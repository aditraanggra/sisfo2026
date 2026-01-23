# Implementation Plan: UI Modernization SISFO UPZ

## Overview

Implementasi modernisasi UI untuk aplikasi SISFO UPZ akan dilakukan secara bertahap, dimulai dari update theme configuration, kemudian pembuatan komponen-komponen baru, dan terakhir integrasi ke halaman-halaman yang ada.

Bahasa implementasi: **Dart/Flutter** (sesuai dengan project yang sudah ada)

## Tasks

- [x] 1. Update Theme Configuration
  - [x] 1.1 Add Modern Colors to flutter_flow_theme.dart
    - Add ModernColors class with primaryDark, primaryAccent, backgroundPrimary, goldAccent, incomeGreen, expenseRed
    - Update LightModeTheme and DarkModeTheme with new colors
    - _Requirements: 1.1, 1.2, 1.3, 1.4, 1.5, 1.6_
  - [x] 1.2 Add Modern Spacing and Radius constants
    - Add ModernSpacing class (xs, sm, md, lg, xl)
    - Add ModernRadius class (sm, md, lg, xl, xxl)
    - _Requirements: 7.1, 7.3_
  - [x] 1.3 Update Typography configuration
    - Update font family to Inter (via Google Fonts)
    - Add displayBalance, headingMedium text styles
    - _Requirements: 2.1, 2.2, 2.3, 2.4, 2.5, 2.6_

- [x] 2. Checkpoint - Verify theme changes compile
  - Ensure all tests pass, ask the user if questions arise.

- [x] 3. Create Modern Card Component
  - [x] 3.1 Create ModernCardWidget
    - Create lib/component/modern_card/modern_card_widget.dart
    - Create lib/component/modern_card/modern_card_model.dart
    - Implement with border radius 20px, soft shadow, padding 16-20px
    - Support white and gradient backgrounds
    - Add tap feedback animation
    - _Requirements: 7.1, 7.2, 7.3, 7.4, 7.5, 7.6_
  - [ ]\* 3.2 Write widget test for ModernCardWidget
    - **Property 2: Card Border Radius Consistency**
    - **Property 3: Card Padding Consistency**
    - **Validates: Requirements 7.1, 7.3**

