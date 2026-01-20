import '/flutter_flow/flutter_flow_util.dart';
import 'modern_input_widget.dart' show ModernInputWidget;
import 'package:flutter/material.dart';

/// Model for ModernInputWidget
/// Requirements: 9.1, 9.2, 9.3, 9.4, 9.5, 9.6
class ModernInputModel extends FlutterFlowModel<ModernInputWidget> {
  /// Focus node for the input field
  FocusNode? focusNode;

  /// Text editing controller (if not provided externally)
  TextEditingController? textController;

  /// Whether the controller was created internally
  bool _internalController = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    focusNode?.dispose();
    if (_internalController) {
      textController?.dispose();
    }
  }

  /// Initialize the controller if not provided externally
  void initController(TextEditingController? externalController) {
    if (externalController != null) {
      textController = externalController;
      _internalController = false;
    } else if (textController == null) {
      textController = TextEditingController();
      _internalController = true;
    }
  }

  /// Initialize the focus node
  void initFocusNode() {
    focusNode ??= FocusNode();
  }
}
