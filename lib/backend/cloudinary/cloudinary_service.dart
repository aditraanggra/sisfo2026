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

  /// Upload bukti transfer
  Future<CloudinaryUploadResponse> uploadBuktiTransfer(
    dynamic file, {
    String? transactionId,
  }) async {
    final String publicId = transactionId != null
        ? 'bukti_${transactionId}_${DateTime.now().millisecondsSinceEpoch}'
        : 'bukti_${DateTime.now().millisecondsSinceEpoch}';

    if (file is File) {
      return await uploadImage(
        file,
        folder: CloudinaryConfig.folderBuktiTransfer,
        publicId: publicId,
      );
    } else if (file is Uint8List) {
      return await uploadImageBytes(
        file,
        folder: CloudinaryConfig.folderBuktiTransfer,
        publicId: publicId,
      );
    }
    return CloudinaryUploadResponse.error('Invalid file type');
  }

  /// Upload foto profil
  Future<CloudinaryUploadResponse> uploadProfilePhoto(
    dynamic file, {
    required String unitId,
  }) async {
    final String publicId = 'profile_$unitId';

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

  /// Internal upload method menggunakan unsigned upload
  Future<CloudinaryUploadResponse> _uploadBytes(
    Uint8List bytes, {
    String? folder,
    String? publicId,
    String? fileName,
  }) async {
    try {
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

      // Send request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return CloudinaryUploadResponse.fromJson(jsonResponse);
      } else {
        final errorBody = json.decode(response.body);
        return CloudinaryUploadResponse.error(
          errorBody['error']?['message'] ??
              'Upload failed with status ${response.statusCode}',
        );
      }
    } catch (e) {
      return CloudinaryUploadResponse.error('Upload error: $e');
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
