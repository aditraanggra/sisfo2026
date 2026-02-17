import '/backend/api_requests/api_calls.dart';
import '/component/date_picker/date_picker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'penyerapan_hak_amil_widget.dart' show PenyerapanHakAmilWidget;
import 'package:flutter/material.dart';

class PenyerapanHakAmilModel extends FlutterFlowModel<PenyerapanHakAmilWidget> {
  double? currentBeras = 0.0;

  int? currentUang = 0;

  Future<ApiCallResponse>? rekapAlokasi;

  final formKey = GlobalKey<FormState>();
  late DatePickerModel datePickerModel;
  FocusNode? namaMustahikFocusNode;
  TextEditingController? namaMustahikTextController;
  String? Function(BuildContext, String?)? namaMustahikTextControllerValidator;
  String? _namaMustahikTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Harus diisi!';
    }

    return null;
  }

  String? sumberDanaValue;
  FormFieldController<String>? sumberDanaValueController;
  FormFieldController<String>? jenisZFValueController;
  FocusNode? berasFocusNode;
  TextEditingController? berasTextController;
  String? Function(BuildContext, String?)? berasTextControllerValidator;
  FocusNode? jumlaUangFocusNode;
  TextEditingController? jumlaUangTextController;
  String? Function(BuildContext, String?)? jumlaUangTextControllerValidator;
  FocusNode? penerimaManfaatFocusNode;
  TextEditingController? penerimaManfaatTextController;
  String? Function(BuildContext, String?)?
      penerimaManfaatTextControllerValidator;
  String? _penerimaManfaatTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Harus Diisi!';
    }

    return null;
  }

  FocusNode? keteranganFocusNode;
  TextEditingController? keteranganTextController;
  String? Function(BuildContext, String?)? keteranganTextControllerValidator;
  ApiCallResponse? responsePenyerapanAdd;

  @override
  void initState(BuildContext context) {
    datePickerModel = createModel(context, () => DatePickerModel());
    namaMustahikTextControllerValidator = _namaMustahikTextControllerValidator;
    penerimaManfaatTextControllerValidator =
        _penerimaManfaatTextControllerValidator;
  }

  @override
  void dispose() {
    datePickerModel.dispose();
    namaMustahikFocusNode?.dispose();
    namaMustahikTextController?.dispose();

    berasFocusNode?.dispose();
    berasTextController?.dispose();

    jumlaUangFocusNode?.dispose();
    jumlaUangTextController?.dispose();

    penerimaManfaatFocusNode?.dispose();
    penerimaManfaatTextController?.dispose();

    keteranganFocusNode?.dispose();
    keteranganTextController?.dispose();
  }

  String? get jenisZFValue => jenisZFValueController?.value;
}
