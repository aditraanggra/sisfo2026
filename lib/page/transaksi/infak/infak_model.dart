import '/component/date_picker/date_picker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'infak_widget.dart' show InfakWidget;
import 'package:flutter/material.dart';

class InfakModel extends FlutterFlowModel<InfakWidget> {
  final formKey = GlobalKey<FormState>();
  late DatePickerModel datePickerModel;

  // Jenis infak: true = terikat program, false = tidak terikat
  bool isTerikatProgram = false;

  // Selected program
  int? selectedProgramId;
  String? selectedProgramName;

  // Loading & error states
  bool isLoadingPrograms = false;
  String? programsError;

  // List program dari API
  List<Map<String, dynamic>> programs = [];

  // Form fields
  FocusNode? namaMuzakkiFocusNode;
  TextEditingController? namaMuzakkiTextController;
  String? Function(BuildContext, String?)? namaMuzakkiTextControllerValidator;
  String? _namaMuzakkiTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nama Munfik Harus Diisi';
    }
    return null;
  }

  FocusNode? jmlInfakFocusNode;
  TextEditingController? jmlInfakTextController;
  String? Function(BuildContext, String?)? jmlInfakTextControllerValidator;
  String? _jmlInfakTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Jumlah Infak Harus Diisi';
    }
    return null;
  }

  FocusNode? keteranganFocusNode;
  TextEditingController? keteranganTextController;
  String? Function(BuildContext, String?)? keteranganTextControllerValidator;

  @override
  void initState(BuildContext context) {
    datePickerModel = createModel(context, () => DatePickerModel());
    namaMuzakkiTextControllerValidator = _namaMuzakkiTextControllerValidator;
    jmlInfakTextControllerValidator = _jmlInfakTextControllerValidator;
  }

  @override
  void dispose() {
    datePickerModel.dispose();
    namaMuzakkiFocusNode?.dispose();
    namaMuzakkiTextController?.dispose();
    jmlInfakFocusNode?.dispose();
    jmlInfakTextController?.dispose();
    keteranganFocusNode?.dispose();
    keteranganTextController?.dispose();
  }
}
