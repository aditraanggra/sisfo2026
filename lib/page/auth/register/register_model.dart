import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'register_widget.dart' show RegisterWidget;
import 'package:flutter/material.dart';

class RegisterModel extends FlutterFlowModel<RegisterWidget> {
  final formKey = GlobalKey<FormState>();

  FocusNode? nameRegFocusNode;
  TextEditingController? nameRegTextController;

  FocusNode? emailRegFocusNode;
  TextEditingController? emailRegTextController;

  FocusNode? passRegFocusNode;
  TextEditingController? passRegTextController;
  late bool passRegVisibility;

  FocusNode? passRegConfirmFocusNode;
  TextEditingController? passRegConfirmTextController;
  late bool passRegConfirmVisibility;

  bool isLoading = false;
  ApiCallResponse? registerResponse;
  ApiCallResponse? loginResponse;

  String? validateName(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nama wajib diisi';
    }
    if (val.length < 3) {
      return 'Nama minimal 3 karakter';
    }
    return null;
  }

  String? validateEmail(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email wajib diisi';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(val)) {
      return 'Format email tidak valid';
    }
    return null;
  }

  String? validatePassword(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password wajib diisi';
    }
    if (val.length < 6) {
      return 'Password minimal 6 karakter';
    }
    return null;
  }

  String? validateConfirmPassword(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Konfirmasi password wajib diisi';
    }
    if (val != passRegTextController?.text) {
      return 'Password tidak cocok';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    passRegVisibility = false;
    passRegConfirmVisibility = false;
    nameRegTextController = TextEditingController();
    emailRegTextController = TextEditingController();
    passRegTextController = TextEditingController();
    passRegConfirmTextController = TextEditingController();
  }

  @override
  void dispose() {
    nameRegFocusNode?.dispose();
    nameRegTextController?.dispose();

    emailRegFocusNode?.dispose();
    emailRegTextController?.dispose();

    passRegFocusNode?.dispose();
    passRegTextController?.dispose();

    passRegConfirmFocusNode?.dispose();
    passRegConfirmTextController?.dispose();
  }
}
