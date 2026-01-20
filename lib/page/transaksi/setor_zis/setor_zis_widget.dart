import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/component/card_setor_zis/card_setor_zis_widget.dart';
import '/component/card_setor_zis_beras/card_setor_zis_beras_widget.dart';
import '/component/date_picker/date_picker_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/backend/schema/structs/index.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'setor_zis_model.dart';
export 'setor_zis_model.dart';

class SetorZisWidget extends StatefulWidget {
  const SetorZisWidget({super.key});

  static String routeName = 'SetorZis';
  static String routePath = '/setorZis';

  @override
  State<SetorZisWidget> createState() => _SetorZisWidgetState();
}

class _SetorZisWidgetState extends State<SetorZisWidget> {
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
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitFadingFour(
                  color: Color(0xFF259148),
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        final setorZisRekapAlokasiResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: responsiveVisibility(
              context: context,
              desktop: false,
            )
                ? AppBar(
                    backgroundColor: Color(0xFF259148),
                    automaticallyImplyLeading: false,
                    leading: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 48.0,
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 20.0,
                      ),
                      onPressed: () async {
                        context.pop();
                      },
                    ),
                    title: Text(
                      'Setor ZIS',
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            font: GoogleFonts.notoSans(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                            ),
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                    ),
                    actions: [],
                    centerTitle: false,
                    elevation: 2.0,
                  )
                : null,
            body: SafeArea(
              top: true,
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
                      child: SizedBox(
                        width: 40.0,
                        height: 40.0,
                        child: SpinKitFadingFour(
                          color: Color(0xFF259148),
                          size: 40.0,
                        ),
                      ),
                    );
                  }
                  final formRekapSetorResponse = snapshot.data!;

                  return Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 40.0),
                      child: SingleChildScrollView(
                        primary: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: Text(
                                'Dana ZIS Yang Harus Disetor ke BAZNAS',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.notoSans(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.datePickerModel,
                                updateCallback: () => safeSetState(() {}),
                                child: DatePickerWidget(),
                              ),
                            ),
                            Container(
                              width: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Text(
                                  '${valueOrDefault<String>(
                                    formatNumber(
                                      _model.nomSetorZf +
                                          _model.nomSetorZm +
                                          _model.nomSetorIfs,
                                      formatType: FormatType.decimal,
                                      decimalType: DecimalType.periodDecimal,
                                      currency: 'Rp. ',
                                    ),
                                    '0',
                                  )}${_model.currentZfBeras! > 0.0 ? valueOrDefault<String>(
                                      ' & ${valueOrDefault<String>(
                                        formatNumber(
                                          _model.nomSetorZfBeras,
                                          formatType: FormatType.custom,
                                          format: '###.### Kg',
                                          locale: 'ID',
                                        ),
                                        '0',
                                      )}',
                                      '0',
                                    ) : ''}',
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
                                        color: Color(0xFF259148),
                                        fontSize: 22.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
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
                                  _model.currentZfBeras = _model.currentZfBeras;
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
                                  _model.currentZfBeras = _model.currentZfBeras;
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
                                  _model.currentZfBeras = _model.currentZfBeras;
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
                              child: FFButtonWidget(
                                onPressed: () async {
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    storageFolderPath: 'bukti_setor',
                                    maxHeight: 800.00,
                                    imageQuality: 80,
                                    allowPhoto: true,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                    textColor:
                                        FlutterFlowTheme.of(context).alternate,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    safeSetState(() => _model
                                        .isDataUploading_uploadDataF1e = true);
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
                                          await uploadSupabaseStorageFiles(
                                        bucketName: 'sisfo',
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
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              font: GoogleFonts.notoSans(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontStyle,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  );
                                },
                                text: 'Upload Bukti Setor',
                                icon: Icon(
                                  Icons.image_outlined,
                                  size: 32.0,
                                ),
                                options: FFButtonOptions(
                                  height: 56.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.notoSans(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                  borderSide: BorderSide(
                                    color: Color(0xFF259148),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if ((_model.nomSetorZf == 0) &&
                                      (_model.nomSetorZm == 0) &&
                                      (_model.nomSetorIfs == 0) &&
                                      (_model.nomSetorZfBeras == 0.0)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Tidak ada dana yang disetor',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.notoSans(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                  } else {
                                    if (_model.formKey.currentState == null ||
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
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  font: GoogleFonts.notoSans(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
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
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  font: GoogleFonts.notoSans(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
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
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Konfimasi'),
                                                  content: Text(
                                                      'Anda menyetorkan ${valueOrDefault<String>(
                                                    formatNumber(
                                                      _model.nomSetorZf +
                                                          _model.nomSetorZm +
                                                          _model.nomSetorIfs,
                                                      formatType:
                                                          FormatType.custom,
                                                      currency: 'Rp. ',
                                                      format: '###,###',
                                                      locale: 'id_ID',
                                                    ),
                                                    '0',
                                                  )} Uang & ${valueOrDefault<String>(
                                                    formatNumber(
                                                      _model.nomSetorZfBeras,
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
                                                      child: Text('Batal'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Setor'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ) ??
                                            false;
                                    await TransactionEndPointGroup
                                        .addSetorZISCall
                                        .call(
                                      token: currentAuthenticationToken,
                                      unitId: FFAppState().profileUPZ.id,
                                      trxDate: _model.datePickerModel.datePicked
                                          ?.toString(),
                                      zfAmountDeposit: _model.nomSetorZf,
                                      zfRiceDeposit: _model.nomSetorZfBeras,
                                      zmAmountDeposit: _model.nomSetorZm,
                                      ifsAmountDeposit: _model.nomSetorIfs,
                                      totalDeposit: valueOrDefault<int>(
                                        _model.nomSetorZf +
                                            _model.nomSetorZm +
                                            _model.nomSetorIfs,
                                        0,
                                      ),
                                      status: 'Tunai',
                                      validation: 'Belum Valid',
                                      upload:
                                          _model.uploadedFileUrl_uploadDataF1e,
                                    );

                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Setor Dana ZIS Berhasil',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.notoSans(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor: Color(0xFF259148),
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
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.leftToRight,
                                        ),
                                      },
                                    );
                                  }
                                },
                                text: 'Setor Dana',
                                icon: Icon(
                                  Icons.play_for_work_rounded,
                                  size: 32.0,
                                ),
                                options: FFButtonOptions(
                                  height: 48.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.notoSans(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
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
                                        fontStyle: FlutterFlowTheme.of(context)
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
                              future:
                                  TransactionEndPointGroup.getSetorZISCall.call(
                                token: currentAuthenticationToken,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 40.0,
                                      height: 40.0,
                                      child: SpinKitFadingFour(
                                        color: Color(0xFF259148),
                                        size: 40.0,
                                      ),
                                    ),
                                  );
                                }
                                final listViewGetSetorZISResponse =
                                    snapshot.data!;

                                return Builder(
                                  builder: (context) {
                                    final listSetorZis =
                                        TransactionEndPointGroup.getSetorZISCall
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
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .notoSans(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
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
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .notoSans(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
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
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .notoSans(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
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
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .notoSans(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
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
                                                      DataSetorStruct.maybeFromMap(
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
        );
      },
    );
  }
}
