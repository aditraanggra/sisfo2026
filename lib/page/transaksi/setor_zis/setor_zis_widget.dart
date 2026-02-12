import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/cloudinary/cloudinary_upload_helper.dart';
import '/component/card_setor_zis/card_setor_zis_widget.dart';
import '/component/card_setor_zis_beras/card_setor_zis_beras_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/backend/schema/structs/index.dart';

import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'setor_zis_model.dart';
export 'setor_zis_model.dart';

/// Setor ZIS transaction form page with modern UI styling
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
  late AnimationController _buttonAnimationController;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetorZisModel());
    _buttonAnimationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    _buttonAnimationController.dispose();
    super.dispose();
  }

  // Initialize current values from API data
  void _initializeCurrentValues(ApiCallResponse rekapAlokasiResponse,
      ApiCallResponse rekapSetorResponse) {
    // Calculate initial values (alokasi - realisasi)
    _model.currentZf = valueOrDefault<int>(
      valueOrDefault<int>(
            RekapEndPointGroup.rekapAlokasiCall.setorZfUang(
              rekapAlokasiResponse.jsonBody,
            ),
            0,
          ) -
          valueOrDefault<int>(
            RekapEndPointGroup.rekapSetorCall.realisasiSetorZfUang(
              rekapSetorResponse.jsonBody,
            ),
            0,
          ),
      0,
    );
    _model.currentZm = valueOrDefault<int>(
      valueOrDefault<int>(
            RekapEndPointGroup.rekapAlokasiCall.setorZm(
              rekapAlokasiResponse.jsonBody,
            ),
            0,
          ) -
          valueOrDefault<int>(
            RekapEndPointGroup.rekapSetorCall.realisasiSetorZm(
              rekapSetorResponse.jsonBody,
            ),
            0,
          ),
      0,
    );
    _model.currentIfs = valueOrDefault<int>(
      valueOrDefault<int>(
            RekapEndPointGroup.rekapAlokasiCall.setorIfs(
              rekapAlokasiResponse.jsonBody,
            ),
            0,
          ) -
          valueOrDefault<int>(
            RekapEndPointGroup.rekapSetorCall.realisasiSetorIfs(
              rekapSetorResponse.jsonBody,
            ),
            0,
          ),
      0,
    );
    _model.currentZfBeras = valueOrDefault<double>(
      valueOrDefault<double>(
            RekapEndPointGroup.rekapAlokasiCall.setorZfBeras(
              rekapAlokasiResponse.jsonBody,
            ),
            0.0,
          ) -
          valueOrDefault<double>(
            RekapEndPointGroup.rekapSetorCall.realisasiSetorZfBeras(
              rekapSetorResponse.jsonBody,
            ),
            0.0,
          ),
      0.0,
    );
    safeSetState(() {});
  }

  // Build AppBar widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: ModernColors.backgroundPrimary,
      automaticallyImplyLeading: false,
      leading: FlutterFlowIconButton(
        borderColor: Colors.transparent,
        borderRadius: 30.0,
        borderWidth: 1.0,
        buttonSize: 60.0,
        icon: Icon(
          Icons.arrow_back_rounded,
          color: ModernColors.textPrimary,
          size: 30.0,
        ),
        onPressed: () async {
          context.pop();
        },
      ),
      title: Text(
        'Setor ZIS',
        style: FlutterFlowTheme.of(context).headlineMedium.override(
              fontFamily: 'Noto Sans',
              color: ModernColors.textPrimary,
              fontSize: 22.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w600,
            ),
      ),
      centerTitle: false,
      elevation: 0.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: RekapEndPointGroup.rekapAlokasiCall.call(
        periode: 'tahunan',
        token: currentAuthenticationToken,
        unitId: FFAppState().profileUPZ.id.toString(),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: ModernColors.backgroundPrimary,
            body: Center(
              child: CircularProgressIndicator(
                color: ModernColors.primaryAccent,
              ),
            ),
          );
        }
        final setorZisRekapAlokasiResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: PopScope(
            canPop: false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: ModernColors.backgroundPrimary,
              appBar: _buildAppBar(context),
              body: SafeArea(
                child: FutureBuilder<ApiCallResponse>(
                  future: RekapEndPointGroup.rekapSetorCall.call(
                    periode: 'tahunan',
                    token: currentAuthenticationToken,
                    unitId: FFAppState().profileUPZ.id,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: ModernColors.primaryAccent,
                        ),
                      );
                    }
                    final formRekapSetorResponse = snapshot.data!;

                    // Initialize current values after both API responses are received
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _initializeCurrentValues(
                          setorZisRekapAlokasiResponse, formRekapSetorResponse);
                    });

                    return Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 40.0),
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              // Summary Card
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: Color(0xFFE0E3E7),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total Setoran',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                        ),
                                        SizedBox(height: 8),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Uang',
                                                  style: GoogleFonts.notoSans(
                                                    fontSize: 12,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                  ),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    formatNumber(
                                                      _model.nomSetorZf +
                                                          _model.nomSetorZm +
                                                          _model.nomSetorIfs,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType: DecimalType
                                                          .periodDecimal,
                                                      currency: 'Rp. ',
                                                    ),
                                                    '0',
                                                  ),
                                                  style: GoogleFonts.notoSans(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Color(0xFF259148),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                                height: 30,
                                                width: 1,
                                                color: Color(0xFFE0E3E7)),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Beras',
                                                  style: GoogleFonts.notoSans(
                                                    fontSize: 12,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                  ),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    formatNumber(
                                                      _model.nomSetorZfBeras,
                                                      formatType:
                                                          FormatType.custom,
                                                      format: '###.### Kg',
                                                      locale: 'ID',
                                                    ),
                                                    '0',
                                                  ),
                                                  style: GoogleFonts.notoSans(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Color(0xFF259148),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              wrapWithModel(
                                model: _model.cardSetorZisBerasModel,
                                updateCallback: () => safeSetState(() {}),
                                child: CardSetorZisBerasWidget(
                                  namaZis: 'Zakat Fitrah (Beras)',
                                  nominalSetor: valueOrDefault<double>(
                                    _model.currentZfBeras,
                                    0.0,
                                  ),
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
                                    _model.currentZfBeras =
                                        valueOrDefault<double>(
                                      valueOrDefault<double>(
                                            RekapEndPointGroup.rekapAlokasiCall
                                                .setorZfBeras(
                                              setorZisRekapAlokasiResponse
                                                  .jsonBody,
                                            ),
                                            0.0,
                                          ) -
                                          valueOrDefault<double>(
                                            RekapEndPointGroup.rekapSetorCall
                                                .realisasiSetorZfBeras(
                                              formRekapSetorResponse.jsonBody,
                                            ),
                                            0.0,
                                          ),
                                      0.0,
                                    );
                                    safeSetState(() {});
                                  },
                                ),
                              ),
                              wrapWithModel(
                                model: _model.cardSetorZisModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: CardSetorZisWidget(
                                  namaZis: 'Zakat Fitrah ( Uang ) ',
                                  nominalSetor: valueOrDefault<int>(
                                    _model.currentZf,
                                    0,
                                  ),
                                  updateStateSetor: () async {
                                    _model.nomSetorZf = valueOrDefault<int>(
                                      _model.currentZf,
                                      0,
                                    );
                                    _model.currentZfBeras =
                                        _model.currentZfBeras;
                                    safeSetState(() {});
                                  },
                                  resetSetor: () async {
                                    _model.nomSetorZf = 0;
                                    safeSetState(() {});
                                  },
                                  setCurrentSetor: () async {
                                    _model.currentZf = valueOrDefault<int>(
                                      valueOrDefault<int>(
                                            RekapEndPointGroup.rekapAlokasiCall
                                                .setorZfUang(
                                              setorZisRekapAlokasiResponse
                                                  .jsonBody,
                                            ),
                                            0,
                                          ) -
                                          valueOrDefault<int>(
                                            RekapEndPointGroup.rekapSetorCall
                                                .realisasiSetorZfUang(
                                              formRekapSetorResponse.jsonBody,
                                            ),
                                            0,
                                          ),
                                      0,
                                    );
                                    safeSetState(() {});
                                  },
                                ),
                              ),
                              wrapWithModel(
                                model: _model.cardSetorZisModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: CardSetorZisWidget(
                                  namaZis: 'Infak Sedekah',
                                  nominalSetor: valueOrDefault<int>(
                                    _model.currentIfs,
                                    0,
                                  ),
                                  updateStateSetor: () async {
                                    _model.nomSetorIfs = valueOrDefault<int>(
                                      _model.currentIfs,
                                      0,
                                    );
                                    _model.currentZfBeras =
                                        _model.currentZfBeras;
                                    safeSetState(() {});
                                  },
                                  resetSetor: () async {
                                    _model.nomSetorIfs = 0;
                                    safeSetState(() {});
                                  },
                                  setCurrentSetor: () async {
                                    _model.currentIfs = valueOrDefault<int>(
                                      valueOrDefault<int>(
                                            RekapEndPointGroup.rekapAlokasiCall
                                                .setorIfs(
                                              setorZisRekapAlokasiResponse
                                                  .jsonBody,
                                            ),
                                            0,
                                          ) -
                                          valueOrDefault<int>(
                                            RekapEndPointGroup.rekapSetorCall
                                                .realisasiSetorIfs(
                                              formRekapSetorResponse.jsonBody,
                                            ),
                                            0,
                                          ),
                                      0,
                                    );
                                    safeSetState(() {});
                                  },
                                ),
                              ),
                              wrapWithModel(
                                model: _model.cardSetorZisModel3,
                                updateCallback: () => safeSetState(() {}),
                                child: CardSetorZisWidget(
                                  namaZis: 'Zakat Mal',
                                  nominalSetor: valueOrDefault<int>(
                                    _model.currentZm,
                                    0,
                                  ),
                                  updateStateSetor: () async {
                                    _model.nomSetorZm = valueOrDefault<int>(
                                      _model.currentZm,
                                      0,
                                    );
                                    _model.currentZfBeras =
                                        _model.currentZfBeras;
                                    safeSetState(() {});
                                  },
                                  resetSetor: () async {
                                    _model.nomSetorZm = 0;
                                    safeSetState(() {});
                                  },
                                  setCurrentSetor: () async {
                                    _model.currentZm = valueOrDefault<int>(
                                      valueOrDefault<int>(
                                            RekapEndPointGroup.rekapAlokasiCall
                                                .setorZm(
                                              setorZisRekapAlokasiResponse
                                                  .jsonBody,
                                            ),
                                            0,
                                          ) -
                                          valueOrDefault<int>(
                                            RekapEndPointGroup.rekapSetorCall
                                                .realisasiSetorZm(
                                              formRekapSetorResponse.jsonBody,
                                            ),
                                            0,
                                          ),
                                      0,
                                    );
                                    safeSetState(() {});
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: InkWell(
                                  onTap: () async {
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      storageFolderPath: 'bukti_setor',
                                      maxHeight: 800.00,
                                      imageQuality: 80,
                                      allowPhoto: true,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      textColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      safeSetState(() =>
                                          _model.isDataUploading_uploadDataF1e =
                                              true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];
                                      var downloadUrls = <String>[];
                                      try {
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                  originalFilename:
                                                      m.originalFilename,
                                                ))
                                            .toList();
                                        downloadUrls =
                                            await uploadBuktiTransferToCloudinary(
                                          selectedFiles: selectedMedia,
                                        );
                                      } finally {
                                        _model.isDataUploading_uploadDataF1e =
                                            false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        safeSetState(() {
                                          _model.uploadedLocalFile_uploadDataF1e =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl_uploadDataF1e =
                                              downloadUrls.first;
                                        });
                                      } else {
                                        safeSetState(() {});
                                        return;
                                      }
                                    }
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Upload Bukti Setor Berhasil',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    constraints: BoxConstraints(minHeight: 100),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color:
                                            Color(0xFF259148).withOpacity(0.5),
                                        width: 2,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    child: _model.uploadedFileUrl_uploadDataF1e
                                            .isNotEmpty
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.check_circle,
                                                  color: Color(0xFF259148),
                                                  size: 40),
                                              SizedBox(height: 8),
                                              Text(
                                                'Bukti Setor Terupload',
                                                style: TextStyle(
                                                  color: Color(0xFF259148),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                _model.uploadedLocalFile_uploadDataF1e
                                                        .name ??
                                                    '',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          )
                                        : Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.cloud_upload_outlined,
                                                  color: Color(0xFF259148),
                                                  size: 40),
                                              SizedBox(height: 8),
                                              Text(
                                                'Tap untuk upload bukti setor',
                                                style: TextStyle(
                                                  color: Color(0xFF259148),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                'Format: JPG, PNG',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 56.0,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF259148),
                                        Color(0xFF1B6A34)
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: AlignmentDirectional(0.0, -1.0),
                                      end: AlignmentDirectional(0, 1.0),
                                    ),
                                    borderRadius: BorderRadius.circular(28.0),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                  ),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if ((_model.nomSetorZf == 0) &&
                                          (_model.nomSetorZm == 0) &&
                                          (_model.nomSetorIfs == 0) &&
                                          (_model.nomSetorZfBeras == 0.0)) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Tidak ada dana yang disetor',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                          ),
                                        );
                                      } else {
                                        if (_model.formKey.currentState ==
                                                null ||
                                            !_model.formKey.currentState!
                                                .validate()) {
                                          return;
                                        }
                                        if (_model.datePickerModel.datePicked ==
                                            null) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Tanggal belum dipilih',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                          );
                                          return;
                                        }
                                        if (_model.uploadedFileUrl_uploadDataF1e
                                            .isEmpty) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Harus upload bukti setor',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                          );
                                          return;
                                        }
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text('Konfirmasi'),
                                                      content: Text(
                                                          'Anda menyetorkan ${valueOrDefault<String>(
                                                        formatNumber(
                                                          _model.nomSetorZf +
                                                              _model
                                                                  .nomSetorZm +
                                                              _model
                                                                  .nomSetorIfs,
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'Rp. ',
                                                          format: '###,###',
                                                          locale: 'id_ID',
                                                        ),
                                                        '0',
                                                      )} Uang & ${valueOrDefault<String>(
                                                        formatNumber(
                                                          _model
                                                              .nomSetorZfBeras,
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '##.## Kg',
                                                          locale: 'id_ID',
                                                        ),
                                                        '0',
                                                      )} Beras, apakah ingin diproses?'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  false),
                                                          child: Text('Batal',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey)),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child: Text('Setor',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFF259148),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          await TransactionEndPointGroup
                                              .addSetorZISCall
                                              .call(
                                            token: currentAuthenticationToken,
                                            unitId: FFAppState().profileUPZ.id,
                                            trxDate: _model
                                                .datePickerModel.datePicked
                                                ?.toString(),
                                            zfAmountDeposit: _model.nomSetorZf,
                                            zfRiceDeposit:
                                                _model.nomSetorZfBeras,
                                            zmAmountDeposit: _model.nomSetorZm,
                                            ifsAmountDeposit:
                                                _model.nomSetorIfs,
                                            totalDeposit: valueOrDefault<int>(
                                              _model.nomSetorZf +
                                                  _model.nomSetorZm +
                                                  _model.nomSetorIfs,
                                              0,
                                            ),
                                            status: 'Tunai',
                                            validation: 'Belum Valid',
                                            upload: _model
                                                .uploadedFileUrl_uploadDataF1e,
                                          );
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'Setor Dana ZIS Berhasil',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  Color(0xFF259148),
                                            ),
                                          );
                                          _model.nomSetorIfs = 0;
                                          _model.nomSetorZm = 0;
                                          _model.nomSetorZf = 0;
                                          _model.nomSetorZfBeras = 0.0;
                                          _model.currentIfs = 0;
                                          _model.currentZm = 0;
                                          _model.currentZf = 0;
                                          _model.currentZfBeras = 0.0;
                                          safeSetState(() {});
                                          context.goNamed(
                                            HomeWidget.routeName,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .leftToRight,
                                              ),
                                            },
                                          );
                                        }
                                      }
                                    },
                                    text: 'Setor Dana',
                                    icon: Icon(
                                      Icons.play_for_work_rounded,
                                      size: 24.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 56.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Colors.transparent,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.notoSans(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,
                                            ),
                                            color: Colors.white,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 0.0,
                                      ),
                                      borderRadius: BorderRadius.circular(28.0),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: Text(
                                  'Rekapitulasi Setor ZIS',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSans(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              FutureBuilder<ApiCallResponse>(
                                future: TransactionEndPointGroup.getSetorZISCall
                                    .call(
                                  token: currentAuthenticationToken,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: ModernColors.primaryAccent,
                                      ),
                                    );
                                  }
                                  final listViewGetSetorZISResponse =
                                      snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                      final listSetorZis =
                                          TransactionEndPointGroup
                                                  .getSetorZISCall
                                                  .listDataSetor(
                                                    listViewGetSetorZISResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toList() ??
                                              [];

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: listSetorZis.length,
                                        itemBuilder:
                                            (context, listSetorZisIndex) {
                                          final listSetorZisItem =
                                              listSetorZis[listSetorZisIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 8.0, 8.0, 8.0),
                                            child: Container(
                                              width: 100.0,
                                              height: 344.57,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '#${DataSetorStruct.maybeFromMap(listSetorZisItem)?.id.toString()}/ ${DataSetorStruct.maybeFromMap(listSetorZisItem)?.trxDate}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .notoSans(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Setor Zakat Fitrah (Beras)',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSans(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      Text(
                                                        formatNumber(
                                                          DataSetorStruct
                                                                  .maybeFromMap(
                                                                      listSetorZisItem)!
                                                              .zfRiceDeposit,
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '###.### Kg',
                                                          locale: 'ID',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSans(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Setor Zakat Fitrah (Uang)',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSans(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      Text(
                                                        formatNumber(
                                                          DataSetorStruct
                                                                  .maybeFromMap(
                                                                      listSetorZisItem)!
                                                              .zfAmountDeposit,
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'Rp ',
                                                          format: '###,###',
                                                          locale: 'ID',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSans(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Setor Zakat Mal',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSans(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      Text(
                                                        formatNumber(
                                                          DataSetorStruct
                                                                  .maybeFromMap(
                                                                      listSetorZisItem)!
                                                              .zmAmountDeposit,
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'Rp ',
                                                          format: '###,###',
                                                          locale: 'ID',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSans(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Setor Infak',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSans(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      Text(
                                                        formatNumber(
                                                          DataSetorStruct
                                                                  .maybeFromMap(
                                                                      listSetorZisItem)!
                                                              .ifsAmountDeposit,
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'Rp ',
                                                          format: '###,###',
                                                          locale: 'ID',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSans(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        DataSetorStruct
                                                                .maybeFromMap(
                                                                    listSetorZisItem)!
                                                            .upload,
                                                        width: 171.07,
                                                        height: 207.7,
                                                        fit: BoxFit.scaleDown,
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 8.0)),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
