# SISFO UPZ - Project Specification

## 1. Overview

SISFO UPZ adalah Sistem Informasi Zakat untuk Unit Pengumpul Zakat (UPZ) BAZNAS Kabupaten Cianjur. Aplikasi ini membantu operator UPZ dalam mengelola transaksi Zakat, Infak, dan Sedekah (ZIS).

### 1.1 Versi Aplikasi

- **Version**: 2.1.0+591
- **Platform**: Android, iOS, Web
- **Framework**: Flutter (FlutterFlow)

### 1.2 Target User

- Operator UPZ DKM (Dewan Kemakmuran Masjid)
- Operator UPZ Sekolah (SD/SMP)
- Admin BAZNAS

---

## 2. Architecture

### 2.1 Backend Services

| Service    | Base URL                                                         | Fungsi                            |
| ---------- | ---------------------------------------------------------------- | --------------------------------- |
| Main API   | `https://sisfo-upz-sisfoupz-webapp.2rxwkd.easypanel.host/api/v1` | Auth, Transaksi, Rekap            |
| Supabase   | `https://jxzqpwcahrynoeplktoe.supabase.co`                       | Database                          |
| Cloudinary | `https://api.cloudinary.com/v1_1/{cloud_name}`                   | Asset Storage (Images, Documents) |

### 2.2 Authentication

- **Type**: JWT Bearer Token
- **Flow**: Login → Get Token → Store in App State → Use for API calls

---

## 3. API Documentation

### 3.1 Authentication Endpoints

#### Login

```
POST /login
Content-Type: application/json

Request:
{
  "email": "string",
  "password": "string"
}

Response:
{
  "token": "jwt_token",
  "user": {
    "id": int,
    "name": "string",
    "email": "string"
  },
  "message": "string"
}
```

#### Register

```
POST /register
Content-Type: application/json

Request:
{
  "name": "string",
  "email": "string",
  "password": "string",
  "password_confirmation": "string"
}
```

#### Logout

```
GET /logout
Authorization: Bearer {token}
```

---

### 3.2 Unit ZIS (Profile UPZ) Endpoints

#### Get UPZ Profile

```
GET /unit-zis
Authorization: Bearer {token}

Response:
{
  "data": [{
    "id": int,
    "user_id": int,
    "category_id": int,
    "village_id": int,
    "district_id": int,
    "no_register": "string",
    "unit_name": "string",
    "no_sk": "string",
    "address": "string",
    "unit_leader": "string",
    "unit_assistant": "string",
    "unit_finance": "string",
    "operator_phone": "string",
    "rice_price": int,
    "is_verified": boolean,
    "profile_completion": int,
    "village_name": "string",
    "district_name": "string"
  }]
}
```

#### Add Profile UPZ

```
POST /unit-zis
Authorization: Bearer {token}
Content-Type: application/json

Request:
{
  "user_id": int,
  "category_id": int,
  "village_id": int,
  "district_id": int,
  "no_sk": "string",
  "unit_name": "string",
  "no_register": "string",
  "address": "string",
  "unit_leader": "string",
  "unit_assistant": "string",
  "unit_finance": "string",
  "operator_phone": "string",
  "rice_price": int,
  "is_verified": boolean,
  "profile_completion": int
}
```

#### Update Profile UPZ

```
PUT /unit-zis/{id}
Authorization: Bearer {token}
```

---

### 3.3 Zakat Fitrah Endpoints

#### Get Zakat Fitrah

```
GET /zf
Authorization: Bearer {token}

Response:
{
  "data": [...]
}
```

#### Add Zakat Fitrah

```
POST /zf
Authorization: Bearer {token}
Content-Type: application/json

Request:
{
  "unit_id": int,
  "trx_date": "YYYY-MM-DD",
  "muzakki_name": "string",
  "zf_rice": double,        // dalam kg
  "zf_amount": int,         // dalam rupiah
  "total_muzakki": int,
  "desc": "string"
}
```

#### Update Zakat Fitrah

```
POST /zf/{id}
Authorization: Bearer {token}
```

#### Delete Zakat Fitrah

```
DELETE /zf/{id}
Authorization: Bearer {token}
```

---

### 3.4 Zakat Mal Endpoints

#### Get Zakat Mal

```
GET /zm
Authorization: Bearer {token}
```

#### Add Zakat Mal

```
POST /zm
Authorization: Bearer {token}
Content-Type: application/json

Request:
{
  "unit_id": int,
  "trx_date": "YYYY-MM-DD",
  "muzakki_name": "string",
  "category_maal": "string",  // kategori zakat mal
  "amount": int,
  "desc": "string"
}
```

#### Update Zakat Mal

```
POST /zm/{id}
Authorization: Bearer {token}
```

