/// Cloudinary Upload Helper
///
/// Helper function untuk mengintegrasikan Cloudinary dengan sistem upload
/// yang sudah ada (compatible dengan SelectedFile dan FFUploadedFile).

import 'dart:typed_data';
import '/flutter_flow/upload_data.dart';
import 'cloudinary_service.dart';
import 'cloudinary_config.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

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

/// Upload bukti setor ke Cloudinary
///
/// Folder: sisfo_upz/bukti_setor
/// Format penamaan file: tgl_noregister_namaupz
///
/// [selectedFiles] - List file gambar (jpeg, jpg, png)
/// [noRegister] - Nomor register UPZ
/// [namaUpz] - Nama unit UPZ
Future<List<String>> uploadBuktiTransferToCloudinary({
  required List<SelectedFile> selectedFiles,
  String? noRegister,
  String? namaUpz,
}) async {
  final cloudinary = CloudinaryService();
  final List<String> uploadedUrls = [];

  for (int i = 0; i < selectedFiles.length; i++) {
    final file = selectedFiles[i];
    final bytes = file.bytes;

    if (bytes.isEmpty) continue;

    try {
      final response = await cloudinary.uploadBuktiTransfer(
        bytes,
        noRegister: noRegister,
        namaUpz: namaUpz,
      );

      if (response.success && response.secureUrl != null) {
        uploadedUrls.add(response.secureUrl!);
      } else {
        print(
            'Cloudinary bukti setor upload failed for file $i: ${response.error}');
      }
    } catch (e) {
      print('Cloudinary bukti setor upload error for file $i: $e');
    }
  }

  return uploadedUrls;
}

/// Upload foto profil ke Cloudinary
///
/// Folder: sisfo_upz/profile
/// Format penamaan file: userId_noregister
///
/// [selectedFiles] - List file gambar (jpeg, jpg, png)
/// [userId] - User ID
/// [noRegister] - Nomor register UPZ
Future<List<String>> uploadProfilePhotoToCloudinary({
  required List<SelectedFile> selectedFiles,
  String? userId,
  String? noRegister,
}) async {
  final cloudinary = CloudinaryService();
  final List<String> uploadedUrls = [];

  for (int i = 0; i < selectedFiles.length; i++) {
    final file = selectedFiles[i];
    final bytes = file.bytes;

    if (bytes.isEmpty) continue;

    try {
      final response = await cloudinary.uploadProfilePhoto(
        bytes,
        userId: userId ?? 'anon_${DateTime.now().millisecondsSinceEpoch}',
        noRegister: noRegister,
      );
      if (response.success && response.secureUrl != null) {
        uploadedUrls.add(response.secureUrl!);
      } else {
        print(
            'Cloudinary profile upload failed for file $i: ${response.error}');
      }
    } catch (e) {
      print('Cloudinary profile upload error for file $i: $e');
    }
  }

  return uploadedUrls;
}

