import '/flutter_flow/flutter_flow_util.dart';
import 'step_distribusi_widget.dart' show StepDistribusiWidget;
import 'package:flutter/material.dart';

class StepDistribusiModel extends FlutterFlowModel<StepDistribusiWidget> {
  late TextEditingController paketDagingController;
  late TextEditingController penerimaController;

  @override
  void initState(BuildContext context) {
    paketDagingController =
        TextEditingController(text: '${widget?.jmlPaketDaging ?? 70}');
    penerimaController =
        TextEditingController(text: '${widget?.jmlPenerima ?? 70}');
  }

  void syncPaketDaging(int value) {
    if (paketDagingController.text != '$value') {
      paketDagingController.text = '$value';
    }
  }

  void syncPenerima(int value) {
    if (penerimaController.text != '$value') {
      penerimaController.text = '$value';
    }
  }

  @override
  void dispose() {
    paketDagingController.dispose();
    penerimaController.dispose();
  }
}
