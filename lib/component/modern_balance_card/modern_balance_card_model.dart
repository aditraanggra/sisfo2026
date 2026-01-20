import '/flutter_flow/flutter_flow_util.dart';
import 'modern_balance_card_widget.dart' show ModernBalanceCardWidget;
import 'package:flutter/material.dart';

/// Model for ModernBalanceCardWidget
/// Requirements: 4.1, 4.2, 4.3, 4.4, 4.5
class ModernBalanceCardModel extends FlutterFlowModel<ModernBalanceCardWidget> {
  /// Animation controller for button press feedback
  AnimationController? animationController;
  Animation<double>? scaleAnimation;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    animationController?.dispose();
  }
}