#### Delete Zakat Mal

```
DELETE /zm/{id}
Authorization: Bearer {token}
```

---

### 3.5 Infak/Sedekah Endpoints

#### Get Infak/Sedekah

```
GET /ifs
Authorization: Bearer {token}
```

#### Add Infak/Sedekah

```
POST /ifs
Authorization: Bearer {token}
Content-Type: application/json

Request:
{
  "unit_id": int,
  "trx_date": "YYYY-MM-DD",
  "munfiq_name": "string",
  "amount": int,
  "desc": "string"
}
```

#### Update Infak/Sedekah

```
POST /ifs/{id}
Authorization: Bearer {token}
```

#### Delete Infak/Sedekah

```
DELETE /ifs/{id}
Authorization: Bearer {token}
```

---

### 3.6 Fidyah Endpoints

#### Get Fidyah

```
GET /fidyah
Authorization: Bearer {token}
```

#### Add Fidyah

```
POST /fidyah
Authorization: Bearer {token}
Content-Type: application/json

Request:
{
  "unit_id": int,
  "trx_date": "YYYY-MM-DD",
  "name": "string",
  "total_day": int,
  "amount": int
}
```

#### Update Fidyah

```
POST /fidyah/{id}
Authorization: Bearer {token}
```

#### Delete Fidyah

```
DELETE /fidyah/{id}
Authorization: Bearer {token}
```

---

### 3.7 Kotak Amal Endpoints

#### Get Kotak Amal

```
GET /kotak_amal
Authorization: Bearer {token}
```

#### Add Kotak Amal

```
POST /kotak_amal
Authorization: Bearer {token}
Content-Type: application/json

Request:
{
  "unit_id": int,
  "trx_date": "YYYY-MM-DD",
  "amount": int,
  "desc": "string"
}
```

#### Update Kotak Amal

```
POST /kotak_amal/{id}
Authorization: Bearer {token}
```

#### Delete Kotak Amal

```
DELETE /kotak_amal/{id}
Authorization: Bearer {token}
```

---

### 3.8 Pendistribusian Endpoints

#### Get Pendistribusian

```
GET /pendis
Authorization: Bearer {token}
```

#### Add Pendistribusian

```
POST /pendis
Authorization: Bearer {token}
Content-Type: application/json

Request:
{
  "unit_id": int,
  "trx_date": "YYYY-MM-DD",
  "mustahik_name": "string",
  "nik": "string",
  "fund_type": "string",      // jenis dana (ZF/ZM/IFS)
  "asnaf": "string",          // kategori penerima
  "program": "string",
  "total_rice": double,
  "total_amount": int,
  "beneficiary": int          // jumlah penerima manfaat
}
```

#### Update Pendistribusian

```
POST /pendis/{id}
Authorization: Bearer {token}
```

#### Delete Pendistribusian

```
DELETE /pendis/{id}
Authorization: Bearer {token}
```

---

### 3.9 Setor ZIS Endpoints

#### Get Setor ZIS

```
GET /setor
Authorization: Bearer {token}
```

#### Add Setor ZIS

```
POST /setor
Authorization: Bearer {token}
Content-Type: application/json

Request:
{
  "unit_id": int,
  "trx_date": "YYYY-MM-DD",
  "zf_amount_deposit": int,
  "zf_rice_deposit": double,
  "zm_amount_deposit": int,
  "ifs_amount_deposit": int,
  "total_deposit": int,
  "status": "string",
  "validation": "string",
  "upload": "string"          // bukti transfer
}
```

#### Update Setor ZIS

```
POST /setor/{id}
Authorization: Bearer {token}
```

#### Delete Setor ZIS

```
DELETE /setor/{id}
Authorization: Bearer {token}
```

---

### 3.10 Master Data Endpoints

#### Get Kecamatan

```
GET /kecamatan

Response:
{
  "data": [{
    "id": int,
    "name": "string",
    "district_code": "string"
  }]
}
```

#### Get Desa

```
GET /desa?district_id={id}

Response:
{
  "data": [{
    "id": int,
    "name": "string",
    "village_code": "string"
  }]
}
```

---

### 3.11 Rekap/Laporan Endpoints

#### Rekap ZIS

```
GET /rekap/zis?period={YYYY}&unit_id={id}
Authorization: Bearer {token}

Response:
{
  "data": [{
    "total_zf_rice": double,
    "total_zf_amount": int,
    "total_zf_muzakki": int,
    "total_zm_amount": int,
    "total_zm_muzakki": int,
    "total_ifs_amount": int,
    "total_ifs_munfiq": int
  }]
}
```

#### Rekap Pendistribusian

```
GET /rekap/pendis?periode={YYYY}&unit_id={id}
Authorization: Bearer {token}
```

