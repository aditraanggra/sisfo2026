/// Contoh penggunaan Cloudinary Service
///
/// File ini berisi contoh-contoh implementasi upload ke Cloudinary
/// yang bisa digunakan di berbagai halaman aplikasi.

import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'cloudinary_service.dart';

/// Contoh class untuk handle upload di halaman Setor ZIS
class CloudinaryUploadExample {
  final CloudinaryService _cloudinary = CloudinaryService();
  final ImagePicker _picker = ImagePicker();

  /// Contoh 1: Upload bukti transfer dari kamera
  Future<String?> uploadBuktiTransferFromCamera(String transactionId) async {
    try {
      // Pick image dari kamera
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 80,
      );

      if (image == null) return null;

      // Upload ke Cloudinary
      final response = await _cloudinary.uploadBuktiTransfer(
        File(image.path),
        noRegister: '3203001',
        namaUpz: 'UPZ Contoh',
      );

      if (response.success) {
        print('Upload berhasil: ${response.secureUrl}');
        return response.secureUrl;
      } else {
        print('Upload gagal: ${response.error}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  /// Contoh 2: Upload bukti transfer dari galeri
  Future<String?> uploadBuktiTransferFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 80,
      );

      if (image == null) return null;

      final response = await _cloudinary.uploadBuktiTransfer(
        File(image.path),
        noRegister: '3203001',
        namaUpz: 'UPZ Contoh',
      );

      if (response.success) {
        return response.secureUrl;
      }
      return null;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  /// Contoh 3: Upload untuk Web (menggunakan bytes)
  Future<String?> uploadBuktiTransferWeb(
    Uint8List imageBytes,
    String noRegister,
    String namaUpz,
  ) async {
    try {
      final response = await _cloudinary.uploadBuktiTransfer(
        imageBytes,
        noRegister: noRegister,
        namaUpz: namaUpz,
      );
      if (response.success) {
        return response.secureUrl;
      }
      return null;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  /// Contoh 4: Upload foto profil UPZ
  Future<String?> uploadProfilePhoto(String userId, String noRegister) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 85,
      );

      if (image == null) return null;

      final response = await _cloudinary.uploadProfilePhoto(
        File(image.path),
        userId: userId,
        noRegister: noRegister,
      );

      if (response.success) {
        return response.secureUrl;
      }
      return null;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  /// Contoh 5: Mendapatkan URL gambar dengan transformasi
  String getOptimizedImageUrl(String publicId) {
    // Gambar dengan lebar 400px
    return _cloudinary.getImageUrl(publicId, width: 400);
  }

  /// Contoh 6: Mendapatkan thumbnail
  String getThumbnail(String publicId) {
    return _cloudinary.getThumbnailUrl(publicId, size: 100);
  }
}

/// ============================================
/// CONTOH INTEGRASI DI WIDGET SETOR ZIS
/// ============================================
///
/// ```dart
/// class SetorZisWidget extends StatefulWidget {
///   @override
///   _SetorZisWidgetState createState() => _SetorZisWidgetState();
/// }
///
/// class _SetorZisWidgetState extends State<SetorZisWidget> {
///   final CloudinaryService _cloudinary = CloudinaryService();
///   String? _uploadedImageUrl;
///   bool _isUploading = false;
///
///   Future<void> _pickAndUploadImage() async {
///     setState(() => _isUploading = true);
///
///     try {
///       final picker = ImagePicker();
///       final XFile? image = await picker.pickImage(
///         source: ImageSource.gallery,
///         maxWidth: 1024,
///         imageQuality: 80,
///       );
///
///       if (image != null) {
///         final response = await _cloudinary.uploadBuktiTransfer(
///           File(image.path),
///           noRegister: '3203001',
///           namaUpz: 'UPZ Contoh',
///         );
///
///         if (response.success) {
///           setState(() => _uploadedImageUrl = response.secureUrl);
///           // Simpan URL ke form/API
///         } else {
///           ScaffoldMessenger.of(context).showSnackBar(
///             SnackBar(content: Text('Upload gagal: ${response.error}')),
///           );
///         }
///       }
///     } finally {
///       setState(() => _isUploading = false);
///     }
///   }
///
///   @override
///   Widget build(BuildContext context) {
///     return Column(
///       children: [
///         // Preview gambar
///         if (_uploadedImageUrl != null)
///           CachedNetworkImage(
///             imageUrl: _uploadedImageUrl!,
///             width: 200,
///             height: 200,
///             fit: BoxFit.cover,
///           ),
///
///         // Tombol upload
///         ElevatedButton(
///           onPressed: _isUploading ? null : _pickAndUploadImage,
///           child: _isUploading
///             ? CircularProgressIndicator()
///             : Text('Upload Bukti Transfer'),
///         ),
///       ],
///     );
///   }
/// }
/// ```
