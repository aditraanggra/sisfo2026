import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'modern_dana_overview_model.dart';
export 'modern_dana_overview_model.dart';

/// Modern dana overview component displaying simplified fund availability
/// Requirements: 4.6, 4.7, 4.8
///
/// Features:
/// - Two clean cards side by side (Req 4.6, 4.7)
/// - Show Ketersediaan Dana Pendistribusian (icon + amount) (Req 4.6)
/// - Show Ketersediaan Hak Amil (icon + amount) (Req 4.7)
/// - NO progress bars or percentages (Req 4.8)
/// - Clean card layout with icon and amount only (Req 4.8)
class ModernDanaOverviewWidget extends StatefulWidget {
  const ModernDanaOverviewWidget({
    super.key,
    required this.ketersediaanPendis,
    required this.ketersediaanAmil,
  });

  /// Available funds for distribution (Ketersediaan Dana Pendistribusian)
  final int ketersediaanPendis;

  /// Available amil funds (Ketersediaan Hak Amil)
  final int ketersediaanAmil;

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

  /// Formats the monetary value with Indonesian currency format
  String _formatCurrency(int value) {
    return formatNumber(
      value,
      formatType: FormatType.custom,
      currency: 'Rp ',
      format: '###,###',
      locale: 'id_ID',
    );
  }

  @override
  Widget build(BuildContext context) {
    // Requirements: 4.6, 4.7 - Two clean cards side by side
    return Row(
      children: [
        // Requirements: 4.6 - Ketersediaan Dana Pendistribusian
        Expanded(
          child: _buildDanaCard(
            context: context,
            title: 'Dana Pendistribusian',
            amount: widget.ketersediaanPendis,
            icon: Icons.account_balance_wallet_outlined,
            iconBackgroundColor: ModernColors.backgroundMint,
            iconColor: ModernColors.primaryAccent,
          ),
        ),
        const SizedBox(width: ModernSpacing.md),
        // Requirements: 4.7 - Ketersediaan Hak Amil
        Expanded(
          child: _buildDanaCard(
            context: context,
            title: 'Hak Amil',
            amount: widget.ketersediaanAmil,
            icon: Icons.savings_outlined,
            iconBackgroundColor: const Color(0xFFFFF4E5),
            iconColor: ModernColors.goldAccent,
          ),
        ),
      ],
    );
  }

  /// Builds a single dana card with icon and amount
  /// Requirements: 4.8 - Clean card layout with icon and amount only, NO progress bars
  Widget _buildDanaCard({
    required BuildContext context,
    required String title,
    required int amount,
    required IconData icon,
    required Color iconBackgroundColor,
    required Color iconColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: ModernColors.backgroundCard,
        borderRadius: BorderRadius.circular(ModernRadius.lg),
        boxShadow: ModernShadows.cardShadow,
      ),
      child: Padding(
        padding: const EdgeInsets.all(ModernSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon with rounded background
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                borderRadius: BorderRadius.circular(ModernRadius.md),
              ),
              child: Icon(
                icon,
                size: 22,
                color: iconColor,
              ),
            ),
            const SizedBox(height: ModernSpacing.sm),
            // Title
            Text(
              title,
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: 'Inter',
                    color: ModernColors.textSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: ModernSpacing.xs),
            // Amount - Requirements: 4.8 - single amount only
            Text(
              _formatCurrency(amount),
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Inter',
                    color: ModernColors.textPrimary,
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
