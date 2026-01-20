import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'modern_card_model.dart';
export 'modern_card_model.dart';

/// Modern card component with consistent styling
/// Requirements: 7.1, 7.2, 7.3, 7.4, 7.5, 7.6
///
/// Features:
/// - Border radius 20px (Req 7.1)
/// - Soft shadow blur: 16px, opacity: 0.08 (Req 7.2)
/// - Consistent padding 16-20px (Req 7.3)
/// - White background for content cards (Req 7.4)
/// - Gradient background for feature cards (Req 7.5)
/// - Subtle tap feedback animation (Req 7.6)
class ModernCardWidget extends StatefulWidget {
  const ModernCardWidget({
    super.key,
    required this.child,
    this.padding,
    this.isGradient = false,
    this.onTap,
    this.width,
    this.height,
    this.customGradient,
    this.borderRadius,
  });

  /// Child widget to display inside the card
  final Widget child;

  /// Custom padding (defaults to 16px)
  final EdgeInsets? padding;

  /// Whether to use gradient background (default: white)
  final bool isGradient;

  /// Optional tap callback for interactive cards
  final VoidCallback? onTap;

  /// Optional fixed width
  final double? width;

  /// Optional fixed height
  final double? height;

  /// Custom gradient (uses default if not provided)
  final LinearGradient? customGradient;

  /// Custom border radius (defaults to 20px)
  final double? borderRadius;

  @override
  State<ModernCardWidget> createState() => _ModernCardWidgetState();
}

class _ModernCardWidgetState extends State<ModernCardWidget>
    with SingleTickerProviderStateMixin {
  late ModernCardModel _model;
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
    _model = createModel(context, () => ModernCardModel());

    // Initialize animation controller for tap feedback
    // Requirements: 7.6 - subtle hover/press state
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.98, // Subtle scale down on press
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
    if (widget.onTap != null) {
      _animationController.forward();
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.onTap != null) {
      _animationController.reverse();
    }
  }

  void _onTapCancel() {
    if (widget.onTap != null) {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Requirements: 7.1 - Border radius 16-24px (using 20px as default)
    final borderRadius = widget.borderRadius ?? ModernRadius.xl;

    // Requirements: 7.3 - Consistent padding 16-20px
    final padding = widget.padding ?? const EdgeInsets.all(ModernSpacing.md);

    // Requirements: 7.5 - Gradient background for feature cards
    final defaultGradient = ModernGradients.cardGradient;

    // Requirements: 7.2 - Soft shadow (blur: 16px, opacity: 0.08)
    final boxShadow = ModernShadows.cardShadow;

    Widget cardContent = Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        // Requirements: 7.4 - White background for content cards
        // Requirements: 7.5 - Gradient background for feature cards
        color: widget.isGradient ? null : ModernColors.backgroundCard,
        gradient: widget.isGradient
            ? (widget.customGradient ?? defaultGradient)
            : null,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: boxShadow,
      ),
      child: Padding(
        padding: padding,
        child: widget.child,
      ),
    );

    // Requirements: 7.6 - Interactive cards show subtle hover/press state
    if (widget.onTap != null) {
      return GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: child,
            );
          },
          child: cardContent,
        ),
      );
    }

    return cardContent;
  }
}
