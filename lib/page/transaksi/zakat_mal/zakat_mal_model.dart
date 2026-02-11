import '/component/date_picker/date_picker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/form_validators.dart';
import '/index.dart';
import 'zakat_mal_widget.dart' show ZakatMalWidget;
import 'package:flutter/material.dart';

class ZakatMalModel extends FlutterFlowModel<ZakatMalWidget> {
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
      return 'Nama Muzakki Belum Diisi';
    }

    return null;
  }

  // State field(s) for muzakkiPhone widget.
  FocusNode? muzakkiPhoneFocusNode;
  TextEditingController? muzakkiPhoneTextController;
  String? Function(BuildContext, String?)? muzakkiPhoneTextControllerValidator;
  String? _muzakkiPhoneTextControllerValidator(
      BuildContext context, String? val) {
    // Phone is optional according to API spec, but validate if provided
    if (val != null && val.isNotEmpty) {
      return FormValidators.validatePhone(val);
    }
    return null;
  }

  // State field(s) for jenisZM widget.
  String? jenisZMValue;
  FormFieldController<String>? jenisZMValueController;
  // State field(s) for jmlZakatMal widget.
  FocusNode? jmlZakatMalFocusNode;
  TextEditingController? jmlZakatMalTextController;
  String? Function(BuildContext, String?)? jmlZakatMalTextControllerValidator;
  String? _jmlZakatMalTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nominal Zakat Mal Harus Diisi';
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
    muzakkiPhoneTextControllerValidator = _muzakkiPhoneTextControllerValidator;
    jmlZakatMalTextControllerValidator = _jmlZakatMalTextControllerValidator;
  }

  @override
  void dispose() {
    datePickerModel.dispose();
    namaMuzakkiFocusNode?.dispose();
    namaMuzakkiTextController?.dispose();

    muzakkiPhoneFocusNode?.dispose();
    muzakkiPhoneTextController?.dispose();

    jmlZakatMalFocusNode?.dispose();
    jmlZakatMalTextController?.dispose();

    keteranganFocusNode?.dispose();
    keteranganTextController?.dispose();
  }
}
