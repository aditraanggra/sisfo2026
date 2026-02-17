import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'tahun_pengelolaan_widget.dart' show TahunPengelolaanWidget;
import 'package:flutter/material.dart';

class TahunPengelolaanModel extends FlutterFlowModel<TahunPengelolaanWidget> {
  int? selectedYear;

  @override
  void initState(BuildContext context) {
    selectedYear = FFAppState().year;
  }

  @override
  void dispose() {}
}
