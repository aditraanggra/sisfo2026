import '/component/card_setor_zis/card_setor_zis_widget.dart';
import '/component/card_setor_zis_beras/card_setor_zis_beras_widget.dart';
import '/component/date_picker/date_picker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'setor_zis_widget.dart' show SetorZisWidget;
import 'package:flutter/material.dart';

class SetorZisModel extends FlutterFlowModel<SetorZisWidget> {
  ///  Local state fields for this page.

  int nomSetorIfs = 0;

  int nomSetorZm = 0;

  int nomSetorZf = 0;

  int? currentIfs = 0;

  int? currentZm = 0;

  int? currentZf = 0;

  double? nomSetorZfBeras = 0.0;

  double? currentZfBeras = 0.0;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for DatePicker component.
  late DatePickerModel datePickerModel;
  // Model for CardSetorZisBeras component.
  late CardSetorZisBerasModel cardSetorZisBerasModel;
  // Model for CardSetorZis component.
  late CardSetorZisModel cardSetorZisModel1;
  // Model for CardSetorZis component.
  late CardSetorZisModel cardSetorZisModel2;
  // Model for CardSetorZis component.
  late CardSetorZisModel cardSetorZisModel3;
  bool isDataUploading_uploadDataF1e = false;
  FFUploadedFile uploadedLocalFile_uploadDataF1e =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataF1e = '';

  @override
  void initState(BuildContext context) {
    datePickerModel = createModel(context, () => DatePickerModel());
    cardSetorZisBerasModel =
        createModel(context, () => CardSetorZisBerasModel());
    cardSetorZisModel1 = createModel(context, () => CardSetorZisModel());
    cardSetorZisModel2 = createModel(context, () => CardSetorZisModel());
    cardSetorZisModel3 = createModel(context, () => CardSetorZisModel());
  }

  @override
  void dispose() {
    datePickerModel.dispose();
    cardSetorZisBerasModel.dispose();
    cardSetorZisModel1.dispose();
    cardSetorZisModel2.dispose();
    cardSetorZisModel3.dispose();
  }
}
