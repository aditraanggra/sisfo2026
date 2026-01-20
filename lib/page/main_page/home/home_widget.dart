import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/component/card_dana/card_dana_widget.dart';
import '/component/card_dana_beras/card_dana_beras_widget.dart';
import '/component/skeleton_loader/skeleton_loader_widget.dart';
import '/component/modern_header/modern_header_widget.dart';
import '/component/modern_balance_card/modern_balance_card_widget.dart';
import '/component/modern_dana_overview/modern_dana_overview_widget.dart';
import '/component/modern_quick_actions/modern_quick_actions_widget.dart';
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
        final homeRekapAlokasiResponse = snapshot.data!;

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
                final profileWrapperGetUPZResponse = snapshot.data!;

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
                            final hakAmilWrapperRekapHakAmilResponse =
                                snapshot.data!;

                            return Container(
                              decoration: BoxDecoration(),
                              child: Stack(
                                children: [
                                  SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        // Modern Header - Requirements: 3.1, 3.2, 3.3, 3.4, 3.5
                                        wrapWithModel(
                                          model: _model.modernHeaderModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ModernHeaderWidget(
                                            userName: FFAppState()
                                                .profileUPZ
                                                .unitName,
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
                                        // Modern Balance Card - Requirements: 4.1, 4.2, 4.3, 4.4, 4.5
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 16.0, 16.0, 0.0),
                                          child: wrapWithModel(
                                            model:
                                                _model.modernBalanceCardModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ModernBalanceCardWidget(
                                              totalSaldo: valueOrDefault<int>(
                                                RekapEndPointGroup
                                                    .rekapAlokasiCall
                                                    .metaTotal(
                                                  homeRekapAlokasiResponse
                                                      .jsonBody,
                                                ),
                                                0,
                                              ),
                                              onPendistribusianTap: () {
                                                context.pushNamed(
                                                  PendistribusianWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'sisaDanaZf':
                                                        serializeParam(
                                                      _model.sisaDanaZf,
                                                      ParamType.int,
                                                    ),
                                                    'sisaDanaZm':
                                                        serializeParam(
                                                      _model.sisaDanaZm,
                                                      ParamType.int,
                                                    ),
                                                    'sisaDanaIfs':
                                                        serializeParam(
                                                      _model.sisaDanaIfs,
                                                      ParamType.int,
                                                    ),
                                                    'sisaBerasZf':
                                                        serializeParam(
                                                      _model.sisaBerasZf,
                                                      ParamType.double,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              onSetorZisTap: () {
                                                context.pushNamed(
                                                    SetorZisWidget.routeName);
                                              },
                                            ),
                                          ),
                                        ),
                                        // Modern Dana Overview - Requirements: 4.6, 4.7, 4.8
                                        if (FFAppState()
                                                .profileUPZ
                                                .isVerified ==
                                            true)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 16.0, 16.0, 0.0),
                                            child: wrapWithModel(
                                              model: _model
                                                  .modernDanaOverviewModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: ModernDanaOverviewWidget(
                                                ketersediaanPendis:
                                                    valueOrDefault<int>(
                                                  (valueOrDefault<int>(
                                                            RekapEndPointGroup
                                                                .rekapAlokasiCall
                                                                .pendisZfUang(
                                                              homeRekapAlokasiResponse
                                                                  .jsonBody,
                                                            ),
                                                            0,
                                                          ) -
                                                          valueOrDefault<int>(
                                                            RekapEndPointGroup
                                                                .rekapPendisCall
                                                                .totalPendisZfUang(
                                                              pendisWrapperRekapPendisResponse
                                                                  .jsonBody,
                                                            ),
                                                            0,
                                                          )) +
                                                      (valueOrDefault<int>(
                                                            RekapEndPointGroup
                                                                .rekapAlokasiCall
                                                                .pendisZm(
                                                              homeRekapAlokasiResponse
                                                                  .jsonBody,
                                                            ),
                                                            0,
                                                          ) -
                                                          valueOrDefault<int>(
                                                            RekapEndPointGroup
                                                                .rekapPendisCall
                                                                .totalPendisZm(
                                                              pendisWrapperRekapPendisResponse
                                                                  .jsonBody,
                                                            ),
                                                            0,
                                                          )) +
                                                      (valueOrDefault<int>(
                                                            RekapEndPointGroup
                                                                .rekapAlokasiCall
                                                                .pendisIfs(
                                                              homeRekapAlokasiResponse
                                                                  .jsonBody,
                                                            ),
                                                            0,
                                                          ) -
                                                          valueOrDefault<int>(
                                                            RekapEndPointGroup
                                                                .rekapPendisCall
                                                                .totalPendisIfs(
                                                              pendisWrapperRekapPendisResponse
                                                                  .jsonBody,
                                                            ),
                                                            0,
                                                          )),
                                                  0,
                                                ),
                                                ketersediaanAmil:
                                                    valueOrDefault<int>(
                                                  (valueOrDefault<int>(
                                                            RekapEndPointGroup
                                                                .rekapAlokasiCall
                                                                .hakAmilZfUang(
                                                              homeRekapAlokasiResponse
                                                                  .jsonBody,
                                                            ),
                                                            0,
                                                          ) -
                                                          valueOrDefault<int>(
                                                            RekapEndPointGroup
                                                                .rekapHakAmilCall
                                                                .realisasiHaZfUang(
                                                              hakAmilWrapperRekapHakAmilResponse
                                                                  .jsonBody,
                                                            ),
                                                            0,
                                                          )) +
                                                      (valueOrDefault<int>(
                                                            RekapEndPointGroup
                                                                .rekapAlokasiCall
                                                                .hakAmilZm(
                                                              homeRekapAlokasiResponse
                                                                  .jsonBody,
                                                            ),
                                                            0,
                                                          ) -
                                                          valueOrDefault<int>(
                                                            RekapEndPointGroup
                                                                .rekapHakAmilCall
                                                                .realisasiHaZm(
                                                              hakAmilWrapperRekapHakAmilResponse
                                                                  .jsonBody,
                                                            ),
                                                            0,
                                                          )) +
                                                      (valueOrDefault<int>(
                                                            RekapEndPointGroup
                                                                .rekapAlokasiCall
                                                                .hakAmilIfs(
                                                              homeRekapAlokasiResponse
                                                                  .jsonBody,
                                                            ),
                                                            0,
                                                          ) -
                                                          valueOrDefault<int>(
                                                            RekapEndPointGroup
                                                                .rekapHakAmilCall
                                                                .realisasiHaIfs(
                                                              hakAmilWrapperRekapHakAmilResponse
                                                                  .jsonBody,
                                                            ),
                                                            0,
                                                          )),
                                                  0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        // Modern Quick Actions - Requirements: 5.1, 5.2, 5.3, 5.4, 5.5, 5.6
                                        if (FFAppState()
                                                .profileUPZ
                                                .isVerified ==
                                            true)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: wrapWithModel(
                                              model: _model
                                                  .modernQuickActionsModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: ModernQuickActionsWidget(),
                                            ),
                                          ),
                                        // Amilin Section - Keep existing functionality
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (FFAppState()
                                                        .profileUPZ
                                                        .isVerified ==
                                                    true)
                                                  Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, -1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Amilin',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .notoSans(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          16.0,
                                                                          4.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          70.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              context.pushNamed(
                                                                                PenyerapanHakAmilWidget.routeName,
                                                                                queryParameters: {
                                                                                  'sisaAmilZfBeras': serializeParam(
                                                                                    _model.sisaHaZfBeras,
                                                                                    ParamType.double,
                                                                                  ),
                                                                                  'sisaAmilZfUang': serializeParam(
                                                                                    _model.sisaHaZfUang,
                                                                                    ParamType.int,
                                                                                  ),
                                                                                  'sisaAmilZm': serializeParam(
                                                                                    _model.sisaHaZm,
                                                                                    ParamType.int,
                                                                                  ),
                                                                                  'sisaAmilIfs': serializeParam(
                                                                                    _model.sisaHaIfs,
                                                                                    ParamType.int,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                                extra: <String, dynamic>{
                                                                                  kTransitionInfoKey: TransitionInfo(
                                                                                    hasTransition: true,
                                                                                    transitionType: PageTransitionType.leftToRight,
                                                                                  ),
                                                                                },
                                                                              );
                                                                            },
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Image.asset(
                                                                                'assets/images/003-money.png',
                                                                                width: 48.0,
                                                                                height: 48.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                8.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              'Penyerapan Amilin',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    font: GoogleFonts.lato(
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                    ),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 70.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Visibility(
                                                                      visible:
                                                                          FFAppState().profileUPZ.categoryId ==
                                                                              3,
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              context.pushNamed(
                                                                                ListDkmWidget.routeName,
                                                                                extra: <String, dynamic>{
                                                                                  kTransitionInfoKey: TransitionInfo(
                                                                                    hasTransition: true,
                                                                                    transitionType: PageTransitionType.leftToRight,
                                                                                  ),
                                                                                },
                                                                              );
                                                                            },
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Image.asset(
                                                                                'assets/images/012-mosque-1.png',
                                                                                width: 48.0,
                                                                                height: 48.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                8.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              'Rekapitulasi DKM',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    font: GoogleFonts.lato(
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                    ),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 70.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          70.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                    ),
                                                                  ),
                                                                ].divide(
                                                                    SizedBox(
                                                                        width:
                                                                            () {
                                                                  if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointSmall) {
                                                                    return 2.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointMedium) {
                                                                    return 4.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointLarge) {
                                                                    return 6.0;
                                                                  } else {
                                                                    return 8.0;
                                                                  }
                                                                }())),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                if (FFAppState()
                                                        .profileUPZ
                                                        .isVerified ==
                                                    false)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 8.0,
                                                                24.0, 8.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xF3DFDFDF),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            12.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .person_off_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              size: 40.0,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'User Belum Terverifikasi! \nTunggu proses verifikasi selesai atau \nhubungi Admin',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .notoSans(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
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
                                                                      lineHeight:
                                                                          1.5,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (FFAppState()
                                                        .profileUPZ
                                                        .isVerified ==
                                                    true)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    16.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      -1.0),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        16.0,
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  'Ketersediaan Hak Amil',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .notoSans(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      -1.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'Rincian Hak Amil per masing masing jenis dana',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .notoSans(
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                        lineHeight:
                                                                            1.5,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .cardDanaModel1,
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      updateOnChange:
                                                                          true,
                                                                      child:
                                                                          CardDanaWidget(
                                                                        alokasiDana:
                                                                            'Hak Amil',
                                                                        sumberDana:
                                                                            'Zakat Fitrah (Uang)',
                                                                        danaKeluar:
                                                                            valueOrDefault<int>(
                                                                          RekapEndPointGroup
                                                                              .rekapHakAmilCall
                                                                              .realisasiHaZfUang(
                                                                            hakAmilWrapperRekapHakAmilResponse.jsonBody,
                                                                          ),
                                                                          0,
                                                                        ),
                                                                        danaTersedia:
                                                                            valueOrDefault<int>(
                                                                          RekapEndPointGroup.rekapAlokasiCall.metaTotal(
                                                                                    homeRekapAlokasiResponse.jsonBody,
                                                                                  ) ==
                                                                                  0
                                                                              ? 0
                                                                              : valueOrDefault<int>(
                                                                                  RekapEndPointGroup.rekapAlokasiCall.hakAmilZfUang(
                                                                                    homeRekapAlokasiResponse.jsonBody,
                                                                                  ),
                                                                                  0,
                                                                                ),
                                                                          0,
                                                                        ),
                                                                        setSisaDana:
                                                                            () async {
                                                                          _model.sisaHaZfUang =
                                                                              valueOrDefault<int>(
                                                                            valueOrDefault<int>(
                                                                                  RekapEndPointGroup.rekapAlokasiCall.hakAmilZfUang(
                                                                                    homeRekapAlokasiResponse.jsonBody,
                                                                                  ),
                                                                                  0,
                                                                                ) -
                                                                                valueOrDefault<int>(
                                                                                  RekapEndPointGroup.rekapHakAmilCall.realisasiHaZfUang(
                                                                                    hakAmilWrapperRekapHakAmilResponse.jsonBody,
                                                                                  ),
                                                                                  0,
                                                                                ),
                                                                            0,
                                                                          );
                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .cardDanaBerasModel1,
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      updateOnChange:
                                                                          true,
                                                                      child:
                                                                          CardDanaBerasWidget(
                                                                        berasKeluar:
                                                                            valueOrDefault<double>(
                                                                          RekapEndPointGroup
                                                                              .rekapHakAmilCall
                                                                              .realisasiHaZfBeras(
                                                                            hakAmilWrapperRekapHakAmilResponse.jsonBody,
                                                                          ),
                                                                          0.0,
                                                                        ),
                                                                        berasTersedia:
                                                                            valueOrDefault<double>(
                                                                          RekapEndPointGroup.rekapAlokasiCall.metaTotal(
                                                                                    homeRekapAlokasiResponse.jsonBody,
                                                                                  ) ==
                                                                                  0
                                                                              ? 0.0
                                                                              : valueOrDefault<double>(
                                                                                  RekapEndPointGroup.rekapAlokasiCall.hakAmilZfBeras(
                                                                                    homeRekapAlokasiResponse.jsonBody,
                                                                                  ),
                                                                                  0.0,
                                                                                ),
                                                                          0.0,
                                                                        ),
                                                                        alokasiDana:
                                                                            'Hak Amil',
                                                                        sumberDana:
                                                                            'Zakat Fitrah (Beras)',
                                                                        setSisaBeras:
                                                                            () async {
                                                                          _model.sisaHaZfBeras =
                                                                              valueOrDefault<double>(
                                                                            valueOrDefault<double>(
                                                                                  RekapEndPointGroup.rekapAlokasiCall.hakAmilZfBeras(
                                                                                    homeRekapAlokasiResponse.jsonBody,
                                                                                  ),
                                                                                  0.0,
                                                                                ) -
                                                                                valueOrDefault<double>(
                                                                                  RekapEndPointGroup.rekapHakAmilCall.realisasiHaZfBeras(
                                                                                    hakAmilWrapperRekapHakAmilResponse.jsonBody,
                                                                                  ),
                                                                                  0.0,
                                                                                ),
                                                                            0.0,
                                                                          );
                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .cardDanaModel2,
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      updateOnChange:
                                                                          true,
                                                                      child:
                                                                          CardDanaWidget(
                                                                        alokasiDana:
                                                                            'Hak Amil',
                                                                        sumberDana:
                                                                            'Infak Sedekah',
                                                                        danaKeluar:
                                                                            valueOrDefault<int>(
                                                                          RekapEndPointGroup
                                                                              .rekapHakAmilCall
                                                                              .realisasiHaIfs(
                                                                            hakAmilWrapperRekapHakAmilResponse.jsonBody,
                                                                          ),
                                                                          0,
                                                                        ),
                                                                        danaTersedia:
                                                                            valueOrDefault<int>(
                                                                          RekapEndPointGroup.rekapAlokasiCall.metaTotal(
                                                                                    homeRekapAlokasiResponse.jsonBody,
                                                                                  ) ==
                                                                                  0
                                                                              ? 0
                                                                              : valueOrDefault<int>(
                                                                                  RekapEndPointGroup.rekapAlokasiCall.hakAmilIfs(
                                                                                    homeRekapAlokasiResponse.jsonBody,
                                                                                  ),
                                                                                  0,
                                                                                ),
                                                                          0,
                                                                        ),
                                                                        setSisaDana:
                                                                            () async {
                                                                          _model.sisaHaIfs =
                                                                              valueOrDefault<int>(
                                                                            valueOrDefault<int>(
                                                                                  RekapEndPointGroup.rekapAlokasiCall.hakAmilIfs(
                                                                                    homeRekapAlokasiResponse.jsonBody,
                                                                                  ),
                                                                                  0,
                                                                                ) -
                                                                                valueOrDefault<int>(
                                                                                  RekapEndPointGroup.rekapHakAmilCall.realisasiHaIfs(
                                                                                    hakAmilWrapperRekapHakAmilResponse.jsonBody,
                                                                                  ),
                                                                                  0,
                                                                                ),
                                                                            0,
                                                                          );
                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .cardDanaModel3,
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      updateOnChange:
                                                                          true,
                                                                      child:
                                                                          CardDanaWidget(
                                                                        alokasiDana:
                                                                            'Hak Amil',
                                                                        sumberDana:
                                                                            'Zakat Mal',
                                                                        danaKeluar:
                                                                            valueOrDefault<int>(
                                                                          RekapEndPointGroup
                                                                              .rekapHakAmilCall
                                                                              .realisasiHaZm(
                                                                            hakAmilWrapperRekapHakAmilResponse.jsonBody,
                                                                          ),
                                                                          0,
                                                                        ),
                                                                        danaTersedia:
                                                                            valueOrDefault<int>(
                                                                          RekapEndPointGroup.rekapAlokasiCall.metaTotal(
                                                                                    homeRekapAlokasiResponse.jsonBody,
                                                                                  ) ==
                                                                                  0
                                                                              ? 0
                                                                              : valueOrDefault<int>(
                                                                                  RekapEndPointGroup.rekapAlokasiCall.hakAmilZm(
                                                                                    homeRekapAlokasiResponse.jsonBody,
                                                                                  ),
                                                                                  0,
                                                                                ),
                                                                          0,
                                                                        ),
                                                                        setSisaDana:
                                                                            () async {
                                                                          _model.sisaHaZm =
                                                                              valueOrDefault<int>(
                                                                            valueOrDefault<int>(
                                                                                  RekapEndPointGroup.rekapAlokasiCall.hakAmilZm(
                                                                                    homeRekapAlokasiResponse.jsonBody,
                                                                                  ),
                                                                                  0,
                                                                                ) -
                                                                                valueOrDefault<int>(
                                                                                  RekapEndPointGroup.rekapHakAmilCall.realisasiHaZm(
                                                                                    hakAmilWrapperRekapHakAmilResponse.jsonBody,
                                                                                  ),
                                                                                  0,
                                                                                ),
                                                                            0,
                                                                          );
                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ]
                                                                    .divide(SizedBox(
                                                                        width:
                                                                            16.0))
                                                                    .around(SizedBox(
                                                                        width:
                                                                            16.0)),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (FFAppState()
                                                        .profileUPZ
                                                        .isVerified ==
                                                    true)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  24.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      16.0,
                                                                      0.0,
                                                                      80.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        -1.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Ketersediaan Dana Pendistribusian',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.notoSans(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        -1.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Alokasi untuk pendistribusian yang dikelola UPZ ( 70% dari penerimaan Bruto) diluar Hak Amil UPZ ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.notoSans(
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                          lineHeight:
                                                                              1.5,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SingleChildScrollView(
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          wrapWithModel(
                                                                        model: _model
                                                                            .cardDanaModel4,
                                                                        updateCallback:
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                        updateOnChange:
                                                                            true,
                                                                        child:
                                                                            CardDanaWidget(
                                                                          alokasiDana:
                                                                              'Alokasi Pendistribusian',
                                                                          sumberDana:
                                                                              'Zakat Fitrah (Uang)',
                                                                          danaKeluar:
                                                                              valueOrDefault<int>(
                                                                            RekapEndPointGroup.rekapPendisCall.totalPendisZfUang(
                                                                              pendisWrapperRekapPendisResponse.jsonBody,
                                                                            ),
                                                                            0,
                                                                          ),
                                                                          danaTersedia:
                                                                              valueOrDefault<int>(
                                                                            RekapEndPointGroup.rekapAlokasiCall.pendisZfUang(
                                                                              homeRekapAlokasiResponse.jsonBody,
                                                                            ),
                                                                            0,
                                                                          ),
                                                                          setSisaDana:
                                                                              () async {
                                                                            _model.sisaDanaZf =
                                                                                valueOrDefault<int>(
                                                                              valueOrDefault<int>(
                                                                                    RekapEndPointGroup.rekapAlokasiCall.pendisZfUang(
                                                                                      homeRekapAlokasiResponse.jsonBody,
                                                                                    ),
                                                                                    0,
                                                                                  ) -
                                                                                  valueOrDefault<int>(
                                                                                    RekapEndPointGroup.rekapPendisCall.totalPendisZfUang(
                                                                                      pendisWrapperRekapPendisResponse.jsonBody,
                                                                                    ),
                                                                                    0,
                                                                                  ),
                                                                              0,
                                                                            );
                                                                            _model.sisaUangZf =
                                                                                valueOrDefault<int>(
                                                                              valueOrDefault<int>(
                                                                                    RekapEndPointGroup.rekapAlokasiCall.pendisZfUang(
                                                                                      homeRekapAlokasiResponse.jsonBody,
                                                                                    ),
                                                                                    0,
                                                                                  ) -
                                                                                  valueOrDefault<int>(
                                                                                    RekapEndPointGroup.rekapPendisCall.totalPendisZfUang(
                                                                                      pendisWrapperRekapPendisResponse.jsonBody,
                                                                                    ),
                                                                                    0,
                                                                                  ),
                                                                              0,
                                                                            );
                                                                            safeSetState(() {});
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          wrapWithModel(
                                                                        model: _model
                                                                            .cardDanaBerasModel2,
                                                                        updateCallback:
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                        updateOnChange:
                                                                            true,
                                                                        child:
                                                                            CardDanaBerasWidget(
                                                                          berasKeluar:
                                                                              valueOrDefault<double>(
                                                                            RekapEndPointGroup.rekapPendisCall.totalPendisZfBeras(
                                                                              pendisWrapperRekapPendisResponse.jsonBody,
                                                                            ),
                                                                            0.0,
                                                                          ),
                                                                          berasTersedia:
                                                                              valueOrDefault<double>(
                                                                            RekapEndPointGroup.rekapAlokasiCall.pendisZfBeras(
                                                                              homeRekapAlokasiResponse.jsonBody,
                                                                            ),
                                                                            0.0,
                                                                          ),
                                                                          alokasiDana:
                                                                              'Alokasi Pendistribusian',
                                                                          sumberDana:
                                                                              'Zakat Fitrah (Beras)',
                                                                          setSisaBeras:
                                                                              () async {
                                                                            _model.sisaBerasZf =
                                                                                valueOrDefault<double>(
                                                                              valueOrDefault<double>(
                                                                                    RekapEndPointGroup.rekapAlokasiCall.pendisZfBeras(
                                                                                      homeRekapAlokasiResponse.jsonBody,
                                                                                    ),
                                                                                    0.0,
                                                                                  ) -
                                                                                  valueOrDefault<double>(
                                                                                    RekapEndPointGroup.rekapPendisCall.totalPendisZfBeras(
                                                                                      pendisWrapperRekapPendisResponse.jsonBody,
                                                                                    ),
                                                                                    0.0,
                                                                                  ),
                                                                              0.0,
                                                                            );
                                                                            safeSetState(() {});
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          wrapWithModel(
                                                                        model: _model
                                                                            .cardDanaModel5,
                                                                        updateCallback:
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                        updateOnChange:
                                                                            true,
                                                                        child:
                                                                            CardDanaWidget(
                                                                          alokasiDana:
                                                                              'Alokasi Pendistribusian',
                                                                          sumberDana:
                                                                              'Zakat Mal',
                                                                          danaKeluar:
                                                                              valueOrDefault<int>(
                                                                            RekapEndPointGroup.rekapPendisCall.totalPendisZm(
                                                                              pendisWrapperRekapPendisResponse.jsonBody,
                                                                            ),
                                                                            0,
                                                                          ),
                                                                          danaTersedia:
                                                                              valueOrDefault<int>(
                                                                            RekapEndPointGroup.rekapAlokasiCall.pendisZm(
                                                                              homeRekapAlokasiResponse.jsonBody,
                                                                            ),
                                                                            0,
                                                                          ),
                                                                          setSisaDana:
                                                                              () async {
                                                                            _model.sisaDanaZm =
                                                                                valueOrDefault<int>(
                                                                              valueOrDefault<int>(
                                                                                    RekapEndPointGroup.rekapAlokasiCall.pendisZm(
                                                                                      homeRekapAlokasiResponse.jsonBody,
                                                                                    ),
                                                                                    0,
                                                                                  ) -
                                                                                  valueOrDefault<int>(
                                                                                    RekapEndPointGroup.rekapPendisCall.totalPendisZm(
                                                                                      pendisWrapperRekapPendisResponse.jsonBody,
                                                                                    ),
                                                                                    0,
                                                                                  ),
                                                                              0,
                                                                            );
                                                                            safeSetState(() {});
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          wrapWithModel(
                                                                        model: _model
                                                                            .cardDanaModel6,
                                                                        updateCallback:
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                        updateOnChange:
                                                                            true,
                                                                        child:
                                                                            CardDanaWidget(
                                                                          alokasiDana:
                                                                              'Alokasi Pendistribusian',
                                                                          sumberDana:
                                                                              'Infak Sedekah',
                                                                          danaKeluar:
                                                                              valueOrDefault<int>(
                                                                            RekapEndPointGroup.rekapPendisCall.totalPendisIfs(
                                                                              pendisWrapperRekapPendisResponse.jsonBody,
                                                                            ),
                                                                            0,
                                                                          ),
                                                                          danaTersedia:
                                                                              valueOrDefault<int>(
                                                                            RekapEndPointGroup.rekapAlokasiCall.pendisIfs(
                                                                              homeRekapAlokasiResponse.jsonBody,
                                                                            ),
                                                                            0,
                                                                          ),
                                                                          setSisaDana:
                                                                              () async {
                                                                            _model.sisaDanaIfs =
                                                                                valueOrDefault<int>(
                                                                              valueOrDefault<int>(
                                                                                    RekapEndPointGroup.rekapAlokasiCall.pendisIfs(
                                                                                      homeRekapAlokasiResponse.jsonBody,
                                                                                    ),
                                                                                    0,
                                                                                  ) -
                                                                                  valueOrDefault<int>(
                                                                                    RekapEndPointGroup.rekapPendisCall.totalPendisIfs(
                                                                                      pendisWrapperRekapPendisResponse.jsonBody,
                                                                                    ),
                                                                                    0,
                                                                                  ),
                                                                              0,
                                                                            );
                                                                            safeSetState(() {});
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ]
                                                                      .divide(SizedBox(
                                                                          width:
                                                                              16.0))
                                                                      .around(SizedBox(
                                                                          width:
                                                                              16.0)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 24.0),
                                                    child: Text(
                                                      'SISFO ZIS Version 2.0',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .lato(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xFFD0D0D0),
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                  ))
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 120.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(40.0),
                                            topRight: Radius.circular(40.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 8.0, 24.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                          HomeWidget.routeName);
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.home_filled,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 48.0,
                                                        ),
                                                        Text(
                                                          'Beranda',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                          LaporanWidget
                                                              .routeName);
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.analytics,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 48.0,
                                                        ),
                                                        Text(
                                                          'Laporan',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                          HistoriTransaksiWidget
                                                              .routeName);
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.work_history,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 48.0,
                                                        ),
                                                        Text(
                                                          'Transaksi',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                          ProfileResponsiveWidget
                                                              .routeName);
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.person_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 48.0,
                                                        ),
                                                        Text(
                                                          'Profil',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
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
