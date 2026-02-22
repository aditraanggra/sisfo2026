import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/cloudinary/cloudinary_upload_helper.dart';
import '/component/card_setor_zis/card_setor_zis_widget.dart';
import '/component/card_setor_zis_beras/card_setor_zis_beras_widget.dart';
import '/component/date_picker/date_picker_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/backend/schema/structs/index.dart';
import '/component/skeleton_loader/skeleton_loader_widget.dart';

import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'setor_zis_model.dart';
export 'setor_zis_model.dart';

/// Setor ZIS transaction form page with modernized UI/UX
class SetorZisWidget extends StatefulWidget {
  const SetorZisWidget({super.key});

  static String routeName = 'SetorZis';
  static String routePath = '/setorZis';

  @override
  State<SetorZisWidget> createState() => _SetorZisWidgetState();
}

class _SetorZisWidgetState extends State<SetorZisWidget>
    with TickerProviderStateMixin {
  late SetorZisModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetorZisModel());
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  // Initialize current values from API data
  void _initializeCurrentValues(ApiCallResponse alokasiReportResponse) {
    final body = alokasiReportResponse.jsonBody;
    _model.currentZf = valueOrDefault<int>(
      RekapEndPointGroup.alokasiReportCall.alokasiSetorZfUang(body),
      0,
    );
    _model.currentZm = valueOrDefault<int>(
      RekapEndPointGroup.alokasiReportCall.alokasiSetorZm(body),
      0,
    );
    _model.currentIfs = valueOrDefault<int>(
      RekapEndPointGroup.alokasiReportCall.alokasiSetorIfs(body),
      0,
    );
    _model.currentZfBeras = valueOrDefault<double>(
      RekapEndPointGroup.alokasiReportCall.alokasiSetorZfBeras(body),
      0.0,
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: FlutterFlowTheme.of(context).primaryDark,
      automaticallyImplyLeading: false,
      leading: FlutterFlowIconButton(
        borderColor: Colors.transparent,
        borderRadius: 30.0,
        borderWidth: 1.0,
        buttonSize: 48.0,
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.white,
          size: 20.0,
        ),
        onPressed: () => context.pop(),
      ),
      title: Text(
        'Setor Dana ZIS',
        style: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Inter',
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
      ),
      centerTitle: false,
      elevation: 0.0,
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 8.0),
      child: Text(
        title,
        style: FlutterFlowTheme.of(context).labelMedium.override(
              fontFamily: 'Inter',
              color: FlutterFlowTheme.of(context).primaryDark,
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
      ),
    );
  }

  Widget _buildAlokasiItem(
    BuildContext context,
    String label,
    dynamic value,
    IconData icon, {
    FormatType formatType = FormatType.decimal,
    String? currency,
    String? format,
    String? suffix,
  }) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F4F8),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon,
                  color: FlutterFlowTheme.of(context).primaryDark, size: 16.0),
              const SizedBox(width: 4.0),
              Expanded(
                child: Text(
                  label,
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 10.0,
                        fontWeight: FontWeight.w500,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4.0),
          Text(
            formatType == FormatType.decimal
                ? formatNumber(
                    value,
                    formatType: FormatType.decimal,
                    decimalType: DecimalType.periodDecimal,
                    currency: currency,
                  )
                : formatNumber(
                      value,
                      formatType: FormatType.custom,
                      format: format,
                      locale: 'id_ID',
                    ) +
                    (suffix ?? ''),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: FlutterFlowTheme.of(context).primaryDark,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: RekapEndPointGroup.alokasiReportCall.call(
        token: currentAuthenticationToken,
        unitId: FFAppState().profileUPZ.id,
        year: FFAppState().year,
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: _buildAppBar(context),
            body: _buildShimmerLoading(),
          );
        }
        final alokasiReportData = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: _buildAppBar(context),
            body: SafeArea(
              child: Builder(
                builder: (context) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _initializeCurrentValues(alokasiReportData);
                  });

                  return CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 20.0, 16.0, 0.0),
                          child: Form(
                            key: _model.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Sisa Alokasi Summary
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16.0),
                                    boxShadow: ModernShadows.cardShadow,
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12.0, horizontal: 16.0),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryDark,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(16.0),
                                            topRight: Radius.circular(16.0),
                                          ),
                                        ),
                                        child: Row(
                                          children: const [
                                            Icon(Icons.info_outline,
                                                color: Colors.white,
                                                size: 20.0),
                                            SizedBox(width: 8.0),
                                            Text(
                                              'Sisa Dana Untuk Disetor',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: GridView(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 12.0,
                                            mainAxisSpacing: 12.0,
                                            childAspectRatio: 2.2,
                                          ),
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          children: [
                                            _buildAlokasiItem(
                                              context,
                                              'Zakat Fitrah (Uang)',
                                              _model.currentZf,
                                              Icons.payments_outlined,
                                              currency: 'Rp ',
                                            ),
                                            _buildAlokasiItem(
                                              context,
                                              'Zakat Fitrah (Beras)',
                                              _model.currentZfBeras,
                                              Icons.eco_outlined,
                                              formatType: FormatType.custom,
                                              format: '##.##',
                                              suffix: ' Kg',
                                            ),
                                            _buildAlokasiItem(
                                              context,
                                              'Zakat Mal',
                                              _model.currentZm,
                                              Icons
                                                  .account_balance_wallet_outlined,
                                              currency: 'Rp ',
                                            ),
                                            _buildAlokasiItem(
                                              context,
                                              'Infak Sedekah',
                                              _model.currentIfs,
                                              Icons.volunteer_activism_outlined,
                                              currency: 'Rp ',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 24.0),
                                _buildSectionTitle('TANGGAL SETORAN'),
                                wrapWithModel(
                                  model: _model.datePickerModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: const DatePickerWidget(),
                                ),
                                const SizedBox(height: 24.0),
                                _buildSectionTitle('DETAIL DANA SETORAN'),
                                wrapWithModel(
                                  model: _model.cardSetorZisBerasModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CardSetorZisBerasWidget(
                                    namaZis: 'Zakat Fitrah (Beras)',
                                    nominalSetor: _model.currentZfBeras ?? 0.0,
                                    updateStateSetor: () async {
                                      _model.nomSetorZfBeras =
                                          _model.currentZfBeras;
                                      safeSetState(() {});
                                    },
                                    resetSetor: () async {
                                      _model.nomSetorZfBeras = 0.0;
                                      safeSetState(() {});
                                    },
                                    setCurrentSetor: () async {
                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                                const SizedBox(height: 12),
                                wrapWithModel(
                                  model: _model.cardSetorZisModel1,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CardSetorZisWidget(
                                    namaZis: 'Zakat Fitrah (Uang)',
                                    nominalSetor: _model.currentZf ?? 0,
                                    updateStateSetor: () async {
                                      _model.nomSetorZf = _model.currentZf ?? 0;
                                      safeSetState(() {});
                                    },
                                    resetSetor: () async {
                                      _model.nomSetorZf = 0;
                                      safeSetState(() {});
                                    },
                                    setCurrentSetor: () async {
                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                                const SizedBox(height: 12),
                                wrapWithModel(
                                  model: _model.cardSetorZisModel2,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CardSetorZisWidget(
                                    namaZis: 'Infak Sedekah',
                                    nominalSetor: _model.currentIfs ?? 0,
                                    updateStateSetor: () async {
                                      _model.nomSetorIfs =
                                          _model.currentIfs ?? 0;
                                      safeSetState(() {});
                                    },
                                    resetSetor: () async {
                                      _model.nomSetorIfs = 0;
                                      safeSetState(() {});
                                    },
                                    setCurrentSetor: () async {
                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                                const SizedBox(height: 12),
                                wrapWithModel(
                                  model: _model.cardSetorZisModel3,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CardSetorZisWidget(
                                    namaZis: 'Zakat Mal',
                                    nominalSetor: _model.currentZm ?? 0,
                                    updateStateSetor: () async {
                                      _model.nomSetorZm = _model.currentZm ?? 0;
                                      safeSetState(() {});
                                    },
                                    resetSetor: () async {
                                      _model.nomSetorZm = 0;
                                      safeSetState(() {});
                                    },
                                    setCurrentSetor: () async {
                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                                const SizedBox(height: 24.0),
                                _buildSectionTitle('BUKTI SETORAN'),
                                InkWell(
                                  onTap: () async {
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      storageFolderPath: 'bukti_setor',
                                      maxHeight: 800.00,
                                      imageQuality: 80,
                                      allowPhoto: true,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryDark,
                                      textColor: Colors.white,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      safeSetState(() =>
                                          _model.isDataUploading_uploadDataF1e =
                                              true);
                                      try {
                                        final downloadUrls =
                                            await uploadBuktiTransferToCloudinary(
                                          selectedFiles: selectedMedia,
                                          noRegister: FFAppState()
                                              .profileUPZ
                                              .noRegister,
                                          namaUpz:
                                              FFAppState().profileUPZ.unitName,
                                        );
                                        if (downloadUrls.isNotEmpty) {
                                          safeSetState(() {
                                            _model.uploadedFileUrl_uploadDataF1e =
                                                downloadUrls.first;
                                          });
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: const Text(
                                                  'Upload Bukti Setor Berhasil'),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'Upload gagal. Pastikan koneksi internet stabil dan coba lagi.'),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        }
                                      } catch (e) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text('Upload gagal: $e'),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      } finally {
                                        safeSetState(() => _model
                                                .isDataUploading_uploadDataF1e =
                                            false);
                                      }
                                    }
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary
                                            .withAlpha(50),
                                        width: 2,
                                      ),
                                    ),
                                    child: _model.isDataUploading_uploadDataF1e
                                        ? Column(
                                            children: [
                                              CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                'Mengupload...',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          )
                                        : _model.uploadedFileUrl_uploadDataF1e
                                                .isNotEmpty
                                            ? Column(
                                                children: [
                                                  const Icon(Icons.check_circle,
                                                      color: ModernColors
                                                          .primaryAccent,
                                                      size: 40),
                                                  const SizedBox(height: 8),
                                                  const Text(
                                                      'Bukti Setor Terupload',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  const SizedBox(height: 4),
                                                  Text('Klik untuk mengubah',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[600],
                                                          fontSize: 12)),
                                                ],
                                              )
                                            : Column(
                                                children: const [
                                                  Icon(
                                                      Icons
                                                          .cloud_upload_outlined,
                                                      color: ModernColors
                                                          .primaryAccent,
                                                      size: 40),
                                                  SizedBox(height: 8),
                                                  Text('Upload Bukti Setoran',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  SizedBox(height: 4),
                                                  Text(
                                                      'Format: JPG, PNG • Maks: 5MB',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 12)),
                                                ],
                                              ),
                                  ),
                                ),
                                const SizedBox(height: 32.0),
                                FFButtonWidget(
                                  onPressed: () async {
                                    if ((_model.nomSetorZf == 0) &&
                                        (_model.nomSetorZm == 0) &&
                                        (_model.nomSetorIfs == 0) &&
                                        (_model.nomSetorZfBeras == 0.0)) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Tidak ada dana yang disetor'),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                      return;
                                    }
                                    if (_model.datePickerModel.datePicked ==
                                        null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('Tanggal belum dipilih'),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                      return;
                                    }
                                    if (_model.uploadedFileUrl_uploadDataF1e
                                        .isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('Harus upload bukti setor'),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                      return;
                                    }

                                    final confirm = await showDialog<bool>(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: const Text('Konfirmasi'),
                                        content: const Text(
                                            'Apakah data setoran sudah benar?'),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(ctx, false),
                                              child: const Text('Batal')),
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(ctx, true),
                                              child: const Text('Ya, Setor')),
                                        ],
                                      ),
                                    );

                                    if (confirm == true) {
                                      await TransactionEndPointGroup
                                          .addSetorZISCall
                                          .call(
                                        token: currentAuthenticationToken,
                                        unitId: FFAppState().profileUPZ.id,
                                        trxDate: _model
                                            .datePickerModel.datePicked
                                            ?.toString(),
                                        zfAmountDeposit: _model.nomSetorZf,
                                        zfRiceDeposit: _model.nomSetorZfBeras,
                                        zmAmountDeposit: _model.nomSetorZm,
                                        ifsAmountDeposit: _model.nomSetorIfs,
                                        totalDeposit: _model.nomSetorZf +
                                            _model.nomSetorZm +
                                            _model.nomSetorIfs,
                                        status: 'Tunai',
                                        validation: 'Belum Valid',
                                        upload: _model
                                            .uploadedFileUrl_uploadDataF1e,
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('Setor Dana ZIS Berhasil'),
                                          backgroundColor: Colors.green,
                                        ),
                                      );
                                      context.goNamed(HomeWidget.routeName);
                                    }
                                  },
                                  text: 'Proses Setoran',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 56.0,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryDark,
                                    textStyle: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                    elevation: 2,
                                  ),
                                ),
                                const SizedBox(height: 40.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildShimmerLoading() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Top Summary Card Skeleton
            const SkeletonLoaderWidget(
              type: SkeletonType.card,
              itemCount: 1,
            ),
            const SizedBox(height: 16),
            // Date Picker Skeleton
            const SkeletonLoaderWidget(
              type: SkeletonType.detailRow,
              itemCount: 1,
            ),
            const SizedBox(height: 16),
            // Transaction Cards Skeleton
            const SkeletonLoaderWidget(
              type: SkeletonType.card,
              itemCount: 3,
            ),
            const SizedBox(height: 16),
            // Upload Button Skeleton
            const SkeletonLoaderWidget(
              type: SkeletonType.detailRow,
              itemCount: 1,
            ),
          ],
        ),
      ),
    );
  }
}