#### Rekap Hak Amil

```
GET /rekap/hak-amil
Authorization: Bearer {token}
```

#### Rekap Setor

```
GET /rekap/setor
Authorization: Bearer {token}
```

#### Rekap Alokasi

```
GET /rekap/alokasi
Authorization: Bearer {token}
```

---

### 3.12 Supabase Direct API (Legacy)

Base URL: `https://jxzqpwcahrynoeplktoe.supabase.co/rest/v1/`

#### Get SD (Sekolah Dasar)

```
GET /sd?kecamatan_id=eq.{id}
```

#### Get SMP

```
GET /smp?kecamatan_id=eq.{id}
```

---

## 4. Data Models

### 4.1 User

```dart
{
  id: int,
  name: String,
  email: String
}
```

### 4.2 UPZ (Unit Pengumpul Zakat)

```dart
{
  id: int,
  user_id: int,
  category_id: int,           // 1=DKM, 2=Sekolah
  village_id: int,
  district_id: int,
  no_register: String,
  unit_name: String,
  no_sk: String,
  address: String,
  unit_leader: String,
  unit_assistant: String,
  unit_finance: String,
  operator_phone: String,
  rice_price: int,            // harga beras per kg
  is_verified: bool,
  profile_completion: int,    // persentase kelengkapan
  village_name: String,
  district_name: String
}
```

### 4.3 Transaksi Zakat Fitrah

```dart
{
  id: int,
  unit_id: int,
  trx_date: String,
  muzakki_name: String,
  zf_rice: double,
  zf_amount: int,
  total_muzakki: int,
  desc: String
}
```

### 4.4 Transaksi Zakat Mal

```dart
{
  id: int,
  unit_id: int,
  trx_date: String,
  muzakki_name: String,
  category_maal: String,
  amount: int,
  desc: String
}
```

### 4.5 Transaksi Infak/Sedekah

```dart
{
  id: int,
  unit_id: int,
  trx_date: String,
  munfiq_name: String,
  amount: int,
  desc: String
}
```

### 4.6 Pendistribusian

```dart
{
  id: int,
  unit_id: int,
  trx_date: String,
  mustahik_name: String,
  nik: String,
  fund_type: String,
  asnaf: String,
  program: String,
  total_rice: double,
  total_amount: int,
  beneficiary: int
}
```

### 4.7 Setor ZIS

```dart
{
  id: int,
  unit_id: int,
  trx_date: String,
  zf_amount_deposit: int,
  zf_rice_deposit: double,
  zm_amount_deposit: int,
  ifs_amount_deposit: int,
  total_deposit: int,
  status: String,
  validation: String,
  upload: String
}
```

---

## 5. Fitur Utama

### 5.1 Autentikasi

- Login dengan email & password
- Register akun baru
- Logout
- Kelengkapan profil UPZ

### 5.2 Pencatatan Transaksi

- **Zakat Fitrah**: Beras (kg) dan Uang (Rp)
- **Zakat Mal**: Berbagai kategori (penghasilan, perdagangan, dll)
- **Infak/Sedekah**: Donasi umum
- **Fidyah**: Pengganti puasa
- **Kotak Amal**: Pengumpulan dari kotak amal masjid

### 5.3 Pendistribusian

- Pencatatan penyaluran dana ke mustahik
- Kategorisasi berdasarkan asnaf (8 golongan)
- Tracking program penyaluran

### 5.4 Penyetoran

- Setor dana ZIS ke BAZNAS
- Upload bukti transfer
- Status validasi

### 5.5 Laporan & Rekap

- Rekap pengumpulan ZIS
- Rekap pendistribusian
- Rekap penyetoran
- Hak amil

### 5.6 Kalkulator Zakat

- Perhitungan zakat mal
- Nisab dan haul

---

## 6. Database Tables (Supabase)

| Table              | Deskripsi                  |
| ------------------ | -------------------------- |
| users              | Data pengguna              |
| profile            | Profil UPZ                 |
| kecamatan          | Master kecamatan           |
| desa               | Master desa/kelurahan      |
| sd                 | Master sekolah SD          |
| smp                | Master sekolah SMP         |
| zakat_fitrah       | Transaksi zakat fitrah     |
| zakat_mal          | Transaksi zakat mal        |
| infak              | Transaksi infak/sedekah    |
| pendistribusian    | Transaksi pendistribusian  |
| setor_zis          | Transaksi penyetoran       |
| dskl               | Data sekolah               |
| rekap_zis_2023     | Rekap ZIS tahun 2023       |
| rekap_pendis_2023  | Rekap pendistribusian 2023 |
| rekap_setor_2023   | Rekap setor 2023           |
| rekap_alokasi_2023 | Rekap alokasi 2023         |
| rekap_dkm_2023     | Rekap DKM 2023             |
| rekap_dskl_2023    | Rekap sekolah 2023         |

