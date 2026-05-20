# Struktur Direktori Proyek SISFO UPZ

```
lib/
├── auth/                              # Authentication Module
│   └── custom_auth/                    # Custom JWT Auth
│       ├── custom_auth_manager.dart      # Auth state & session management
│       ├── custom_auth_user_provider.dart # User provider
│       └── auth_util.dart              # Auth utilities & exports
│
├── backend/                           # Data & Backend Integration
│   ├── api_requests/                   # REST API Layer
│   │   ├── api_manager.dart            # HTTP client abstraction
│   │   ├── api_calls.dart              # Generated API call functions
│   │   └── get_streamed_response.dart  # Streaming response handler
│   │
│   ├── cloudinary/                     # Cloud Storage (configured)
│   │   ├── cloudinary_config.dart      # Cloudinary credentials
│   │   ├── cloudinary_service.dart     # Upload service
│   │   ├── cloudinary_upload_helper.dart # Upload utilities
│   │   └── index.dart                 # Export barrel
│   │
│   ├── schema/                        # Data Models
│   │   ├── structs/                    # 30+ data structures
│   │   │   ├── upz_struct.dart         # UPZ profile model
│   │   │   ├── user_struct.dart        # User model
│   │   │   ├── data_zf_struct.dart     # Zakat Fitrah model
│   │   │   ├── data_zm_struct.dart     # Zakat Mal model
│   │   │   └── [27 more structs...]    # Other domain models
│   │   └── util/                      # Schema utilities
│   │
│   └── supabase/                      # Supabase Integration
│       ├── supabase.dart               # Supabase client initialization
│
│       ├── database/                    # Database access
│       │   ├── database.dart
│       │   ├── table.dart
│       │   ├── row.dart
│       │   └── tables/                 # 16 table definitions
│       │       ├── users.dart
│       │       ├── zakat_fitrah.dart
│       │       ├── zakat_mal.dart
│       │       ├── [12 more...]
│       │
│       └── storage/                    # Storage access
│           └── storage.dart
│
├── component/                          # Reusable UI Components (15+)
│   ├── card_dana/                      # Dana summary card
│   ├── modern_balance_card/             # Balance display card
│   ├── modern_button/                   # Styled button
│   ├── modern_input/                    # Text input field
│   ├── date_picker/                    # Date selection widget
│   ├── modal_success/                   # Success modal
│   ├── skeleton_loader/                 # Loading skeleton
│   └── [8 more components...]
│
├── components/                         # Additional Components
│   └── empty_list_widget.dart          # Empty state widget
│
├── flutter_flow/                       # FlutterFlow Utilities
│   ├── flutter_flow_theme.dart          # Theme & colors
│   ├── flutter_flow_model.dart          # Base model class
│   ├── flutter_flow_util.dart           # Common utilities
│   ├── flutter_flow_widgets.dart        # Common widgets
│   ├── form_validators.dart             # Validation functions
│   ├── internationalization.dart        # i18n support
│   ├── nav/                            # Navigation utilities
│   ├── custom_functions.dart             # Custom JS functions
│   ├── custom_icons.dart                # Custom icon definitions
│   └── [7 more utilities...]
│
├── page/                              # Application Screens
│   ├── auth/                          # Authentication Screens
│   │   ├── login/
│   │   ├── register/
│   │   └── registration_type/
│   │
│   ├── main_page/                     # Main Navigation Screens
│   │   ├── home/                      # Dashboard
│   │   ├── laporan/                   # Reports
│   │   ├── profile_responsive/         # User profile
│   │   └── histori_transaksi/          # Transaction history
│   │
│   ├── transaksi/                     # Transaction Screens (7+)
│   │   ├── zakat_fitrah/             # Zakat Fitrah form
│   │   ├── zakat_mal/                # Zakat Mal form
│   │   ├── infak_sedekah/            # Infak/Sedekah form
│   │   ├── fidyah/                    # Fidyah form
│   │   ├── kotak_amal/               # Kotak Amal form
│   │   ├── pendistribusian/           # Distribution form
│   │   ├── setor_zis/                # Deposit form
│   │   └── [transaction details...]
│   │
│   └── misc_page/                    # Miscellaneous Screens
│       ├── list_dkm/
│       ├── regulasi/
│       └── settings/
│
├── services/                         # Business Logic Services
│   ├── dialog_service.dart             # Centralized dialog management
│   └── error_handler.dart             # Error handling & translation
│
├── actions/                          # Custom Actions
│   └── actions.dart.dart
│
├── custom_code/                       # Custom Code
│   └── actions/
│       └── save_to_pdf.dart          # PDF export functionality
│
├── app_state.dart                    # Global Application State
│   └── persistent state management via SharedPreferences
│
└── main.dart                        # Application Entry Point
    └── MaterialApp.router with GoRouter configuration
```

## File Kunci

| File | Peran |
|------|-------|
| `main.dart` | Entry point, Router configuration, Theme setup |
| `app_state.dart` | Global state (profileUPZ, listSekolahSD, year) |
| `custom_auth_manager.dart` | JWT auth, session persistence |
| `api_manager.dart` | HTTP client, request/response handling |
| `api_calls.dart` | Generated API endpoint functions |
| `form_validators.dart` | Centralized form validation (Indonesian) |
| `dialog_service.dart` | Success/error dialog management |
| `error_handler.dart` | Error mapping to Indonesian messages |
| `flutter_flow_theme.dart` | Color scheme & theming |