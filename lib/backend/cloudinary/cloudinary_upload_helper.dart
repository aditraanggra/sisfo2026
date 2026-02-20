/// Cloudinary Upload Helper
///
/// Helper function untuk mengintegrasikan Cloudinary dengan sistem upload
/// yang sudah ada (compatible dengan SelectedFile dan FFUploadedFile).

import 'dart:typed_data';
import '/flutter_flow/upload_data.dart';
import 'cloudinary_service.dart';
import 'cloudinary_config.dart';

/// Upload files ke Cloudinary dan return list of URLs
///
/// Fungsi ini kompatibel dengan sistem upload yang sudah ada,
/// menggantikan `uploadSupabaseStorageFiles()`.
///
/// [selectedFiles] - List file yang akan diupload (dari selectMedia/selectFile)
/// [folder] - Folder tujuan di Cloudinary (default: folderDocuments)
/// [transactionId] - Optional ID transaksi untuk penamaan file
///
/// Returns: List<String> berisi URL dari file yang berhasil diupload
Future<List<String>> uploadCloudinaryFiles({
  required List<SelectedFile> selectedFiles,
  String? folder,
  String? transactionId,
}) async {
  final cloudinary = CloudinaryService();
  final List<String> uploadedUrls = [];

  for (int i = 0; i < selectedFiles.length; i++) {
    final file = selectedFiles[i];
    final bytes = file.bytes;

    if (bytes.isEmpty) continue;

    // Generate unique public ID
    final String publicIdSuffix = transactionId != null
        ? '${transactionId}_$i'
        : '${DateTime.now().millisecondsSinceEpoch}_$i';

    try {
      final response = await cloudinary.uploadImageBytes(
        bytes,
        folder: folder ?? CloudinaryConfig.folderDocuments,
        publicId: publicIdSuffix,
        fileName: file.originalFilename,
      );

      if (response.success && response.secureUrl != null) {
        uploadedUrls.add(response.secureUrl!);
      } else {
        // Log error but continue with other files
        print('Cloudinary upload failed for file $i: ${response.error}');
      }
    } catch (e) {
      print('Cloudinary upload error for file $i: $e');
    }
  }

  return uploadedUrls;
}

/// Upload single file ke Cloudinary
///
/// [bytes] - Bytes dari file yang akan diupload
/// [folder] - Folder tujuan di Cloudinary
/// [fileName] - Nama file original
///
/// Returns: URL dari file yang berhasil diupload, atau null jika gagal
Future<String?> uploadCloudinarySingleFile({
  required Uint8List bytes,
  String? folder,
  String? fileName,
  String? transactionId,
}) async {
  if (bytes.isEmpty) return null;

  final cloudinary = CloudinaryService();

  try {
    final response = await cloudinary.uploadImageBytes(
      bytes,
      folder: folder ?? CloudinaryConfig.folderDocuments,
      publicId: transactionId,
      fileName: fileName,
    );

    if (response.success && response.secureUrl != null) {
      return response.secureUrl;
    } else {
      print('Cloudinary upload failed: ${response.error}');
      return null;
    }
  } catch (e) {
    print('Cloudinary upload error: $e');
    return null;
  }
}

/// Upload bukti transfer ke Cloudinary
///
/// Wrapper khusus untuk upload bukti transfer dengan folder yang tepat
Future<List<String>> uploadBuktiTransferToCloudinary({
  required List<SelectedFile> selectedFiles,
  String? transactionId,
}) async {
  return uploadCloudinaryFiles(
    selectedFiles: selectedFiles,
    folder: CloudinaryConfig.folderBuktiTransfer,
    transactionId: transactionId,
  );
}

/// Upload foto profil ke Cloudinary
///
/// Wrapper khusus untuk upload foto profil dengan folder yang tepat
Future<List<String>> uploadProfilePhotoToCloudinary({
  required List<SelectedFile> selectedFiles,
  String? unitId,
}) async {
  return uploadCloudinaryFiles(
    selectedFiles: selectedFiles,
    folder: CloudinaryConfig.folderProfilePhoto,
    transactionId: unitId != null ? 'profile_$unitId' : null,
  );
}

/// Upload dokumen (PDF, etc) ke Cloudinary
///
/// Fungsi khusus untuk upload dokumen dengan folder yang tepat.
/// Menggunakan raw upload endpoint untuk dokumen non-gambar.
///
/// [bytes] - Bytes dari dokumen yang akan diupload
/// [fileName] - Nama file original (harus menyertakan ekstensi)
/// [documentId] - Optional ID untuk penamaan file
/// [folder] - Folder tujuan (default: folderDocuments)
///
/// Returns: URL dari dokumen yang berhasil diupload, atau null jika gagal
Future<String?> uploadDocumentToCloudinary({
  required Uint8List bytes,
  required String fileName,
  String? documentId,
  String? folder,
}) async {
  if (bytes.isEmpty) return null;

  final cloudinary = CloudinaryService();

  final String publicId = documentId != null
      ? 'doc_${documentId}_${DateTime.now().millisecondsSinceEpoch}'
      : 'doc_${DateTime.now().millisecondsSinceEpoch}';

  try {
    final response = await cloudinary.uploadImageBytes(
      bytes,
      folder: folder ?? CloudinaryConfig.folderDocuments,
      publicId: publicId,
      fileName: fileName,
    );

    if (response.success && response.secureUrl != null) {
      return response.secureUrl;
    } else {
      print('Cloudinary document upload failed: ${response.error}');
      return null;
    }
  } catch (e) {
    print('Cloudinary document upload error: $e');
    return null;
  }
}

/// Upload dokumen dari SelectedFile ke Cloudinary
///
/// Wrapper untuk upload dokumen menggunakan SelectedFile.
///
/// [selectedFiles] - List file dari selectFiles()
/// [documentId] - Optional ID untuk penamaan file
///
/// Returns: List<String> berisi URL dari dokumen yang berhasil diupload
Future<List<String>> uploadDocumentsToCloudinary({
  required List<SelectedFile> selectedFiles,
  String? documentId,
}) async {
  final List<String> uploadedUrls = [];

  for (int i = 0; i < selectedFiles.length; i++) {
    final file = selectedFiles[i];
    final bytes = file.bytes;

    if (bytes.isEmpty) continue;

    final String docId = documentId != null
        ? '${documentId}_$i'
        : '${DateTime.now().millisecondsSinceEpoch}_$i';

    try {
      final response = await CloudinaryService().uploadImageBytes(
        bytes,
        folder: CloudinaryConfig.folderDocuments,
        publicId: docId,
        fileName: file.originalFilename,
      );

      if (response.success && response.secureUrl != null) {
        uploadedUrls.add(response.secureUrl!);
      } else {
        print(
            'Cloudinary document upload failed for file $i: ${response.error}');
      }
    } catch (e) {
      print('Cloudinary document upload error for file $i: $e');
    }
  }

  return uploadedUrls;
}
