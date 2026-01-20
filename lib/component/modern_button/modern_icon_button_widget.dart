import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'modern_icon_button_model.dart';
export 'modern_icon_button_model.dart';

/// Modern icon button component with consistent styling
/// Requirements: 10.5
///
/// Features:
/// - Circular shape (Req 10.5)
/// - 48px minimum size (Req 10.5)
/// - Optional background color
/// - Scale animation on press
class ModernIconButtonWidget extends StatefulWidget {
  const ModernIconButtonWidget({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.size,
    this.iconSize,
    this.disabled = false,
    this.showShadow = false,
  });

  /// Icon to display
  final IconData icon;

  /// Callback when button is pressed
  final VoidCallback onPressed;

  /// Optional background color
  final Color? backgroundColor;

  /// Optional icon color (defaults to primaryDark)
  final Color? iconColor;

  /// Button size (defaults to 48px minimum)
  final double? size;

  /// Icon size (defaults to 24px)
  final double? iconSize;

  /// Whether button is disabled
  final bool disabled;

  /// Whether to show shadow
  final bool showShadow;

  @override
  State<ModernIconButtonWidget> createState() => _ModernIconButtonWidgetState();
}

class _ModernIconButtonWidgetState extends State<ModernIconButtonWidget>
    with SingleTickerProviderStateMixin {
  late ModernIconButtonModel _model;
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
    _model = createModel(context, () => ModernIconButtonModel());

    // Initialize animation controller for press feedback
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
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
    if (!widget.disabled) {
      _animationController.forward();
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (!widget.disabled) {
      _animationController.reverse();
    }
  }

  void _onTapCancel() {
    if (!widget.disabled) {
      _animationController.reverse();
    }
  }

  void _onTap() {
    if (!widget.disabled) {
      widget.onPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Requirements: 10.5 - 48px minimum size
    final buttonSize = widget.size ?? 48.0;
    final iconSize = widget.iconSize ?? 24.0;

    // Default colors
    final backgroundColor = widget.disabled
        ? (widget.backgroundColor ?? ModernColors.backgroundMint)
            .withOpacity(0.5)
        : widget.backgroundColor ?? ModernColors.backgroundMint;

    final iconColor = widget.disabled
        ? (widget.iconColor ?? ModernColors.primaryDark).withOpacity(0.5)
        : widget.iconColor ?? ModernColors.primaryDark;

    Widget buttonContent = Container(
      width: buttonSize,
      height: buttonSize,
      constraints: const BoxConstraints(
        minWidth: 48.0, // Requirements: 10.5 - 48px minimum size
        minHeight: 48.0, // Requirements: 10.5 - 48px minimum size
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle, // Requirements: 10.5 - Circular shape
        boxShadow: widget.showShadow && !widget.disabled
            ? ModernShadows.buttonShadow
            : null,
      ),
      child: Center(
        child: Icon(
          widget.icon,
          color: iconColor,
          size: iconSize,
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
