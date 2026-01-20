# Implementation Plan: UX Improvement SISFO UPZ

## Overview

Implementasi perbaikan UX untuk aplikasi SISFO UPZ akan dilakukan secara bertahap, dimulai dari perbaikan bug kritis (delete confirmation), kemudian komponen-komponen UX baru, dan terakhir integrasi ke halaman-halaman yang ada.

## Tasks

- [x] 1. Fix Critical Bug: Delete Confirmation Flow
  - [x] 1.1 Fix delete confirmation in histori_transaksi_widget.dart
    - Move confirmation dialog BEFORE deleteZakatFitrahCall API call
    - Apply same fix for all transaction types (Infak, Zakat Mal, Kotak Amal, Pendistribusian)
    - _Requirements: 6.4_
  - [ ]\* 1.2 Write property test for delete confirmation flow
    - **Property 1: Delete Confirmation Before API Call**
    - **Validates: Requirements 6.4**

- [x] 2. Create Form Validation Utilities
  - [x] 2.1 Create FormValidators class
    - Create lib/flutter_flow/form_validators.dart
    - Implement validateRequired, validateEmail, validateCurrency, validatePhone
    - All error messages in Bahasa Indonesia
    - _Requirements: 3.1, 3.3, 10.1_
  - [x] 2.2 Create CurrencyInputFormatter
    - Auto-format with thousand separators (1.000.000)
    - Handle backspace and cursor position
    - _Requirements: 3.2, 5.3_
  - [ ]\* 2.3 Write property tests for form validators
    - **Property 3: Inline Validation Display**
    - **Property 4: Currency Formatting Consistency**
    - **Validates: Requirements 3.1, 3.2, 3.3, 5.3**

- [x] 3. Checkpoint - Ensure all tests pass
  - Ensure all tests pass, ask the user if questions arise.

- [x] 4. Create Skeleton Loader Component
  - [x] 4.1 Create SkeletonLoaderWidget
    - Create lib/component/skeleton_loader/skeleton_loader_widget.dart
    - Create lib/component/skeleton_loader/skeleton_loader_model.dart
    - Implement shimmer animation with Container placeholders
    - Support types: listItem, card, profile, form
    - _Requirements: 1.1_
  - [ ]\* 4.2 Write widget test for skeleton loader
    - **Property 9: Skeleton Loader for Loading States**
    - **Validates: Requirements 1.1**

- [x] 5. Create Enhanced Empty State Component
  - [x] 5.1 Create EnhancedEmptyStateWidget
    - Create lib/component/enhanced_empty_state/enhanced_empty_state_widget.dart
    - Create lib/component/enhanced_empty_state/enhanced_empty_state_model.dart
    - Include illustration, title, description, action button, tips
    - _Requirements: 4.1, 4.3_
  - [ ]\* 5.2 Write property test for empty state
    - **Property 5: Empty State Action Button**
    - **Validates: Requirements 4.1, 4.3**

- [x] 6. Create Dialog Service
  - [x] 6.1 Create DialogService class
    - Create lib/services/dialog_service.dart
    - Implement showDeleteConfirmation with proper flow
    - Implement showSuccessModal with "Tambah Lagi" and "Lihat Histori" options
    - Implement showErrorDialog with retry option
    - _Requirements: 6.4, 9.1, 9.2, 10.3_
  - [ ]\* 6.2 Write property tests for dialog service
    - **Property 6: Error Message with Retry**
    - **Property 8: Success Modal Display**
    - **Validates: Requirements 9.1, 9.2, 10.3**

- [x] 7. Checkpoint - Ensure all tests pass
  - Ensure all tests pass, ask the user if questions arise.

- [x] 8. Create Error Handler Service
  - [x] 8.1 Create ErrorHandler class
    - Create lib/services/error_handler.dart
    - Map API errors to user-friendly Indonesian messages
    - Implement isRetryable logic
    - _Requirements: 10.1, 10.2, 10.3_
  - [ ]\* 8.2 Write property test for error handler
    - **Property 11: Error Message in Indonesian**
    - **Validates: Requirements 10.1, 10.2**

