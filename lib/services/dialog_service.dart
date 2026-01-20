import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';

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
                    child: FFButtonWidget(
                      onPressed: () => Navigator.of(dialogContext).pop(false),
                      text: 'Batal',
                      options: FFButtonOptions(
                        height: 48.0,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        color: theme.secondaryBackground,
                        textStyle: theme.bodyMedium.override(
                          font:
                              GoogleFonts.notoSans(fontWeight: FontWeight.w600),
                          color: theme.primaryText,
                          letterSpacing: 0.0,
                        ),
                        elevation: 0.0,
                        borderSide:
                            BorderSide(color: theme.alternate, width: 1.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      showLoadingIndicator: false,
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: Semantics(
                    label: 'Konfirmasi hapus data',
                    button: true,
                    child: FFButtonWidget(
                      onPressed: () => Navigator.of(dialogContext).pop(true),
                      text: 'Hapus',
                      options: FFButtonOptions(
                        height: 48.0,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        color: theme.error,
                        textStyle: theme.bodyMedium.override(
                          font:
                              GoogleFonts.notoSans(fontWeight: FontWeight.w600),
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      showLoadingIndicator: false,
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
                        child: FFButtonWidget(
                          onPressed: () {
                            Navigator.of(dialogContext)
                                .pop(SuccessModalAction.addMore);
                            onAddMore();
                          },
                          text: 'Tambah Lagi',
                          options: FFButtonOptions(
                            height: 48.0,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            color: theme.secondaryBackground,
                            textStyle: theme.bodyMedium.override(
                              font: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.w600),
                              color: theme.primary,
                              letterSpacing: 0.0,
                            ),
                            elevation: 0.0,
                            borderSide:
                                BorderSide(color: theme.primary, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          showLoadingIndicator: false,
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
                        child: FFButtonWidget(
                          onPressed: () {
                            Navigator.of(dialogContext)
                                .pop(SuccessModalAction.viewHistory);
                            onViewHistory();
                          },
                          text: 'Lihat Histori',
                          options: FFButtonOptions(
                            height: 48.0,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            color: theme.primary,
                            textStyle: theme.bodyMedium.override(
                              font: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.w600),
                              color: Colors.white,
                              letterSpacing: 0.0,
                            ),
                            elevation: 2.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          showLoadingIndicator: false,
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
                    child: FFButtonWidget(
                      onPressed: () => Navigator.of(dialogContext)
                          .pop(SuccessModalAction.dismissed),
                      text: 'Tutup',
                      options: FFButtonOptions(
                        height: 48.0,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        color: theme.primary,
                        textStyle: theme.bodyMedium.override(
                          font:
                              GoogleFonts.notoSans(fontWeight: FontWeight.w600),
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      showLoadingIndicator: false,
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
                    child: FFButtonWidget(
                      onPressed: () => Navigator.of(dialogContext)
                          .pop(ErrorDialogAction.dismissed),
                      text: 'Tutup',
                      options: FFButtonOptions(
                        height: 48.0,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        color: theme.secondaryBackground,
                        textStyle: theme.bodyMedium.override(
                          font:
                              GoogleFonts.notoSans(fontWeight: FontWeight.w600),
                          color: theme.primaryText,
                          letterSpacing: 0.0,
                        ),
                        elevation: 0.0,
                        borderSide:
                            BorderSide(color: theme.alternate, width: 1.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      showLoadingIndicator: false,
                    ),
                  ),
                ),
                if (isRetryable && onRetry != null) ...[
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Semantics(
                      label: 'Coba lagi',
                      button: true,
                      child: FFButtonWidget(
                        onPressed: () {
                          Navigator.of(dialogContext)
                              .pop(ErrorDialogAction.retry);
                          onRetry();
                        },
                        text: 'Coba Lagi',
                        options: FFButtonOptions(
                          height: 48.0,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          color: theme.primary,
                          textStyle: theme.bodyMedium.override(
                            font: GoogleFonts.notoSans(
                                fontWeight: FontWeight.w600),
                            color: Colors.white,
                            letterSpacing: 0.0,
                          ),
                          elevation: 2.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        showLoadingIndicator: false,
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
              child: FFButtonWidget(
                onPressed: () => Navigator.of(dialogContext).pop(),
                text: 'OK',
                options: FFButtonOptions(
                  height: 48.0,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  color: theme.primary,
                  textStyle: theme.bodyMedium.override(
                    font: GoogleFonts.notoSans(fontWeight: FontWeight.w600),
                    color: Colors.white,
                    letterSpacing: 0.0,
                  ),
                  elevation: 2.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                showLoadingIndicator: false,
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
                  child: FFButtonWidget(
                    onPressed: () => Navigator.of(dialogContext).pop(false),
                    text: cancelText,
                    options: FFButtonOptions(
                      height: 48.0,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      color: theme.secondaryBackground,
                      textStyle: theme.bodyMedium.override(
                        font: GoogleFonts.notoSans(fontWeight: FontWeight.w600),
                        color: theme.primaryText,
                        letterSpacing: 0.0,
                      ),
                      elevation: 0.0,
                      borderSide:
                          BorderSide(color: theme.alternate, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    showLoadingIndicator: false,
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: FFButtonWidget(
                    onPressed: () => Navigator.of(dialogContext).pop(true),
                    text: confirmText,
                    options: FFButtonOptions(
                      height: 48.0,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      color: isDestructive ? theme.error : theme.primary,
                      textStyle: theme.bodyMedium.override(
                        font: GoogleFonts.notoSans(fontWeight: FontWeight.w600),
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                      elevation: 2.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    showLoadingIndicator: false,
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
