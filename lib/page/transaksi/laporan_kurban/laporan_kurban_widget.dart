import '/backend/api_requests/api_calls.dart';
import '/auth/custom_auth/auth_util.dart';
import '/component/stepper_header/stepper_header_widget.dart';
import '/component/step_nav_bar/step_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'laporan_kurban_model.dart';
import 'step_masjid_widget.dart';
import 'step_hewan_widget.dart';
import 'step_distribusi_widget.dart';
import 'step_dokumentasi_widget.dart';
import 'step_konfirmasi_widget.dart';
import 'sukses_laporan_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
export 'laporan_kurban_model.dart';

class LaporanKurbanWidget extends StatefulWidget {
  const LaporanKurbanWidget({super.key});

  static String routeName = 'LaporanKurban';
  static String routePath = '/laporan-kurban';

  @override
  State<LaporanKurbanWidget> createState() => _LaporanKurbanWidgetState();
}

class _LaporanKurbanWidgetState extends State<LaporanKurbanWidget> {
  late LaporanKurbanModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  static const List<String> _stepLabels = [
    'Masjid',
    'Hewan',
    'Distribusi',
    'Dokumentasi',
  ];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LaporanKurbanModel());
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _model.initFromProfile();
      await _checkExistingReport();
      if (!_model.hasExistingReport) {
        await _checkDraft();
      }
      safeSetState(() {});
    });
  }

  Future<void> _checkExistingReport() async {
    final response = await LaporanKurbanEndPointGroup.listLaporanKurbanCall.call(
      token: currentAuthenticationToken,
      tahun: _model.tahunMasehi,
      status: 'submitted',
    );
    if (response.succeeded) {
      final list =
          LaporanKurbanEndPointGroup.listLaporanKurbanCall.dataList(response.jsonBody);
      if (list != null && list.isNotEmpty) {
        _model.hasExistingReport = true;
        safeSetState(() {});
      }
    }
  }

  Future<void> _checkDraft() async {
    if (LaporanKurbanModel.hasDraft()) {
      final shouldContinue = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ModernRadius.md)),
          title: Text(
            'Lanjutkan laporan sebelumnya?',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: ModernColors.textPrimary,
            ),
          ),
          content: Text(
            'Terdapat laporan yang belum selesai. Ingin melanjutkan?',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: ModernColors.textSecondary,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                LaporanKurbanModel.clearDraft();
                safeSetState(() => _model = createModel(context, () => LaporanKurbanModel()));
                _model.initFromProfile();
                Navigator.of(ctx).pop(false);
              },
              child: Text(
                'Mulai Ulang',
                style: GoogleFonts.inter(
                  color: ModernColors.expenseRed,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              style: ElevatedButton.styleFrom(
                backgroundColor: ModernColors.primaryAccent,
              ),
              child: Text(
                'Lanjutkan',
                style: GoogleFonts.inter(color: Colors.white),
              ),
            ),
          ],
        ),
      );

      if (shouldContinue == true) {
        _model.loadDraft();
      }
      safeSetState(() {});
    }
  }

  void _cancelReport() {
    LaporanKurbanModel.clearDraft();
    context.pop();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  bool get _canGoNext {
    switch (_model.currentStep) {
      case 0:
        return _model.unitName != null && _model.unitName!.isNotEmpty;
      case 1:
        return _model.totalEkor > 0;
      default:
        return true;
    }
  }

  void _onNext() {
    if (_model.isLoading) return;

    if (_model.currentStep == 0) {
      _model.completedSteps.add(0);
    } else if (_model.currentStep == 1) {
      _model.completedSteps.add(1);
    } else if (_model.currentStep == 2) {
      _model.completedSteps.add(2);
    } else if (_model.currentStep == 3) {
      _model.completedSteps.add(3);
    }

    if (_model.currentStep < _stepLabels.length) {
      safeSetState(() => _model.currentStep++);
      _model.saveDraft();
    } else {
      _submitLaporan();
    }
  }

  void _onBack() {
    if (_model.currentStep > 0) {
      safeSetState(() => _model.currentStep--);
      _model.saveDraft();
    }
  }

  void _onStateChanged(VoidCallback callback) {
    safeSetState(() {
      callback();
      _model.saveDraft();
    });
  }

  Future<void> _submitLaporan() async {
    safeSetState(() => _model.isLoading = true);

    try {
      final createResp =
          await LaporanKurbanEndPointGroup.createLaporanKurbanCall.call(
        token: currentAuthenticationToken,
        unitId: FFAppState().profileUPZ.id,
        tahunHijriah: _model.getTahunHijriah(_model.tahunMasehi),
        tahunMasehi: _model.tahunMasehi,
        jmlSapi: _model.jmlSapi,
        jmlKerbau: _model.jmlKerbau,
        jmlKambing: _model.jmlKambing,
        jmlDomba: _model.jmlDomba,
        totalShohibul: _model.totalShohibul,
        shohibulDikoreksi: _model.shohibulDikoreksi,
        alasanKoreksi: _model.alasanKoreksi,
        jmlPaketDaging: _model.jmlPaketDaging,
        jmlPenerima: _model.jmlPenerima,
        kelompokPenerima: _model.kelompokPenerima,
        catatan: null,
      );

      if (!createResp.succeeded) {
        _showError('Gagal membuat laporan', createResp.exceptionMessage);
        return;
      }

      final reportId =
          LaporanKurbanEndPointGroup.createLaporanKurbanCall
              .createdId(createResp.jsonBody);

      if (reportId == null) {
        _showError('Gagal membuat laporan', 'ID laporan tidak ditemukan');
        return;
      }

      final submitResp =
          await LaporanKurbanEndPointGroup.submitLaporanKurbanCall.call(
        token: currentAuthenticationToken,
        id: reportId,
      );

      if (!submitResp.succeeded) {
        _showError('Gagal mengirim laporan', submitResp.exceptionMessage);
        return;
      }

      final noReferensi =
          LaporanKurbanEndPointGroup.submitLaporanKurbanCall
              .noReferensi(submitResp.jsonBody);

      LaporanKurbanModel.clearDraft();

      if (!mounted) return;
      context.pushReplacement(
        SuksesLaporanWidget.routePath,
        extra: {
          'noReferensi': noReferensi ?? 'LK/${_model.tahunMasehi}/XXX',
          'reportId': reportId,
          'unitName': _model.unitName ?? '',
          'fotoKegiatan': _model.fotoKegiatan,
          'beritaAcara': _model.beritaAcara,
        },
      );
    } catch (e) {
      _showError('Terjadi kesalahan', e.toString());
    } finally {
      if (mounted) safeSetState(() => _model.isLoading = false);
    }
  }

  void _showError(String title, String? message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title: ${message ?? 'Kesalahan tidak diketahui'}'),
        backgroundColor: ModernColors.expenseRed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_model.hasExistingReport) {
      return Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: ModernColors.primaryDark,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded,
                color: ModernColors.textOnDark),
            onPressed: () => context.pop(),
          ),
          title: Text(
            'Laporan Kurban',
            style: GoogleFonts.inter(
              color: ModernColors.textOnDark,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(ModernSpacing.lg),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: ModernColors.goldAccent.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.info_outline,
                      color: ModernColors.goldAccent,
                      size: 36,
                    ),
                  ),
                  const SizedBox(height: ModernSpacing.lg),
                  Text(
                    'Laporan Sudah Ada',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: ModernColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: ModernSpacing.sm),
                  Text(
                    'Anda sudah melaporkan kurban tahun ${_model.tahunMasehi}. Jika ada perubahan silakan hubungi admin.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: ModernColors.textSecondary,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: ModernSpacing.xl),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => context.pop(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ModernColors.primaryAccent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(ModernRadius.sm),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Kembali ke Beranda',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: ModernColors.primaryDark,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded,
              color: ModernColors.textOnDark),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Laporan Kurban',
          style: GoogleFonts.inter(
            color: ModernColors.textOnDark,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          StepperHeaderWidget(
            steps: _stepLabels,
            currentStep: _model.currentStep,
            completedSteps: _model.completedSteps,
            onTapStep: (step) {
              if (_model.completedSteps.contains(step)) {
                safeSetState(() => _model.currentStep = step);
              }
            },
          ),
          const Divider(height: 1),
          Expanded(child: _buildCurrentStep()),
          const Divider(height: 1),
          _buildNavBar(),
        ],
      ),
    );
  }

  Widget _buildCurrentStep() {
    switch (_model.currentStep) {
      case 0:
        return StepMasjidWidget(
          unitName: _model.unitName,
          desa: _model.desa,
          kecamatan: _model.kecamatan,
          tahunMasehi: _model.tahunMasehi,
          onUnitNameChanged: (v) =>
              _onStateChanged(() => _model.unitName = v),
          onDesaChanged: (v) =>
              _onStateChanged(() => _model.desa = v),
          onKecamatanChanged: (v) =>
              _onStateChanged(() => _model.kecamatan = v),
          onTahunChanged: (v) =>
              _onStateChanged(() => _model.tahunMasehi = v),
        );
      case 1:
        return StepHewanWidget(
          jmlSapi: _model.jmlSapi,
          jmlKerbau: _model.jmlKerbau,
          jmlKambing: _model.jmlKambing,
          jmlDomba: _model.jmlDomba,
          shohibulDikoreksi: _model.shohibulDikoreksi,
          shohibulManual: _model.shohibulManual,
          alasanKoreksi: _model.alasanKoreksi,
          onSapiChanged: (v) =>
              _onStateChanged(() => _model.jmlSapi = v),
          onKerbauChanged: (v) =>
              _onStateChanged(() => _model.jmlKerbau = v),
          onKambingChanged: (v) =>
              _onStateChanged(() => _model.jmlKambing = v),
          onDombaChanged: (v) =>
              _onStateChanged(() => _model.jmlDomba = v),
          onShohibulManualChanged: (v) =>
              _onStateChanged(() => _model.shohibulManual = v),
          onAlasanKoreksiChanged: (v) =>
              _onStateChanged(() => _model.alasanKoreksi = v),
          onToggleKoreksi: () =>
              _onStateChanged(() => _model.shohibulDikoreksi =
                  !_model.shohibulDikoreksi),
          onResetShohibul: () => _onStateChanged(() {
            _model.shohibulDikoreksi = false;
            _model.shohibulManual = null;
            _model.alasanKoreksi = null;
          }),
        );
      case 2:
        return StepDistribusiWidget(
          jmlPaketDaging: _model.jmlPaketDaging,
          jmlPenerima: _model.jmlPenerima,
          kelompokPenerima: _model.kelompokPenerima,
          onPaketDagingChanged: (v) =>
              _onStateChanged(() => _model.jmlPaketDaging = v.round()),
          onPenerimaChanged: (v) =>
              _onStateChanged(() => _model.jmlPenerima = v.round()),
          onKelompokChanged: (v) =>
              _onStateChanged(() => _model.kelompokPenerima = v),
        );
      case 3:
        return StepDokumentasiWidget(
          fotoKegiatan: _model.fotoKegiatan,
          beritaAcara: _model.beritaAcara,
          fotoKegiatanUrl: _model.fotoKegiatanUrl,
          beritaAcaraUrl: _model.beritaAcaraUrl,
          onFotoKegiatanChanged: (f) =>
              _onStateChanged(() => _model.fotoKegiatan = f),
          onBeritaAcaraChanged: (f) =>
              _onStateChanged(() => _model.beritaAcara = f),
          onFotoKegiatanUrlChanged: (url) =>
              _onStateChanged(() => _model.fotoKegiatanUrl = url),
          onBeritaAcaraUrlChanged: (url) =>
              _onStateChanged(() => _model.beritaAcaraUrl = url),
          onFotoKegiatanPathChanged: (path) =>
              _onStateChanged(() => _model.fotoKegiatanPath = path),
          onBeritaAcaraPathChanged: (path) =>
              _onStateChanged(() => _model.beritaAcaraPath = path),
        );
      case 4:
        return StepKonfirmasiWidget(
          unitName: _model.unitName,
          desa: _model.desa,
          kecamatan: _model.kecamatan,
          tahunMasehi: _model.tahunMasehi,
          jmlSapi: _model.jmlSapi,
          jmlKerbau: _model.jmlKerbau,
          jmlKambing: _model.jmlKambing,
          jmlDomba: _model.jmlDomba,
          shohibulDikoreksi: _model.shohibulDikoreksi,
          totalShohibul: _model.totalShohibul,
          jmlPaketDaging: _model.jmlPaketDaging,
          jmlPenerima: _model.jmlPenerima,
          kelompokPenerima: _model.kelompokPenerima,
          fotoKegiatan: _model.fotoKegiatan,
          beritaAcara: _model.beritaAcara,
          onKirim: _submitLaporan,
          isLoading: _model.isLoading,
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildNavBar() {
    if (_model.currentStep == _stepLabels.length) {
      return const SizedBox.shrink();
    }

    final isLastStep = _model.currentStep == _stepLabels.length - 1;
    final isSecondLast = _model.currentStep == _stepLabels.length - 2;

    return StepNavBarWidget(
      onBack: _model.currentStep > 0 ? _onBack : _cancelReport,
      onNext: _canGoNext ? _onNext : () {},
      nextLabel: isLastStep
          ? 'Ringkasan'
          : 'Lanjut',
      showSkip: isSecondLast,
      isLoading: _model.isLoading,
    );
  }
}
