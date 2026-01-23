import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'laporan_model.dart';
export 'laporan_model.dart';

// Modern styling constants for Laporan page
// Requirements: 7.1, 7.2, 7.3, 10.1, 10.2, 10.3

class LaporanWidget extends StatefulWidget {
  const LaporanWidget({super.key});

  static String routeName = 'Laporan';
  static String routePath = '/laporan';

  @override
  State<LaporanWidget> createState() => _LaporanWidgetState();
}

class _LaporanWidgetState extends State<LaporanWidget> {
  late LaporanModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LaporanModel());

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
        token: currentAuthenticationToken,
        unitId: FFAppState().profileUPZ.id.toString(),
        periode: 'tahunan',
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: ModernColors.backgroundPrimary,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitFadingFour(
                  color: ModernColors.primaryAccent,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        final laporanRekapAlokasiResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: ModernColors.backgroundPrimary,
            appBar: responsiveVisibility(
              context: context,
              desktop: false,
            )
                ? AppBar(
                    backgroundColor: ModernColors.primaryDark,
                    automaticallyImplyLeading: false,
                    title: Text(
                      'Laporan',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                    actions: [],
                    centerTitle: true,
                    elevation: 0.0,
                  )
                : null,
            body: SafeArea(
              top: true,
              child: FutureBuilder<ApiCallResponse>(
                future: RekapEndPointGroup.rekapZISCall.call(
                  period: 'tahunan',
                  unitId: FFAppState().profileUPZ.id.toString(),
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
                          color: ModernColors.primaryAccent,
                          size: 40.0,
                        ),
                      ),
                    );
                  }
                  final rekapZisWrapperRekapZISResponse = snapshot.data!;

                  return Container(
                    decoration: BoxDecoration(),
                    child: FutureBuilder<ApiCallResponse>(
                      future: RekapEndPointGroup.rekapPendisCall.call(
                        token: currentAuthenticationToken,
                        unitId: FFAppState().profileUPZ.id,
                        periode: 'tahunan',
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 40.0,
                              height: 40.0,
                              child: SpinKitFadingFour(
                                color: ModernColors.primaryAccent,
                                size: 40.0,
                              ),
                            ),
                          );
                        }
                        final rekapPendisWrapperRekapPendisResponse =
                            snapshot.data!;

                        return Container(
                          decoration: BoxDecoration(),
                          child: FutureBuilder<ApiCallResponse>(
                            future: RekapEndPointGroup.rekapHakAmilCall.call(
                              token: currentAuthenticationToken,
                              unitId: FFAppState().profileUPZ.id,
                              periode: 'tahunan',
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 40.0,
                                    height: 40.0,
                                    child: SpinKitFadingFour(
                                      color: ModernColors.primaryAccent,
                                      size: 40.0,
                                    ),
                                  ),
                                );
                              }
                              final rekapHakAmilWraperRekapHakAmilResponse =
                                  snapshot.data!;

                              return Container(
                                decoration: BoxDecoration(),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            ModernSpacing.md,
                                            0.0,
                                            ModernSpacing.md,
                                            0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      ModernSpacing.lg,
                                                      ModernSpacing.sm,
                                                      ModernSpacing.lg,
                                                      ModernSpacing.xl),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await actions.saveToPdf(
                                                    FFAppState()
                                                        .profileUPZ
                                                        .unitName,
                                                    FFAppState()
                                                        .profileUPZ
                                                        .noRegister,
                                                    FFAppState()
                                                        .profileUPZ
                                                        .address,
                                                    FFAppState()
                                                        .profileUPZ
                                                        .villageName,
                                                    FFAppState()
                                                        .profileUPZ
                                                        .districtName,
                                                    '${valueOrDefault<String>(
                                                      formatNumber(
                                                        RekapEndPointGroup
                                                            .rekapZISCall
                                                            .totalZfAmount(
                                                          rekapZisWrapperRekapZISResponse
                                                              .jsonBody,
                                                        ),
                                                        formatType:
                                                            FormatType.custom,
                                                        currency: 'Rp ',
                                                        format: '###,###',
                                                        locale: 'ID',
                                                      ),
                                                      '0',
                                                    )} | ${valueOrDefault<String>(
                                                      formatNumber(
                                                        RekapEndPointGroup
                                                            .rekapZISCall
                                                            .totalZfRice(
                                                          rekapZisWrapperRekapZISResponse
                                                              .jsonBody,
                                                        ),
                                                        formatType:
                                                            FormatType.custom,
                                                        format: '##.## Kg',
                                                        locale: 'ID',
                                                      ),
                                                      '0',
                                                    )}',
                                                    valueOrDefault<String>(
                                                      RekapEndPointGroup
                                                          .rekapZISCall
                                                          .totalZfMuzakki(
                                                            rekapZisWrapperRekapZISResponse
                                                                .jsonBody,
                                                          )
                                                          ?.toString(),
                                                      '0',
                                                    ),
                                                    valueOrDefault<String>(
                                                      formatNumber(
                                                        RekapEndPointGroup
                                                            .rekapZISCall
                                                            .totalZmAmount(
                                                          rekapZisWrapperRekapZISResponse
                                                              .jsonBody,
                                                        ),
                                                        formatType:
                                                            FormatType.custom,
                                                        currency: 'Rp ',
                                                        format: '###,###',
                                                        locale: 'ID',
                                                      ),
                                                      '0',
                                                    ),
                                                    RekapEndPointGroup
                                                        .rekapZISCall
                                                        .totalZmMuzakki(
                                                          rekapZisWrapperRekapZISResponse
                                                              .jsonBody,
                                                        )
                                                        ?.toString(),
                                                    valueOrDefault<String>(
                                                      formatNumber(
                                                        RekapEndPointGroup
                                                            .rekapZISCall
                                                            .totalIfsAmount(
                                                          rekapZisWrapperRekapZISResponse
                                                              .jsonBody,
                                                        ),
                                                        formatType:
                                                            FormatType.custom,
                                                        currency: 'Rp ',
                                                        format: '###,###',
                                                        locale: 'ID',
                                                      ),
                                                      '0',
                                                    ),
                                                    valueOrDefault<String>(
                                                      RekapEndPointGroup
                                                          .rekapZISCall
                                                          .totalIfsMunfiq(
                                                            rekapZisWrapperRekapZISResponse
                                                                .jsonBody,
                                                          )
                                                          ?.toString(),
                                                      '0',
                                                    ),
                                                    RekapEndPointGroup
                                                        .rekapPendisCall
                                                        .totalPenerimaManfaat(
                                                          rekapPendisWrapperRekapPendisResponse
                                                              .jsonBody,
                                                        )
                                                        ?.toString(),
                                                    RekapEndPointGroup
                                                        .rekapPendisCall
                                                        .totalPenerimaManfaat(
                                                          rekapPendisWrapperRekapPendisResponse
                                                              .jsonBody,
                                                        )
                                                        ?.toString(),
                                                    RekapEndPointGroup
                                                        .rekapPendisCall
                                                        .totalPenerimaManfaat(
                                                          rekapPendisWrapperRekapPendisResponse
                                                              .jsonBody,
                                                        )
                                                        ?.toString(),
                                                    RekapEndPointGroup
                                                        .rekapHakAmilCall
                                                        .totalPm(
                                                          rekapHakAmilWraperRekapHakAmilResponse
                                                              .jsonBody,
                                                        )
                                                        ?.toString(),
                                                    RekapEndPointGroup
                                                        .rekapHakAmilCall
                                                        .totalPm(
                                                          rekapHakAmilWraperRekapHakAmilResponse
                                                              .jsonBody,
                                                        )
                                                        ?.toString(),
                                                    RekapEndPointGroup
                                                        .rekapHakAmilCall
                                                        .totalPm(
                                                          rekapHakAmilWraperRekapHakAmilResponse
                                                              .jsonBody,
                                                        )
                                                        ?.toString(),
                                                    valueOrDefault<String>(
                                                      '${valueOrDefault<String>(
                                                        formatNumber(
                                                          RekapEndPointGroup
                                                              .rekapPendisCall
                                                              .totalPendisZfUang(
                                                            rekapPendisWrapperRekapPendisResponse
                                                                .jsonBody,
                                                          ),
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'Rp ',
                                                          format: '###,###',
                                                          locale: 'ID',
                                                        ),
                                                        '0',
                                                      )} | ${valueOrDefault<String>(
                                                        formatNumber(
                                                          RekapEndPointGroup
                                                              .rekapPendisCall
                                                              .totalPendisZfBeras(
                                                            rekapPendisWrapperRekapPendisResponse
                                                                .jsonBody,
                                                          ),
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '##.## Kg',
                                                          locale: 'ID',
                                                        ),
                                                        '0',
                                                      )}',
                                                      '0',
                                                    ),
                                                    valueOrDefault<String>(
                                                      formatNumber(
                                                        RekapEndPointGroup
                                                            .rekapPendisCall
                                                            .totalPendisZm(
                                                          rekapPendisWrapperRekapPendisResponse
                                                              .jsonBody,
                                                        ),
                                                        formatType:
                                                            FormatType.custom,
                                                        currency: 'Rp ',
                                                        format: '###,###',
                                                        locale: 'ID',
                                                      ),
                                                      '0',
                                                    ),
                                                    valueOrDefault<String>(
                                                      formatNumber(
                                                        RekapEndPointGroup
                                                            .rekapPendisCall
                                                            .totalPendisIfs(
                                                          rekapPendisWrapperRekapPendisResponse
                                                              .jsonBody,
                                                        ),
                                                        formatType:
                                                            FormatType.custom,
                                                        currency: 'Rp ',
                                                        format: '###,###',
                                                        locale: 'ID',
                                                      ),
                                                      '0',
                                                    ),
                                                    '${valueOrDefault<String>(
                                                      formatNumber(
                                                        RekapEndPointGroup
                                                            .rekapAlokasiCall
                                                            .setorZfUang(
                                                          laporanRekapAlokasiResponse
                                                              .jsonBody,
                                                        ),
                                                        formatType:
                                                            FormatType.custom,
                                                        currency: 'Rp ',
                                                        format: '###,###',
                                                        locale: 'ID',
                                                      ),
                                                      '0',
                                                    )} | ${valueOrDefault<String>(
                                                      formatNumber(
                                                        RekapEndPointGroup
                                                            .rekapAlokasiCall
                                                            .setorZfBeras(
                                                          laporanRekapAlokasiResponse
                                                              .jsonBody,
                                                        ),
                                                        formatType:
                                                            FormatType.custom,
                                                        format: '##.## Kg',
                                                        locale: 'ID',
                                                      ),
                                                      '0',
                                                    )}',
                                                    valueOrDefault<String>(
                                                      formatNumber(
                                                        RekapEndPointGroup
                                                            .rekapAlokasiCall
                                                            .setorZm(
                                                          laporanRekapAlokasiResponse
                                                              .jsonBody,
                                                        ),
                                                        formatType:
                                                            FormatType.custom,
                                                        currency: 'Rp ',
                                                        format: '###,###',
                                                        locale: 'ID',
                                                      ),
                                                      '0',
                                                    ),
                                                    valueOrDefault<String>(
                                                      formatNumber(
                                                        RekapEndPointGroup
                                                            .rekapAlokasiCall
                                                            .setorIfs(
                                                          laporanRekapAlokasiResponse
                                                              .jsonBody,
                                                        ),
                                                        formatType:
                                                            FormatType.custom,
                                                        currency: 'Rp ',
                                                        format: '###,###',
                                                        locale: 'ID',
                                                      ),
                                                      '0',
                                                    ),
                                                    () {
                                                      if (FFAppState()
                                                              .profileUPZ
                                                              .categoryId ==
                                                          4) {
                                                        return 'Ketua DKM';
                                                      } else if (FFAppState()
                                                              .profileUPZ
                                                              .categoryId ==
                                                          3) {
                                                        return 'Kepala Desa';
                                                      } else {
                                                        return 'Camat';
                                                      }
                                                    }(),
                                                    FFAppState()
                                                        .profileUPZ
                                                        .unitLeader,
                                                    FFAppState()
                                                        .profileUPZ
                                                        .unitAssistant,
                                                    FFAppState()
                                                        .profileUPZ
                                                        .unitFinance,
                                                  );
                                                },
                                                text: 'Cetak Laporan',
                                                icon: Icon(
                                                  Icons.picture_as_pdf_outlined,
                                                  size: 15.0,
                                                ),
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 52.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          ModernSpacing.lg,
                                                          0.0,
                                                          ModernSpacing.lg,
                                                          0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color:
                                                      ModernColors.primaryDark,
                                                  textStyle: GoogleFonts.inter(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14.0,
                                                  ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          ModernRadius.md),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0,
                                                      ModernSpacing.md,
                                                      0.0,
                                                      0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        ModernRadius.sm),
                                                child: Image.asset(
                                                  Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? 'assets/images/logo_baznas_putih.png'
                                                      : 'assets/images/logo_BAZNAS_CIANJUR.png',
                                                  width: 125.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0,
                                                      ModernSpacing.md,
                                                      0.0,
                                                      0.0),
                                              child: Text(
                                                'LAPORAN PENGELOLAAN ZIS',
                                                style: GoogleFonts.inter(
                                                  color:
                                                      ModernColors.textPrimary,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0,
                                                      ModernSpacing.xs,
                                                      0.0,
                                                      0.0),
                                              child: Text(
                                                'UPZ ${FFAppState().profileUPZ.unitName}',
                                                style: GoogleFonts.inter(
                                                  color:
                                                      ModernColors.textPrimary,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0,
                                                      ModernSpacing.xs,
                                                      0.0,
                                                      ModernSpacing.xs),
                                              child: Text(
                                                FFAppState()
                                                    .profileUPZ
                                                    .noRegister,
                                                style: GoogleFonts.inter(
                                                  color: ModernColors
                                                      .textSecondary,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                            ),
                                            Divider(
                                              thickness: 1.0,
                                              color: ModernColors
                                                  .backgroundPrimary,
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0,
                                                        ModernSpacing.sm,
                                                        0.0,
                                                        0.0),
                                                child: Text(
                                                  'TOTAL PENERIMAAN DAN PENYALURAN ZIS',
                                                  style: GoogleFonts.inter(
                                                    color: ModernColors
                                                        .textPrimary,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0,
                                                      ModernSpacing.xs,
                                                      0.0,
                                                      0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      'Total Penerimaan Uang',
                                                      style: GoogleFonts.inter(
                                                        color: ModernColors
                                                            .textPrimary,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 14.0,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        formatNumber(
                                                          valueOrDefault<int>(
                                                                RekapEndPointGroup
                                                                    .rekapZISCall
                                                                    .totalZfAmount(
                                                                  rekapZisWrapperRekapZISResponse
                                                                      .jsonBody,
                                                                ),
                                                                0,
                                                              ) +
                                                              valueOrDefault<
                                                                  int>(
                                                                RekapEndPointGroup
                                                                    .rekapZISCall
                                                                    .totalZmAmount(
                                                                  rekapZisWrapperRekapZISResponse
                                                                      .jsonBody,
                                                                ),
                                                                0,
                                                              ) +
                                                              valueOrDefault<
                                                                  int>(
                                                                RekapEndPointGroup
                                                                    .rekapZISCall
                                                                    .totalIfsAmount(
                                                                  rekapZisWrapperRekapZISResponse
                                                                      .jsonBody,
                                                                ),
                                                                0,
                                                              ),
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'Rp ',
                                                          format: '###,###',
                                                          locale: 'ID',
                                                        ),
                                                        '0',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: GoogleFonts.inter(
                                                        color: ModernColors
                                                            .primaryAccent,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14.0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      'Total Penerimaan Beras',
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
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        formatNumber(
                                                          RekapEndPointGroup
                                                              .rekapZISCall
                                                              .totalZfRice(
                                                            rekapZisWrapperRekapZISResponse
                                                                .jsonBody,
                                                          ),
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '##.## Kg',
                                                          locale: 'ID',
                                                        ),
                                                        '0',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .lato(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xFF259148),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      'Total Penyaluran Uang',
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
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        formatNumber(
                                                          valueOrDefault<int>(
                                                                RekapEndPointGroup
                                                                    .rekapPendisCall
                                                                    .totalPendisZfUang(
                                                                  rekapPendisWrapperRekapPendisResponse
                                                                      .jsonBody,
                                                                ),
                                                                0,
                                                              ) +
                                                              valueOrDefault<
                                                                  int>(
                                                                RekapEndPointGroup
                                                                    .rekapPendisCall
                                                                    .totalPendisZm(
                                                                  rekapPendisWrapperRekapPendisResponse
                                                                      .jsonBody,
                                                                ),
                                                                0,
                                                              ) +
                                                              valueOrDefault<
                                                                  int>(
                                                                RekapEndPointGroup
                                                                    .rekapPendisCall
                                                                    .totalPendisIfs(
                                                                  rekapPendisWrapperRekapPendisResponse
                                                                      .jsonBody,
                                                                ),
                                                                0,
                                                              ),
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'Rp ',
                                                          format: '###,###',
                                                          locale: 'ID',
                                                        ),
                                                        '0',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .lato(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xFF259148),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      'Total Penyaluran Beras',
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
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        formatNumber(
                                                          RekapEndPointGroup
                                                              .rekapPendisCall
                                                              .totalPendisZfBeras(
                                                            rekapPendisWrapperRekapPendisResponse
                                                                .jsonBody,
                                                          ),
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '##.## Kg',
                                                          locale: 'ID',
                                                        ),
                                                        '0',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .lato(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xFF259148),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      'Total Muzakki',
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
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        (valueOrDefault<int>(
                                                                  RekapEndPointGroup
                                                                      .rekapZISCall
                                                                      .totalZfMuzakki(
                                                                    rekapZisWrapperRekapZISResponse
                                                                        .jsonBody,
                                                                  ),
                                                                  0,
                                                                ) +
                                                                valueOrDefault<
                                                                    int>(
                                                                  RekapEndPointGroup
                                                                      .rekapZISCall
                                                                      .totalZmMuzakki(
                                                                    rekapZisWrapperRekapZISResponse
                                                                        .jsonBody,
                                                                  ),
                                                                  0,
                                                                ))
                                                            .toString(),
                                                        '0',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .lato(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xFF259148),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      'Total Mustahik',
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
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        RekapEndPointGroup
                                                            .rekapPendisCall
                                                            .totalPenerimaManfaat(
                                                              rekapPendisWrapperRekapPendisResponse
                                                                  .jsonBody,
                                                            )
                                                            ?.toString(),
                                                        '0',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .lato(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xFF259148),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Text(
                                                  'RINCIAN PENERIMAAN ZIS',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSans(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Text(
                                                  'Zakat Fitrah',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSans(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: ModernColors
                                                            .primaryAccent,
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
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      'Total Penerimaan Uang',
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
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        formatNumber(
                                                          RekapEndPointGroup
                                                              .rekapZISCall
                                                              .totalZfAmount(
                                                            rekapZisWrapperRekapZISResponse
                                                                .jsonBody,
                                                          ),
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'Rp ',
                                                          format: '###,###',
                                                          locale: 'ID',
                                                        ),
                                                        '0',
                                                      ),
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
                                                            color: Color(
                                                                0xFF259148),
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      'Total Penerimaan Beras',
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
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        formatNumber(
                                                          RekapEndPointGroup
                                                              .rekapZISCall
                                                              .totalZfRice(
                                                            rekapZisWrapperRekapZISResponse
                                                                .jsonBody,
                                                          ),
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '##.## Kg',
                                                          locale: 'ID',
                                                        ),
                                                        '0',
                                                      ),
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
                                                            color: Color(
                                                                0xFF259148),
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      'Jumlah Muzakki',
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
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        RekapEndPointGroup
                                                            .rekapZISCall
                                                            .totalZfMuzakki(
                                                              rekapZisWrapperRekapZISResponse
                                                                  .jsonBody,
                                                            )
                                                            ?.toString(),
                                                        '0',
                                                      ),
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
                                                            color: Color(
                                                                0xFF259148),
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Text(
                                                  'Zakat Mal',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSans(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: ModernColors
                                                            .primaryAccent,
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
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      'Total Penerimaan',
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
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        formatNumber(
                                                          RekapEndPointGroup
                                                              .rekapZISCall
                                                              .totalZmAmount(
                                                            rekapZisWrapperRekapZISResponse
                                                                .jsonBody,
                                                          ),
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'Rp ',
                                                          format: '###,###',
                                                          locale: 'ID',
                                                        ),
                                                        '0',
                                                      ),
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
                                                            color: Color(
                                                                0xFF259148),
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      'Jumlah Muzakki',
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
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        RekapEndPointGroup
                                                            .rekapZISCall
                                                            .totalZmMuzakki(
                                                              rekapZisWrapperRekapZISResponse
                                                                  .jsonBody,
                                                            )
                                                            ?.toString(),
                                                        '0',
                                                      ),
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
                                                            color: Color(
                                                                0xFF259148),
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Text(
                                                  'Infak Sedekah',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSans(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: ModernColors
                                                            .primaryAccent,
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
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      'Total Penerimaan',
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
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        formatNumber(
                                                          RekapEndPointGroup
                                                              .rekapZISCall
                                                              .totalIfsAmount(
                                                            rekapZisWrapperRekapZISResponse
                                                                .jsonBody,
                                                          ),
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'Rp ',
                                                          format: '###,###',
                                                          locale: 'ID',
                                                        ),
                                                        '0',
                                                      ),
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
                                                            color: Color(
                                                                0xFF259148),
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      'Jumlah Munfiq',
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
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        RekapEndPointGroup
                                                            .rekapZISCall
                                                            .totalIfsMunfiq(
                                                              rekapZisWrapperRekapZISResponse
                                                                  .jsonBody,
                                                            )
                                                            ?.toString(),
                                                        '0',
                                                      ),
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
                                                            color: Color(
                                                                0xFF259148),
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            ModernSpacing.md,
                                            0.0,
                                            ModernSpacing.md,
                                            ModernSpacing.sm),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0,
                                                        ModernSpacing.sm,
                                                        0.0,
                                                        0.0),
                                                child: Text(
                                                  'RINCIAN PENYALURAN',
                                                  style: GoogleFonts.inter(
                                                    color: ModernColors
                                                        .textPrimary,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Text(
                                                  'Berdasarkan Sumber Dana ( Uang | Beras )',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSans(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: ModernColors
                                                            .primaryAccent,
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
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      'Zakat Fitrah',
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
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      '${valueOrDefault<String>(
                                                        formatNumber(
                                                          RekapEndPointGroup
                                                              .rekapPendisCall
                                                              .totalPendisZfUang(
                                                            rekapPendisWrapperRekapPendisResponse
                                                                .jsonBody,
                                                          ),
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'Rp ',
                                                          format: '###,###',
                                                          locale: 'ID',
                                                        ),
                                                        '0',
                                                      )} | ${valueOrDefault<String>(
                                                        formatNumber(
                                                          RekapEndPointGroup
                                                              .rekapPendisCall
                                                              .totalPendisZfBeras(
                                                            rekapPendisWrapperRekapPendisResponse
                                                                .jsonBody,
                                                          ),
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '##.## Kg',
                                                          locale: 'ID',
                                                        ),
                                                        '0',
                                                      )}',
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
                                                            color: Color(
                                                                0xFF259148),
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      'Zakat Mal',
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
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        formatNumber(
                                                          RekapEndPointGroup
                                                              .rekapPendisCall
                                                              .totalPendisZm(
                                                            rekapPendisWrapperRekapPendisResponse
                                                                .jsonBody,
                                                          ),
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'Rp ',
                                                          format: '###,###',
                                                          locale: 'ID',
                                                        ),
                                                        '0',
                                                      ),
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
                                                            color: Color(
                                                                0xFF259148),
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      'Infak Sedekah',
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
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        formatNumber(
                                                          RekapEndPointGroup
                                                              .rekapPendisCall
                                                              .totalPendisIfs(
                                                            rekapPendisWrapperRekapPendisResponse
                                                                .jsonBody,
                                                          ),
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'Rp ',
                                                          format: '###,###',
                                                          locale: 'ID',
                                                        ),
                                                        '0',
                                                      ),
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
                                                            color: Color(
                                                                0xFF259148),
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Text(
                                                  'Berdasarkan Asnaf ( Uang | Beras )',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSans(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: ModernColors
                                                            .primaryAccent,
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
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      'Fakir',
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
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      '${valueOrDefault<String>(
                                                        formatNumber(
                                                          RekapEndPointGroup
                                                              .rekapPendisCall
                                                              .totalFakirUang(
                                                            rekapPendisWrapperRekapPendisResponse
                                                                .jsonBody,
                                                          ),
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'Rp ',
                                                          format: '###,###',
                                                          locale: 'ID',
                                                        ),
                                                        '0',
                                                      )} | ${valueOrDefault<String>(
                                                        formatNumber(
                                                          RekapEndPointGroup
                                                              .rekapPendisCall
                                                              .totalFakirBeras(
                                                            rekapPendisWrapperRekapPendisResponse
                                                                .jsonBody,
                                                          ),
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '##.## Kg',
                                                          locale: 'ID',
                                                        ),
                                                        '0',
                                                      )}',
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
                                                            color: Color(
                                                                0xFF259148),
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      'Miskin',
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
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      '${valueOrDefault<String>(
                                                        formatNumber(
                                                          RekapEndPointGroup
                                                              .rekapPendisCall
                                                              .totalMiskinUang(
                                                            rekapPendisWrapperRekapPendisResponse
                                                                .jsonBody,
                                                          ),
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'Rp ',
                                                          format: '###,###',
                                                          locale: 'ID',
                                                        ),
                                                        '0',
                                                      )} | ${valueOrDefault<String>(
                                                        formatNumber(
                                                          RekapEndPointGroup
                                                              .rekapPendisCall
                                                              .totalMiskinBeras(
                                                            rekapPendisWrapperRekapPendisResponse
                                                                .jsonBody,
                                                          ),
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '##.## Kg',
                                                          locale: 'ID',
                                                        ),
                                                        '0',
                                                      )}',
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
                                                            color: Color(
                                                                0xFF259148),
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      'Fiesabilillah',
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
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      '${valueOrDefault<String>(
                                                        formatNumber(
                                                          RekapEndPointGroup
                                                              .rekapPendisCall
                                                              .totalFisabliliahUang(
                                                            rekapPendisWrapperRekapPendisResponse
                                                                .jsonBody,
                                                          ),
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'Rp ',
                                                          format: '###,###',
                                                          locale: 'ID',
                                                        ),
                                                        '0',
                                                      )} | ${valueOrDefault<String>(
                                                        formatNumber(
                                                          RekapEndPointGroup
                                                              .rekapPendisCall
                                                              .totalFisabililahBeras(
                                                            rekapPendisWrapperRekapPendisResponse
                                                                .jsonBody,
                                                          ),
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '##.## Kg',
                                                          locale: 'ID',
                                                        ),
                                                        '0',
                                                      )}',
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
                                                            color: Color(
                                                                0xFF259148),
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      'Amil',
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
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      '${valueOrDefault<String>(
                                                        formatNumber(
                                                          valueOrDefault<int>(
                                                                RekapEndPointGroup
                                                                    .rekapHakAmilCall
                                                                    .realisasiHaZfUang(
                                                                  rekapHakAmilWraperRekapHakAmilResponse
                                                                      .jsonBody,
                                                                ),
                                                                0,
                                                              ) +
                                                              valueOrDefault<
                                                                  int>(
                                                                RekapEndPointGroup
                                                                    .rekapHakAmilCall
                                                                    .realisasiHaZm(
                                                                  rekapHakAmilWraperRekapHakAmilResponse
                                                                      .jsonBody,
                                                                ),
                                                                0,
                                                              ) +
                                                              valueOrDefault<
                                                                  int>(
                                                                RekapEndPointGroup
                                                                    .rekapHakAmilCall
                                                                    .realisasiHaIfs(
                                                                  rekapHakAmilWraperRekapHakAmilResponse
                                                                      .jsonBody,
                                                                ),
                                                                0,
                                                              ),
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'Rp ',
                                                          format: '###,###',
                                                          locale: 'ID',
                                                        ),
                                                        '0',
                                                      )} | ${valueOrDefault<String>(
                                                        formatNumber(
                                                          RekapEndPointGroup
                                                              .rekapHakAmilCall
                                                              .realisasiHaZfBeras(
                                                            rekapHakAmilWraperRekapHakAmilResponse
                                                                .jsonBody,
                                                          ),
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '##.## Kg',
                                                          locale: 'ID',
                                                        ),
                                                        '0',
                                                      )}',
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
                                                            color: Color(
                                                                0xFF259148),
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Text(
                                                  'Berdasarkan Program ( Uang | Beras )',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSans(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: ModernColors
                                                            .primaryAccent,
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
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      'Kemanusiaan',
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
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      '${valueOrDefault<String>(
                                                        formatNumber(
                                                          RekapEndPointGroup
                                                              .rekapPendisCall
                                                              .totalKemanusiaanUang(
                                                            rekapPendisWrapperRekapPendisResponse
                                                                .jsonBody,
                                                          ),
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'Rp ',
                                                          format: '###,###',
                                                          locale: 'ID',
                                                        ),
                                                        '0',
                                                      )} | ${valueOrDefault<String>(
                                                        formatNumber(
                                                          RekapEndPointGroup
                                                              .rekapPendisCall
                                                              .totalKemanusiaanBeras(
                                                            rekapPendisWrapperRekapPendisResponse
                                                                .jsonBody,
                                                          ),
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '##.## Kg',
                                                          locale: 'ID',
                                                        ),
                                                        '0',
                                                      )}',
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
                                                            color: Color(
                                                                0xFF259148),
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      'Dakwah',
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
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      '${valueOrDefault<String>(
                                                        formatNumber(
                                                          RekapEndPointGroup
                                                              .rekapPendisCall
                                                              .totalDakwahUang(
                                                            rekapPendisWrapperRekapPendisResponse
                                                                .jsonBody,
                                                          ),
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'Rp ',
                                                          format: '###,###',
                                                          locale: 'ID',
                                                        ),
                                                        '0',
                                                      )} | ${valueOrDefault<String>(
                                                        formatNumber(
                                                          RekapEndPointGroup
                                                              .rekapPendisCall
                                                              .totalDakwahBeras(
                                                            rekapPendisWrapperRekapPendisResponse
                                                                .jsonBody,
                                                          ),
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '##.## Kg',
                                                          locale: 'ID',
                                                        ),
                                                        '0',
                                                      )}',
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
                                                            color: Color(
                                                                0xFF259148),
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      'Operasional',
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
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      '${valueOrDefault<String>(
                                                        formatNumber(
                                                          valueOrDefault<int>(
                                                                RekapEndPointGroup
                                                                    .rekapHakAmilCall
                                                                    .realisasiHaZfUang(
                                                                  rekapHakAmilWraperRekapHakAmilResponse
                                                                      .jsonBody,
                                                                ),
                                                                0,
                                                              ) +
                                                              valueOrDefault<
                                                                  int>(
                                                                RekapEndPointGroup
                                                                    .rekapHakAmilCall
                                                                    .realisasiHaZm(
                                                                  rekapHakAmilWraperRekapHakAmilResponse
                                                                      .jsonBody,
                                                                ),
                                                                0,
                                                              ) +
                                                              valueOrDefault<
                                                                  int>(
                                                                RekapEndPointGroup
                                                                    .rekapHakAmilCall
                                                                    .realisasiHaIfs(
                                                                  rekapHakAmilWraperRekapHakAmilResponse
                                                                      .jsonBody,
                                                                ),
                                                                0,
                                                              ),
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'Rp ',
                                                          format: '###,###',
                                                          locale: 'ID',
                                                        ),
                                                        '0',
                                                      )} | ${valueOrDefault<String>(
                                                        formatNumber(
                                                          RekapEndPointGroup
                                                              .rekapHakAmilCall
                                                              .realisasiHaZfBeras(
                                                            rekapHakAmilWraperRekapHakAmilResponse
                                                                .jsonBody,
                                                          ),
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '##.## Kg',
                                                          locale: 'ID',
                                                        ),
                                                        '0',
                                                      )}',
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
                                                            color: Color(
                                                                0xFF259148),
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Text(
                                                  'RINCIAN HAK AMILIN ( Uang | Beras )',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSans(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      'Penerimaan Hak Amil',
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
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        '${valueOrDefault<String>(
                                                          formatNumber(
                                                            valueOrDefault<int>(
                                                                  RekapEndPointGroup
                                                                      .rekapAlokasiCall
                                                                      .hakAmilZfUang(
                                                                    laporanRekapAlokasiResponse
                                                                        .jsonBody,
                                                                  ),
                                                                  0,
                                                                ) +
                                                                valueOrDefault<
                                                                    int>(
                                                                  RekapEndPointGroup
                                                                      .rekapAlokasiCall
                                                                      .hakAmilZm(
                                                                    laporanRekapAlokasiResponse
                                                                        .jsonBody,
                                                                  ),
                                                                  0,
                                                                ) +
                                                                valueOrDefault<
                                                                    int>(
                                                                  RekapEndPointGroup
                                                                      .rekapAlokasiCall
                                                                      .hakAmilIfs(
                                                                    laporanRekapAlokasiResponse
                                                                        .jsonBody,
                                                                  ),
                                                                  0,
                                                                ),
                                                            formatType:
                                                                FormatType
                                                                    .custom,
                                                            currency: 'Rp ',
                                                            format: '###,###',
                                                            locale: 'ID',
                                                          ),
                                                          '0',
                                                        )} | ${valueOrDefault<String>(
                                                          formatNumber(
                                                            RekapEndPointGroup
                                                                .rekapAlokasiCall
                                                                .hakAmilZfBeras(
                                                              laporanRekapAlokasiResponse
                                                                  .jsonBody,
                                                            ),
                                                            formatType:
                                                                FormatType
                                                                    .custom,
                                                            format: '##.## Kg',
                                                            locale: 'ID',
                                                          ),
                                                          '0',
                                                        )}',
                                                        '0',
                                                      ),
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
                                                            color: Color(
                                                                0xFF259148),
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      'Penyerapan Hak Amil',
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
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        '${valueOrDefault<String>(
                                                          formatNumber(
                                                            valueOrDefault<int>(
                                                                  RekapEndPointGroup
                                                                      .rekapHakAmilCall
                                                                      .realisasiHaZfUang(
                                                                    rekapHakAmilWraperRekapHakAmilResponse
                                                                        .jsonBody,
                                                                  ),
                                                                  0,
                                                                ) +
                                                                valueOrDefault<
                                                                    int>(
                                                                  RekapEndPointGroup
                                                                      .rekapHakAmilCall
                                                                      .realisasiHaZm(
                                                                    rekapHakAmilWraperRekapHakAmilResponse
                                                                        .jsonBody,
                                                                  ),
                                                                  0,
                                                                ) +
                                                                valueOrDefault<
                                                                    int>(
                                                                  RekapEndPointGroup
                                                                      .rekapHakAmilCall
                                                                      .realisasiHaIfs(
                                                                    rekapHakAmilWraperRekapHakAmilResponse
                                                                        .jsonBody,
                                                                  ),
                                                                  0,
                                                                ),
                                                            formatType:
                                                                FormatType
                                                                    .custom,
                                                            currency: 'Rp ',
                                                            format: '###,###',
                                                            locale: 'ID',
                                                          ),
                                                          '0',
                                                        )} | ${valueOrDefault<String>(
                                                          formatNumber(
                                                            RekapEndPointGroup
                                                                .rekapHakAmilCall
                                                                .realisasiHaZfBeras(
                                                              rekapHakAmilWraperRekapHakAmilResponse
                                                                  .jsonBody,
                                                            ),
                                                            formatType:
                                                                FormatType
                                                                    .custom,
                                                            format: '##.## Kg',
                                                            locale: 'ID',
                                                          ),
                                                          '0',
                                                        )}',
                                                        '0',
                                                      ),
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
                                                            color: Color(
                                                                0xFF259148),
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
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
