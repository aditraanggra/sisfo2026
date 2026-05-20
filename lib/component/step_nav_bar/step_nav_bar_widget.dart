import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'step_nav_bar_model.dart';
export 'step_nav_bar_model.dart';

class StepNavBarWidget extends StatefulWidget {
  final VoidCallback? onBack;
  final VoidCallback onNext;
  final String nextLabel;
  final bool isLoading;
  final bool showSkip;

  const StepNavBarWidget({
    super.key,
    this.onBack,
    required this.onNext,
    required this.nextLabel,
    this.isLoading = false,
    this.showSkip = false,
  });

  @override
  State<StepNavBarWidget> createState() => _StepNavBarWidgetState();
}

class _StepNavBarWidgetState extends State<StepNavBarWidget> {
  late StepNavBarModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StepNavBarModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
          ModernSpacing.md, ModernSpacing.sm, ModernSpacing.md, 24),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            if (widget.onBack != null)
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: widget.onBack,
                  icon: const Icon(Icons.arrow_back_rounded, size: 18),
                  label: Text(
                    'Kembali',
                    style: GoogleFonts.inter(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: ModernColors.textSecondary,
                    side: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(ModernRadius.sm),
                    ),
                  ),
                ),
              ),
            if (widget.onBack != null) const SizedBox(width: ModernSpacing.sm),
            if (widget.showSkip)
              Expanded(
                child: TextButton(
                  onPressed: widget.onNext,
                  child: Text(
                    'Lewati',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ModernColors.textSecondary,
                    ),
                  ),
                ),
              ),
            if (widget.showSkip) const SizedBox(width: ModernSpacing.sm),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: widget.isLoading ? null : widget.onNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ModernColors.primaryAccent,
                  disabledBackgroundColor: ModernColors.primaryAccent.withOpacity(0.5),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(ModernRadius.sm),
                  ),
                  elevation: 0,
                ),
                child: widget.isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        widget.nextLabel,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
