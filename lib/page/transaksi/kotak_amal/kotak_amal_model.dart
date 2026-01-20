import '/component/date_picker/date_picker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'kotak_amal_widget.dart' show KotakAmalWidget;
import 'package:flutter/material.dart';

class KotakAmalModel extends FlutterFlowModel<KotakAmalWidget> {
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
      return 'Nama muzakki harus diisi';
    }

    return null;
  }

  // State field(s) for jmlKotakAmal widget.
  FocusNode? jmlKotakAmalFocusNode;
  TextEditingController? jmlKotakAmalTextController;
  String? Function(BuildContext, String?)? jmlKotakAmalTextControllerValidator;
  String? _jmlKotakAmalTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nominal Kotak Amal Harus Diisi';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    datePickerModel = createModel(context, () => DatePickerModel());
    namaMuzakkiTextControllerValidator = _namaMuzakkiTextControllerValidator;
    jmlKotakAmalTextControllerValidator = _jmlKotakAmalTextControllerValidator;
  }

  @override
  void dispose() {
    datePickerModel.dispose();
    namaMuzakkiFocusNode?.dispose();
    namaMuzakkiTextController?.dispose();

    jmlKotakAmalFocusNode?.dispose();
    jmlKotakAmalTextController?.dispose();
  }
}
