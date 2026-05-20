import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'step_masjid_widget.dart' show StepMasjidWidget;
import 'package:flutter/material.dart';

class StepMasjidModel extends FlutterFlowModel<StepMasjidWidget> {
  List<Map<String, dynamic>> kecamatanList = [];
  List<Map<String, dynamic>> desaList = [];
  bool isLoading = true;
  bool _loaded = false;

  Future<void> loadData(
    BuildContext context, {
    required VoidCallback onKecamatanLoaded,
    required VoidCallback onDesaLoaded,
  }) async {
    if (_loaded) return;
    _loaded = true;

    await Future.delayed(const Duration(milliseconds: 100));

    final profile = FFAppState().profileUPZ;

    final kecResponse = await MiscEndPointGroup.getKecamatanCall.call();
    if (kecResponse.succeeded) {
      final data = kecResponse.jsonBody['data'] as List? ?? [];
      kecamatanList = data.cast<Map<String, dynamic>>();

      if (profile.districtName != null &&
          profile.districtName!.isNotEmpty) {
        onKecamatanLoaded();
      }
    }

    final desaResponse = await MiscEndPointGroup.getDesaCall.call(
      districtId: profile.districtId.toString(),
    );
    if (desaResponse.succeeded) {
      final data = desaResponse.jsonBody['data'] as List? ?? [];
      desaList = data.cast<Map<String, dynamic>>();

      if (profile.villageName != null &&
          profile.villageName!.isNotEmpty) {
        onDesaLoaded();
      }
    }

    isLoading = false;
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
