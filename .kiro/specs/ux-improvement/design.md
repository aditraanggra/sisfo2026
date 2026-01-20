# Design Document: UX Improvement SISFO UPZ

## Overview

Dokumen ini menjelaskan desain teknis untuk perbaikan UX aplikasi SISFO UPZ. Fokus utama adalah meningkatkan pengalaman pengguna melalui perbaikan loading states, form validation, empty states, navigation, dan error handling.

Aplikasi ini dibangun dengan Flutter menggunakan FlutterFlow, sehingga desain akan mengikuti pattern dan struktur yang sudah ada sambil memperkenalkan komponen baru yang lebih baik.

## Architecture

### Current Architecture

```
┌─────────────────────────────────────────────────────────┐
│                      UI Layer                           │
│  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐   │
│  │  Pages  │  │Components│  │ Widgets │  │  Theme  │   │
│  └────┬────┘  └────┬────┘  └────┬────┘  └────┬────┘   │
│       │            │            │            │         │
│       └────────────┴────────────┴────────────┘         │
│                         │                               │
│  ┌──────────────────────┴──────────────────────┐       │
│  │              State Management               │       │
│  │         (Provider + FFAppState)             │       │
│  └──────────────────────┬──────────────────────┘       │
│                         │                               │
│  ┌──────────────────────┴──────────────────────┐       │
│  │              Backend Layer                  │       │
│  │    ┌─────────┐  ┌─────────┐  ┌─────────┐   │       │
│  │    │API Calls│  │Supabase │  │Cloudinary│   │       │
│  │    └─────────┘  └─────────┘  └─────────┘   │       │
│  └─────────────────────────────────────────────┘       │
└─────────────────────────────────────────────────────────┘
```

### Proposed UX Enhancement Layer

```
┌─────────────────────────────────────────────────────────┐
│                  UX Enhancement Layer                   │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐     │
│  │  Skeleton   │  │   Empty     │  │   Error     │     │
│  │  Loaders    │  │   States    │  │  Handlers   │     │
│  └─────────────┘  └─────────────┘  └─────────────┘     │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐     │
│  │   Form      │  │  Success    │  │  Feedback   │     │
│  │ Validators  │  │   Modals    │  │  Utilities  │     │
│  └─────────────┘  └─────────────┘  └─────────────┘     │
└─────────────────────────────────────────────────────────┘
```

## Components and Interfaces

### 1. Skeleton Loader Component

```dart
// lib/component/skeleton_loader/skeleton_loader_widget.dart

class SkeletonLoaderWidget extends StatelessWidget {
  final SkeletonType type; // list, card, profile, form
  final int itemCount;

  // Renders shimmer animation with content placeholder
  // based on the type parameter
}

enum SkeletonType {
  listItem,    // For transaction lists
  card,        // For dashboard cards
  profile,     // For profile sections
  form,        // For form fields
}
```

### 2. Enhanced Empty State Component

```dart
// lib/component/enhanced_empty_state/enhanced_empty_state_widget.dart

class EnhancedEmptyStateWidget extends StatelessWidget {
  final String title;
  final String description;
  final String? illustrationAsset;
  final String actionButtonText;
  final VoidCallback onActionPressed;
  final List<String>? tips; // Contextual tips

  // Renders illustrated empty state with action button
}
```

### 3. Form Validator Utility

```dart
// lib/flutter_flow/form_validators.dart

class FormValidators {
  static String? validateRequired(String? value, String fieldName);
  static String? validateEmail(String? value);
  static String? validateCurrency(String? value);
  static String? validatePhone(String? value);

  // Real-time validation with Indonesian error messages
}

class CurrencyInputFormatter extends TextInputFormatter {
  // Auto-formats input with thousand separators
  // e.g., 1000000 -> 1.000.000
}
```

### 4. Confirmation Dialog Service

```dart
// lib/services/dialog_service.dart

class DialogService {
  static Future<bool> showDeleteConfirmation({
    required BuildContext context,
    required String itemName,
    required String itemId,
  });

  static Future<void> showSuccessModal({
    required BuildContext context,
    required String title,
    required String message,
    VoidCallback? onAddMore,
    VoidCallback? onViewHistory,
  });

  static Future<void> showErrorDialog({
    required BuildContext context,
    required String message,
    VoidCallback? onRetry,
  });
}
```

### 5. Quick Actions Component

```dart
// lib/component/quick_actions/quick_actions_widget.dart

class QuickActionsWidget extends StatelessWidget {
  // Grid of quick action buttons for home screen
  // - Zakat Fitrah
  // - Infak/Sedekah
  // - Zakat Mal
  // - Setor ZIS
  // - Pendistribusian
  // - Laporan
}
```

## Data Models

### Loading State Model

```dart
class LoadingState {
  final bool isLoading;
  final String? message;
  final DateTime? startTime;

  bool get isLongRunning =>
    startTime != null &&
    DateTime.now().difference(startTime!) > Duration(seconds: 3);
}
```

### Form State Model

```dart
class FormFieldState {
  final String value;
  final String? error;
  final bool isDirty;
  final bool isValid;

  FormFieldState copyWith({...});
}

class TransactionFormState {
  final FormFieldState date;
  final FormFieldState name;
  final FormFieldState amount;
  final FormFieldState description;
  final bool isSubmitting;
  final bool hasUnsavedChanges;
}
```

### Error State Model

```dart
class AppError {
  final String code;
  final String userMessage; // Indonesian, user-friendly
  final String? technicalMessage; // For logging
  final ErrorType type;
  final bool isRetryable;

  factory AppError.fromApiError(dynamic error);
  factory AppError.networkError();
  factory AppError.sessionExpired();
}

enum ErrorType {
  network,
  validation,
  authentication,
  server,
  unknown,
}
```

