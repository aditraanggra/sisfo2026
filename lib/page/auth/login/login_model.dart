import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailLogin widget.
  final emailLoginKey = GlobalKey();
  FocusNode? emailLoginFocusNode;
  TextEditingController? emailLoginTextController;
  String? emailLoginSelectedOption;
  String? Function(BuildContext, String?)? emailLoginTextControllerValidator;
  // State field(s) for passLogin widget.
  FocusNode? passLoginFocusNode;
  TextEditingController? passLoginTextController;
  late bool passLoginVisibility;
  String? Function(BuildContext, String?)? passLoginTextControllerValidator;
  // Stores action output result for [Backend Call - API (Login User)] action in Button widget.
  ApiCallResponse? loginResponse;

  @override
  void initState(BuildContext context) {
    passLoginVisibility = false;
  }

  @override
  void dispose() {
    emailLoginFocusNode?.dispose();

    passLoginFocusNode?.dispose();
    passLoginTextController?.dispose();
  }
}
