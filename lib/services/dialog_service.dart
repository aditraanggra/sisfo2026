import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/flutter_flow/flutter_flow_theme.dart';

/// Enum representing the action taken on a success modal.
enum SuccessModalAction {
  /// User tapped "Tambah Lagi" button
  addMore,

  /// User tapped "Lihat Histori" button
  viewHistory,

  /// Dialog was dismissed (tapped outside or auto-dismissed)
  dismissed,
}

/// Enum representing the action taken on an error dialog.
enum ErrorDialogAction {
  /// User tapped "Coba Lagi" button
  retry,

  /// Dialog was dismissed
  dismissed,
}

/// DialogService provides centralized dialog management for the application.
/// All dialogs use consistent styling and Indonesian language.
///
/// Requirements: 6.4, 9.1, 9.2, 10.3
class DialogService {
  /// Shows a delete confirmation dialog.
  /// Returns true if user confirms deletion, false otherwise.
  ///
  /// This method MUST be called BEFORE executing any delete API call
  /// to ensure proper confirmation flow (Requirement 6.4).
  static Future<bool> showDeleteConfirmation({
    required BuildContext context,
    required String itemName,
    String? itemId,
  }) async {
    final theme = FlutterFlowTheme.of(context);

    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: theme.secondaryBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: theme.error.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Icon(
                  Icons.delete_outline_rounded,
                  color: theme.error,
                  size: 24.0,
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Text(
                  'Hapus Data',
                  style: theme.titleMedium.override(
                    font: GoogleFonts.notoSans(fontWeight: FontWeight.w600),
                    color: theme.primaryText,
                    letterSpacing: 0.0,
                  ),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Apakah Anda yakin ingin menghapus data ini?',
                style: theme.bodyMedium.override(
                  font: GoogleFonts.notoSans(),
                  color: theme.primaryText,
                  letterSpacing: 0.0,
                ),
              ),
              const SizedBox(height: 12.0),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: theme.primaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      color: theme.secondaryText,
                      size: 20.0,
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        itemId != null ? '$itemName (ID: $itemId)' : itemName,
                        style: theme.bodySmall.override(
                          font: GoogleFonts.notoSans(),
                          color: theme.secondaryText,
                          letterSpacing: 0.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Data yang dihapus tidak dapat dikembalikan.',
                style: theme.labelSmall.override(
                  font: GoogleFonts.notoSans(),
                  color: theme.error,
                  letterSpacing: 0.0,
                ),
              ),
            ],
          ),
          actionsPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
          actions: [
            Row(
              children: [
                Expanded(
                  child: Semantics(
                    label: 'Batal hapus',
                    button: true,
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(dialogContext).pop(false),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(0, 48),
                        side: BorderSide(color: theme.alternate),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        'Batal',
                        style: theme.bodyMedium.override(
                          font:
                              GoogleFonts.notoSans(fontWeight: FontWeight.w600),
                          color: theme.primaryText,
                          letterSpacing: 0.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: Semantics(
                    label: 'Konfirmasi hapus data',
                    button: true,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(dialogContext).pop(true),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(0, 48),
                        backgroundColor: theme.error,
                        foregroundColor: Colors.white,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        'Hapus',
                        style: theme.bodyMedium.override(
                          font:
                              GoogleFonts.notoSans(fontWeight: FontWeight.w600),
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );

    return result ?? false;
  }

  /// Shows a success modal after a transaction is saved.
  /// Provides options to add another transaction or view history.
  /// Requirements: 9.1, 9.2
  static Future<SuccessModalAction?> showSuccessModal({
    required BuildContext context,
    required String title,
    required String message,
    Map<String, String>? transactionSummary,
    VoidCallback? onAddMore,
    VoidCallback? onViewHistory,
    int autoDismissSeconds = 0,
  }) async {
    final theme = FlutterFlowTheme.of(context);

    final result = await showDialog<SuccessModalAction>(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        if (autoDismissSeconds > 0) {
          Future.delayed(Duration(seconds: autoDismissSeconds), () {
            if (Navigator.of(dialogContext).canPop()) {
              Navigator.of(dialogContext).pop(SuccessModalAction.dismissed);
            }
          });
        }

        return AlertDialog(
          backgroundColor: theme.secondaryBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          contentPadding: const EdgeInsets.all(24.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  color: theme.success.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_circle_rounded,
                  color: theme.success,
                  size: 48.0,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                title,
                textAlign: TextAlign.center,
                style: theme.titleMedium.override(
                  font: GoogleFonts.notoSans(fontWeight: FontWeight.w600),
                  color: theme.primaryText,
                  letterSpacing: 0.0,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                message,
                textAlign: TextAlign.center,
                style: theme.bodyMedium.override(
                  font: GoogleFonts.notoSans(),
                  color: theme.secondaryText,
                  letterSpacing: 0.0,
                ),
              ),
              if (transactionSummary != null &&
                  transactionSummary.isNotEmpty) ...[
                const SizedBox(height: 16.0),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: theme.primaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: transactionSummary.entries.map((entry) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              entry.key,
                              style: theme.labelSmall.override(
                                font: GoogleFonts.notoSans(),
                                color: theme.secondaryText,
                                letterSpacing: 0.0,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                entry.value,
                                textAlign: TextAlign.end,
                                style: theme.bodySmall.override(
                                  font: GoogleFonts.notoSans(
                                      fontWeight: FontWeight.w600),
                                  color: theme.primaryText,
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
              const SizedBox(height: 24.0),
              Row(
                children: [
                  if (onAddMore != null)
                    Expanded(
                      child: Semantics(
                        label: 'Tambah transaksi lagi',
                        button: true,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(dialogContext)
                                .pop(SuccessModalAction.addMore);
                            onAddMore();
                          },
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size(0, 48),
                            side: BorderSide(color: theme.primary),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Text(
                            'Tambah Lagi',
                            style: theme.bodyMedium.override(
                              font: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.w600),
                              color: theme.primary,
                              letterSpacing: 0.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (onAddMore != null && onViewHistory != null)
                    const SizedBox(width: 12.0),
                  if (onViewHistory != null)
                    Expanded(
                      child: Semantics(
                        label: 'Lihat histori transaksi',
                        button: true,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(dialogContext)
                                .pop(SuccessModalAction.viewHistory);
                            onViewHistory();
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(0, 48),
                            backgroundColor: theme.primary,
                            foregroundColor: Colors.white,
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Text(
                            'Lihat Histori',
                            style: theme.bodyMedium.override(
                              font: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.w600),
                              color: Colors.white,
                              letterSpacing: 0.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              if (onAddMore == null && onViewHistory == null)
                SizedBox(
                  width: double.infinity,
                  child: Semantics(
                    label: 'Tutup dialog',
                    button: true,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(dialogContext)
                          .pop(SuccessModalAction.dismissed),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(0, 48),
                        backgroundColor: theme.primary,
                        foregroundColor: Colors.white,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        'Tutup',
                        style: theme.bodyMedium.override(
                          font:
                              GoogleFonts.notoSans(fontWeight: FontWeight.w600),
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );

    return result;
  }

  /// Shows an error dialog with optional retry functionality.
  /// Error messages are displayed in Indonesian (Requirement 10.1, 10.2).
  static Future<ErrorDialogAction?> showErrorDialog({
    required BuildContext context,
    String title = 'Terjadi Kesalahan',
    required String message,
    VoidCallback? onRetry,
    bool isRetryable = true,
  }) async {
    final theme = FlutterFlowTheme.of(context);

    final result = await showDialog<ErrorDialogAction>(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: theme.secondaryBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: theme.error.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Icon(
                  Icons.error_outline_rounded,
                  color: theme.error,
                  size: 24.0,
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Text(
                  title,
                  style: theme.titleMedium.override(
                    font: GoogleFonts.notoSans(fontWeight: FontWeight.w600),
                    color: theme.primaryText,
                    letterSpacing: 0.0,
                  ),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message,
                style: theme.bodyMedium.override(
                  font: GoogleFonts.notoSans(),
                  color: theme.primaryText,
                  letterSpacing: 0.0,
                ),
              ),
              if (isRetryable && onRetry != null) ...[
                const SizedBox(height: 12.0),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: theme.primaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.lightbulb_outline_rounded,
                        color: theme.warning,
                        size: 20.0,
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          'Silakan coba lagi atau periksa koneksi internet Anda.',
                          style: theme.labelSmall.override(
                            font: GoogleFonts.notoSans(),
                            color: theme.secondaryText,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
          actionsPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
          actions: [
            Row(
              children: [
                Expanded(
                  child: Semantics(
                    label: 'Tutup dialog error',
                    button: true,
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(dialogContext)
                          .pop(ErrorDialogAction.dismissed),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(0, 48),
                        side: BorderSide(color: theme.alternate),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        'Tutup',
                        style: theme.bodyMedium.override(
                          font:
                              GoogleFonts.notoSans(fontWeight: FontWeight.w600),
                          color: theme.primaryText,
                          letterSpacing: 0.0,
                        ),
                      ),
                    ),
                  ),
                ),
                if (isRetryable && onRetry != null) ...[
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Semantics(
                      label: 'Coba lagi',
                      button: true,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(dialogContext)
                              .pop(ErrorDialogAction.retry);
                          onRetry();
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(0, 48),
                          backgroundColor: theme.primary,
                          foregroundColor: Colors.white,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          'Coba Lagi',
                          style: theme.bodyMedium.override(
                            font: GoogleFonts.notoSans(
                                fontWeight: FontWeight.w600),
                            color: Colors.white,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        );
      },
    );

    return result;
  }

  /// Shows a simple info dialog.
  static Future<void> showInfoDialog({
    required BuildContext context,
    required String title,
    required String message,
  }) async {
    final theme = FlutterFlowTheme.of(context);

    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: theme.secondaryBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: theme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Icon(
                  Icons.info_outline_rounded,
                  color: theme.primary,
                  size: 24.0,
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Text(
                  title,
                  style: theme.titleMedium.override(
                    font: GoogleFonts.notoSans(fontWeight: FontWeight.w600),
                    color: theme.primaryText,
                    letterSpacing: 0.0,
                  ),
                ),
              ),
            ],
          ),
          content: Text(
            message,
            style: theme.bodyMedium.override(
              font: GoogleFonts.notoSans(),
              color: theme.primaryText,
              letterSpacing: 0.0,
            ),
          ),
          actionsPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
          actions: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(0, 48),
                  backgroundColor: theme.primary,
                  foregroundColor: Colors.white,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'OK',
                  style: theme.bodyMedium.override(
                    font: GoogleFonts.notoSans(fontWeight: FontWeight.w600),
                    color: Colors.white,
                    letterSpacing: 0.0,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Shows a confirmation dialog with custom actions.
  static Future<bool> showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String message,
    String confirmText = 'Ya',
    String cancelText = 'Tidak',
    bool isDestructive = false,
  }) async {
    final theme = FlutterFlowTheme.of(context);

    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: theme.secondaryBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: Text(
            title,
            style: theme.titleMedium.override(
              font: GoogleFonts.notoSans(fontWeight: FontWeight.w600),
              color: theme.primaryText,
              letterSpacing: 0.0,
            ),
          ),
          content: Text(
            message,
            style: theme.bodyMedium.override(
              font: GoogleFonts.notoSans(),
              color: theme.primaryText,
              letterSpacing: 0.0,
            ),
          ),
          actionsPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
          actions: [
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(dialogContext).pop(false),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(0, 48),
                      side: BorderSide(color: theme.alternate),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      cancelText,
                      style: theme.bodyMedium.override(
                        font: GoogleFonts.notoSans(fontWeight: FontWeight.w600),
                        color: theme.primaryText,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(dialogContext).pop(true),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(0, 48),
                      backgroundColor:
                          isDestructive ? theme.error : theme.primary,
                      foregroundColor: Colors.white,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      confirmText,
                      style: theme.bodyMedium.override(
                        font: GoogleFonts.notoSans(fontWeight: FontWeight.w600),
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );

    return result ?? false;
  }
}
