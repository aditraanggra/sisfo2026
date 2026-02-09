# AGENTS.md - Development Guidelines for SISFO UPZ

This guide helps agentic coding agents understand the Flutter project structure, conventions, and workflows for the SISFO UPZ (Sistem Informasi Zakat) application.

## Project Overview

**SISFO UPZ** is a Flutter mobile application for Zakat, Infak, and Sedekah (ZIS) management at Unit Pengumpul Zakat (UPZ) BAZNAS Cianjur.

- **Framework**: Flutter 3.x (FlutterFlow generated)
- **Backend**: Laravel API + Supabase  
- **State Management**: Provider
- **Authentication**: Custom JWT-based auth
- **Routing**: GoRouter
- **Localization**: Indonesian (id)

## Build Commands

### Development Commands
```bash
# Install dependencies
flutter pub get

# Run the app in development
flutter run

# Build for production
flutter build apk
flutter build ios

# Analyze code for issues
flutter analyze

# Run tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Format code
dart format .

# Generate code (if using code generation)
flutter packages pub run build_runner build
```

### Test Commands
```bash
# Run all tests
flutter test

# Run single test file
flutter test test/widget_test.dart

# Run tests with coverage
flutter test --coverage

# Run specific test group
flutter test --name "FormValidators"
```

## Code Style Guidelines

### File Structure & Naming
```
lib/
├── auth/                    # Custom authentication
├── backend/                  # API and backend integration
│   ├── api_requests/         # REST API calls
│   ├── schema/structs/       # Data models
│   └── supabase/           # Supabase configuration
├── component/               # Reusable UI components
├── flutter_flow/            # FlutterFlow utilities
├── page/                   # Screen pages
│   ├── auth/               # Login, Register, Profile
│   ├── main_page/          # Home, Laporan, Histori, Profile
│   ├── misc_page/          # Settings, List DKM, Regulasi
│   └── transaksi/          # All ZIS transaction pages
├── services/               # Business logic services
└── main.dart
```

### Component Pattern
Each screen follows FlutterFlow pattern:
- `[name]_widget.dart` - UI widget
- `[name]_model.dart` - State management and logic
- Export model class from widget file: `export '[name]_model.dart';`

### Import Organization
```dart
// Flutter imports first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

// Third-party packages
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Internal imports (absolute paths)
import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/backend/schema/structs/index.dart';
import '/index.dart';
```

### Naming Conventions
- **Files**: snake_case (e.g., `login_widget.dart`, `zakat_fitrah_model.dart`)
- **Classes**: PascalCase (e.g., `LoginWidget`, `LoginModel`)
- **Variables**: camelCase (e.g., `emailLoginTextController`, `profileUPZ`)
- **Constants**: SCREAMING_SNAKE_CASE (e.g., `kThemeModeKey`)
- **Private members**: Prefix with `_` (e.g., `_model`, `_scaffoldKey`)

### State Management
```dart
class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});
  
  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget>
    with TickerProviderStateMixin {
  late LoginModel _model;
  
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());
    // Initialize controllers and focus nodes
  }
  
  @override
  void dispose() {
    _model.dispose(); // Clean up resources
    super.dispose();
  }
}
```

### API Integration
```dart
// API calls return structured responses
final response = await LoginUserCall.call(
  email: email,
  password: password,
);

if (response.succeeded) {
  final user = response.jsonBody['user'];
  // Handle success
} else {
  // Handle error - show Indonesian error messages
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Login gagal: ${response.exceptionMessage}')),
  );
}
```

### Form Validation
Use the centralized `FormValidators` class with Indonesian error messages:

```dart
// Required field validation
TextFormField(
  validator: (value) => FormValidators.validateRequired(value, 'Email'),
)

// Email validation
validator: FormValidators.validateEmail,

// Currency validation (with thousand separators)
validator: (value) => FormValidators.validateCurrency(value, minValue: 1000),

// Phone validation (Indonesian format)
validator: FormValidators.validatePhone,
```

### Currency Handling
Use `CurrencyInputFormatter` for Indonesian format (dots as thousand separators):

```dart
TextFormField(
  inputFormatters: [CurrencyInputFormatter()],
  decoration: InputDecoration(
    prefixText: 'Rp ',
  ),
)

// Convert formatted string to number
final amount = CurrencyInputFormatter.parseFormattedCurrency('1.000.000'); // 1000000
```

### Color Scheme
Use the modern `ModernColors` palette:

```dart
// Primary colors
ModernColors.primaryDark      // #1A3C34 (dark green)
ModernColors.primaryAccent    // #259148 (medium green)

// Backgrounds  
ModernColors.backgroundPrimary  // #F5F7F5 (off-white)
ModernColors.backgroundCard   // #FFFFFF (pure white)

// Text
ModernColors.textPrimary     // #1A1A1A (primary text)
ModernColors.textSecondary   // #6B7280 (secondary text)
```

### Error Handling
```dart
try {
  final result = await apiCall();
  if (result.succeeded) {
    // Handle success
  } else {
    // Show user-friendly Indonesian error
    showErrorDialog(context, 'Terjadi kesalahan: ${result.exceptionMessage}');
  }
} catch (e) {
  // Log and show generic error
  log('Error: $e');
  showErrorDialog(context, 'Terjadi kesalahan yang tidak terduga');
}
```

