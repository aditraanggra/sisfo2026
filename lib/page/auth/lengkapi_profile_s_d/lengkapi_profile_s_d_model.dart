import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'lengkapi_profile_s_d_widget.dart' show LengkapiProfileSDWidget;
import 'package:flutter/material.dart';

class LengkapiProfileSDModel extends FlutterFlowModel<LengkapiProfileSDWidget> {
  ///  Local state fields for this page.

  String kecamatanId = '3203200';

  String registerUpz = '';

  String namaUpz = '';

  String npsnId = '20203374';

  String npsnSmp = '20203900';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_uploadData5l4Dkm = false;
  FFUploadedFile uploadedLocalFile_uploadData5l4Dkm =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData5l4Dkm = '';

  // State field(s) for namaOperator widget.
  FocusNode? namaOperatorFocusNode;
  TextEditingController? namaOperatorTextController;
  String? Function(BuildContext, String?)? namaOperatorTextControllerValidator;
  String? _namaOperatorTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'nama operator harus diisi';
    }

    return null;
  }

  // State field(s) for noHp widget.
  FocusNode? noHpFocusNode;
  TextEditingController? noHpTextController;
  String? Function(BuildContext, String?)? noHpTextControllerValidator;
  String? _noHpTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'no hp harus diisi';
    }

    return null;
  }

  // State field(s) for KategoriUpz widget.
  FormFieldController<String>? kategoriUpzValueController;
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
  String? dropKecamatanValue;
  FormFieldController<String>? dropKecamatanValueController;
  Completer<ApiCallResponse>? apiRequestCompleter1;
  Completer<ApiCallResponse>? apiRequestCompleter3;
  // State field(s) for dropDesa widget.
  String? dropDesaValue;
  FormFieldController<String>? dropDesaValueController;
  // State field(s) for dropSD widget.
  String? dropSDValue;
  FormFieldController<String>? dropSDValueController;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  // State field(s) for dropSmp widget.
  String? dropSmpValue;
  FormFieldController<String>? dropSmpValueController;
  Completer<ApiCallResponse>? apiRequestCompleter4;
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

  // State field(s) for NoSK widget.
  FocusNode? noSKFocusNode;
  TextEditingController? noSKTextController;
  String? Function(BuildContext, String?)? noSKTextControllerValidator;
  bool isDataUploading_uploadDataF8uDkm = false;
  FFUploadedFile uploadedLocalFile_uploadDataF8uDkm =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataF8uDkm = '';

  @override
  void initState(BuildContext context) {
    namaOperatorTextControllerValidator = _namaOperatorTextControllerValidator;
    noHpTextControllerValidator = _noHpTextControllerValidator;
    alamatTextControllerValidator = _alamatTextControllerValidator;
    ketuaTextControllerValidator = _ketuaTextControllerValidator;
    sekretarisTextControllerValidator = _sekretarisTextControllerValidator;
    bendaharaTextControllerValidator = _bendaharaTextControllerValidator;
  }

  @override
  void dispose() {
    namaOperatorFocusNode?.dispose();
    namaOperatorTextController?.dispose();

    noHpFocusNode?.dispose();
    noHpTextController?.dispose();

    alamatFocusNode?.dispose();
    alamatTextController?.dispose();

    ketuaFocusNode?.dispose();
    ketuaTextController?.dispose();

    sekretarisFocusNode?.dispose();
    sekretarisTextController?.dispose();

    bendaharaFocusNode?.dispose();
    bendaharaTextController?.dispose();

    noSKFocusNode?.dispose();
    noSKTextController?.dispose();
  }

  /// Additional helper methods.
  String? get kategoriUpzValue => kategoriUpzValueController?.value;
  Future waitForApiRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter3?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted4({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter4?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
