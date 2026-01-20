# Requirements Document

## Introduction

Dokumen ini berisi requirements untuk modernisasi UI aplikasi SISFO UPZ agar tampilan lebih clean, modern, dan user-friendly sesuai dengan referensi desain fintech modern. Perubahan ini fokus pada aspek visual dan style tanpa mengubah fungsi aplikasi yang sudah ada.

Referensi desain menunjukkan karakteristik:

- Color scheme hijau gelap (dark green) yang sophisticated
- Card dengan gradient dan rounded corners besar
- Typography yang clean dengan hierarchy yang jelas
- Spacing yang generous dan konsisten
- Soft shadows dan subtle depth
- Modern iconography

## Glossary

- **Design_System**: Kumpulan komponen, warna, typography, dan spacing yang konsisten
- **Color_Palette**: Set warna yang digunakan dalam aplikasi
- **Typography_Scale**: Sistem ukuran font yang konsisten
- **Spacing_System**: Sistem jarak/padding yang konsisten
- **Card_Component**: Komponen container dengan background, shadow, dan border radius
- **Header_Section**: Bagian atas halaman dengan informasi utama
- **Balance_Card**: Card yang menampilkan saldo/total dana
- **Quick_Transfer**: Komponen untuk aksi cepat dengan avatar
- **Bottom_Navigation**: Navigasi di bagian bawah layar

---

## Requirements

### Requirement 1: Modernisasi Color Palette

**User Story:** As an operator UPZ, I want a modern and professional color scheme, so that the application feels trustworthy and pleasant to use.

#### Acceptance Criteria

