import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'modern_input_model.dart';
export 'modern_input_model.dart';

/// Modern input field component with consistent styling
/// Requirements: 9.1, 9.2, 9.3, 9.4, 9.5, 9.6
///
/// Features:
/// - Border radius 12-16px (Req 9.1)
/// - Light gray background (#F5F7F5) for inactive state (Req 9.2)
/// - Green border (#259148) for focused state (Req 9.3)
/// - Floating label animation (Req 9.4)
/// - Height 56px (Req 9.5)
/// - Support prefix/suffix icons (Req 9.6)
class ModernInputWidget extends StatefulWidget {
  const ModernInputWidget({
    super.key,
    this.controller,
    required this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconTap,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.textCapitalization = TextCapitalization.none,
    this.autofocus = false,
    this.textInputAction,
    this.initialValue,
  });

  /// Text editing controller (optional - will create one if not provided)
  final TextEditingController? controller;

  /// Label text for the input field
  final String label;

  /// Hint text (optional)
  final String? hint;

  /// Prefix icon (optional) - Requirements: 9.6
  final IconData? prefixIcon;

  /// Suffix icon (optional) - Requirements: 9.6
  final IconData? suffixIcon;

  /// Callback when suffix icon is tapped
  final VoidCallback? onSuffixIconTap;

  /// Keyboard type
  final TextInputType? keyboardType;

  /// Whether to obscure text (for passwords)
  final bool obscureText;

  /// Validator function
  final String? Function(String?)? validator;

  /// Callback when text changes
  final ValueChanged<String>? onChanged;

  /// Callback when submitted
  final ValueChanged<String>? onSubmitted;

  /// Whether the input is enabled
  final bool enabled;

  /// Whether the input is read-only
  final bool readOnly;

  /// Maximum number of lines
  final int maxLines;

  /// Minimum number of lines
  final int? minLines;

  /// Maximum length of input
  final int? maxLength;

  /// Text capitalization
  final TextCapitalization textCapitalization;

  /// Whether to autofocus
  final bool autofocus;

  /// Text input action
  final TextInputAction? textInputAction;

  /// Initial value (used if no controller is provided)
  final String? initialValue;

  @override
  State<ModernInputWidget> createState() => _ModernInputWidgetState();
}

class _ModernInputWidgetState extends State<ModernInputWidget> {
  late ModernInputModel _model;
  bool _isFocused = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModernInputModel());

    // Initialize controller
    _model.initController(widget.controller);
    if (widget.initialValue != null && _model.textController!.text.isEmpty) {
      _model.textController!.text = widget.initialValue!;
    }

    // Initialize focus node
    _model.initFocusNode();
    _model.focusNode!.addListener(_onFocusChange);

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.focusNode?.removeListener(_onFocusChange);
    _model.maybeDispose();
    super.dispose();
  }

  void _onFocusChange() {
    safeSetState(() {
      _isFocused = _model.focusNode!.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Requirements: 9.1 - Border radius 12-16px (using 16px)
    const borderRadius = ModernRadius.lg;

    // Requirements: 9.2 - Light gray background (#F5F7F5) for inactive state
    final backgroundColor = widget.enabled
        ? ModernColors.backgroundPrimary
        : ModernColors.backgroundPrimary.withOpacity(0.7);

    // Requirements: 9.5 - Height 56px
    const inputHeight = 56.0;

    return SizedBox(
      height: widget.maxLines > 1 ? null : inputHeight,
      child: TextFormField(
        controller: _model.textController,
        focusNode: _model.focusNode,
        autofocus: widget.autofocus,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        textCapitalization: widget.textCapitalization,
        textInputAction: widget.textInputAction,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        maxLength: widget.maxLength,
        enabled: widget.enabled,
        readOnly: widget.readOnly,
        validator: widget.validator,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onSubmitted,
        style: GoogleFonts.inter(
          color: ModernColors.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          // Requirements: 9.4 - Floating label animation
          labelText: widget.label,
          labelStyle: GoogleFonts.inter(
            color: _isFocused
                ? ModernColors.primaryAccent
                : ModernColors.textSecondary,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          floatingLabelStyle: GoogleFonts.inter(
            color: _isFocused
                ? ModernColors.primaryAccent
                : ModernColors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          hintText: widget.hint,
          hintStyle: GoogleFonts.inter(
            color: ModernColors.textSecondary.withOpacity(0.7),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          // Requirements: 9.6 - Support prefix icons
          prefixIcon: widget.prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 16, right: 12),
                  child: Icon(
                    widget.prefixIcon,
                    color: _isFocused
                        ? ModernColors.primaryAccent
                        : ModernColors.textSecondary,
                    size: 22,
                  ),
                )
              : null,
          prefixIconConstraints: widget.prefixIcon != null
              ? const BoxConstraints(minWidth: 50, minHeight: 50)
              : null,
          // Requirements: 9.6 - Support suffix icons
          suffixIcon: widget.suffixIcon != null
              ? GestureDetector(
                  onTap: widget.onSuffixIconTap,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 16),
                    child: Icon(
                      widget.suffixIcon,
                      color: _isFocused
                          ? ModernColors.primaryAccent
                          : ModernColors.textSecondary,
                      size: 22,
                    ),
                  ),
                )
              : null,
          suffixIconConstraints: widget.suffixIcon != null
              ? const BoxConstraints(minWidth: 50, minHeight: 50)
              : null,
          // Requirements: 9.2 - Light gray background (#F5F7F5)
          filled: true,
          fillColor: backgroundColor,
          // Requirements: 9.1 - Border radius 12-16px
          // Requirements: 9.3 - Green border for focused state
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: ModernColors.primaryAccent,
              width: 2.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: ModernColors.expenseRed,
              width: 1.5,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: ModernColors.expenseRed,
              width: 2.0,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: widget.prefixIcon != null ? 0 : 16,
            vertical: 16,
          ),
          errorStyle: GoogleFonts.inter(
            color: ModernColors.expenseRed,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          counterStyle: GoogleFonts.inter(
            color: ModernColors.textSecondary,
            fontSize: 12,
          ),
        ),
        cursorColor: ModernColors.primaryAccent,
      ),
    );
  }
}
