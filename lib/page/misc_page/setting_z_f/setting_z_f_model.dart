import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'setting_z_f_widget.dart' show SettingZFWidget;
import 'package:flutter/material.dart';

class SettingZFModel extends FlutterFlowModel<SettingZFWidget> {
  ///  Local state fields for this page.

  bool isEdited = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for hargaBeras widget.
  FocusNode? hargaBerasFocusNode;
  TextEditingController? hargaBerasTextController;
  String? Function(BuildContext, String?)? hargaBerasTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    hargaBerasFocusNode?.dispose();
    hargaBerasTextController?.dispose();
  }
}