## Correctness Properties

_A property is a characteristic or behavior that should hold true across all valid executions of a system—essentially, a formal statement about what the system should do. Properties serve as the bridge between human-readable specifications and machine-verifiable correctness guarantees._

### Property 1: Delete Confirmation Before API Call

_For any_ delete action on any transaction type, the confirmation dialog SHALL be displayed and user must confirm BEFORE the delete API call is executed.
**Validates: Requirements 6.4**

### Property 2: Form Submission Button State

_For any_ form with a submit button, when the form is being submitted (API call in progress), the submit button SHALL be disabled and show loading indicator.
**Validates: Requirements 1.3**

### Property 3: Inline Validation Display

_For any_ form field with validation rules, when the user enters invalid data and the field loses focus, an inline error message SHALL be displayed immediately below the field.
**Validates: Requirements 3.1, 3.3**

### Property 4: Currency Formatting Consistency

_For any_ currency input field or currency display, the value SHALL be formatted with "Rp" prefix and thousand separators (e.g., "Rp 1.000.000").
**Validates: Requirements 3.2, 5.3**

### Property 5: Empty State Action Button

_For any_ list that is empty, the empty state component SHALL include at least one actionable button that allows the user to add the first item.
**Validates: Requirements 4.1, 4.3**

### Property 6: Error Message with Retry

_For any_ API error that is retryable (network error, timeout), the error display SHALL include a retry button that re-executes the failed operation.
**Validates: Requirements 1.5, 10.3**

### Property 7: Form Data Preservation on Error

_For any_ form submission that fails, all user-entered data SHALL be preserved in the form fields, allowing the user to retry without re-entering data.
**Validates: Requirements 3.6**

### Property 8: Success Modal Display

_For any_ successful transaction creation or update, a success modal SHALL be displayed with transaction summary and navigation options.
**Validates: Requirements 9.1, 9.2**

### Property 9: Skeleton Loader for Loading States

_For any_ data fetching operation, when data is loading, a skeleton loader SHALL be displayed that matches the expected content structure.
**Validates: Requirements 1.1**

### Property 10: Touch Target Size

_For any_ interactive element (button, link, icon button), the touch target size SHALL be at least 48x48 density-independent pixels.
**Validates: Requirements 5.2**

### Property 11: Error Message in Indonesian

_For any_ error displayed to the user, the error message SHALL be in Bahasa Indonesia and provide actionable guidance.
**Validates: Requirements 10.1, 10.2**

### Property 12: Status Indicator Accessibility

_For any_ status indicator (verified/unverified, success/error), the status SHALL be conveyed using both color AND icon or text label.
**Validates: Requirements 7.3, 7.4**

## Error Handling

### Error Handling Strategy

```dart
// lib/services/error_handler.dart

class ErrorHandler {
  static AppError handleApiError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
          return AppError(
            code: 'TIMEOUT',
            userMessage: 'Koneksi timeout. Silakan coba lagi.',
            type: ErrorType.network,
            isRetryable: true,
          );
        case DioExceptionType.connectionError:
          return AppError(
            code: 'NO_CONNECTION',
            userMessage: 'Tidak ada koneksi internet. Periksa jaringan Anda.',
            type: ErrorType.network,
            isRetryable: true,
          );
        // ... more cases
      }
    }

    if (error.statusCode == 401) {
      return AppError.sessionExpired();
    }

    return AppError(
      code: 'UNKNOWN',
      userMessage: 'Terjadi kesalahan. Silakan coba lagi.',
      type: ErrorType.unknown,
      isRetryable: true,
    );
  }
}
```

### Error Message Mapping (Indonesian)

| Error Code       | User Message                                                    |
| ---------------- | --------------------------------------------------------------- |
| TIMEOUT          | Koneksi timeout. Silakan coba lagi.                             |
| NO_CONNECTION    | Tidak ada koneksi internet. Periksa jaringan Anda.              |
| SESSION_EXPIRED  | Sesi Anda telah berakhir. Silakan login kembali.                |
| VALIDATION_ERROR | Data tidak valid. Periksa kembali input Anda.                   |
| SERVER_ERROR     | Terjadi kesalahan pada server. Silakan coba beberapa saat lagi. |
| NOT_FOUND        | Data tidak ditemukan.                                           |
| FORBIDDEN        | Anda tidak memiliki akses untuk melakukan aksi ini.             |

## Testing Strategy

### Unit Tests

- Form validators: Test each validation function with valid and invalid inputs
- Currency formatter: Test formatting with various numeric inputs
- Error handler: Test error mapping for different error types
- Date utilities: Test date formatting and parsing

### Widget Tests

- Skeleton loader: Verify correct rendering for each type
- Empty state: Verify illustration, text, and action button rendering
- Success modal: Verify content and button callbacks
- Confirmation dialog: Verify dialog flow and return values

### Property-Based Tests

Using `flutter_test` with custom property generators:

1. **Delete Confirmation Property Test**
   - Generate random transaction data
   - Trigger delete action
   - Verify confirmation dialog appears before API call

2. **Form Validation Property Test**
   - Generate random invalid inputs (empty, whitespace, special chars)
   - Verify validation errors appear for all invalid inputs

3. **Currency Formatting Property Test**
   - Generate random numeric values
   - Verify all outputs have correct format (Rp prefix, separators)

4. **Touch Target Property Test**
   - Traverse widget tree for interactive elements
   - Verify all have minimum 48x48 size

### Integration Tests

- Complete transaction flow: Create → Confirm → Success modal
- Delete flow: Select → Confirm dialog → Delete → Undo option
- Error recovery flow: Submit → Error → Retry → Success

### Test Configuration

- Minimum 100 iterations for property-based tests
- Use `mockito` for API mocking
- Use `golden_toolkit` for visual regression tests
