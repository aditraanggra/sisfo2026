import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'quick_actions_model.dart';
export 'quick_actions_model.dart';

/// Quick action data model for each button
class QuickActionItem {
  final String label;
  final String iconPath;
  final IconData? fallbackIcon;
  final String routeName;
  final Color? iconColor;

  QuickActionItem({
    required this.label,
    required this.iconPath,
    this.fallbackIcon,
    required this.routeName,
    this.iconColor,
  });
}

class QuickActionsWidget extends StatefulWidget {
  const QuickActionsWidget({super.key});

  @override
  State<QuickActionsWidget> createState() => _QuickActionsWidgetState();
}

class _QuickActionsWidgetState extends State<QuickActionsWidget> {
  late QuickActionsModel _model;

  /// List of quick action items with their configurations
  static final List<QuickActionItem> _quickActions = [
    QuickActionItem(
      label: 'Zakat Fitrah',
      iconPath: 'assets/images/001-zakat.png',
      fallbackIcon: Icons.volunteer_activism,
      routeName: ZakatFitrahWidget.routeName,
    ),
    QuickActionItem(
      label: 'Infak/Sedekah',
      iconPath: 'assets/images/006-infaq.png',
      fallbackIcon: Icons.favorite,
      routeName: InfakWidget.routeName,
    ),
    QuickActionItem(
      label: 'Zakat Mal',
      iconPath: 'assets/images/003-money.png',
      fallbackIcon: Icons.account_balance_wallet,
      routeName: ZakatMalWidget.routeName,
    ),
    QuickActionItem(
      label: 'Setor ZIS',
      iconPath: 'assets/images/005-donation.png',
      fallbackIcon: Icons.upload,
      routeName: SetorZisWidget.routeName,
    ),
    QuickActionItem(
      label: 'Kotak Amal',
      iconPath: 'assets/images/007-charity.png',
      fallbackIcon: Icons.inventory_2,
      routeName: KotakAmalWidget.routeName,
    ),
    QuickActionItem(
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
    _model = createModel(context, () => QuickActionsModel());
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
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 3.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Menu Cepat',
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.notoSans(
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
              const SizedBox(height: 16.0),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  childAspectRatio: 1.0,
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

  Widget _buildQuickActionButton(
    BuildContext context,
    QuickActionItem action,
  ) {
    return Semantics(
      label: 'Tombol ${action.label}',
      button: true,
      hint: 'Ketuk untuk membuka halaman ${action.label}',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => context.pushNamed(action.routeName),
          borderRadius: BorderRadius.circular(12.0),
          child: Container(
            constraints: const BoxConstraints(
              minWidth: 48.0,
              minHeight: 48.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).alternate,
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: _buildActionIcon(context, action),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    action.label,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          font: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontStyle,
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
      ),
    );
  }

  Widget _buildActionIcon(BuildContext context, QuickActionItem action) {
    return ExcludeSemantics(
      child: Image.asset(
        action.iconPath,
        width: 36.0,
        height: 36.0,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          // Fallback to icon if image fails to load
          return Icon(
            action.fallbackIcon ?? Icons.touch_app,
            size: 32.0,
            color: const Color(0xFF259148),
          );
        },
      ),
    );
  }
}