---

## 7. App State (Persisted)

```dart
FFAppState {
  SisaSaldoPendis: int,           // Sisa saldo pendistribusian
  ListSekolahSD: List<SekolahSdStruct>,
  profileUPZ: UpzStruct           // Profile UPZ aktif
}
```

---

## 8. Navigation Structure

```
├── Login
├── Register
├── Registration Type (DKM/Sekolah)
├── Lengkapi Profile
│   ├── Lengkapi Profile (DKM)
│   └── Lengkapi Profile SD
├── NavBar (Main)
│   ├── Home (Beranda)
│   ├── Laporan
│   ├── Histori Transaksi
│   └── Profile
├── Transaksi
│   ├── Zakat Fitrah
│   ├── Zakat Mal
│   ├── Infak/Sedekah
│   ├── Kotak Amal
│   ├── Qurban
│   ├── Pendistribusian
│   ├── Setor ZIS
│   ├── Penyerapan Hak Amil
│   ├── Kalkulator Zakat
│   └── Details Transaksi
└── Misc
    ├── Edit Profile
    ├── Profil UPZ
    ├── Setting ZF
    ├── List DKM
    └── Regulasi Page
```

---

## 9. Kategori Asnaf (Penerima Zakat)

1. Fakir
2. Miskin
3. Amil
4. Muallaf
5. Riqab
6. Gharimin
7. Fisabilillah
8. Ibnu Sabil

---

## 10. Kategori Zakat Mal

- Zakat Penghasilan/Profesi
- Zakat Perdagangan
- Zakat Pertanian
- Zakat Peternakan
- Zakat Emas & Perak
- Zakat Rikaz (Harta Temuan)
- Zakat Saham & Investasi

---

## 11. Status Codes

| Code | Meaning          |
| ---- | ---------------- |
| 200  | Success          |
| 201  | Created          |
| 400  | Bad Request      |
| 401  | Unauthorized     |
| 403  | Forbidden        |
| 404  | Not Found        |
| 422  | Validation Error |
| 500  | Server Error     |

---

## 12. Environment

### Development

- API: `https://sisfo-upz-sisfoupz-webapp.2rxwkd.easypanel.host/api/v1`
- Cloudinary: `https://api.cloudinary.com/v1_1/{cloud_name}`

### Production

- Same as development (single environment)

---

## 13. Cloudinary Integration

### 13.1 Setup Cloudinary

1. Buat akun di [cloudinary.com](https://cloudinary.com) (gratis)
2. Dapatkan credentials dari Dashboard:
   - `cloud_name`
   - `api_key`
   - `api_secret`
3. Buat **Upload Preset** (unsigned) di Settings > Upload:
   - Nama: `sisfo_upz_preset`
   - Signing Mode: **Unsigned**
   - Folder: `sisfo_upz`

### 13.2 Konfigurasi

Edit file `lib/backend/cloudinary/cloudinary_config.dart`:

```dart
class CloudinaryConfig {
  static const String cloudName = 'YOUR_CLOUD_NAME';
  static const String apiKey = 'YOUR_API_KEY';
  static const String apiSecret = 'YOUR_API_SECRET';
  static const String uploadPreset = 'sisfo_upz_preset';
}
```

### 13.3 Folder Structure di Cloudinary

| Folder                     | Kegunaan                 |
| -------------------------- | ------------------------ |
| `sisfo_upz/bukti_transfer` | Bukti transfer setor ZIS |
| `sisfo_upz/profile`        | Foto profil UPZ          |
| `sisfo_upz/documents`      | Dokumen lainnya          |

### 13.4 Penggunaan

```dart
import 'package:sisfo/backend/cloudinary/cloudinary_service.dart';

// Upload bukti transfer
final response = await CloudinaryService().uploadBuktiTransfer(
  file,
  transactionId: 'TRX_123',
);

if (response.success) {
  String imageUrl = response.secureUrl!;
  // Simpan URL ke API
}

// Upload foto profil
final response = await CloudinaryService().uploadProfilePhoto(
  file,
  unitId: '456',
);

// Get optimized image URL
String url = CloudinaryService().getImageUrl(
  'sisfo_upz/bukti_transfer/bukti_123',
  width: 400,
);

// Get thumbnail
String thumb = CloudinaryService().getThumbnailUrl(publicId, size: 100);
```

### 13.5 File Structure

```
lib/backend/cloudinary/
├── index.dart              # Exports
├── cloudinary_config.dart  # Konfigurasi
├── cloudinary_service.dart # Service upload
└── cloudinary_example.dart # Contoh penggunaan
```

---

_Last Updated: January 2026_
