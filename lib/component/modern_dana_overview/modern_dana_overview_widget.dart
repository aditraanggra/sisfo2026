import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'modern_dana_overview_model.dart';
export 'modern_dana_overview_model.dart';

/// Modern overview component displaying Muzakki, Munfiq, and Mustahik counts
/// Requirements: 4.6, 4.7, 4.8
///
/// Features:
/// - Three clean cards side by side (Req 4.6, 4.7)
/// - Show Jumlah Muzakki (icon + count) (Req 4.6)
/// - Show Jumlah Munfiq (icon + count)
/// - Show Jumlah Mustahik (icon + count) (Req 4.7)
/// - Clean card layout with icon and count only (Req 4.8)
class ModernDanaOverviewWidget extends StatefulWidget {
  const ModernDanaOverviewWidget({
    super.key,
    required this.jumlahMuzakki,
    required this.jumlahMunfiq,
    required this.jumlahMustahik,
  });

  /// Total number of Muzakki (zakat payers)
  final int jumlahMuzakki;

  /// Total number of Munfiq (infak/sedekah donors)
  final int jumlahMunfiq;

  /// Total number of Mustahik (zakat recipients)
  final int jumlahMustahik;

  @override
  State<ModernDanaOverviewWidget> createState() =>
      _ModernDanaOverviewWidgetState();
}

class _ModernDanaOverviewWidgetState extends State<ModernDanaOverviewWidget> {
  late ModernDanaOverviewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModernDanaOverviewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  /// Formats the count number with thousand separator
  String _formatNumber(int value) {
    return formatNumber(
      value,
      formatType: FormatType.custom,
      format: '###,###',
      locale: 'id_ID',
    );
  }

  @override
  Widget build(BuildContext context) {
    // Requirements: 4.6, 4.7 - Three clean cards side by side
    return Row(
      children: [
        // Jumlah Muzakki
        Expanded(
          child: _buildCountCard(
            context: context,
            title: 'Jumlah Muzakki',
            count: widget.jumlahMuzakki,
            icon: Icons.people_outline_rounded,
            iconBackgroundColor: FlutterFlowTheme.of(context).backgroundMint,
            iconColor: FlutterFlowTheme.of(context).primary,
          ),
        ),
        const SizedBox(width: ModernSpacing.sm),
        // Jumlah Munfiq
        Expanded(
          child: _buildCountCard(
            context: context,
            title: 'Jumlah Munfiq',
            count: widget.jumlahMunfiq,
            icon: Icons.card_giftcard_rounded,
            iconBackgroundColor:
                FlutterFlowTheme.of(context).accent2.withOpacity(0.2),
            iconColor: FlutterFlowTheme.of(context).secondary,
          ),
        ),
        const SizedBox(width: ModernSpacing.sm),
        // Jumlah Mustahik
        Expanded(
          child: _buildCountCard(
            context: context,
            title: 'Jumlah Mustahik',
            count: widget.jumlahMustahik,
            icon: Icons.volunteer_activism_outlined,
            iconBackgroundColor:
                FlutterFlowTheme.of(context).warning.withOpacity(0.15),
            iconColor: FlutterFlowTheme.of(context).warning,
          ),
        ),
      ],
    );
  }

  /// Builds a single count card with icon and number
  /// Requirements: 4.8 - Clean card layout with icon and count only
  Widget _buildCountCard({
    required BuildContext context,
    required String title,
    required int count,
    required IconData icon,
    required Color iconBackgroundColor,
    required Color iconColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(ModernRadius.lg),
        boxShadow: ModernShadows.cardShadow,
      ),
      child: Padding(
        padding: const EdgeInsets.all(ModernSpacing.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon with rounded background
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                borderRadius: BorderRadius.circular(ModernRadius.md),
              ),
              child: Icon(
                icon,
                size: 20,
                color: iconColor,
              ),
            ),
            const SizedBox(height: ModernSpacing.sm),
            // Title
            Text(
              title,
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: 'Inter',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 11,
                    fontWeight: FontWeight.normal,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: ModernSpacing.xs),
            // Count - Requirements: 4.8 - single count only
            Text(
              _formatNumber(count),
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Inter',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
