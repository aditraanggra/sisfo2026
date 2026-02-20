/// Cloudinary Configuration for SISFO UPZ
///
/// Setup:
/// 1. Buat akun di https://cloudinary.com (gratis)
/// 2. Dapatkan cloud_name, api_key, api_secret dari Dashboard
/// 3. Buat upload preset (unsigned) di Settings > Upload

class CloudinaryConfig {
  // Public identifiers only - safe for client-side
  // Hardcoded for production - cloud name and upload preset are public-safe
  static const String cloudName = 'dlss3vrkz';

  // Upload preset for unsigned uploads (no secret required)
  static const String uploadPreset = 'sisfo_zis';

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
