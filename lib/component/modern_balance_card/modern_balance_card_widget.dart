import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'modern_balance_card_model.dart';
export 'modern_balance_card_model.dart';

/// Modern balance card component displaying total saldo with action buttons
/// Requirements: 4.1, 4.2, 4.3, 4.4, 4.5
///
/// Features:
/// - Dark green gradient background (Req 4.1)
/// - "Total Saldo" label in small text above amount (Req 4.2)
/// - Large monetary value in white text 28-32px (Req 4.3)
/// - Large border radius 20-24px (Req 4.4)
/// - Two pill-shaped action buttons: "Pendistribusian" and "Setor ZIS" (Req 4.5)
class ModernBalanceCardWidget extends StatefulWidget {
  const ModernBalanceCardWidget({
    super.key,
    required this.totalSaldo,
    required this.onPendistribusianTap,
    required this.onSetorZisTap,
  });

  /// Total saldo amount to display
  final int totalSaldo;

  /// Callback when Pendistribusian button is tapped
  final VoidCallback onPendistribusianTap;

  /// Callback when Setor ZIS button is tapped
  final VoidCallback onSetorZisTap;

  @override
  State<ModernBalanceCardWidget> createState() =>
      _ModernBalanceCardWidgetState();
}

class _ModernBalanceCardWidgetState extends State<ModernBalanceCardWidget> {
  late ModernBalanceCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModernBalanceCardModel());

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
    return Container(
      width: double.infinity,
      // Requirements: 4.4 - Large border radius 20-24px
      decoration: BoxDecoration(
        // Requirements: 4.1 - Dark green gradient background
        gradient: ModernGradients.cardGradient,
        borderRadius: BorderRadius.circular(ModernRadius.xl),
        boxShadow: ModernShadows.cardShadow,
      ),
      child: Padding(
        padding: const EdgeInsets.all(ModernSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Requirements: 4.2 - "Total Saldo" label in small text
            Text(
              'Total Saldo',
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: 'Inter',
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
            ),
            const SizedBox(height: ModernSpacing.sm),
            // Requirements: 4.3 - Large monetary value in white text (28-32px)
            Text(
              _formatCurrency(widget.totalSaldo),
              style: FlutterFlowTheme.of(context).headlineLarge.override(
                    fontFamily: 'Inter',
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: ModernSpacing.lg),
            // Requirements: 4.5 - Two pill-shaped action buttons
            Row(
              children: [
                Expanded(
                  child: _buildActionButton(
                    context: context,
                    label: 'Pendistribusian',
                    icon: Icons.arrow_upward_rounded,
                    onTap: widget.onPendistribusianTap,
                    isPrimary: true,
                  ),
                ),
                const SizedBox(width: ModernSpacing.md),
                Expanded(
                  child: _buildActionButton(
                    context: context,
                    label: 'Setor ZIS',
                    icon: Icons.arrow_downward_rounded,
                    onTap: widget.onSetorZisTap,
                    isPrimary: false,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a pill-shaped action button
  /// Requirements: 4.5 - Pill-shaped design
  Widget _buildActionButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required VoidCallback onTap,
    required bool isPrimary,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(ModernRadius.xxl),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: ModernSpacing.md,
            vertical: ModernSpacing.md,
          ),
          decoration: BoxDecoration(
            color: isPrimary ? Colors.white : Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(ModernRadius.xxl),
            border: isPrimary
                ? null
                : Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 1,
                  ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 18,
                color: isPrimary ? ModernColors.primaryDark : Colors.white,
              ),
              const SizedBox(width: ModernSpacing.sm),
              Flexible(
                child: Text(
                  label,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color:
                            isPrimary ? ModernColors.primaryDark : Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
