import '/flutter_flow/flutter_flow_util.dart';
import 'modern_card_widget.dart' show ModernCardWidget;
import 'package:flutter/material.dart';

/// Model for ModernCardWidget
/// Requirements: 7.1, 7.2, 7.3, 7.4, 7.5, 7.6
class ModernCardModel extends FlutterFlowModel<ModernCardWidget> {
  /// Animation controller for tap feedback
  AnimationController? animationController;
  Animation<double>? scaleAnimation;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    animationController?.dispose();
  }
}
