import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'cloudinary_config.dart';

/// Response dari upload Cloudinary
class CloudinaryUploadResponse {
  final bool success;
  final String? publicId;
  final String? secureUrl;
  final String? url;
  final String? error;
  final int? width;
  final int? height;
  final int? bytes;
  final String? format;

  CloudinaryUploadResponse({
    required this.success,
    this.publicId,
    this.secureUrl,
    this.url,
    this.error,
    this.width,
    this.height,
    this.bytes,
    this.format,
  });

  factory CloudinaryUploadResponse.fromJson(Map<String, dynamic> json) {
    return CloudinaryUploadResponse(
      success: true,
      publicId: json['public_id'],
      secureUrl: json['secure_url'],
      url: json['url'],
      width: json['width'],
      height: json['height'],
      bytes: json['bytes'],
      format: json['format'],
    );
  }

  factory CloudinaryUploadResponse.error(String message) {
    return CloudinaryUploadResponse(
      success: false,
      error: message,
    );
  }
}

/// Helper: format tanggal hari ini sebagai YYYYMMDD
String _todayFormatted() {
  final now = DateTime.now();
  final y = now.year.toString();
  final m = now.month.toString().padLeft(2, '0');
  final d = now.day.toString().padLeft(2, '0');
  return '$y$m$d';
}

/// Helper: sanitize string untuk public_id (hapus spasi & karakter khusus)
String _sanitize(String input) {
  return input
      .replaceAll(RegExp(r'[^a-zA-Z0-9_\-]'), '_')
      .replaceAll(RegExp(r'_+'), '_')
      .toLowerCase();
}

/// Service untuk upload ke Cloudinary
class CloudinaryService {
  static final CloudinaryService _instance = CloudinaryService._internal();
  factory CloudinaryService() => _instance;
  CloudinaryService._internal();

  /// Upload gambar dari File (Mobile)
  Future<CloudinaryUploadResponse> uploadImage(
    File file, {
    String? folder,
    String? publicId,
  }) async {
    try {
      final bytes = await file.readAsBytes();
      return await _uploadBytes(
        bytes,
        folder: folder ?? CloudinaryConfig.folderDocuments,
        publicId: publicId,
      );
    } catch (e) {
      return CloudinaryUploadResponse.error('Upload failed: $e');
    }
  }

  /// Upload gambar dari Bytes (Web & Mobile)
  Future<CloudinaryUploadResponse> uploadImageBytes(
    Uint8List bytes, {
    String? folder,
    String? publicId,
    String? fileName,
  }) async {
    return await _uploadBytes(
      bytes,
      folder: folder ?? CloudinaryConfig.folderDocuments,
      publicId: publicId,
      fileName: fileName,
    );
  }

  /// Upload bukti setor
  /// Format penamaan: tgl_noregister_namaupz
  /// Folder: sisfo_upz/bukti_setor
  Future<CloudinaryUploadResponse> uploadBuktiTransfer(
    dynamic file, {
    String? noRegister,
    String? namaUpz,
  }) async {
    final String tgl = _todayFormatted();
    final String reg = _sanitize(noRegister ?? 'unknown');
    final String nama = _sanitize(namaUpz ?? 'unknown');
    final String publicId = '${tgl}_${reg}_$nama';

    if (file is File) {
      return await uploadImage(
        file,
        folder: CloudinaryConfig.folderBuktiSetor,
        publicId: publicId,
      );
    } else if (file is Uint8List) {
      return await uploadImageBytes(
        file,
        folder: CloudinaryConfig.folderBuktiSetor,
        publicId: publicId,
      );
    }
    return CloudinaryUploadResponse.error('Invalid file type');
  }

