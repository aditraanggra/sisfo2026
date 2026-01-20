import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FlutterFlowIconButton extends StatefulWidget {
  const FlutterFlowIconButton({
    Key? key,
    required this.icon,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.buttonSize,
    this.fillColor,
    this.disabledColor,
    this.disabledIconColor,
    this.hoverColor,
    this.hoverIconColor,
    this.hoverBorderColor,
    this.onPressed,
    this.showLoadingIndicator = false,
    this.focusBorderSide,
    this.focusBorderRadius,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  }) : super(key: key);

  final Widget icon;
  final double? borderRadius;

  /// Button size - minimum 48.0dp for accessibility compliance (touch target size)
  /// Requirements: 5.2 - Minimum touch target size of 48x48dp
  final double? buttonSize;
  final Color? fillColor;
  final Color? disabledColor;
  final Color? disabledIconColor;
  final Color? hoverColor;
  final Color? hoverIconColor;
  final Color? hoverBorderColor;
  final Color? borderColor;
  final double? borderWidth;
  final bool showLoadingIndicator;
  final Function()? onPressed;
  final BorderSide? focusBorderSide;
  final BorderRadius? focusBorderRadius;

  /// Semantic label for screen readers (accessibility)
  final String? semanticLabel;

  /// Whether to exclude this button from semantics tree
  final bool excludeFromSemantics;

  /// Minimum touch target size for accessibility compliance
  /// Requirements: 5.2 - Minimum touch target size of 48x48dp
  static const double minTouchTargetSize = 48.0;

  @override
  State<FlutterFlowIconButton> createState() => _FlutterFlowIconButtonState();
}

class _FlutterFlowIconButtonState extends State<FlutterFlowIconButton> {
  bool loading = false;
  late double? iconSize;
  late Color? iconColor;
  late Widget effectiveIcon;

  @override
  void initState() {
    super.initState();
    _updateIcon();
  }

  @override
  void didUpdateWidget(FlutterFlowIconButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateIcon();
  }

  void _updateIcon() {
    final isFontAwesome = widget.icon is FaIcon;
    if (isFontAwesome) {
      FaIcon icon = widget.icon as FaIcon;
      effectiveIcon = FaIcon(
        icon.icon,
        size: icon.size,
      );
      iconSize = icon.size;
      iconColor = icon.color;
    } else {
      Icon icon = widget.icon as Icon;
      effectiveIcon = Icon(
        icon.icon,
        size: icon.size,
      );
      iconSize = icon.size;
      iconColor = icon.color;
    }
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle style = ButtonStyle(
      shape: WidgetStateProperty.resolveWith<OutlinedBorder>(
        (states) {
          if (states.contains(WidgetState.hovered)) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
              side: BorderSide(
                color: widget.hoverBorderColor ??
                    widget.borderColor ??
                    Colors.transparent,
                width: widget.borderWidth ?? 0,
              ),
            );
          }
          if (states.contains(WidgetState.focused) &&
              widget.focusBorderSide != null) {
            return RoundedRectangleBorder(
              borderRadius:
                  widget.focusBorderRadius ?? BorderRadius.circular(8),
              side: widget.focusBorderSide!,
            );
          }
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
            side: BorderSide(
              color: widget.borderColor ?? Colors.transparent,
              width: widget.borderWidth ?? 0,
            ),
          );
        },
      ),
      iconColor: WidgetStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(WidgetState.disabled) &&
              widget.disabledIconColor != null) {
            return widget.disabledIconColor;
          }
          if (states.contains(WidgetState.hovered) &&
              widget.hoverIconColor != null) {
            return widget.hoverIconColor;
          }
          return iconColor;
        },
      ),
      backgroundColor: WidgetStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(WidgetState.disabled) &&
              widget.disabledColor != null) {
            return widget.disabledColor;
          }
          if (states.contains(WidgetState.hovered) &&
              widget.hoverColor != null) {
            return widget.hoverColor;
          }

          return widget.fillColor;
        },
      ),
      overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.pressed)) {
          return null;
        }
        return widget.hoverColor == null ? null : Colors.transparent;
      }),
    );

    // Ensure minimum touch target size of 48dp for accessibility
    // Requirements: 5.2 - Minimum touch target size of 48x48dp
    final effectiveButtonSize =
        (widget.buttonSize ?? FlutterFlowIconButton.minTouchTargetSize)
            .clamp(FlutterFlowIconButton.minTouchTargetSize, double.infinity);

    Widget buttonWidget = SizedBox(
      width: effectiveButtonSize,
      height: effectiveButtonSize,
      child: Theme(
        data: ThemeData.from(
          colorScheme: Theme.of(context).colorScheme,
          useMaterial3: true,
        ),
        child: IgnorePointer(
          ignoring: (widget.showLoadingIndicator && loading),
          child: IconButton(
            icon: (widget.showLoadingIndicator && loading)
                ? Container(
                    width: iconSize,
                    height: iconSize,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        iconColor ?? Colors.white,
                      ),
                    ),
                  )
                : effectiveIcon,
            onPressed: widget.onPressed == null
                ? null
                : () async {
                    if (loading) {
                      return;
                    }
                    setState(() => loading = true);
                    try {
                      await widget.onPressed!();
                    } finally {
                      if (mounted) {
                        setState(() => loading = false);
                      }
                    }
                  },
            splashRadius: effectiveButtonSize,
            style: style,
          ),
        ),
      ),
    );

    // Wrap with Semantics if semantic label is provided
    if (widget.semanticLabel != null && !widget.excludeFromSemantics) {
      return Semantics(
        label: widget.semanticLabel,
        button: true,
        enabled: widget.onPressed != null,
        child: buttonWidget,
      );
    }

    return buttonWidget;
  }
}
