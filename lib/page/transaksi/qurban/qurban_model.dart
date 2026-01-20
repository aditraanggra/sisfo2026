import '/component/date_picker/date_picker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'qurban_widget.dart' show QurbanWidget;
import 'package:flutter/material.dart';

class QurbanModel extends FlutterFlowModel<QurbanWidget> {
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

  // State field(s) for alamatMuzakki widget.
  FocusNode? alamatMuzakkiFocusNode;
  TextEditingController? alamatMuzakkiTextController;
  String? Function(BuildContext, String?)? alamatMuzakkiTextControllerValidator;
  String? _alamatMuzakkiTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Alamat Belum Diisi';
    }

    return null;
  }

  // State field(s) for jmlSapi widget.
  FocusNode? jmlSapiFocusNode;
  TextEditingController? jmlSapiTextController;
  String? Function(BuildContext, String?)? jmlSapiTextControllerValidator;
  // State field(s) for hargaSapi widget.
  FocusNode? hargaSapiFocusNode;
  TextEditingController? hargaSapiTextController;
  String? Function(BuildContext, String?)? hargaSapiTextControllerValidator;
  // State field(s) for jmlKambing widget.
  FocusNode? jmlKambingFocusNode;
  TextEditingController? jmlKambingTextController;
  String? Function(BuildContext, String?)? jmlKambingTextControllerValidator;
  // State field(s) for hargaKambing widget.
  FocusNode? hargaKambingFocusNode;
  TextEditingController? hargaKambingTextController;
  String? Function(BuildContext, String?)? hargaKambingTextControllerValidator;
  // State field(s) for jmlDomba widget.
  FocusNode? jmlDombaFocusNode;
  TextEditingController? jmlDombaTextController;
  String? Function(BuildContext, String?)? jmlDombaTextControllerValidator;
  // State field(s) for hargaDomba widget.
  FocusNode? hargaDombaFocusNode;
  TextEditingController? hargaDombaTextController;
  String? Function(BuildContext, String?)? hargaDombaTextControllerValidator;
  // State field(s) for keterangan widget.
  FocusNode? keteranganFocusNode;
  TextEditingController? keteranganTextController;
  String? Function(BuildContext, String?)? keteranganTextControllerValidator;

  @override
  void initState(BuildContext context) {
    datePickerModel = createModel(context, () => DatePickerModel());
    namaMuzakkiTextControllerValidator = _namaMuzakkiTextControllerValidator;
    alamatMuzakkiTextControllerValidator =
        _alamatMuzakkiTextControllerValidator;
  }

  @override
  void dispose() {
    datePickerModel.dispose();
    namaMuzakkiFocusNode?.dispose();
    namaMuzakkiTextController?.dispose();

    alamatMuzakkiFocusNode?.dispose();
    alamatMuzakkiTextController?.dispose();

    jmlSapiFocusNode?.dispose();
    jmlSapiTextController?.dispose();

    hargaSapiFocusNode?.dispose();
    hargaSapiTextController?.dispose();

    jmlKambingFocusNode?.dispose();
    jmlKambingTextController?.dispose();

    hargaKambingFocusNode?.dispose();
    hargaKambingTextController?.dispose();

    jmlDombaFocusNode?.dispose();
    jmlDombaTextController?.dispose();

    hargaDombaFocusNode?.dispose();
    hargaDombaTextController?.dispose();

    keteranganFocusNode?.dispose();
    keteranganTextController?.dispose();
  }
}
