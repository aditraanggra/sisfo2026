import '/flutter_flow/flutter_flow_util.dart';
import 'hewan_counter_row_widget.dart' show HewanCounterRowWidget;
import 'package:flutter/material.dart';

class HewanCounterRowModel
    extends FlutterFlowModel<HewanCounterRowWidget> {
  late TextEditingController countController;

  @override
  void initState(BuildContext context) {
    countController = TextEditingController(text: '${widget?.value ?? 0}');
  }

  void syncValue(int newValue) {
    countController.text = '$newValue';
  }

  @override
  void dispose() {
    countController.dispose();
  }
}
