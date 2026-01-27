import '/component/date_picker/date_picker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'fidyah_widget.dart' show FidyahWidget;
import 'package:flutter/material.dart';

class FidyahModel extends FlutterFlowModel<FidyahWidget> {
  // State fields
  TextEditingController? namaMuzakkiTextController;
  FocusNode? namaMuzakkiFocusNode;
  String? Function(BuildContext, String?)? namaMuzakkiTextControllerValidator;

  TextEditingController? jmlHariTextController;
  FocusNode? jmlHariFocusNode;
  String? Function(BuildContext, String?)? jmlHariTextControllerValidator;

  TextEditingController? nominalPerHariTextController;
  FocusNode? nominalPerHariFocusNode;

  TextEditingController? keteranganTextController;
  FocusNode? keteranganFocusNode;

  // Model for date picker
  late DatePickerModel datePickerModel;

  // Form key
  final formKey = GlobalKey<FormState>();

  @override
  void initState(BuildContext context) {
    datePickerModel = createModel(context, () => DatePickerModel());
  }

  @override
  void dispose() {
    namaMuzakkiTextController?.dispose();
    namaMuzakkiFocusNode?.dispose();
    jmlHariTextController?.dispose();
    jmlHariFocusNode?.dispose();
    nominalPerHariTextController?.dispose();
    nominalPerHariFocusNode?.dispose();
    keteranganTextController?.dispose();
    keteranganFocusNode?.dispose();
    datePickerModel.dispose();
  }

  int get totalFidyah {
    final jmlHari = int.tryParse(jmlHariTextController?.text ?? '0') ?? 0;
    final nominalPerHari =
        int.tryParse(nominalPerHariTextController?.text ?? '0') ?? 0;
    return jmlHari * nominalPerHari;
  }
}
