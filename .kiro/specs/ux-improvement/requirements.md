# Requirements Document

## Introduction

Dokumen ini berisi rekomendasi perbaikan UX (User Experience) untuk aplikasi SISFO UPZ - Sistem Informasi Zakat untuk Unit Pengumpul Zakat BAZNAS Kabupaten Cianjur. Berdasarkan analisis mendalam terhadap kode UI dan struktur aplikasi, berikut adalah area-area yang memerlukan peningkatan untuk memberikan pengalaman pengguna yang lebih baik.

## Glossary

- **UPZ**: Unit Pengumpul Zakat
- **ZIS**: Zakat, Infak, dan Sedekah
- **Muzakki**: Orang yang membayar zakat
- **Mustahik**: Penerima zakat
- **Operator**: Pengguna aplikasi (operator UPZ DKM/Sekolah)
- **Loading_State**: Kondisi saat aplikasi sedang memuat data
- **Empty_State**: Kondisi saat tidak ada data untuk ditampilkan
- **Error_State**: Kondisi saat terjadi kesalahan
- **Feedback_Visual**: Respons visual yang diberikan kepada pengguna

---

## Requirements

### Requirement 1: Perbaikan Loading State dan Feedback Visual

**User Story:** As an operator UPZ, I want to see clear loading indicators and progress feedback, so that I know the application is working and not frozen.

#### Acceptance Criteria

1. WHEN data is being fetched, THE System SHALL display a skeleton loader instead of only spinner to indicate content structure
2. WHEN an API call takes longer than 3 seconds, THE System SHALL display a contextual message explaining the wait
3. WHEN a form is being submitted, THE System SHALL disable the submit button and show loading state to prevent double submission
4. WHEN data refresh is triggered, THE System SHALL show pull-to-refresh indicator with clear visual feedback
5. IF an API call fails, THEN THE System SHALL display a user-friendly error message with retry option

---

### Requirement 2: Perbaikan Navigation dan Information Architecture

**User Story:** As an operator UPZ, I want intuitive navigation and clear information hierarchy, so that I can quickly find and complete my tasks.

#### Acceptance Criteria

1. THE Home_Screen SHALL display quick action buttons for most frequent tasks (Zakat Fitrah, Infak, Setor ZIS)
2. WHEN user is on Home screen, THE System SHALL show a summary dashboard with key metrics (total pengumpulan, total distribusi, saldo)
3. THE Bottom_Navigation SHALL use consistent iconography with clear labels
4. WHEN navigating between screens, THE System SHALL maintain scroll position and form state
5. THE System SHALL provide breadcrumb navigation for nested screens (e.g., Transaksi > Zakat Fitrah > Detail)

---

### Requirement 3: Perbaikan Form UX dan Input Validation

**User Story:** As an operator UPZ, I want forms that are easy to fill and provide immediate feedback, so that I can enter data quickly and accurately.

#### Acceptance Criteria

1. WHEN user enters invalid data, THE Form SHALL display inline validation errors immediately below the field
2. THE Form SHALL auto-format currency inputs with thousand separators as user types
3. WHEN a required field is empty, THE System SHALL highlight the field with visual indicator before submission
4. THE Date_Picker SHALL default to current date and allow quick selection of recent dates
5. WHEN user completes a transaction form, THE System SHALL show a confirmation summary before final submission
6. IF form submission fails, THEN THE System SHALL preserve all entered data and highlight the error

---

### Requirement 4: Perbaikan Empty State dan Onboarding

**User Story:** As a new operator UPZ, I want helpful guidance when there's no data, so that I understand how to start using the application.

#### Acceptance Criteria

1. WHEN a list is empty, THE System SHALL display an illustrative empty state with actionable guidance
2. WHEN user first logs in with incomplete profile, THE System SHALL show a profile completion wizard with progress indicator
3. THE Empty_State SHALL include a primary action button to add first item (e.g., "Tambah Transaksi Pertama")
4. WHEN user has no transactions in a category, THE System SHALL display contextual tips about that transaction type

---

### Requirement 5: Perbaikan Visual Hierarchy dan Typography

**User Story:** As an operator UPZ, I want clear visual hierarchy and readable text, so that I can scan information quickly and reduce eye strain.

#### Acceptance Criteria

1. THE System SHALL use consistent font sizes: 24px for headings, 16px for body, 14px for secondary text, 12px for captions
2. THE System SHALL maintain minimum touch target size of 48x48dp for all interactive elements
3. WHEN displaying monetary values, THE System SHALL use consistent formatting with currency symbol and thousand separators
4. THE Card_Components SHALL use consistent padding (16dp) and border radius (12dp)
5. THE System SHALL ensure color contrast ratio of at least 4.5:1 for text readability

---

### Requirement 6: Perbaikan Transaction History UX

**User Story:** As an operator UPZ, I want to easily browse and manage transaction history, so that I can track and verify all ZIS activities.

#### Acceptance Criteria

