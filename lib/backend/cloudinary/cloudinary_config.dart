/// Cloudinary Configuration for SISFO UPZ
///
/// Setup:
/// 1. Buat akun di https://cloudinary.com (gratis)
/// 2. Dapatkan cloud_name, api_key, api_secret dari Dashboard
/// 3. Buat upload preset (unsigned) di Settings > Upload
/// 4. Copy .env.example ke .env dan isi credentials

import 'package:flutter_dotenv/flutter_dotenv.dart';

class CloudinaryConfig {
  // Credentials dari .env file untuk keamanan
  static String get cloudName => dotenv.env['CLOUDINARY_CLOUD_NAME'] ?? '';
  static String get apiKey => dotenv.env['CLOUDINARY_API_KEY'] ?? '';
  static String get apiSecret => dotenv.env['CLOUDINARY_API_SECRET'] ?? '';

  // Upload preset untuk unsigned upload (lebih aman untuk mobile)
  static String get uploadPreset =>
      dotenv.env['CLOUDINARY_UPLOAD_PRESET'] ?? 'sisfo_upz_preset';

  // Folder untuk organisasi assets
  static const String folderBuktiTransfer = 'sisfo_upz/bukti_transfer';
  static const String folderProfilePhoto = 'sisfo_upz/profile';
  static const String folderDocuments = 'sisfo_upz/documents';

  // Base URL untuk Cloudinary
  static String get baseUrl => 'https://api.cloudinary.com/v1_1/$cloudName';
  static String get uploadUrl => '$baseUrl/image/upload';
  static String get uploadVideoUrl => '$baseUrl/video/upload';

  // URL untuk mengakses gambar
  static String imageUrl(String publicId,
      {int? width, int? height, String? crop}) {
    String transformation = '';
    if (width != null || height != null || crop != null) {
      List<String> params = [];
      if (width != null) params.add('w_$width');
      if (height != null) params.add('h_$height');
      if (crop != null) params.add('c_$crop');
      transformation = '${params.join(',')}';
    }
    return 'https://res.cloudinary.com/$cloudName/image/upload/$transformation$publicId';
  }
}