  /// Upload foto profil
  /// Format penamaan: userId_noregister
  /// Folder: sisfo_upz/profile
  Future<CloudinaryUploadResponse> uploadProfilePhoto(
    dynamic file, {
    required String userId,
    String? noRegister,
  }) async {
    final String sanitizedUserId = _sanitize(userId);
    final String reg = _sanitize(noRegister ?? 'unknown');
    final String publicId = '${sanitizedUserId}_$reg';

    if (file is File) {
      return await uploadImage(
        file,
        folder: CloudinaryConfig.folderProfilePhoto,
        publicId: publicId,
      );
    } else if (file is Uint8List) {
      return await uploadImageBytes(
        file,
        folder: CloudinaryConfig.folderProfilePhoto,
        publicId: publicId,
      );
    }
    return CloudinaryUploadResponse.error('Invalid file type');
  }

  /// Upload form PDF
  /// Format penamaan: tgl_noregister_namaupz_timestamp
  /// Folder: sisfo_upz/form
  Future<CloudinaryUploadResponse> uploadFormPdf(
    dynamic file, {
    String? noRegister,
    String? namaUpz,
    String? fileName,
  }) async {
    final String tgl = _todayFormatted();
    final String reg = _sanitize(noRegister ?? 'unknown');
    final String nama = _sanitize(namaUpz ?? 'unknown');
    final String uniqueSuffix =
        DateTime.now().millisecondsSinceEpoch.toString();
    final String publicId = '${tgl}_${reg}_${nama}_$uniqueSuffix';

    Uint8List bytes;
    if (file is File) {
      bytes = await file.readAsBytes();
    } else if (file is Uint8List) {
      bytes = file;
    } else {
      return CloudinaryUploadResponse.error('Invalid file type for PDF upload');
    }

    return await _uploadRawBytes(
      bytes,
      folder: CloudinaryConfig.folderFormPdf,
      publicId: publicId,
      fileName: fileName ?? '$publicId.pdf',
    );
  }

  /// Upload PDF bytes secara eksplisit (untuk file hasil konversi)
  /// Menggunakan signed/unsigned upload untuk raw file
  Future<CloudinaryUploadResponse> uploadPdfBytes(
    Uint8List bytes, {
    String? folder,
    String? publicId,
    String? fileName,
  }) async {
    return await _uploadRawBytes(
      bytes,
      folder: folder ?? CloudinaryConfig.folderDocuments,
      publicId: publicId,
      fileName:
          fileName ?? 'converted_${DateTime.now().millisecondsSinceEpoch}.pdf',
    );
  }

