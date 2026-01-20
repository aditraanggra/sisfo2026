import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'modern_secondary_button_model.dart';
export 'modern_secondary_button_model.dart';

/// Modern secondary button component with consistent styling
/// Requirements: 10.4
///
/// Features:
/// - White background with green border and text (Req 10.4)
/// - Border radius 12-16px
/// - Scale animation on press 0.98
class ModernSecondaryButtonWidget extends StatefulWidget {
  const ModernSecondaryButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.width,
    this.height,
    this.disabled = false,
    this.isLoading = false,
  });

  /// Button text
  final String text;

  /// Callback when button is pressed
  final VoidCallback onPressed;

  /// Optional icon to display before text
  final IconData? icon;

  /// Optional fixed width (defaults to full width)
  final double? width;

  /// Optional height (defaults to 52px)
  final double? height;

  /// Whether button is disabled
  final bool disabled;

  /// Whether to show loading indicator
  final bool isLoading;

  @override
  State<ModernSecondaryButtonWidget> createState() =>
      _ModernSecondaryButtonWidgetState();
}

class _ModernSecondaryButtonWidgetState
    extends State<ModernSecondaryButtonWidget>
    with SingleTickerProviderStateMixin {
  late ModernSecondaryButtonModel _model;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModernSecondaryButtonModel());

    // Initialize animation controller for press feedback
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.98,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _model.animationController = _animationController;
    _model.scaleAnimation = _scaleAnimation;

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    if (!widget.disabled && !widget.isLoading) {
      _animationController.forward();
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (!widget.disabled && !widget.isLoading) {
      _animationController.reverse();
    }
  }

  void _onTapCancel() {
    if (!widget.disabled && !widget.isLoading) {
      _animationController.reverse();
    }
  }

  void _onTap() {
    if (!widget.disabled && !widget.isLoading) {
      widget.onPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Requirements: 10.4 - Border radius 12-16px (using 16px)
    const borderRadius = ModernRadius.lg;

    // Height defaults to 52px
    final buttonHeight = widget.height ?? 52.0;

    // Requirements: 10.4 - White background
    final backgroundColor =
        widget.disabled ? Colors.white.withOpacity(0.7) : Colors.white;

    // Requirements: 10.4 - Green border and text
    final borderColor = widget.disabled
        ? ModernColors.primaryAccent.withOpacity(0.5)
        : ModernColors.primaryAccent;

    final textColor = widget.disabled
        ? ModernColors.primaryAccent.withOpacity(0.5)
        : ModernColors.primaryAccent;

    Widget buttonContent = Container(
      width: widget.width,
      height: buttonHeight,
      constraints: const BoxConstraints(
        minHeight: 52.0,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor,
          width: 1.5,
        ),
      ),
      child: Center(
        child: widget.isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(textColor),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.icon != null) ...[
                    Icon(
                      widget.icon,
                      color: textColor,
                      size: 20,
                    ),
                    const SizedBox(width: ModernSpacing.sm),
                  ],
                  Text(
                    widget.text,
                    style: GoogleFonts.inter(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
      ),
    );

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: _onTap,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: child,
          );
        },
        child: buttonContent,
      ),
    );
  }
}