- [x] 4. Create Modern Header Component
  - [x] 4.1 Create ModernHeaderWidget
    - Create lib/component/modern_header/modern_header_widget.dart
    - Create lib/component/modern_header/modern_header_model.dart
    - Implement gradient background (#1A3C34 to #0D1F1A)
    - Add greeting text, user name, circular avatar with border
    - Add notification icon with badge
    - Rounded bottom corners (24px)
    - _Requirements: 3.1, 3.2, 3.3, 3.4, 3.5_

- [x] 5. Create Modern Balance Card Component
  - [x] 5.1 Create ModernBalanceCardWidget
    - Create lib/component/modern_balance_card/modern_balance_card_widget.dart
    - Create lib/component/modern_balance_card/modern_balance_card_model.dart
    - Implement dark green gradient background
    - Display "Total Saldo" label and large monetary value (28-32px)
    - Add two pill-shaped action buttons: "Pendistribusian" and "Setor ZIS"
    - Border radius 20-24px
    - _Requirements: 4.1, 4.2, 4.3, 4.4, 4.5_

- [x] 6. Create Modern Dana Overview Component
  - [x] 6.1 Create ModernDanaOverviewWidget
    - Create lib/component/modern_dana_overview/modern_dana_overview_widget.dart
    - Create lib/component/modern_dana_overview/modern_dana_overview_model.dart
    - Display two clean cards side by side
    - Show Ketersediaan Dana Pendistribusian (icon + amount)
    - Show Ketersediaan Hak Amil (icon + amount)
    - NO progress bars or percentages
    - _Requirements: 4.6, 4.7, 4.8_

- [x] 7. Checkpoint - Verify card components
  - Ensure all tests pass, ask the user if questions arise.

- [x] 8. Create Modern Quick Actions Component
  - [x] 8.1 Create ModernQuickActionsWidget
    - Create lib/component/modern_quick_actions/modern_quick_actions_widget.dart
    - Create lib/component/modern_quick_actions/modern_quick_actions_model.dart
    - Implement 2x3 grid layout
    - Include: Zakat Fitrah, Infak/Sedekah, Zakat Mal, Setor ZIS, Penyerapan Amil, Laporan
    - Circular icon containers with subtle background
    - Name labels below each icon
    - Consistent spacing (16px)
    - _Requirements: 5.1, 5.2, 5.3, 5.4, 5.5, 5.6_

- [x] 9. Create Modern Transaction Item Component
  - [x] 9.1 Create ModernTransactionItemWidget
    - Create lib/component/modern_transaction_item/modern_transaction_item_widget.dart
    - Create lib/component/modern_transaction_item/modern_transaction_item_model.dart
    - Icon on left with rounded background
    - Title and subtitle in middle
    - Amount and time on right
    - Green color for income, red for expense
    - _Requirements: 6.1, 6.2, 6.3, 6.4, 6.5, 6.7_
  - [ ]\* 9.2 Write property test for transaction color coding
    - **Property 1: Transaction Color Coding Consistency**
    - **Validates: Requirements 6.5**

- [x] 10. Create Modern Button Components
  - [x] 10.1 Create ModernPrimaryButton
    - Create lib/component/modern_button/modern_primary_button_widget.dart
    - Dark green background (#1A3C34), white text
    - Border radius 12-16px, height 52px
    - Scale animation on press (0.98)
    - _Requirements: 10.1, 10.2, 10.3, 10.6_
  - [x] 10.2 Create ModernSecondaryButton
    - Create lib/component/modern_button/modern_secondary_button_widget.dart
    - White background, green border and text
    - Border radius 12-16px
    - _Requirements: 10.4_
  - [x] 10.3 Create ModernIconButton
    - Create lib/component/modern_button/modern_icon_button_widget.dart
    - Circular shape, 48px minimum size
    - _Requirements: 10.5_
  - [ ]\* 10.4 Write property tests for button components
    - **Property 5: Primary Button Height Constraint**
    - **Property 6: Icon Button Size Constraint**
    - **Validates: Requirements 10.3, 10.5**

- [x] 11. Checkpoint - Verify all components
  - Ensure all tests pass, ask the user if questions arise.

- [x] 12. Create Modern Input Component
  - [x] 12.1 Create ModernInputWidget
    - Create lib/component/modern_input/modern_input_widget.dart
    - Create lib/component/modern_input/modern_input_model.dart
    - Border radius 12-16px
    - Light gray background (#F5F7F5) inactive, green border focused
    - Floating label animation
    - Height 56px
    - Support prefix/suffix icons
    - _Requirements: 9.1, 9.2, 9.3, 9.4, 9.5, 9.6_
  - [ ]\* 12.2 Write property test for input field height
    - **Property 4: Input Field Height Consistency**
    - **Validates: Requirements 9.5**

- [x] 13. Update Home Page with Modern Components
  - [x] 13.1 Replace header in home_widget.dart
    - Replace current gradient header with ModernHeaderWidget
    - Pass user name and avatar data
    - _Requirements: 3.1, 3.2, 3.3, 3.4_
  - [x] 13.2 Replace profile card with ModernBalanceCardWidget
    - Replace ProfileHomeWidget with ModernBalanceCardWidget
    - Connect action buttons to navigation
    - _Requirements: 4.1, 4.2, 4.3, 4.4, 4.5_
  - [x] 13.3 Add ModernDanaOverviewWidget
    - Replace CardDanaWidget and CardDanaBerasWidget with ModernDanaOverviewWidget
    - Display simplified dana overview
    - _Requirements: 4.6, 4.7, 4.8_
  - [x] 13.4 Update QuickActionsWidget with modern styling
    - Update existing QuickActionsWidget or replace with ModernQuickActionsWidget
    - Add Penyerapan Amil to menu
    - _Requirements: 5.1, 5.2, 5.3, 5.4, 5.5, 5.6_

- [x] 14. Checkpoint - Verify Home page updates
  - Ensure all tests pass, ask the user if questions arise.

- [x] 15. Update Transaction History Page
  - [x] 15.1 Update histori_transaksi_widget.dart with modern styling
    - Update background color to off-white (#F5F7F5)
    - Add "View All" link in section headers
    - _Requirements: 6.6_
  - [x] 15.2 Replace transaction list items with ModernTransactionItemWidget
    - Update list rendering to use new component
    - Apply color coding for income/expense
    - _Requirements: 6.1, 6.2, 6.3, 6.4, 6.5, 6.7_

- [x] 16. Update Login Page with Modern Styling
  - [x] 16.1 Update login_widget.dart styling
    - Update background color
    - Replace input fields with ModernInputWidget styling
    - Replace buttons with ModernPrimaryButton styling
    - _Requirements: 9.1, 9.2, 9.3, 9.4, 9.5, 10.1, 10.2, 10.3_

- [x] 17. Update Transaction Form Pages
  - [x] 17.1 Update zakat_fitrah_widget.dart with modern styling
    - Apply ModernInputWidget styling to form fields
    - Apply ModernPrimaryButton styling to submit button
    - Update card styling with ModernCardWidget
    - _Requirements: 9.1, 9.2, 9.3, 9.4, 9.5, 10.1, 10.2, 10.3_
  - [x] 17.2 Update infak_widget.dart with modern styling
    - Update background color to ModernColors.backgroundPrimary
    - Update AppBar to use ModernColors.primaryDark
    - Apply modern input decoration with ModernColors and ModernRadius
    - Update form card with ModernCardWidget styling (shadow, border radius)
    - Apply ModernPrimaryButton styling to submit button
    - Use Google Fonts Inter for typography
    - _Requirements: 9.1, 9.2, 9.3, 9.4, 9.5, 10.1, 10.2, 10.3_
  - [x] 17.3 Update zakat_mal_widget.dart with modern styling
    - Update background color to ModernColors.backgroundPrimary
    - Update AppBar to use ModernColors.primaryDark
    - Apply modern input decoration with ModernColors and ModernRadius
    - Update form card with ModernCardWidget styling (shadow, border radius)
    - Apply ModernPrimaryButton styling to submit button
    - Use Google Fonts Inter for typography
    - _Requirements: 9.1, 9.2, 9.3, 9.4, 9.5, 10.1, 10.2, 10.3_

- [x] 18. Checkpoint - Verify form page updates
  - Ensure all tests pass, ask the user if questions arise.

- [x] 19. Update Profile Page with Modern Styling
  - [x] 19.1 Update profile_responsive_widget.dart
    - Update background color to ModernColors.backgroundPrimary
    - Update AppBar to use ModernColors.primaryDark
    - Update avatar border color to ModernColors.primaryAccent
    - Update card styling with ModernRadius.xl and ModernShadows.cardShadow
    - Update icon colors to ModernColors.primaryAccent
    - Use Google Fonts Inter for typography
    - _Requirements: 12.1, 12.2, 12.3, 12.4, 12.5, 12.6_

- [x] 20. Update Bottom Navigation Styling
  - [x] 20.1 Update nav bar styling in main.dart NavBarPage
    - Add subtle top shadow to BottomNavigationBar
    - Update selectedItemColor to ModernColors.primaryDark
    - Update unselectedItemColor to ModernColors.textSecondary
    - Ensure safe area padding for devices with home indicator
    - _Requirements: 8.1, 8.2, 8.3, 8.4, 8.5, 8.6_

- [x] 21. Update Laporan Page with Modern Styling
  - [x] 21.1 Update laporan_widget.dart
    - Update background color to ModernColors.backgroundPrimary
    - Update AppBar to use ModernColors.primaryDark
    - Apply modern card styling with ModernRadius and ModernShadows
    - Update button styling with ModernColors.primaryDark
    - Apply consistent spacing using ModernSpacing
    - Use Google Fonts Inter for typography
    - _Requirements: 7.1, 7.2, 7.3, 10.1, 10.2, 10.3_

- [x] 22. Final Checkpoint - Full UI Review
  - Ensure all tests pass, ask the user if questions arise.
  - Run full test suite
  - Visual review of all updated pages
  - Verify consistency across the application

## Notes

- Tasks marked with `*` are optional and can be skipped for faster MVP
- Each task references specific requirements for traceability
- Checkpoints ensure incremental validation
- Property tests validate universal correctness properties
- Focus on visual changes only - no functional changes
- Keep existing components functional during migration
- Use existing FlutterFlow patterns and structures

## File Structure for New Components

```
lib/component/
├── modern_card/
│   ├── modern_card_widget.dart
│   └── modern_card_model.dart
├── modern_header/
│   ├── modern_header_widget.dart
│   └── modern_header_model.dart
├── modern_balance_card/
│   ├── modern_balance_card_widget.dart
│   └── modern_balance_card_model.dart
├── modern_dana_overview/
│   ├── modern_dana_overview_widget.dart
│   └── modern_dana_overview_model.dart
├── modern_quick_actions/
│   ├── modern_quick_actions_widget.dart
│   └── modern_quick_actions_model.dart
├── modern_transaction_item/
│   ├── modern_transaction_item_widget.dart
│   └── modern_transaction_item_model.dart
├── modern_button/
│   ├── modern_primary_button_widget.dart
│   ├── modern_secondary_button_widget.dart
│   └── modern_icon_button_widget.dart
└── modern_input/
    ├── modern_input_widget.dart
    └── modern_input_model.dart
```
