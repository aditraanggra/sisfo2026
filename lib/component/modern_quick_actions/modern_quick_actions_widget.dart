import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'modern_quick_actions_model.dart';
export 'modern_quick_actions_model.dart';

/// Quick action item data model
class ModernQuickActionItem {
  final String label;
  final String iconPath;
  final IconData? fallbackIcon;
  final String routeName;
  final Color? iconBackgroundColor;

  const ModernQuickActionItem({
    required this.label,
    required this.iconPath,
    this.fallbackIcon,
    required this.routeName,
    this.iconBackgroundColor,
  });
}

/// Modern Quick Actions Component
/// Requirements: 5.1, 5.2, 5.3, 5.4, 5.5, 5.6
///
/// Features:
/// - 2x3 grid layout (Req 5.1)
/// - Menu items: Zakat Fitrah, Infak/Sedekah, Zakat Mal, Setor ZIS, Penyerapan Amil, Laporan (Req 5.2)
/// - Circular icon containers with subtle background (Req 5.3)
/// - Name labels below each icon (Req 5.4)
/// - Consistent spacing 16px (Req 5.5)
/// - Consistent icon style (Req 5.6)
class ModernQuickActionsWidget extends StatefulWidget {
  const ModernQuickActionsWidget({
    super.key,
    this.showTitle = true,
  });

  /// Whether to show the "Menu Cepat" title
  final bool showTitle;

  @override
  State<ModernQuickActionsWidget> createState() =>
      _ModernQuickActionsWidgetState();
}

class _ModernQuickActionsWidgetState extends State<ModernQuickActionsWidget> {
  late ModernQuickActionsModel _model;

  /// List of quick action items - Requirements: 5.2
  /// Includes: Zakat Fitrah, Infak/Sedekah, Zakat Mal, Setor ZIS, Penyerapan Amil, Laporan
  static final List<ModernQuickActionItem> _quickActions = [
    ModernQuickActionItem(
      label: 'Zakat Fitrah',
      iconPath: 'assets/images/001-zakat.png',
      fallbackIcon: Icons.volunteer_activism,
      routeName: ZakatFitrahWidget.routeName,
    ),
    ModernQuickActionItem(
      label: 'Infak/Sedekah',
      iconPath: 'assets/images/006-infaq.png',
      fallbackIcon: Icons.favorite,
      routeName: InfakWidget.routeName,
    ),
    ModernQuickActionItem(
      label: 'Zakat Mal',
      iconPath: 'assets/images/003-money.png',
      fallbackIcon: Icons.account_balance_wallet,
      routeName: ZakatMalWidget.routeName,
    ),
    ModernQuickActionItem(
      label: 'Setor ZIS',
      iconPath: 'assets/images/005-donation.png',
      fallbackIcon: Icons.upload,
      routeName: SetorZisWidget.routeName,
    ),
    ModernQuickActionItem(
      label: 'Penyerapan Amil',
      iconPath: 'assets/images/004-zakat-2.png',
      fallbackIcon: Icons.account_balance,
      routeName: PenyerapanHakAmilWidget.routeName,
    ),
    ModernQuickActionItem(
      label: 'Laporan',
      iconPath: 'assets/images/012-mosque-1.png',
      fallbackIcon: Icons.assessment,
      routeName: LaporanWidget.routeName,
    ),
  ];

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModernQuickActionsModel());
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Requirements: 5.5 - Consistent spacing 16px
      padding: const EdgeInsets.symmetric(horizontal: ModernSpacing.md),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ModernColors.backgroundCard,
          borderRadius: BorderRadius.circular(ModernRadius.xl),
          boxShadow: ModernShadows.cardShadow,
        ),
        child: Padding(
          padding: const EdgeInsets.all(ModernSpacing.md),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.showTitle) ...[
                Text(
                  'Menu Cepat',
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: ModernSpacing.md),
              ],
              // Requirements: 5.1 - 2x3 grid layout (2 rows, 3 columns)
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  // Requirements: 5.5 - Consistent spacing 16px
                  crossAxisSpacing: ModernSpacing.md,
                  mainAxisSpacing: ModernSpacing.md,
                  childAspectRatio: 0.85,
                ),
                itemCount: _quickActions.length,
                itemBuilder: (context, index) {
                  return _buildQuickActionButton(
                    context,
                    _quickActions[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Build individual quick action button
  /// Requirements: 5.3, 5.4, 5.6
  Widget _buildQuickActionButton(
    BuildContext context,
    ModernQuickActionItem action,
  ) {
    return Semantics(
      label: 'Tombol ${action.label}',
      button: true,
      hint: 'Ketuk untuk membuka halaman ${action.label}',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => context.pushNamed(action.routeName),
          borderRadius: BorderRadius.circular(ModernRadius.md),
          child: Container(
            constraints: const BoxConstraints(
              minWidth: 48.0,
              minHeight: 48.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Requirements: 5.3 - Circular icon containers with subtle background
                _buildCircularIconContainer(context, action),
                const SizedBox(height: ModernSpacing.sm),
                // Requirements: 5.4 - Name labels below each icon
                Text(
                  action.label,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 11.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Build circular icon container with subtle background
  /// Requirements: 5.3, 5.6
  Widget _buildCircularIconContainer(
    BuildContext context,
    ModernQuickActionItem action,
  ) {
    return Container(
      width: 56.0,
      height: 56.0,
      decoration: BoxDecoration(
        // Subtle background color
        color: action.iconBackgroundColor ??
            ModernColors.backgroundMint.withOpacity(0.5),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: _buildActionIcon(context, action),
      ),
    );
  }

  /// Build action icon with fallback
  /// Requirements: 5.6 - Consistent icon style
  Widget _buildActionIcon(BuildContext context, ModernQuickActionItem action) {
    return ExcludeSemantics(
      child: Image.asset(
        action.iconPath,
        width: 32.0,
        height: 32.0,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          // Fallback to icon if image fails to load
          return Icon(
            action.fallbackIcon ?? Icons.touch_app,
            size: 28.0,
            color: ModernColors.primaryAccent,
          );
        },
      ),
    );
  }
}