1. THE Design_System SHALL use dark green (#1A3C34) as primary dark color for headers and cards
2. THE Design_System SHALL use medium green (#259148) as primary accent color for buttons and highlights
3. THE Design_System SHALL use light mint (#E8F5E9) as subtle background accent
4. THE Design_System SHALL use off-white (#F5F7F5) as primary background color
5. THE Design_System SHALL use pure white (#FFFFFF) for card backgrounds
6. WHEN displaying monetary values, THE System SHALL use gold/amber (#D4AF37) for emphasis

---

### Requirement 2: Modernisasi Typography

**User Story:** As an operator UPZ, I want clear and readable typography, so that I can quickly scan information.

#### Acceptance Criteria

1. THE Typography_Scale SHALL use Inter or SF Pro as primary font family for modern appearance
2. THE Display_Text (saldo, total) SHALL use font size 32-36px with semibold weight
3. THE Heading_Text SHALL use font size 18-20px with medium weight
4. THE Body_Text SHALL use font size 14-16px with regular weight
5. THE Caption_Text SHALL use font size 12px with regular weight
6. THE System SHALL maintain line height of 1.4-1.5 for optimal readability

---

### Requirement 3: Modernisasi Header dan Profile Section

**User Story:** As an operator UPZ, I want a clean and informative header section, so that I can see my profile and key information at a glance.

#### Acceptance Criteria

1. THE Header_Section SHALL use dark green gradient background (#1A3C34 to #0D1F1A)
2. THE Header_Section SHALL display greeting text "Welcome Back" dengan nama user
3. THE Header_Section SHALL include circular profile avatar with border
4. THE Header_Section SHALL have rounded bottom corners (24-32px radius)
5. WHEN displaying notification icon, THE System SHALL use outlined style with badge indicator

---

### Requirement 4: Modernisasi Balance Card dan Dana Overview

**User Story:** As an operator UPZ, I want a prominent and simple balance display, so that I can immediately see the total funds and availability.

#### Acceptance Criteria

1. THE Balance_Card SHALL use dark green gradient background matching header
2. THE Balance_Card SHALL display "Total Saldo" label in small text above the amount
3. THE Balance_Card SHALL display total monetary value in large white text (28-32px)
4. THE Balance_Card SHALL have large border radius (20-24px)
5. THE Balance_Card SHALL include two action buttons: "Pendistribusian" and "Setor ZIS" with pill-shaped design
6. THE Dana_Overview SHALL display simplified summary below balance card showing:
   - Ketersediaan Dana Pendistribusian (single amount)
   - Ketersediaan Hak Amil (single amount)
7. THE Dana_Overview SHALL use clean card layout with icon and amount only
8. THE Dana_Overview SHALL NOT show complex progress bars or percentages

---

### Requirement 5: Modernisasi Quick Actions Grid

**User Story:** As an operator UPZ, I want easy access to common actions, so that I can quickly navigate to frequent tasks.

#### Acceptance Criteria

1. THE Quick_Actions SHALL display as 2-row grid (3 columns) with icon buttons
2. THE Quick_Actions SHALL include menu: Zakat Fitrah, Infak/Sedekah, Zakat Mal, Setor ZIS, Penyerapan Amil, Laporan
3. THE Quick_Actions SHALL use circular icon containers with subtle background
4. THE Quick_Actions SHALL display name labels below each icon
5. THE Quick_Actions SHALL have consistent spacing (16px between items)
6. THE Quick_Actions SHALL use consistent icon style (outlined or filled)

---

### Requirement 6: Modernisasi Transaction List

**User Story:** As an operator UPZ, I want a clean transaction list, so that I can easily review recent activities.

#### Acceptance Criteria

1. THE Transaction_List SHALL display items in card format with white background
2. THE Transaction_Item SHALL show icon/logo on the left with rounded background
3. THE Transaction_Item SHALL display title and subtitle (type/category) in the middle
4. THE Transaction_Item SHALL show amount and time on the right
5. THE Transaction_Item SHALL use green color for income, red for expense
6. THE Transaction_List SHALL have "View All" link in section header
7. THE Transaction_Item SHALL have subtle separator or spacing between items

---

### Requirement 7: Modernisasi Card Components

**User Story:** As an operator UPZ, I want consistent and modern card designs, so that the interface feels cohesive.

#### Acceptance Criteria

1. THE Card_Component SHALL use border radius of 16-24px
2. THE Card_Component SHALL use soft shadow (blur: 10-20px, opacity: 0.05-0.1)
3. THE Card_Component SHALL have consistent padding of 16-20px
4. THE Card_Component SHALL use white background for content cards
5. THE Card_Component SHALL use gradient background for feature cards (balance, stats)
6. WHEN card is interactive, THE System SHALL show subtle hover/press state

---

### Requirement 8: Modernisasi Bottom Navigation

**User Story:** As an operator UPZ, I want a clean bottom navigation, so that I can easily switch between main sections.

#### Acceptance Criteria

1. THE Bottom_Navigation SHALL use white background with subtle top shadow
2. THE Bottom_Navigation SHALL display 4 main items: Home, Analytics, Transaction, Profile
3. THE Navigation_Item SHALL use outlined icons for inactive state
4. THE Navigation_Item SHALL use filled icons with primary color for active state
5. THE Navigation_Item SHALL include text labels below icons
6. THE Bottom_Navigation SHALL have safe area padding for devices with home indicator

---

### Requirement 9: Modernisasi Form Inputs

**User Story:** As an operator UPZ, I want modern and clear form inputs, so that data entry feels smooth.

#### Acceptance Criteria

1. THE Input_Field SHALL use border radius of 12-16px
2. THE Input_Field SHALL have light gray background (#F5F7F5) for inactive state
3. THE Input_Field SHALL show green border (#259148) for focused state
4. THE Input_Field SHALL display floating label that animates on focus
5. THE Input_Field SHALL have consistent height of 56px
6. THE Input_Field SHALL include appropriate icons (prefix/suffix) where relevant

---

### Requirement 10: Modernisasi Buttons

**User Story:** As an operator UPZ, I want clear and tappable buttons, so that I can confidently perform actions.

#### Acceptance Criteria

1. THE Primary_Button SHALL use dark green background (#1A3C34) with white text
2. THE Primary_Button SHALL have border radius of 12-16px
3. THE Primary_Button SHALL have minimum height of 52px
4. THE Secondary_Button SHALL use white background with green border and text
5. THE Icon_Button SHALL use circular shape with 48px minimum size
6. WHEN button is pressed, THE System SHALL show subtle scale animation (0.98)

---

### Requirement 11: Modernisasi Analytics/Chart Section

**User Story:** As an operator UPZ, I want visual analytics display, so that I can understand data trends at a glance.

#### Acceptance Criteria

1. THE Analytics_Section SHALL display bar chart with green gradient bars
2. THE Analytics_Section SHALL include period selector (1W, 1M, 3M, 6M, 1Y) as pill buttons
3. THE Analytics_Section SHALL show "Spent Overview" with percentage change indicator
4. THE Analytics_Section SHALL display category breakdown with colored indicators
5. THE Chart_Bars SHALL have rounded top corners
6. THE Analytics_Section SHALL use consistent card styling

---

### Requirement 12: Modernisasi Profile/Settings Page

**User Story:** As an operator UPZ, I want a clean profile page, so that I can manage my account easily.

#### Acceptance Criteria

1. THE Profile_Page SHALL display large profile avatar at top center
2. THE Profile_Page SHALL show user name prominently below avatar
3. THE Profile_Page SHALL include quick action buttons (Freeze, Change PIN, Add Card) in row
4. THE Profile_Page SHALL display card details in clean list format
5. THE Profile_Page SHALL use consistent card styling for sections
6. THE Profile_Page SHALL include "See Details" link for expandable sections

---

## Visual Reference Summary

Berdasarkan gambar referensi, berikut adalah karakteristik utama yang perlu diimplementasi:

### Color Scheme

| Element        | Current                   | Target               |
| -------------- | ------------------------- | -------------------- |
| Header BG      | #259148 (bright green)    | #1A3C34 (dark green) |
| Card BG        | White with green gradient | Dark green gradient  |
| Background     | #F1F4F8 (gray)            | #F5F7F5 (off-white)  |
| Accent         | #259148                   | #259148 (keep)       |
| Text Primary   | #14181B                   | #1A1A1A              |
| Text Secondary | #57636C                   | #6B7280              |

### Border Radius

| Element | Current | Target           |
| ------- | ------- | ---------------- |
| Cards   | 12px    | 20-24px          |
| Buttons | 12px    | 12-16px          |
| Inputs  | 12px    | 12-16px          |
| Header  | 0px     | 24-32px (bottom) |

### Shadows

| Element | Current      | Target                    |
| ------- | ------------ | ------------------------- |
| Cards   | blur: 3px    | blur: 16px, opacity: 0.08 |
| Buttons | elevation: 2 | blur: 8px, opacity: 0.1   |

### Typography

| Element  | Current | Target  |
| -------- | ------- | ------- |
| Balance  | 20px    | 32-36px |
| Headings | 16-18px | 18-20px |
| Body     | 14px    | 14-16px |
| Caption  | 12px    | 12px    |

---

## Prioritas Implementasi

| Priority | Requirement               | Impact | Effort |
| -------- | ------------------------- | ------ | ------ |
| P0       | Req 1 - Color Palette     | High   | Low    |
| P0       | Req 7 - Card Components   | High   | Medium |
| P1       | Req 3 - Header Section    | High   | Medium |
| P1       | Req 4 - Balance Card      | High   | Medium |
| P1       | Req 8 - Bottom Navigation | Medium | Low    |
| P2       | Req 2 - Typography        | Medium | Low    |
| P2       | Req 5 - Quick Actions     | Medium | Medium |
| P2       | Req 6 - Transaction List  | Medium | Medium |
| P3       | Req 9 - Form Inputs       | Medium | Medium |
| P3       | Req 10 - Buttons          | Medium | Low    |
| P3       | Req 11 - Analytics        | Low    | High   |
| P3       | Req 12 - Profile Page     | Low    | Medium |
