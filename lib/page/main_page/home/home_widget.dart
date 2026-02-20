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

  bool _isLoading = true;
  int _loadedYear = 0;
  int _totalUang = 0;
  double _totalBeras = 0.0;
  int _totalMuzakki = 0;
  int _totalMunfiq = 0;
  int _totalMustahik = 0;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final currentYear = FFAppState().year;
    if (_loadedYear != currentYear) {
      _loadData();
    }
  }

  Future<void> _loadData() async {
    final currentYear = FFAppState().year;
    safeSetState(() => _isLoading = true);

    if (FFAppState().profileUPZ.id == 0 ||
        FFAppState().profileUPZ.isVerified != true) {
      await _loadUPZData();
    }

    await _loadReportData();

    _loadedYear = currentYear;
    safeSetState(() => _isLoading = false);
  }

  Future<void> _loadUPZData() async {
    final response = await AuthEndPointGroup.getUPZCall.call(
      token: currentAuthenticationToken,
    );

    if (response.succeeded) {
      final upzData = response.jsonBody;
      FFAppState().update(() {
        FFAppState().profileUPZ = UpzStruct(
          id: AuthEndPointGroup.getUPZCall.id(upzData),
          userId: AuthEndPointGroup.getUPZCall.userId(upzData),
          categoryId: AuthEndPointGroup.getUPZCall.categoryId(upzData),
          villageId: AuthEndPointGroup.getUPZCall.villageId(upzData),
          districtId: AuthEndPointGroup.getUPZCall.districtId(upzData),
          noSk: AuthEndPointGroup.getUPZCall.noSk(upzData),
          unitName: AuthEndPointGroup.getUPZCall.unitName(upzData),
          noRegister: AuthEndPointGroup.getUPZCall.noRegister(upzData),
          address: AuthEndPointGroup.getUPZCall.address(upzData),
          unitLeader: AuthEndPointGroup.getUPZCall.unitLead(upzData),
          unitAssistant: AuthEndPointGroup.getUPZCall.unitAssist(upzData),
          unitFinance: AuthEndPointGroup.getUPZCall.unitFinance(upzData),
          operatorPhone: AuthEndPointGroup.getUPZCall.opPhone(upzData),
          ricePrice: AuthEndPointGroup.getUPZCall.ricePrice(upzData),
          isVerified: AuthEndPointGroup.getUPZCall.isVerified(upzData),
          profileCompletion:
              AuthEndPointGroup.getUPZCall.profileCompletion(upzData),
          villageName: AuthEndPointGroup.getUPZCall.villageName(upzData),
          districtName: AuthEndPointGroup.getUPZCall.districtName(upzData),
        );
      });
    }
  }

  Future<void> _loadReportData() async {
    final unitId = FFAppState().profileUPZ.id;
    final year = FFAppState().year;

    if (unitId == 0) return;

    final response = await RekapEndPointGroup.rekapZisReportCall.call(
      unitId: unitId,
      periode: 'tahunan',
      year: year,
      fromDate: '$year-01-01',
      toDate: '$year-12-31',
      token: currentAuthenticationToken,
    );

    if (response.succeeded) {
      final reportData = response.jsonBody;

      _totalUang = (valueOrDefault<int>(
              RekapEndPointGroup.rekapZisReportCall.totalZfAmount(reportData),
              0) +
          valueOrDefault<int>(
              RekapEndPointGroup.rekapZisReportCall.totalZmAmount(reportData),
              0) +
          valueOrDefault<int>(
              RekapEndPointGroup.rekapZisReportCall.totalIfsAmount(reportData),
              0));

      _totalBeras = valueOrDefault<double>(
          RekapEndPointGroup.rekapZisReportCall.totalZfRice(reportData), 0.0);

      _totalMuzakki = (valueOrDefault<int>(
              RekapEndPointGroup.rekapZisReportCall.totalZfMuzakki(reportData),
              0) +
          valueOrDefault<int>(
              RekapEndPointGroup.rekapZisReportCall.totalZmMuzakki(reportData),
              0));

      _totalMunfiq = valueOrDefault<int>(
          RekapEndPointGroup.rekapZisReportCall.totalIfsMunfiq(reportData), 0);

      _totalMustahik = valueOrDefault<int>(
          RekapEndPointGroup.rekapZisReportCall.totalPm(reportData), 0);
    }
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return PopScope(
      canPop: false,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: _isLoading ? _buildShimmerLoading() : _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    final isVerified = FFAppState().profileUPZ.isVerified == true;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          wrapWithModel(
            model: _model.modernHeaderModel,
            updateCallback: () => safeSetState(() {}),
            child: ModernHeaderWidget(
              userName: FFAppState().profileUPZ.unitName,
              noRegister: FFAppState().profileUPZ.noRegister,
              totalPenerimaanUang: isVerified
                  ? formatNumber(
                      _totalUang,
                      formatType: FormatType.custom,
                      currency: 'Rp ',
                      format: '###,###',
                      locale: 'ID',
                    )
                  : null,
              totalPenerimaanBeras: isVerified
                  ? formatNumber(
                      _totalBeras,
                      formatType: FormatType.custom,
                      format: '##.## Kg',
                      locale: 'ID',
                    )
                  : null,
              onNotificationTap: () {},
              onAvatarTap: () {
                context.pushNamed(ProfileResponsiveWidget.routeName);
              },
            ),
          ),
          if (!isVerified) _buildUnverifiedMessage(context),
          if (isVerified) ...[
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
              child: wrapWithModel(
                model: _model.modernDanaOverviewModel,
                updateCallback: () => safeSetState(() {}),
                child: ModernDanaOverviewWidget(
                  jumlahMuzakki: _totalMuzakki,
                  jumlahMunfiq: _totalMunfiq,
                  jumlahMustahik: _totalMustahik,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: wrapWithModel(
                model: _model.modernQuickActionsModel,
                updateCallback: () => safeSetState(() {}),
                child: ModernQuickActionsWidget(),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
              child: RecentTransactionsWidget(),
            ),
          ],
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 24.0),
              child: Text(
                'SISFO ZIS Version 2.0',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.lato(
                        fontWeight: FontWeight.w300,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: Color(0xFFD0D0D0),
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w300,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUnverifiedMessage(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
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
                color: FlutterFlowTheme.of(context).error,
                size: 40.0,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Text(
                  'User Belum Terverifikasi! \nTunggu proses verifikasi selesai atau \nhubungi Admin',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.notoSans(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        lineHeight: 1.5,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerLoading() {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: _buildShimmerContent(),
        ),
      ),
    );
  }

  Widget _buildShimmerContent() {
    return Column(
      children: [
        SkeletonLoaderWidget(type: SkeletonType.header),
        const SizedBox(height: 16.0),
        SkeletonLoaderWidget(
          type: SkeletonType.dashboardStats,
        ),
        const SizedBox(height: 16.0),
        SkeletonLoaderWidget(
          type: SkeletonType.dashboardGrid,
        ),
        const SizedBox(height: 24.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkeletonLoaderWidget(
                type: SkeletonType.transactionFilter,
              ),
              const SizedBox(height: 16.0),
              SkeletonLoaderWidget(
                type: SkeletonType.listItem,
                itemCount: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
