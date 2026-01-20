import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  Local state fields for this page.

  bool isEdited = true;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataR0t = false;
  FFUploadedFile uploadedLocalFile_uploadDataR0t =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataR0t = '';

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;
  // State field(s) for noTelp widget.
  FocusNode? noTelpFocusNode;
  TextEditingController? noTelpTextController;
  String? Function(BuildContext, String?)? noTelpTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();

    noTelpFocusNode?.dispose();
    noTelpTextController?.dispose();
  }
}
