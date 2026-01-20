import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'modern_primary_button_model.dart';
export 'modern_primary_button_model.dart';

/// Modern primary button component with consistent styling
/// Requirements: 10.1, 10.2, 10.3, 10.6
///
/// Features:
/// - Dark green background (#1A3C34) with white text (Req 10.1)
/// - Border radius 12-16px (Req 10.2)
/// - Minimum height 52px (Req 10.3)
/// - Scale animation on press 0.98 (Req 10.6)
class ModernPrimaryButtonWidget extends StatefulWidget {
  const ModernPrimaryButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.icon,
    this.width,
    this.height,
    this.disabled = false,
  });

  /// Button text
  final String text;

  /// Callback when button is pressed
  final VoidCallback onPressed;

  /// Whether to show loading indicator
  final bool isLoading;

  /// Optional icon to display before text
  final IconData? icon;

  /// Optional fixed width (defaults to full width)
  final double? width;

  /// Optional height (defaults to 52px minimum)
  final double? height;

  /// Whether button is disabled
  final bool disabled;

  @override
  State<ModernPrimaryButtonWidget> createState() =>
      _ModernPrimaryButtonWidgetState();
}

class _ModernPrimaryButtonWidgetState extends State<ModernPrimaryButtonWidget>
    with SingleTickerProviderStateMixin {
  late ModernPrimaryButtonModel _model;
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
    _model = createModel(context, () => ModernPrimaryButtonModel());

    // Initialize animation controller for press feedback
    // Requirements: 10.6 - Scale animation on press (0.98)
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.98, // Requirements: 10.6 - Scale to 0.98 on press
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
    // Requirements: 10.2 - Border radius 12-16px (using 16px)
    const borderRadius = ModernRadius.lg;

    // Requirements: 10.3 - Minimum height 52px
    final buttonHeight = widget.height ?? 52.0;

    // Requirements: 10.1 - Dark green background (#1A3C34)
    final backgroundColor = widget.disabled
        ? ModernColors.primaryDark.withOpacity(0.5)
        : ModernColors.primaryDark;

    // Requirements: 10.1 - White text
    final textColor = widget.disabled
        ? ModernColors.textOnDark.withOpacity(0.7)
        : ModernColors.textOnDark;

    Widget buttonContent = Container(
      width: widget.width,
      height: buttonHeight,
      constraints: BoxConstraints(
        minHeight: 52.0, // Requirements: 10.3 - Minimum height 52px
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: widget.disabled ? null : ModernShadows.buttonShadow,
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