1. THE Transaction_History SHALL support search and filter by date range, type, and amount
2. WHEN displaying transaction list, THE System SHALL group transactions by date with clear date headers
3. THE Slidable_Actions (Edit/Delete) SHALL be discoverable with visual hint icon
4. WHEN user deletes a transaction, THE System SHALL show confirmation dialog BEFORE executing the delete API call
5. THE Transaction_List SHALL support infinite scroll with loading indicator at bottom
6. WHEN transaction is successfully deleted, THE System SHALL show undo option for 5 seconds

---

### Requirement 7: Perbaikan Accessibility dan Inclusive Design

**User Story:** As an operator UPZ with varying abilities, I want the application to be accessible, so that I can use it effectively regardless of my physical capabilities.

#### Acceptance Criteria

1. THE System SHALL support dynamic text scaling up to 200% without layout breaking
2. THE Interactive_Elements SHALL have semantic labels for screen readers
3. THE Color_Scheme SHALL not rely solely on color to convey information (use icons/text as well)
4. WHEN displaying status indicators, THE System SHALL use both color and icon/text labels
5. THE Form_Fields SHALL have visible focus indicators with sufficient contrast

---

### Requirement 8: Perbaikan Performance Perception

**User Story:** As an operator UPZ, I want the application to feel fast and responsive, so that I can complete my tasks efficiently.

#### Acceptance Criteria

1. THE System SHALL implement optimistic UI updates for common actions (add/edit transactions)
2. WHEN loading lists, THE System SHALL show cached data first, then update with fresh data
3. THE System SHALL prefetch data for likely next screens (e.g., transaction form when on history)
4. WHEN network is slow, THE System SHALL show offline indicator and queue actions for later sync
5. THE System SHALL cache frequently accessed data (profile, rekap) locally

---

### Requirement 9: Perbaikan Confirmation dan Success States

**User Story:** As an operator UPZ, I want clear confirmation of my actions, so that I have confidence my data was saved correctly.

#### Acceptance Criteria

1. WHEN a transaction is successfully saved, THE System SHALL display a success modal with transaction summary
2. THE Success_Modal SHALL include options to "Tambah Lagi" or "Lihat Histori"
3. WHEN user completes a multi-step process, THE System SHALL show completion celebration animation
4. THE System SHALL provide haptic feedback on successful form submission (mobile)
5. WHEN displaying success message, THE System SHALL auto-dismiss after 3 seconds or on user tap

---

### Requirement 10: Perbaikan Error Handling dan Recovery

**User Story:** As an operator UPZ, I want helpful error messages and easy recovery options, so that I can resolve issues without frustration.

#### Acceptance Criteria

1. WHEN an error occurs, THE System SHALL display human-readable error message in Bahasa Indonesia
2. THE Error_Message SHALL include specific guidance on how to resolve the issue
3. IF network error occurs, THEN THE System SHALL offer retry button and offline mode option
4. WHEN session expires, THE System SHALL redirect to login with message explaining the situation
5. THE System SHALL log errors for debugging while showing user-friendly messages to operators

---

## Analisis UX Saat Ini

### Temuan Positif

1. ✅ Warna brand hijau (#259148) konsisten digunakan
2. ✅ Struktur navigasi bottom bar sudah ada
3. ✅ Form validation dasar sudah diimplementasi
4. ✅ Loading spinner sudah ada (SpinKitFadingFour)
5. ✅ Dark mode support sudah ada

### Area yang Perlu Diperbaiki

#### 1. Loading States

- Saat ini hanya menggunakan spinner tanpa konteks
- Tidak ada skeleton loader untuk preview konten
- Multiple nested FutureBuilder menyebabkan loading berulang

#### 2. Form UX

- Validasi hanya muncul saat submit, bukan real-time
- Tidak ada auto-format untuk input currency
- Konfirmasi delete dipanggil SETELAH API call (seharusnya sebelum)

#### 3. Empty States

- EmptyListWidget terlalu sederhana
- Tidak ada guidance untuk user baru
- Tidak ada ilustrasi yang engaging

#### 4. Navigation

- Tidak ada quick actions di home
- Tab bar di histori transaksi bisa overwhelming (5 tabs)
- Tidak ada breadcrumb untuk nested navigation

#### 5. Visual Consistency

- Beberapa hardcoded colors (Color(0xFF259148)) sebaiknya dari theme
- Padding dan spacing tidak selalu konsisten
- Font size bervariasi tanpa sistem yang jelas

#### 6. Error Handling

- Error message langsung dari API tanpa formatting
- Tidak ada retry mechanism yang jelas
- Session expired handling bisa lebih baik

---

## Prioritas Implementasi

| Priority | Requirement                            | Impact | Effort |
| -------- | -------------------------------------- | ------ | ------ |
| P0       | Req 6.4 - Fix delete confirmation flow | High   | Low    |
| P0       | Req 3.1 - Inline validation            | High   | Medium |
| P1       | Req 1.1 - Skeleton loaders             | High   | Medium |
| P1       | Req 4.1 - Better empty states          | Medium | Low    |
| P1       | Req 2.1 - Quick actions on home        | High   | Medium |
| P2       | Req 5 - Visual hierarchy               | Medium | Medium |
| P2       | Req 8 - Performance perception         | Medium | High   |
| P3       | Req 7 - Accessibility                  | Medium | High   |