### Navigation
Use GoRouter with named routes:

```dart
// Programmatic navigation
context.pushNamed('/home');
context.pushNamed('/transaksi/zakat_fitrah');

// Navigation with parameters
context.pushNamed(
  '/edit_profile',
  extra: {'userId': userId},
);
```

## Testing Guidelines

### Test Structure
Follow the existing test patterns in `test/widget_test.dart`:

```dart
void main() {
  group('FeatureName', () {
    group('methodName', () {
      test('should return error when value is null', () {
        final result = FormValidators.validateRequired(null, 'Field');
        expect(result, 'Field wajib diisi');
      });
      
      test('should return null when value is valid', () {
        final result = FormValidators.validateRequired('Valid Value', 'Field');
        expect(result, isNull);
      });
    });
  });
}
```

### Test Indonesian Localization
All user-facing strings and error messages must be in Indonesian:

```dart
expect(result, 'Nama wajib diisi');           // NOT 'Name is required'
expect(result, 'Format email tidak valid');    // NOT 'Invalid email format'
expect(result, 'Nominal harus berupa angka');  // NOT 'Amount must be numeric'
```

## Linting Rules

The project uses `flutter_lints: 4.0.0` with custom `analysis_options.yaml`:

```yaml
analyzer:
  exclude:
    - lib/custom_code/**
    - lib/flutter_flow/custom_functions.dart
```

Key linting rules to follow:
- Use `const` for immutable widgets
- Prefer `final` where possible
- Handle null safety properly
- Use required parameters when appropriate
- Follow effective Dart linting guidelines

## Key Dependencies

### Core Dependencies
- `flutter: sdk` - Flutter framework
- `provider: 6.1.5` - State management
- `go_router: 12.1.3` - Navigation
- `supabase_flutter: 2.9.0` - Backend integration
- `google_fonts: 6.1.0` - Typography

### UI Dependencies  
- `font_awesome_flutter: 10.7.0` - Icons
- `flutter_slidable: 3.1.1` - Swipe actions
- `cached_network_image: 3.4.1` - Image caching
- `flutter_animate: 4.5.0` - Animations

### Form & Input
- `file_picker: 10.1.9` - File selection
- `dropdown_button2: 2.3.9` - Custom dropdowns
- `easy_debounce: 2.0.1` - Input debouncing

## Authentication Flow

Custom JWT-based authentication with persistent state:

```dart
// Login
final response = await LoginUserCall.call(email: email, password: password);
if (response.succeeded) {
  await authManager.signIn(
    user: UserStruct.fromMap(response.jsonBody['user']),
    jwt: response.jsonBody['token'],
  );
}

// Check current user
final currentUser = authManager.currentUser;

// Logout
await authManager.signOut();
```

## API Integration

### Base URLs
- **Main API**: `https://sisfo-upz-sisfoupz-webapp.2rxwkd.easypanel.host/api/v1`
- **Supabase**: `https://jxzqpwcahrynoeplktoe.supabase.co`

### Authentication
All API calls require JWT Bearer token:

```dart
// Token is automatically added by ApiManager
final response = await GetUPZCall.call();
```

### Data Models
Use generated structs in `backend/schema/structs/`:

```dart
class UPZStruct {
  int? id;
  String? unitName;
  String? address;
  // ... other fields
  
  UPZStruct({this.id, this.unitName, this.address});
  
  UPZStruct.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    unitName = data['unit_name'];
    address = data['address'];
  }
  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'unit_name': unitName,
      'address': address,
    };
  }
}
```

## Development Workflow

1. **Setup**: Run `flutter pub get` after pulling changes
2. **Development**: Use `flutter run` for hot reload
3. **Testing**: Run `flutter test` before committing
4. **Linting**: Check `flutter analyze` for code quality
5. **Building**: Use `flutter build apk` or `flutter build ios` for releases

## Common Patterns

### Safe State Updates
```dart
// Always wrap state updates in safeSetState
safeSetState(() {
  _model.isLoading = false;
  _model.errorMessage = null;
});
```

### Loading States
```dart
if (_model.isLoading) {
  return const CircularProgressIndicator();
}

// Show loading during async operations
safeSetState(() => _model.isLoading = true);
try {
  await performOperation();
} finally {
  safeSetState(() => _model.isLoading = false);
}
```

### Responsive Design
```dart
// Use responsive utilities for different screen sizes
if (isWeb) {
  // Web-specific layout
} else if (isTablet) {
  // Tablet layout  
} else {
  // Mobile layout
}
```

## File Upload Integration

For Cloudinary integration (configured but not fully implemented):

```dart
// Import when needed
import '/backend/cloudinary/cloudinary_service.dart';

// Upload file
final response = await CloudinaryService().uploadFile(file);
if (response.success) {
  // Use response.secureUrl
}
```

Remember: This is a FlutterFlow-generated project with extensive customizations. Always follow existing patterns and maintain Indonesian localization throughout the application.