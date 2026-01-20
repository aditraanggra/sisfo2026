import '/component/date_picker/date_picker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'infak_widget.dart' show InfakWidget;
import 'package:flutter/material.dart';

class InfakModel extends FlutterFlowModel<InfakWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for DatePicker component.
  late DatePickerModel datePickerModel;
  // State field(s) for namaMuzakki widget.
  FocusNode? namaMuzakkiFocusNode;
  TextEditingController? namaMuzakkiTextController;
  String? Function(BuildContext, String?)? namaMuzakkiTextControllerValidator;
  String? _namaMuzakkiTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nama Muzakki Harus Diisi';
    }

    return null;
  }

  // State field(s) for jmlInfak widget.
  FocusNode? jmlInfakFocusNode;
  TextEditingController? jmlInfakTextController;
  String? Function(BuildContext, String?)? jmlInfakTextControllerValidator;
  String? _jmlInfakTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Jumlah Infak Harus Diisi';
    }

    return null;
  }

  // State field(s) for keterangan widget.
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
