import '/flutter_flow/flutter_flow_util.dart';
import 'upload_laporan_widget.dart' show UploadLaporanWidget;
import 'package:flutter/material.dart';

class UploadLaporanModel extends FlutterFlowModel<UploadLaporanWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  // State for Formulir 101
  bool isDataUploading101 = false;
  List<FFUploadedFile> uploadedLocalFiles101 = [];

  // State for Formulir 102
  bool isDataUploading102 = false;
  List<FFUploadedFile> uploadedLocalFiles102 = [];

  // State for LPZ
  bool isDataUploadingLpz = false;
  List<FFUploadedFile> uploadedLocalFilesLpz = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