/// Upload dokumen PDF ke Cloudinary
///
/// Folder: sisfo_upz/form
/// Format penamaan file: tgl_noregister_namaupz
///
/// [bytes] - Bytes dari dokumen PDF
/// [fileName] - Nama file original (harus menyertakan ekstensi .pdf)
/// [noRegister] - Nomor register UPZ
/// [namaUpz] - Nama unit UPZ
///
/// Returns: URL dari dokumen yang berhasil diupload, atau null jika gagal
Future<String?> uploadDocumentToCloudinary({
  required Uint8List bytes,
  required String fileName,
  String? noRegister,
  String? namaUpz,
}) async {
  if (bytes.isEmpty) return null;

  final cloudinary = CloudinaryService();

  try {
    final response = await cloudinary.uploadFormPdf(
      bytes,
      noRegister: noRegister,
      namaUpz: namaUpz,
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
/// Folder: sisfo_upz/form
/// Format penamaan file: tgl_noregister_namaupz
///
/// [selectedFiles] - List file dari selectFiles()
/// [noRegister] - Nomor register UPZ
/// [namaUpz] - Nama unit UPZ
///
/// Returns: List<String> berisi URL dari dokumen yang berhasil diupload
Future<List<String>> uploadDocumentsToCloudinary({
  required List<SelectedFile> selectedFiles,
  String? noRegister,
  String? namaUpz,
}) async {
  final List<String> uploadedUrls = [];

  for (int i = 0; i < selectedFiles.length; i++) {
    final file = selectedFiles[i];
    final bytes = file.bytes;

    if (bytes.isEmpty) continue;

    try {
      final response = await CloudinaryService().uploadFormPdf(
        bytes,
        noRegister: noRegister,
        namaUpz: namaUpz,
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

/// Convert multiple images into a multi-page PDF and upload to Cloudinary
///
/// Folder: sisfo_upz/form (default) atau gunakan folder khusus
/// Format penamaan file: tgl_noregister_namaupz_images (atau sesuai timestamp)
///
/// [selectedFiles] - List file dari selectFiles() (biasanya format gambar)
/// [noRegister] - Nomor register UPZ
/// [namaUpz] - Nama unit UPZ
/// [fileName] - Optional nama file
/// [folder] - Optional folder tujuan
///
/// Returns: URL dari dokumen PDF yang berhasil diupload, atau null jika gagal
Future<String?> convertImagesToPdfAndUpload({
  required List<SelectedFile> selectedFiles,
  String? noRegister,
  String? namaUpz,
  String? fileName,
  String? folder,
}) async {
  if (selectedFiles.isEmpty) return null;

  try {
    // 1. Initialize empty PDF Document
    final pdf = pw.Document();

    // 2. Loop through all images and add each to a new PDF page
    for (int i = 0; i < selectedFiles.length; i++) {
      final file = selectedFiles[i];
      final bytes = file.bytes;

      if (bytes.isNotEmpty) {
        // Create an ImageProvider from the memory bytes
        final image = pw.MemoryImage(bytes);

        // Add a new page with the image covering the full page
        pdf.addPage(
          pw.Page(
            pageFormat: PdfPageFormat.a4,
            build: (pw.Context context) {
              return pw.Center(
                child: pw.Image(image, fit: pw.BoxFit.contain),
              );
            },
          ),
        );
      }
    }

    // 3. Save the PDF as a byte array
    final Uint8List pdfBytes = await pdf.save();

    if (pdfBytes.isEmpty) {
      print('Pdf generation failed, resulting bytes are empty');
      return null;
    }

    // 4. Generate public ID string
    final String tgl = DateTime.now().year.toString() +
        DateTime.now().month.toString().padLeft(2, '0') +
        DateTime.now().day.toString().padLeft(2, '0');
    final String reg =
        noRegister?.replaceAll(RegExp(r'[^a-zA-Z0-9_\-]'), '_').toLowerCase() ??
            'unregistered';
    final String nama =
        namaUpz?.replaceAll(RegExp(r'[^a-zA-Z0-9_\-]'), '_').toLowerCase() ??
            'unknown';
    final String uniqueSuffix =
        DateTime.now().millisecondsSinceEpoch.toString();
    final String publicId = '${tgl}_${reg}_${nama}_images_$uniqueSuffix';

    // 5. Upload to Cloudinary using the new uploadPdfBytes method
    final response = await CloudinaryService().uploadPdfBytes(
      pdfBytes,
      folder: folder ?? CloudinaryConfig.folderFormPdf,
      publicId: publicId,
      fileName: fileName ?? '$publicId.pdf',
    );

    if (response.success && response.secureUrl != null) {
      return response.secureUrl;
    } else {
      print('Cloudinary PDF from Images upload failed: ${response.error}');
      return null;
    }
  } catch (e) {
    print('Error converting images to PDF and uploading: $e');
    return null;
  }
}
