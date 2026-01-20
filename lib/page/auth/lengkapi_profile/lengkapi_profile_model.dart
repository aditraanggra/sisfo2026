import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'lengkapi_profile_widget.dart' show LengkapiProfileWidget;
import 'package:flutter/material.dart';

class LengkapiProfileModel extends FlutterFlowModel<LengkapiProfileWidget> {
  ///  Local state fields for this page.

  int kecamatanId = 1;

  String registerUpz = '';

  List<DataDesaStruct> desaList = [];
  void addToDesaList(DataDesaStruct item) => desaList.add(item);
  void removeFromDesaList(DataDesaStruct item) => desaList.remove(item);
  void removeAtIndexFromDesaList(int index) => desaList.removeAt(index);
  void insertAtIndexInDesaList(int index, DataDesaStruct item) =>
      desaList.insert(index, item);
  void updateDesaListAtIndex(int index, Function(DataDesaStruct) updateFn) =>
      desaList[index] = updateFn(desaList[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for KategoriUpz widget.
  FormFieldController<String>? kategoriUpzValueController;
  // State field(s) for namaUpz widget.
  FocusNode? namaUpzFocusNode;
  TextEditingController? namaUpzTextController;
  String? Function(BuildContext, String?)? namaUpzTextControllerValidator;
  String? _namaUpzTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nama upz harus diisi..';
    }

    return null;
  }

  // State field(s) for alamat widget.
  FocusNode? alamatFocusNode;
  TextEditingController? alamatTextController;
  String? Function(BuildContext, String?)? alamatTextControllerValidator;
  String? _alamatTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Alamat harus diisi';
    }

    return null;
  }

  // State field(s) for dropKecamatan widget.
  int? dropKecamatanValue;
  FormFieldController<int>? dropKecamatanValueController;
  // State field(s) for dropDesa widget.
  int? dropDesaValue;
  FormFieldController<int>? dropDesaValueController;
  // State field(s) for NoSK widget.
  FocusNode? noSKFocusNode;
  TextEditingController? noSKTextController;
  String? Function(BuildContext, String?)? noSKTextControllerValidator;
  // State field(s) for ketua widget.
  FocusNode? ketuaFocusNode;
  TextEditingController? ketuaTextController;
  String? Function(BuildContext, String?)? ketuaTextControllerValidator;
  String? _ketuaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Data pengurus upz belum lengkap';
    }

    return null;
  }

  // State field(s) for sekretaris widget.
  FocusNode? sekretarisFocusNode;
  TextEditingController? sekretarisTextController;
  String? Function(BuildContext, String?)? sekretarisTextControllerValidator;
  String? _sekretarisTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Data pengurus upz belum lengkap';
    }

    return null;
  }

  // State field(s) for bendahara widget.
  FocusNode? bendaharaFocusNode;
  TextEditingController? bendaharaTextController;
  String? Function(BuildContext, String?)? bendaharaTextControllerValidator;
  String? _bendaharaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Data pengurus upz belum lengkap';
    }

    return null;
  }

  // State field(s) for waOperator widget.
  FocusNode? waOperatorFocusNode;
  TextEditingController? waOperatorTextController;
  String? Function(BuildContext, String?)? waOperatorTextControllerValidator;

  @override
  void initState(BuildContext context) {
    namaUpzTextControllerValidator = _namaUpzTextControllerValidator;
    alamatTextControllerValidator = _alamatTextControllerValidator;
    ketuaTextControllerValidator = _ketuaTextControllerValidator;
    sekretarisTextControllerValidator = _sekretarisTextControllerValidator;
    bendaharaTextControllerValidator = _bendaharaTextControllerValidator;
  }

  @override
  void dispose() {
    namaUpzFocusNode?.dispose();
    namaUpzTextController?.dispose();

    alamatFocusNode?.dispose();
    alamatTextController?.dispose();

    noSKFocusNode?.dispose();
    noSKTextController?.dispose();

    ketuaFocusNode?.dispose();
    ketuaTextController?.dispose();

    sekretarisFocusNode?.dispose();
    sekretarisTextController?.dispose();

    bendaharaFocusNode?.dispose();
    bendaharaTextController?.dispose();

    waOperatorFocusNode?.dispose();
    waOperatorTextController?.dispose();
  }

  /// Additional helper methods.
  String? get kategoriUpzValue => kategoriUpzValueController?.value;
}
