import '/backend/api_requests/api_calls.dart';
import '/component/date_picker/date_picker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'pendistribusian_widget.dart' show PendistribusianWidget;
import 'package:flutter/material.dart';

class PendistribusianModel extends FlutterFlowModel<PendistribusianWidget> {
  ///  Local state fields for this page.

  double? currentBeras = 0.0;

  int? currentUang = 0;

  // Stores action output result for [Backend Call - API (Get Rekap Alokasi)] action in Pendistribusian widget.
  Future<ApiCallResponse>? rekapAlokasi;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for DatePicker component.
  late DatePickerModel datePickerModel;
  // State field(s) for NamaMustahik widget.
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

  // State field(s) for JenisTransaksi widget.
  String? jenisTransaksiValue;
  FormFieldController<String>? jenisTransaksiValueController;
  // State field(s) for JenisAsnaf widget.
  String? jenisAsnafValue;
  FormFieldController<String>? jenisAsnafValueController;
  // State field(s) for JenisProgram widget.
  String? jenisProgramValue;
  FormFieldController<String>? jenisProgramValueController;
  // State field(s) for jenisZF widget.
  FormFieldController<String>? jenisZFValueController;
  // State field(s) for Beras widget.
  FocusNode? berasFocusNode;
  TextEditingController? berasTextController;
  String? Function(BuildContext, String?)? berasTextControllerValidator;
  // State field(s) for JumlaUang widget.
  FocusNode? jumlaUangFocusNode;
  TextEditingController? jumlaUangTextController;
  String? Function(BuildContext, String?)? jumlaUangTextControllerValidator;
  // State field(s) for PenerimaManfaat widget.
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

  // State field(s) for Keterangan widget.
  FocusNode? keteranganFocusNode;
  TextEditingController? keteranganTextController;
  String? Function(BuildContext, String?)? keteranganTextControllerValidator;
  // Stores action output result for [Backend Call - API (Add Pendistribusian)] action in Button widget.
  ApiCallResponse? responsePendisAdd;

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

  /// Additional helper methods.
  String? get jenisZFValue => jenisZFValueController?.value;
}
