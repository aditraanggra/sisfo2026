import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'stepper_header_model.dart';
export 'stepper_header_model.dart';

class StepperHeaderWidget extends StatefulWidget {
  final List<String> steps;
  final int currentStep;
  final Set<int> completedSteps;
  final ValueChanged<int>? onTapStep;

  const StepperHeaderWidget({
    super.key,
    required this.steps,
    required this.currentStep,
    required this.completedSteps,
    this.onTapStep,
  });

  @override
  State<StepperHeaderWidget> createState() => _StepperHeaderWidgetState();
}

class _StepperHeaderWidgetState extends State<StepperHeaderWidget> {
  late StepperHeaderModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StepperHeaderModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: ModernSpacing.md, vertical: ModernSpacing.sm),
      child: Row(
        children: List.generate(widget.steps.length * 2 - 1, (index) {
          if (index.isOdd) {
            final stepIndex = index ~/ 2;
            return _buildConnector(stepIndex);
          }
          final stepIndex = index ~/ 2;
          return _buildDot(stepIndex);
        }),
      ),
    );
  }

  Widget _buildDot(int stepIndex) {
    final isActive = stepIndex == widget.currentStep;
    final isCompleted = widget.completedSteps.contains(stepIndex);
    final canTap =
        widget.onTapStep != null && widget.completedSteps.contains(stepIndex);

    return Expanded(
      child: GestureDetector(
        onTap: canTap ? () => widget.onTapStep!(stepIndex) : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted
                    ? const Color(0xFF1D9E75)
                    : isActive
                        ? const Color(0xFF534AB7)
                        : FlutterFlowTheme.of(context).secondaryBackground,
                border: Border.all(
                  color: isActive
                      ? const Color(0xFF534AB7)
                      : isCompleted
                          ? const Color(0xFF1D9E75)
                          : FlutterFlowTheme.of(context).alternate,
                  width: isActive ? 2.5 : 2,
                ),
              ),
              child: isCompleted
                  ? const Icon(Icons.check, color: Colors.white, size: 18)
                  : Text(
                      '${stepIndex + 1}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isActive
                            ? Colors.white
                            : ModernColors.textSecondary,
                      ),
                    ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.steps[stepIndex],
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight:
                    isActive || isCompleted ? FontWeight.w600 : FontWeight.w400,
                color: isActive || isCompleted
                    ? ModernColors.textPrimary
                    : ModernColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConnector(int stepIndex) {
    final isCompleted = widget.completedSteps.contains(stepIndex);
    return Container(
      width: 16,
      height: 2,
      decoration: BoxDecoration(
        color: isCompleted
            ? const Color(0xFF1D9E75)
            : ModernColors.textSecondary.withOpacity(0.3),
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }
}
