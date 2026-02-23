import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profil_u_p_z_model.dart';
export 'profil_u_p_z_model.dart';

class ProfilUPZWidget extends StatefulWidget {
  const ProfilUPZWidget({super.key});

  static String routeName = 'ProfilUPZ';
  static String routePath = '/profilUPZ';

  @override
  State<ProfilUPZWidget> createState() => _ProfilUPZWidgetState();
}

class _ProfilUPZWidgetState extends State<ProfilUPZWidget>
    with TickerProviderStateMixin {
  late ProfilUPZModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilUPZModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF5F7F5),
        appBar: responsiveVisibility(
          context: context,
          desktop: false,
        )
            ? AppBar(
                backgroundColor: Color(0xFF1A3C34),
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 54.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
                title: Text(
                  'Profil UPZ',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
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
            future: AuthEndPointGroup.getUPZCall.call(
              token: currentAuthenticationToken,
            ),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFF259148),
                      ),
                    ),
                  ),
                );
              }
              final columnGetUPZResponse = snapshot.data!;

              if (!columnGetUPZResponse.succeeded) {
                return _buildErrorState();
              }

              final upzDataList = AuthEndPointGroup.getUPZCall.dataUpz(
                columnGetUPZResponse.jsonBody,
              );

              if (upzDataList == null || upzDataList.isEmpty) {
                return _buildEmptyState();
              }

              final upzData = upzDataList.first;

              return SingleChildScrollView(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeaderCard(upzData),
                    SizedBox(height: 20.0),
                    _buildInfoSection(
                      context,
                      'Informasi Lembaga',
                      [
                        _InfoItem(
                          icon: Icons.business_outlined,
                          label: 'Nama UPZ',
                          value: getJsonField(upzData, r'$.unit_name')
                                  ?.toString() ??
                              '-',
                        ),
                        _InfoItem(
                          icon: Icons.numbers_outlined,
                          label: 'No. Register',
                          value: getJsonField(upzData, r'$.no_register')
                                  ?.toString() ??
                              '-',
                        ),
                        _InfoItem(
                          icon: Icons.description_outlined,
                          label: 'No. SK',
                          value:
                              getJsonField(upzData, r'$.no_sk')?.toString() ??
                                  '-',
                        ),
                        _InfoItem(
                          icon: Icons.location_on_outlined,
                          label: 'Wilayah Kerja',
                          value: _getWilayahKerja(
                              getJsonField(upzData, r'$.category_id')),
                        ),
                        _InfoItem(
                          icon: Icons.home_outlined,
                          label: 'Desa',
                          value: getJsonField(upzData, r'$.village_name')
                                  ?.toString() ??
                              '-',
                        ),
                        _InfoItem(
                          icon: Icons.location_city_outlined,
                          label: 'Kecamatan',
                          value: getJsonField(upzData, r'$.district_name')
                                  ?.toString() ??
                              '-',
                        ),
                        _InfoItem(
                          icon: Icons.map_outlined,
                          label: 'Alamat',
                          value:
                              getJsonField(upzData, r'$.address')?.toString() ??
                                  '-',
                          isMultiline: true,
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    _buildInfoSection(
                      context,
                      'Pengurus',
                      [
                        _InfoItem(
                          icon: Icons.person_outline_rounded,
                          label: 'Ketua',
                          value: getJsonField(upzData, r'$.unit_leader')
                                  ?.toString() ??
                              '-',
                        ),
                        _InfoItem(
                          icon: Icons.description_outlined,
                          label: 'Sekretaris',
                          value: getJsonField(upzData, r'$.unit_assistant')
                                  ?.toString() ??
                              '-',
                        ),
                        _InfoItem(
                          icon: Icons.account_balance_wallet_outlined,
                          label: 'Bendahara',
                          value: getJsonField(upzData, r'$.unit_finance')
                                  ?.toString() ??
                              '-',
                        ),
                        _InfoItem(
                          icon: Icons.computer_outlined,
                          label: 'Operator',
                          value: currentUserData?.name ?? '-',
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                color: Color(0xFFFEE2E2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline_rounded,
                color: Color(0xFFEF4444),
                size: 40.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Gagal Memuat Data',
              style: GoogleFonts.inter(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A1A),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Silakan coba lagi nanti',
              style: GoogleFonts.inter(
                fontSize: 14.0,
                color: Color(0xFF6B7280),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                color: Color(0xFFFEF3C7),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.info_outline_rounded,
                color: Color(0xFFF59E0B),
                size: 40.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Data UPZ Tidak Ditemukan',
              style: GoogleFonts.inter(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A1A),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard(dynamic upzData) {
    final unitName = getJsonField(upzData, r'$.unit_name')?.toString() ?? 'UPZ';
    final noRegister =
        getJsonField(upzData, r'$.no_register')?.toString() ?? '-';
    final category = _getWilayahKerja(getJsonField(upzData, r'$.category_id'));

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1A3C34), Color(0xFF259148)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 12.0,
            color: Color(0xFF259148).withOpacity(0.3),
            offset: Offset(0.0, 4.0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 56.0,
                height: 56.0,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Icon(
                  Icons.account_balance_outlined,
                  color: Colors.white,
                  size: 28.0,
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      unitName,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'No. Reg: $noRegister',
                      style: GoogleFonts.inter(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 13.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                  size: 16.0,
                ),
                SizedBox(width: 4.0),
                Text(
                  category,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }

  Widget _buildInfoSection(
      BuildContext context, String title, List<_InfoItem> items) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 8.0,
            color: Color(0xFF000000).withOpacity(0.04),
            offset: Offset(0.0, 2.0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
            child: Row(
              children: [
                Container(
                  width: 4.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF259148),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
                SizedBox(width: 12.0),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    color: Color(0xFF1A1A1A),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Column(
              children: items.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                return Column(
                  children: [
                    _buildInfoItem(item),
                    if (index < items.length - 1)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: Color(0xFFF3F4F6),
                        ),
                      ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }

  Widget _buildInfoItem(_InfoItem item) {
    return Row(
      crossAxisAlignment: item.isMultiline
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: Color(0xFFE8F5E9),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Icon(
            item.icon,
            color: Color(0xFF259148),
            size: 20.0,
          ),
        ),
        SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.label,
                style: GoogleFonts.inter(
                  color: Color(0xFF6B7280),
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 2.0),
              Text(
                item.value,
                style: GoogleFonts.inter(
                  color: Color(0xFF1A1A1A),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getWilayahKerja(dynamic categoryId) {
    if (categoryId == 4) return 'DKM';
    if (categoryId == 3) return 'Desa';
    return 'Kecamatan';
  }
}

class _InfoItem {
  final IconData icon;
  final String label;
  final String value;
  final bool isMultiline;

  _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
    this.isMultiline = false,
  });
}
