import '/flutter_flow/flutter_flow_util.dart';
import 'infaq_form_widget.dart' show InfaqFormWidget;
import 'package:flutter/material.dart';

class InfaqFormModel extends FlutterFlowModel<InfaqFormWidget> {
  ///  Local state fields for this component.

  int? totalText;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
