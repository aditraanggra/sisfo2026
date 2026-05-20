import '/flutter_flow/flutter_flow_util.dart';
import 'laporan_kurban_widget.dart' show LaporanKurbanWidget;
import 'dart:io';

import 'package:flutter/material.dart';

class LaporanKurbanModel extends FlutterFlowModel<LaporanKurbanWidget> {
  static const _draftKey = 'laporan_kurban_draft';

  int currentStep = 0;
  final Set<int> completedSteps = {};
  bool isLoading = false;
  bool hasExistingReport = false;

  String? unitName;
  String? desa;
  String? kecamatan;
  int tahunMasehi = DateTime.now().year;

  int jmlSapi = 0;
  int jmlKerbau = 0;
  int jmlKambing = 0;
  int jmlDomba = 0;

  bool shohibulDikoreksi = false;
  int? shohibulManual;
  String? alasanKoreksi;

  int jmlPaketDaging = 70;
  int jmlPenerima = 70;
  List<String> kelompokPenerima = [];

  File? fotoKegiatan;
  File? beritaAcara;
  String? fotoKegiatanUrl;
  String? beritaAcaraUrl;
  String? fotoKegiatanPath;
  String? beritaAcaraPath;

  int get totalEkor => jmlSapi + jmlKerbau + jmlKambing + jmlDomba;

  int get calculatedShohibul =>
      (jmlSapi + jmlKerbau) * 7 + jmlKambing + jmlDomba;

  int get totalShohibul =>
      shohibulDikoreksi
          ? (shohibulManual ?? calculatedShohibul)
          : calculatedShohibul;

  void initFromProfile() {
    final profile = FFAppState().profileUPZ;
    if (unitName == null || unitName!.isEmpty) {
      unitName = profile.unitName;
    }
    if (kecamatan == null || kecamatan!.isEmpty) {
      kecamatan = profile.districtName;
    }
    if (desa == null || desa!.isEmpty) {
      desa = profile.villageName;
    }
  }

  String getTahunHijriah(int masehi) {
    return '${masehi - 622 + ((masehi - 622) ~/ 33)}';
  }

  void saveDraft() {
    final prefs = FFAppState().prefs;
    final draft = {
      'currentStep': currentStep,
      'completedSteps': completedSteps.toList(),
      'unitName': unitName,
      'desa': desa,
      'kecamatan': kecamatan,
      'tahunMasehi': tahunMasehi,
      'jmlSapi': jmlSapi,
      'jmlKerbau': jmlKerbau,
      'jmlKambing': jmlKambing,
      'jmlDomba': jmlDomba,
      'shohibulDikoreksi': shohibulDikoreksi,
      'shohibulManual': shohibulManual,
      'alasanKoreksi': alasanKoreksi,
      'jmlPaketDaging': jmlPaketDaging,
      'jmlPenerima': jmlPenerima,
      'kelompokPenerima': kelompokPenerima,
      'fotoKegiatanUrl': fotoKegiatanUrl,
      'beritaAcaraUrl': beritaAcaraUrl,
      'fotoKegiatanPath': fotoKegiatanPath,
      'beritaAcaraPath': beritaAcaraPath,
    };
    prefs.setString(_draftKey, jsonEncode(draft));
  }

  void loadDraft() {
    final prefs = FFAppState().prefs;
    final raw = prefs.getString(_draftKey);
    if (raw == null || raw.isEmpty) return;

    final draft = jsonDecode(raw) as Map<String, dynamic>;
    currentStep = draft['currentStep'] ?? 0;
    completedSteps.addAll(
        (draft['completedSteps'] as List? ?? []).cast<int>());
    unitName = draft['unitName'];
    desa = draft['desa'];
    kecamatan = draft['kecamatan'];
    tahunMasehi = draft['tahunMasehi'] ?? DateTime.now().year;
    jmlSapi = draft['jmlSapi'] ?? 0;
    jmlKerbau = draft['jmlKerbau'] ?? 0;
    jmlKambing = draft['jmlKambing'] ?? 0;
    jmlDomba = draft['jmlDomba'] ?? 0;
    shohibulDikoreksi = draft['shohibulDikoreksi'] ?? false;
    shohibulManual = draft['shohibulManual'];
    alasanKoreksi = draft['alasanKoreksi'];
    jmlPaketDaging = draft['jmlPaketDaging'] ?? 70;
    jmlPenerima = draft['jmlPenerima'] ?? 70;
    kelompokPenerima =
        (draft['kelompokPenerima'] as List? ?? []).cast<String>();
    fotoKegiatanUrl = draft['fotoKegiatanUrl'];
    beritaAcaraUrl = draft['beritaAcaraUrl'];
    fotoKegiatanPath = draft['fotoKegiatanPath'];
    beritaAcaraPath = draft['beritaAcaraPath'];

    if (fotoKegiatanPath != null) {
      final f = File(fotoKegiatanPath!);
      if (f.existsSync()) fotoKegiatan = f;
    }
    if (beritaAcaraPath != null) {
      final f = File(beritaAcaraPath!);
      if (f.existsSync()) beritaAcara = f;
    }
  }

  static void clearDraft() {
    FFAppState().prefs.remove(_draftKey);
  }

  static bool hasDraft() {
    return FFAppState().prefs.containsKey(_draftKey);
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
