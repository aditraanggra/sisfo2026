import '/flutter_flow/flutter_flow_util.dart';
import 'modern_icon_button_widget.dart' show ModernIconButtonWidget;
import 'package:flutter/material.dart';

/// Model for ModernIconButtonWidget
/// Requirements: 10.5
class ModernIconButtonModel extends FlutterFlowModel<ModernIconButtonWidget> {
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