- [x] 9. Create Quick Actions Component
  - [x] 9.1 Create QuickActionsWidget
    - Create lib/component/quick_actions/quick_actions_widget.dart
    - Create lib/component/quick_actions/quick_actions_model.dart
    - Grid layout with 6 quick action buttons
    - Navigate to respective transaction pages
    - _Requirements: 2.1_
  - [ ]\* 9.2 Write widget test for quick actions
    - Verify all 6 buttons render and navigate correctly
    - _Requirements: 2.1_

- [x] 10. Integrate Components into Home Page
  - [x] 10.1 Add QuickActionsWidget to home_widget.dart
    - Place below profile card
    - _Requirements: 2.1_
  - [x] 10.2 Replace spinner with SkeletonLoader in home_widget.dart
    - Use card type skeleton for dashboard cards
    - _Requirements: 1.1_

- [x] 11. Checkpoint - Ensure all tests pass
  - Ensure all tests pass, ask the user if questions arise.

- [x] 12. Integrate Components into Transaction Forms
  - [x] 12.1 Add real-time validation to zakat_fitrah_widget.dart
    - Use FormValidators for all fields
    - Show inline errors on field blur
    - _Requirements: 3.1, 3.3_
  - [x] 12.2 Add CurrencyInputFormatter to amount fields
    - Apply to nominalInfakTextController and similar fields
    - _Requirements: 3.2_
  - [x] 12.3 Add success modal after form submission
    - Use DialogService.showSuccessModal
    - _Requirements: 9.1, 9.2_
  - [ ]\* 12.4 Write property test for form submission flow
    - **Property 2: Form Submission Button State**
    - **Property 7: Form Data Preservation on Error**
    - **Validates: Requirements 1.3, 3.6**

- [x] 13. Integrate Components into Transaction History
  - [x] 13.1 Replace EmptyListWidget with EnhancedEmptyStateWidget
    - Add contextual tips for each transaction type
    - _Requirements: 4.1, 4.3, 4.4_
  - [x] 13.2 Replace spinner with SkeletonLoader
    - Use listItem type skeleton
    - _Requirements: 1.1_
  - [x] 13.3 Update delete flow to use DialogService
    - Ensure confirmation before API call
    - _Requirements: 6.4_

- [x] 14. Checkpoint - Ensure all tests pass
  - Ensure all tests pass, ask the user if questions arise.

- [x] 15. Accessibility Improvements
  - [x] 15.1 Add semantic labels to interactive elements
    - Add Semantics widgets to buttons and icons
    - _Requirements: 7.2_
  - [x] 15.2 Update status indicators with icons
    - Add icons alongside color for verified/unverified status
    - _Requirements: 7.3, 7.4_
  - [ ]\* 15.3 Write property test for accessibility
    - **Property 12: Status Indicator Accessibility**
    - **Validates: Requirements 7.3, 7.4**

- [x] 16. Touch Target Size Audit
  - [x] 16.1 Audit and fix touch target sizes
    - Ensure all buttons, icons are minimum 48x48dp
    - Update IconButton sizes where needed
    - _Requirements: 5.2_
  - [ ]\* 16.2 Write property test for touch targets
    - **Property 10: Touch Target Size**
    - **Validates: Requirements 5.2**

- [x] 17. Final Checkpoint - Ensure all tests pass
  - Ensure all tests pass, ask the user if questions arise.
  - Run full test suite
  - Verify all property tests pass

## Notes

- Tasks marked with `*` are optional and can be skipped for faster MVP
- Each task references specific requirements for traceability
- Checkpoints ensure incremental validation
- Property tests validate universal correctness properties
- Unit tests validate specific examples and edge cases
- Priority order: Bug fix (1) → Core utilities (2-3) → Components (4-9) → Integration (10-16)
