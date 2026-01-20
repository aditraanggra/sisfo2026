import '/flutter_flow/flutter_flow_util.dart';
import 'modern_primary_button_widget.dart' show ModernPrimaryButtonWidget;
import 'package:flutter/material.dart';

/// Model for ModernPrimaryButtonWidget
/// Requirements: 10.1, 10.2, 10.3, 10.6
class ModernPrimaryButtonModel
    extends FlutterFlowModel<ModernPrimaryButtonWidget> {
  /// Animation controller for press feedback
  AnimationController? animationController;
  Animation<double>? scaleAnimation;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    animationController?.dispose();
  }
}
