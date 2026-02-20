import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'histori_transaksi_widget.dart' show HistoriTransaksiWidget;
import 'package:flutter/material.dart';

class HistoriTransaksiModel extends FlutterFlowModel<HistoriTransaksiWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Backend Call - API (Delete Zakat Fitrah)] action in SlidableActionWidget widget.
  ApiCallResponse? apiResultads;
  // Stores action output result for [Backend Call - API (Delete Sedekah)] action in SlidableActionWidget widget.
  ApiCallResponse? apiResultadsCopy2;
  // Stores action output result for [Backend Call - API (Delete Zakat Mal)] action in SlidableActionWidget widget.
  ApiCallResponse? apiResultadsCopy;
  // Stores action output result for [Backend Call - API (Delete Kotak Amal)] action in SlidableActionWidget widget.
  ApiCallResponse? apiResultadsCopy3;
  // Stores action output result for [Backend Call - API (Delete Fidyah)] action in SlidableActionWidget widget.
  ApiCallResponse? apiResultadsFidyah;
  // Stores action output result for [Backend Call - API (Delete Pendistribusian)] action in SlidableActionWidget widget.
  ApiCallResponse? apiResultadsCopy3Copy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
