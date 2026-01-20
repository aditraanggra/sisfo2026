import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'enhanced_empty_state_model.dart';
export 'enhanced_empty_state_model.dart';

/// Enhanced empty state component with illustration, title, description,
/// action button, and contextual tips.
///
/// Requirements: 4.1, 4.3 - Provides illustrative empty state with actionable guidance
class EnhancedEmptyStateWidget extends StatefulWidget {
  const EnhancedEmptyStateWidget({
    super.key,
    required this.title,
    required this.description,
    this.illustrationAsset,
    this.icon,
    this.iconColor,
    required this.actionButtonText,
    required this.onActionPressed,
    this.tips,
    this.showTips = true,
  });

  /// Main title text displayed prominently
  final String title;

  /// Description text providing context about the empty state
  final String description;

  /// Optional asset path for illustration image
  final String? illustrationAsset;

  /// Optional icon to display if no illustration is provided
  final IconData? icon;

  /// Optional color for the icon (defaults to primary color)
  final Color? iconColor;

  /// Text for the primary action button
  final String actionButtonText;

  /// Callback when action button is pressed
  final VoidCallback onActionPressed;

  /// Optional list of contextual tips to help the user
  final List<String>? tips;

  /// Whether to show the tips section (default: true)
  final bool showTips;

  @override
  State<EnhancedEmptyStateWidget> createState() =>
      _EnhancedEmptyStateWidgetState();
}

class _EnhancedEmptyStateWidgetState extends State<EnhancedEmptyStateWidget> {
  late EnhancedEmptyStateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EnhancedEmptyStateModel());
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Illustration or Icon
            _buildIllustration(context),
            const SizedBox(height: 24.0),

            // Title
            Semantics(
              header: true,
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.notoSans(
                        fontWeight: FontWeight.w600,
                      ),
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            const SizedBox(height: 8.0),

            // Description
            Text(
              widget.description,
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).labelMedium.override(
                    font: GoogleFonts.notoSans(
                      fontWeight: FontWeight.normal,
                    ),
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                  ),
            ),
            const SizedBox(height: 24.0),

            // Action Button - Required for Requirement 4.3
            Semantics(
              label: widget.actionButtonText,
              button: true,
              hint: 'Ketuk untuk ${widget.actionButtonText.toLowerCase()}',
              child: FFButtonWidget(
                onPressed: widget.onActionPressed,
                text: widget.actionButtonText,
                icon: const Icon(
                  Icons.add_rounded,
                  size: 20.0,
                ),
                options: FFButtonOptions(
                  height: 48.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.notoSans(
                          fontWeight: FontWeight.w500,
                        ),
                        color: Colors.white,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                  elevation: 2.0,
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),

            // Tips Section - Contextual guidance for Requirement 4.4
            if (widget.showTips &&
                widget.tips != null &&
                widget.tips!.isNotEmpty)
              _buildTipsSection(context),
          ],
        ),
      ),
    );
  }

  /// Builds the illustration or icon section
  Widget _buildIllustration(BuildContext context) {
    // Exclude decorative illustration from semantics
    return ExcludeSemantics(
      child: widget.illustrationAsset != null
          ? Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(60.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60.0),
                child: Image.asset(
                  widget.illustrationAsset!,
                  width: 120.0,
                  height: 120.0,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return _buildDefaultIconContent(context);
                  },
                ),
              ),
            )
          : _buildDefaultIconContent(context),
    );
  }

  /// Builds the default icon content when no illustration is provided
  Widget _buildDefaultIconContent(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Icon(
        widget.icon ?? Icons.inbox_outlined,
        color: widget.iconColor ?? FlutterFlowTheme.of(context).primary,
        size: 48.0,
      ),
    );
  }

  /// Builds the default icon when no illustration is provided
  Widget _buildDefaultIcon(BuildContext context) {
    return ExcludeSemantics(
      child: _buildDefaultIconContent(context),
    );
  }

  /// Builds the tips section with contextual guidance
  Widget _buildTipsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
            width: 1.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.lightbulb_outline_rounded,
                  color: FlutterFlowTheme.of(context).warning,
                  size: 20.0,
                ),
                const SizedBox(width: 8.0),
                Text(
                  'Tips',
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        font: GoogleFonts.notoSans(
                          fontWeight: FontWeight.w600,
                        ),
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            ...widget.tips!.map((tip) => _buildTipItem(context, tip)),
          ],
        ),
      ),
    );
  }

  /// Builds a single tip item
  Widget _buildTipItem(BuildContext context, String tip) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6.0),
            width: 6.0,
            height: 6.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primary,
              borderRadius: BorderRadius.circular(3.0),
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Text(
              tip,
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    font: GoogleFonts.notoSans(
                      fontWeight: FontWeight.normal,
                    ),
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
