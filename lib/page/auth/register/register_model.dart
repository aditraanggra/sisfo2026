import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'register_widget.dart' show RegisterWidget;
import 'package:flutter/material.dart';

class RegisterModel extends FlutterFlowModel<RegisterWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nameReg widget.
  final nameRegKey = GlobalKey();
  FocusNode? nameRegFocusNode;
  TextEditingController? nameRegTextController;
  String? nameRegSelectedOption;
  String? Function(BuildContext, String?)? nameRegTextControllerValidator;
  // State field(s) for emailReg widget.
  final emailRegKey = GlobalKey();
  FocusNode? emailRegFocusNode;
  TextEditingController? emailRegTextController;
  String? emailRegSelectedOption;
  String? Function(BuildContext, String?)? emailRegTextControllerValidator;
  // State field(s) for passReg widget.
  FocusNode? passRegFocusNode;
  TextEditingController? passRegTextController;
  late bool passRegVisibility;
  String? Function(BuildContext, String?)? passRegTextControllerValidator;
  String? _passRegTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password wajib diisi';
    }

    return null;
  }

  // State field(s) for passRegConfirm widget.
  FocusNode? passRegConfirmFocusNode;
  TextEditingController? passRegConfirmTextController;
  late bool passRegConfirmVisibility;
  String? Function(BuildContext, String?)?
      passRegConfirmTextControllerValidator;
  String? _passRegConfirmTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password wajib diisi';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Register User)] action in Button widget.
  ApiCallResponse? registerResponse;

  @override
  void initState(BuildContext context) {
    passRegVisibility = false;
    passRegTextControllerValidator = _passRegTextControllerValidator;
    passRegConfirmVisibility = false;
    passRegConfirmTextControllerValidator =
        _passRegConfirmTextControllerValidator;
  }

  @override
  void dispose() {
    nameRegFocusNode?.dispose();

    emailRegFocusNode?.dispose();

    passRegFocusNode?.dispose();
    passRegTextController?.dispose();

    passRegConfirmFocusNode?.dispose();
    passRegConfirmTextController?.dispose();
  }
}
