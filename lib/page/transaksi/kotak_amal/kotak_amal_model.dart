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

  // State field(s) for jmlKotakAmal widget.
  FocusNode? jmlKotakAmalFocusNode;
  TextEditingController? jmlKotakAmalTextController;

  @override
  void initState(BuildContext context) {
    datePickerModel = createModel(context, () => DatePickerModel());
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
