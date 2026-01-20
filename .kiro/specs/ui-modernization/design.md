# Design Document: UI Modernization SISFO UPZ

## Overview

Dokumen ini menjelaskan desain teknis untuk modernisasi UI aplikasi SISFO UPZ. Fokus utama adalah mengubah tampilan visual agar lebih modern, clean, dan user-friendly sesuai dengan referensi desain fintech modern, tanpa mengubah fungsi aplikasi yang sudah ada.

Pendekatan implementasi:

1. Update theme configuration (colors, typography)
2. Create/update reusable components
3. Apply changes to existing pages incrementally

## Architecture

### Design System Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    Design System                        │
│  ┌─────────────────────────────────────────────────┐   │
│  │              Theme Configuration                 │   │
│  │  ┌─────────┐  ┌─────────┐  ┌─────────┐        │   │
│  │  │ Colors  │  │Typography│  │ Spacing │        │   │
│  │  └─────────┘  └─────────┘  └─────────┘        │   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │              Reusable Components                 │   │
│  │  ┌─────────┐  ┌─────────┐  ┌─────────┐        │   │
│  │  │  Cards  │  │ Buttons │  │ Inputs  │        │   │
│  │  └─────────┘  └─────────┘  └─────────┘        │   │
│  │  ┌─────────┐  ┌─────────┐  ┌─────────┐        │   │
│  │  │ Headers │  │  Lists  │  │  Icons  │        │   │
│  │  └─────────┘  └─────────┘  └─────────┘        │   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │              Page Compositions                   │   │
│  │  ┌─────────┐  ┌─────────┐  ┌─────────┐        │   │
│  │  │  Home   │  │ History │  │ Profile │        │   │
│  │  └─────────┘  └─────────┘  └─────────┘        │   │
│  └─────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────┘
```

## Components and Interfaces

### 1. Updated Theme Configuration

```dart
// lib/flutter_flow/flutter_flow_theme.dart - Updated Colors

class ModernColors {
  // Primary Colors
  static const Color primaryDark = Color(0xFF1A3C34);      // Dark green for headers
  static const Color primaryDarkEnd = Color(0xFF0D1F1A);   // Gradient end
  static const Color primaryAccent = Color(0xFF259148);    // Medium green for accents

  // Background Colors
  static const Color backgroundPrimary = Color(0xFFF5F7F5); // Off-white
  static const Color backgroundCard = Color(0xFFFFFFFF);    // Pure white
  static const Color backgroundMint = Color(0xFFE8F5E9);    // Light mint accent

  // Text Colors
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textOnDark = Color(0xFFFFFFFF);

  // Accent Colors
  static const Color goldAccent = Color(0xFFD4AF37);        // For monetary emphasis
  static const Color incomeGreen = Color(0xFF22C55E);       // For income amounts
  static const Color expenseRed = Color(0xFFEF4444);        // For expense amounts
}

class ModernSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
}

class ModernRadius {
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
}
```

### 2. Modern Header Component

```dart
// lib/component/modern_header/modern_header_widget.dart

class ModernHeaderWidget extends StatelessWidget {
  final String userName;
  final String? avatarUrl;
  final VoidCallback? onNotificationTap;
  final int notificationCount;

  // Renders gradient header with:
  // - Greeting text "Welcome Back"
  // - User name
  // - Circular avatar with border
  // - Notification icon with badge
  // - Rounded bottom corners (24px)
}
```

### 3. Modern Balance Card Component

```dart
// lib/component/modern_balance_card/modern_balance_card_widget.dart

class ModernBalanceCardWidget extends StatelessWidget {
  final int totalSaldo;
  final VoidCallback onPendistribusianTap;
  final VoidCallback onSetorZisTap;

  // Renders balance card with:
  // - Dark green gradient background
  // - "Total Saldo" label
  // - Large monetary value (28-32px)
  // - Two pill-shaped action buttons
  // - Border radius 20-24px
}
```

### 4. Modern Dana Overview Component

```dart
// lib/component/modern_dana_overview/modern_dana_overview_widget.dart

class ModernDanaOverviewWidget extends StatelessWidget {
  final int ketersediaanPendis;
  final int ketersediaanAmil;

  // Renders simplified dana overview with:
  // - Two clean cards side by side
  // - Icon + amount only (no progress bars)
  // - White background with subtle shadow
}
```

### 5. Modern Quick Actions Component

```dart
// lib/component/modern_quick_actions/modern_quick_actions_widget.dart

class ModernQuickActionsWidget extends StatelessWidget {
  // Renders 2x3 grid with:
  // - Zakat Fitrah
  // - Infak/Sedekah
  // - Zakat Mal
  // - Setor ZIS
  // - Penyerapan Amil
  // - Laporan
  // Each item: circular icon container + label below
}
```

### 6. Modern Transaction Item Component

```dart
// lib/component/modern_transaction_item/modern_transaction_item_widget.dart

class ModernTransactionItemWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final int amount;
  final DateTime dateTime;
  final TransactionType type; // income or expense
  final String? iconPath;

  // Renders transaction item with:
  // - Icon on left with rounded background
  // - Title and subtitle in middle
  // - Amount (green/red based on type) and time on right
}

enum TransactionType { income, expense }
```

### 7. Modern Card Wrapper Component

```dart
// lib/component/modern_card/modern_card_widget.dart

class ModernCardWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final bool isGradient;
  final VoidCallback? onTap;

  // Renders card with:
  // - Border radius 20px
  // - Soft shadow (blur: 16px, opacity: 0.08)
  // - Padding 16-20px
  // - White or gradient background
  // - Optional tap feedback
}
```

### 8. Modern Input Field Component

```dart
// lib/component/modern_input/modern_input_widget.dart

class ModernInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;

  // Renders input with:
  // - Border radius 12-16px
  // - Light gray background (#F5F7F5)
  // - Green border on focus
  // - Floating label animation
  // - Height 56px
}
```

### 9. Modern Button Components

```dart
// lib/component/modern_button/modern_button_widget.dart

class ModernPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final IconData? icon;

  // Renders primary button with:
  // - Dark green background (#1A3C34)
  // - White text
  // - Border radius 12-16px
  // - Height 52px
  // - Scale animation on press (0.98)
}

class ModernSecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;

  // Renders secondary button with:
  // - White background
  // - Green border and text
  // - Border radius 12-16px
  // - Height 52px
}

class ModernIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;

  // Renders icon button with:
  // - Circular shape
  // - 48px minimum size
  // - Optional background color
}
```

## Data Models

### Theme Extension Model

```dart
extension ModernThemeExtension on FlutterFlowTheme {
  // New color getters
  Color get primaryDark => ModernColors.primaryDark;
  Color get backgroundPrimary => ModernColors.backgroundPrimary;
  Color get goldAccent => ModernColors.goldAccent;
  Color get incomeGreen => ModernColors.incomeGreen;
  Color get expenseRed => ModernColors.expenseRed;

  // New text style getters
  TextStyle get displayBalance => TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  TextStyle get headingMedium => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: textPrimary,
  );
}
```

### Gradient Definitions

```dart
class ModernGradients {
  static const LinearGradient headerGradient = LinearGradient(
    colors: [ModernColors.primaryDark, ModernColors.primaryDarkEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [ModernColors.primaryDark, Color(0xFF124F23)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
```

### Shadow Definitions

```dart
class ModernShadows {
  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.08),
      blurRadius: 16,
      offset: Offset(0, 4),
    ),
  ];

  static List<BoxShadow> buttonShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 8,
      offset: Offset(0, 2),
    ),
  ];
}
```

## Correctness Properties

_A property is a characteristic or behavior that should hold true across all valid executions of a system—essentially, a formal statement about what the system should do. Properties serve as the bridge between human-readable specifications and machine-verifiable correctness guarantees._

### Property 1: Transaction Color Coding Consistency

_For any_ transaction item displayed in the application, if the transaction type is income, the amount SHALL be displayed in green (#22C55E), and if the transaction type is expense, the amount SHALL be displayed in red (#EF4444).
**Validates: Requirements 6.5**

### Property 2: Card Border Radius Consistency

_For any_ card component in the application, the border radius SHALL be between 16px and 24px inclusive.
**Validates: Requirements 7.1**

### Property 3: Card Padding Consistency

_For any_ card component in the application, the internal padding SHALL be between 16px and 20px inclusive.
**Validates: Requirements 7.3**

### Property 4: Input Field Height Consistency

_For any_ input field in the application, the height SHALL be exactly 56px.
**Validates: Requirements 9.5**

### Property 5: Primary Button Height Constraint

_For any_ primary button in the application, the height SHALL be at least 52px.
**Validates: Requirements 10.3**

### Property 6: Icon Button Size Constraint

_For any_ icon button in the application, the minimum size SHALL be 48x48 pixels.
**Validates: Requirements 10.5**

## Error Handling

UI modernization tidak memerlukan error handling khusus karena fokus pada perubahan visual. Namun, beberapa pertimbangan:

1. **Graceful Degradation**: Jika font custom gagal load, fallback ke system font
2. **Color Accessibility**: Pastikan contrast ratio tetap memenuhi WCAG guidelines
3. **Asset Loading**: Gunakan placeholder jika icon/image gagal load

## Testing Strategy

### Visual Regression Testing

- Gunakan `golden_toolkit` untuk screenshot comparison
- Capture golden files untuk setiap komponen baru
- Compare sebelum dan sesudah perubahan

### Widget Tests

- Test setiap komponen baru secara isolated
- Verify correct rendering of colors, sizes, spacing
- Test interactive states (pressed, focused, disabled)

### Property-Based Tests

Menggunakan `flutter_test`:

1. **Transaction Color Test**
   - Generate random transactions with income/expense types
   - Verify color matches type

2. **Card Consistency Test**
   - Traverse widget tree for card components
   - Verify border radius and padding values

3. **Button Size Test**
   - Find all button widgets
   - Verify minimum size constraints

### Integration Tests

- Test full page compositions
- Verify theme changes apply correctly across pages
- Test navigation with new styling

### Test Configuration

- Use `flutter_test` for widget tests
- Use `golden_toolkit` for visual regression
- Minimum 100 iterations for property-based tests where applicable

## Implementation Notes

### Migration Strategy

1. **Phase 1**: Update theme configuration (colors, typography)
2. **Phase 2**: Create new modern components
3. **Phase 3**: Update Home page with new components
4. **Phase 4**: Update other pages incrementally
5. **Phase 5**: Remove deprecated components

### Backward Compatibility

- Keep existing components functional during migration
- Use feature flags if needed for gradual rollout
- Maintain existing color constants for reference

### Performance Considerations

- Use `const` constructors where possible
- Avoid unnecessary rebuilds with proper state management
- Optimize gradient rendering with caching