  /// Internal upload method menggunakan unsigned upload (untuk gambar)
  Future<CloudinaryUploadResponse> _uploadBytes(
    Uint8List bytes, {
    String? folder,
    String? publicId,
    String? fileName,
  }) async {
    try {
      print('Cloudinary Upload - Cloud Name: ${CloudinaryConfig.cloudName}');
      print(
          'Cloudinary Upload - Upload Preset: ${CloudinaryConfig.uploadPreset}');
      print('Cloudinary Upload - Folder: ${folder ?? 'not specified'}');

      if (CloudinaryConfig.cloudName.isEmpty) {
        return CloudinaryUploadResponse.error(
          'Cloud name is not configured. Please set CLOUDINARY_CLOUD_NAME.',
        );
      }

      if (CloudinaryConfig.uploadPreset.isEmpty) {
        return CloudinaryUploadResponse.error(
          'Upload preset is not configured. Please set CLOUDINARY_UPLOAD_PRESET.',
        );
      }

      final uri = Uri.parse(CloudinaryConfig.uploadUrl);
      final request = http.MultipartRequest('POST', uri);

      // Add file
      final multipartFile = http.MultipartFile.fromBytes(
        'file',
        bytes,
        filename:
            fileName ?? 'upload_${DateTime.now().millisecondsSinceEpoch}.jpg',
      );
      request.files.add(multipartFile);

      // Add fields untuk unsigned upload
      request.fields['upload_preset'] = CloudinaryConfig.uploadPreset;

      if (folder != null) {
        request.fields['folder'] = folder;
      }

      if (publicId != null) {
        request.fields['public_id'] = publicId;
      }

      print('Cloudinary Upload - URL: ${CloudinaryConfig.uploadUrl}');

      // Send request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      print('Cloudinary Upload - Status Code: ${response.statusCode}');
      print('Cloudinary Upload - Response: ${response.body}');

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return CloudinaryUploadResponse.fromJson(jsonResponse);
      } else {
        final errorBody = json.decode(response.body);
        final errorMessage = errorBody['error']?['message'] ??
            'Upload failed with status ${response.statusCode}';
        print('Cloudinary Upload Error: $errorMessage');
        return CloudinaryUploadResponse.error(errorMessage);
      }
    } catch (e) {
      print('Cloudinary Upload Exception: $e');
      return CloudinaryUploadResponse.error('Upload error: $e');
    }
  }

  /// Internal upload method untuk raw file (PDF, dokumen)
  Future<CloudinaryUploadResponse> _uploadRawBytes(
    Uint8List bytes, {
    String? folder,
    String? publicId,
    String? fileName,
  }) async {
    try {
      print(
          'Cloudinary Raw Upload - Cloud Name: ${CloudinaryConfig.cloudName}');
      print('Cloudinary Raw Upload - Folder: ${folder ?? 'not specified'}');

      if (CloudinaryConfig.cloudName.isEmpty) {
        return CloudinaryUploadResponse.error(
          'Cloud name is not configured.',
        );
      }

      if (CloudinaryConfig.uploadPreset.isEmpty) {
        return CloudinaryUploadResponse.error(
          'Upload preset is not configured.',
        );
      }

      final uri = Uri.parse(CloudinaryConfig.uploadRawUrl);
      final request = http.MultipartRequest('POST', uri);

      final multipartFile = http.MultipartFile.fromBytes(
        'file',
        bytes,
        filename:
            fileName ?? 'document_${DateTime.now().millisecondsSinceEpoch}.pdf',
      );
      request.files.add(multipartFile);

      request.fields['upload_preset'] = CloudinaryConfig.uploadPreset;

      if (folder != null) {
        request.fields['folder'] = folder;
      }

      if (publicId != null) {
        request.fields['public_id'] = publicId;
      }

      print('Cloudinary Raw Upload - URL: ${CloudinaryConfig.uploadRawUrl}');

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      print('Cloudinary Raw Upload - Status Code: ${response.statusCode}');
      print('Cloudinary Raw Upload - Response: ${response.body}');

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return CloudinaryUploadResponse.fromJson(jsonResponse);
      } else {
        final errorBody = json.decode(response.body);
        final errorMessage = errorBody['error']?['message'] ??
            'Raw upload failed with status ${response.statusCode}';
        print('Cloudinary Raw Upload Error: $errorMessage');
        return CloudinaryUploadResponse.error(errorMessage);
      }
    } catch (e) {
      print('Cloudinary Raw Upload Exception: $e');
      return CloudinaryUploadResponse.error('Raw upload error: $e');
    }
  }

  /// Delete image dari Cloudinary (memerlukan signed request)
  /// Note: Untuk delete, sebaiknya dilakukan dari backend untuk keamanan
  Future<bool> deleteImage(String publicId) async {
    // Implementasi delete sebaiknya melalui backend API
    // karena memerlukan api_secret yang tidak aman disimpan di client
    print('Delete should be handled by backend API for security');
    return false;
  }

  /// Generate URL gambar dengan transformasi
  String getImageUrl(
    String publicId, {
    int? width,
    int? height,
    String crop = 'fill',
  }) {
    return CloudinaryConfig.imageUrl(
      publicId,
      width: width,
      height: height,
      crop: crop,
    );
  }

  /// Generate thumbnail URL
  String getThumbnailUrl(String publicId, {int size = 150}) {
    return CloudinaryConfig.imageUrl(
      publicId,
      width: size,
      height: size,
      crop: 'thumb',
    );
  }
}
