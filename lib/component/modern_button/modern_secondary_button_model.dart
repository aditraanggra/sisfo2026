import '/flutter_flow/flutter_flow_util.dart';
import 'modern_secondary_button_widget.dart' show ModernSecondaryButtonWidget;
import 'package:flutter/material.dart';

/// Model for ModernSecondaryButtonWidget
/// Requirements: 10.4
class ModernSecondaryButtonModel
    extends FlutterFlowModel<ModernSecondaryButtonWidget> {
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
