import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'lengkapi_profile_widget.dart' show LengkapiProfileWidget;
import 'package:flutter/material.dart';

class LengkapiProfileModel extends FlutterFlowModel<LengkapiProfileWidget> {
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool isDesaLoading = false;
  ApiCallResponse? saveResponse;

  FormFieldController<String>? kategoriUpzValueController;

  FocusNode? namaUpzFocusNode;
  TextEditingController? namaUpzTextController;
  String? Function(BuildContext, String?)? namaUpzTextControllerValidator;
  String? _namaUpzTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nama UPZ wajib diisi';
    }
    return null;
  }

  FocusNode? alamatFocusNode;
  TextEditingController? alamatTextController;
  String? Function(BuildContext, String?)? alamatTextControllerValidator;
  String? _alamatTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Alamat wajib diisi';
    }
    return null;
  }

  int? dropKecamatanValue;
  FormFieldController<int>? dropKecamatanValueController;

  int? dropDesaValue;
  FormFieldController<int>? dropDesaValueController;

  Future<ApiCallResponse>? desaFuture;
  List<int> desaIds = [];
  List<String> desaNames = [];

  FocusNode? noSKFocusNode;
  TextEditingController? noSKTextController;
  String? Function(BuildContext, String?)? noSKTextControllerValidator;
  String? _noSKTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nomor SK wajib diisi';
    }
    return null;
  }

  FocusNode? ketuaFocusNode;
  TextEditingController? ketuaTextController;
  String? Function(BuildContext, String?)? ketuaTextControllerValidator;
  String? _ketuaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nama ketua wajib diisi';
    }
    return null;
  }

  FocusNode? sekretarisFocusNode;
  TextEditingController? sekretarisTextController;
  String? Function(BuildContext, String?)? sekretarisTextControllerValidator;
  String? _sekretarisTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nama sekretaris wajib diisi';
    }
    return null;
  }

  FocusNode? bendaharaFocusNode;
  TextEditingController? bendaharaTextController;
  String? Function(BuildContext, String?)? bendaharaTextControllerValidator;
  String? _bendaharaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nama bendahara wajib diisi';
    }
    return null;
  }

  FocusNode? waOperatorFocusNode;
  TextEditingController? waOperatorTextController;
  String? Function(BuildContext, String?)? waOperatorTextControllerValidator;
  String? _waOperatorTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nomor WhatsApp wajib diisi';
    }
    if (!RegExp(r'^[0-9]{10,15}$')
        .hasMatch(val.replaceAll(RegExp(r'[\s\-]'), ''))) {
      return 'Format nomor tidak valid';
    }
    return null;
  }

  String? get kategoriUpzValue => kategoriUpzValueController?.value;

  @override
  void initState(BuildContext context) {
    namaUpzTextControllerValidator = _namaUpzTextControllerValidator;
    alamatTextControllerValidator = _alamatTextControllerValidator;
    noSKTextControllerValidator = _noSKTextControllerValidator;
    ketuaTextControllerValidator = _ketuaTextControllerValidator;
    sekretarisTextControllerValidator = _sekretarisTextControllerValidator;
    bendaharaTextControllerValidator = _bendaharaTextControllerValidator;
    waOperatorTextControllerValidator = _waOperatorTextControllerValidator;
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
}
