# SISFO UPZ - Sistem Informasi Zakat

Aplikasi Flutter untuk pengelolaan Zakat, Infak, dan Sedekah (ZIS) pada Unit Pengumpul Zakat (UPZ) BAZNAS Cianjur.

## 📱 Tentang Aplikasi

SISFO UPZ adalah aplikasi mobile yang dibangun menggunakan FlutterFlow untuk membantu UPZ dalam:

- Pencatatan transaksi zakat (fitrah & mal)
- Pencatatan infak/sedekah
- Pendistribusian dana ZIS
- Pelaporan dan rekap data
- Penyetoran dana ke BAZNAS

## 🛠️ Tech Stack

| Komponen         | Teknologi                 |
| ---------------- | ------------------------- |
| Framework        | Flutter 3.x (FlutterFlow) |
| Backend          | Laravel API + Supabase    |
| Database         | PostgreSQL (Supabase)     |
| State Management | Provider                  |
| Authentication   | Custom Auth (JWT Token)   |
| Routing          | GoRouter                  |

## 📂 Struktur Project

```
lib/
├── auth/                    # Custom authentication
├── backend/
│   ├── api_requests/        # REST API calls
│   ├── schema/structs/      # Data models/structs
│   └── supabase/            # Supabase configuration
├── component/               # Reusable UI components
├── flutter_flow/            # FlutterFlow utilities
├── page/
│   ├── auth/                # Login, Register, Profile completion
│   ├── main_page/           # Home, Laporan, Histori, Profile
│   ├── misc_page/           # Settings, List DKM, Regulasi
│   └── transaksi/           # Semua halaman transaksi ZIS
└── main.dart
```

## 🔗 API Endpoints

Dokumentasi lengkap API tersedia di: [PROJECT_SPEC.md](./PROJECT_SPEC.md)

## 🚀 Getting Started

### Prerequisites

- Flutter SDK >= 3.0.0
- Dart SDK >= 3.0.0

### Installation

```bash
# Clone repository
git clone [repository-url]

# Install dependencies
flutter pub get

# Run app
flutter run
```

## 📄 Dokumentasi Tambahan

- [PROJECT_SPEC.md](./PROJECT_SPEC.md) - Spesifikasi teknis lengkap
- [assets/pdfs/](./assets/pdfs/) - Dokumen regulasi dan panduan

## 📞 Kontak

BAZNAS Kabupaten Cianjur
