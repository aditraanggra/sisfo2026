import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/component/skeleton_loader/skeleton_loader_widget.dart';
import '/component/modern_header/modern_header_widget.dart';
import '/component/modern_dana_overview/modern_dana_overview_widget.dart';
import '/component/modern_quick_actions/modern_quick_actions_widget.dart';
import '/component/recent_transactions/recent_transactions_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    super.key,
    this.userName,
  });

  final String? userName;

  static String routeName = 'Home';
  static String routePath = '/home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().profileUPZ.id == 0) {
        _model.apiResultpvw = await AuthEndPointGroup.getUPZCall.call(
          token: currentAuthenticationToken,
        );

        if ((_model.apiResultpvw?.succeeded ?? true)) {
          FFAppState().profileUPZ = UpzStruct(
            id: AuthEndPointGroup.getUPZCall.id(
              (_model.apiResultpvw?.jsonBody ?? ''),
            ),
            userId: AuthEndPointGroup.getUPZCall.userId(
              (_model.apiResultpvw?.jsonBody ?? ''),
            ),
            categoryId: AuthEndPointGroup.getUPZCall.categoryId(
              (_model.apiResultpvw?.jsonBody ?? ''),
            ),
            villageId: AuthEndPointGroup.getUPZCall.villageId(
              (_model.apiResultpvw?.jsonBody ?? ''),
            ),
            districtId: AuthEndPointGroup.getUPZCall.districtId(
              (_model.apiResultpvw?.jsonBody ?? ''),
            ),
            noSk: AuthEndPointGroup.getUPZCall.noSk(
              (_model.apiResultpvw?.jsonBody ?? ''),
            ),
            unitName: AuthEndPointGroup.getUPZCall.unitName(
              (_model.apiResultpvw?.jsonBody ?? ''),
            ),
            noRegister: AuthEndPointGroup.getUPZCall.noRegister(
              (_model.apiResultpvw?.jsonBody ?? ''),
            ),
            address: AuthEndPointGroup.getUPZCall.address(
              (_model.apiResultpvw?.jsonBody ?? ''),
            ),
            unitLeader: AuthEndPointGroup.getUPZCall.unitLead(
              (_model.apiResultpvw?.jsonBody ?? ''),
            ),
            unitAssistant: AuthEndPointGroup.getUPZCall.unitAssist(
              (_model.apiResultpvw?.jsonBody ?? ''),
            ),
            unitFinance: AuthEndPointGroup.getUPZCall.unitFinance(
              (_model.apiResultpvw?.jsonBody ?? ''),
            ),
            operatorPhone: AuthEndPointGroup.getUPZCall.opPhone(
              (_model.apiResultpvw?.jsonBody ?? ''),
            ),
            ricePrice: AuthEndPointGroup.getUPZCall.ricePrice(
              (_model.apiResultpvw?.jsonBody ?? ''),
            ),
            isVerified: AuthEndPointGroup.getUPZCall.isVerified(
              (_model.apiResultpvw?.jsonBody ?? ''),
            ),
            profileCompletion: AuthEndPointGroup.getUPZCall.profileCompletion(
              (_model.apiResultpvw?.jsonBody ?? ''),
            ),
            villageName: AuthEndPointGroup.getUPZCall.villageName(
              (_model.apiResultpvw?.jsonBody ?? ''),
            ),
            districtName: AuthEndPointGroup.getUPZCall.districtName(
              (_model.apiResultpvw?.jsonBody ?? ''),
            ),
          );
          safeSetState(() {});
        }
      }
    });

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
        unitId: FFAppState().profileUPZ.id.toString(),
        token: currentAuthenticationToken,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Header skeleton
                    Container(
                      width: double.infinity,
                      height: 195.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF259148), Color(0xFF1D6935)],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(1.0, -1.0),
                          end: AlignmentDirectional(-1.0, 1.0),
                        ),
                      ),
                    ),
                    // Card skeletons for dashboard
                    SkeletonLoaderWidget(
                      type: SkeletonType.card,
                      itemCount: 3,
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return PopScope(
          canPop: false,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: FutureBuilder<ApiCallResponse>(
              future: _model.getUpzData(
                requestFn: () => AuthEndPointGroup.getUPZCall.call(
                  token: currentAuthenticationToken,
                ),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return SkeletonLoaderWidget(
                    type: SkeletonType.card,
                    itemCount: 2,
                  );
                }
                // UPZ data loaded successfully

                return Container(
                  decoration: BoxDecoration(),
                  child: FutureBuilder<ApiCallResponse>(
                    future: RekapEndPointGroup.rekapPendisCall.call(
                      periode: 'tahunan',
                      token: currentAuthenticationToken,
                      unitId: FFAppState().profileUPZ.id,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return SkeletonLoaderWidget(
                          type: SkeletonType.card,
                          itemCount: 2,
                        );
                      }
                      final pendisWrapperRekapPendisResponse = snapshot.data!;

                      return Container(
                        decoration: BoxDecoration(),
                        child: FutureBuilder<ApiCallResponse>(
                          future: RekapEndPointGroup.rekapHakAmilCall.call(
                            periode: 'tahunan',
                            token: currentAuthenticationToken,
                            unitId: FFAppState().profileUPZ.id,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return SkeletonLoaderWidget(
                                type: SkeletonType.card,
                                itemCount: 2,
                              );
                            }

                            return Container(
                              decoration: BoxDecoration(),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    // Modern Header
                                    wrapWithModel(
                                      model: _model.modernHeaderModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ModernHeaderWidget(
                                        userName:
                                            FFAppState().profileUPZ.unitName,
                                        onNotificationTap: () {
                                          // TODO: Handle notification tap
                                        },
                                        onAvatarTap: () {
                                          context.pushNamed(
                                              ProfileResponsiveWidget
                                                  .routeName);
                                        },
                                      ),
                                    ),
                                    // Modern Dana Overview - Jumlah Muzakki & Mustahik
                                    if (FFAppState().profileUPZ.isVerified ==
                                        true)
                                      FutureBuilder<ApiCallResponse>(
                                        future: RekapEndPointGroup.rekapZISCall
                                            .call(
                                          period: 'tahunan',
                                          unitId: FFAppState()
                                              .profileUPZ
                                              .id
                                              .toString(),
                                          token: currentAuthenticationToken,
                                        ),
                                        builder: (context, zisSnapshot) {
                                          final totalMuzakki =
                                              zisSnapshot.hasData
                                                  ? (valueOrDefault<int>(
                                                        RekapEndPointGroup
                                                            .rekapZISCall
                                                            .totalZfMuzakki(
                                                                zisSnapshot
                                                                    .data!
                                                                    .jsonBody),
                                                        0,
                                                      ) +
                                                      valueOrDefault<int>(
                                                        RekapEndPointGroup
                                                            .rekapZISCall
                                                            .totalZmMuzakki(
                                                                zisSnapshot
                                                                    .data!
                                                                    .jsonBody),
                                                        0,
                                                      ))
                                                  : 0;
                                          final totalMustahik =
                                              zisSnapshot.hasData
                                                  ? valueOrDefault<int>(
                                                      RekapEndPointGroup
                                                          .rekapPendisCall
                                                          .totalPenerimaManfaat(
                                                        pendisWrapperRekapPendisResponse
                                                            .jsonBody,
                                                      ),
                                                      0,
                                                    )
                                                  : 0;

                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 16.0, 16.0, 0.0),
                                            child: wrapWithModel(
                                              model: _model
                                                  .modernDanaOverviewModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: ModernDanaOverviewWidget(
                                                jumlahMuzakki: totalMuzakki,
                                                jumlahMustahik: totalMustahik,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    // Modern Quick Actions
                                    if (FFAppState().profileUPZ.isVerified ==
                                        true)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: wrapWithModel(
                                          model: _model.modernQuickActionsModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ModernQuickActionsWidget(),
                                        ),
                                      ),
                                    // Transaksi Terbaru Section
                                    if (FFAppState().profileUPZ.isVerified ==
                                        true)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 24.0, 0.0, 0.0),
                                        child: RecentTransactionsWidget(),
                                      ),
                                    // User not verified message
                                    if (FFAppState().profileUPZ.isVerified ==
                                        false)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 16.0, 24.0, 8.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Color(0xF3DFDFDF),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.person_off_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  size: 40.0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Text(
                                                    'User Belum Terverifikasi! \nTunggu proses verifikasi selesai atau \nhubungi Admin',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .notoSans(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                          lineHeight: 1.5,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    // Version text
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 24.0),
                                        child: Text(
                                          'SISFO ZIS Version 2.0',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.lato(
                                                  fontWeight: FontWeight.w300,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFFD0D0D0),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
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
        );
      },
    );
  }
}
