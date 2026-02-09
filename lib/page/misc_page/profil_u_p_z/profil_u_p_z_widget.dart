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
        backgroundColor: Color(0xFFF1F4F8),
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
                        font: GoogleFonts.outfit(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                        ),
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
              // Customize what your widget looks like when it's loading.
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
                return Center(
                  child: Text('Gagal memuat data. Silakan coba lagi.'),
                );
              }

              // Assume the first item is the user's UPZ data
              final upzDataList = AuthEndPointGroup.getUPZCall.dataUpz(
                columnGetUPZResponse.jsonBody,
              );

              if (upzDataList == null || upzDataList.isEmpty) {
                return Center(child: Text('Data UPZ tidak ditemukan.'));
              }

              final upzData = upzDataList.first;

              return SingleChildScrollView(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Informasi Lembaga',
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.outfit(
                                      color: Color(0xFF259148),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                            ),
                            Divider(
                              height: 24.0,
                              thickness: 1.0,
                              color: Color(0xFFE0E3E7),
                            ),
                            _buildInfoRow(
                                context,
                                'Nama UPZ',
                                getJsonField(upzData, r'$.unit_name')
                                        ?.toString() ??
                                    '-'),
                            _buildInfoRow(
                                context,
                                'No. Register',
                                getJsonField(upzData, r'$.no_register')
                                        ?.toString() ??
                                    '-'),
                            _buildInfoRow(
                                context,
                                'No. SK',
                                getJsonField(upzData, r'$.no_sk')?.toString() ??
                                    '-'),
                            _buildInfoRow(
                                context,
                                'Wilayah Kerja',
                                (getJsonField(upzData, r'$.category_id') == 4
                                    ? 'DKM'
                                    : getJsonField(upzData, r'$.category_id') ==
                                            3
                                        ? 'Desa'
                                        : 'Kecamatan')),
                            _buildInfoRow(
                                context,
                                'Desa',
                                getJsonField(upzData, r'$.village_name')
                                        ?.toString() ??
                                    '-'),
                            _buildInfoRow(
                                context,
                                'Kecamatan',
                                getJsonField(upzData, r'$.district_name')
                                        ?.toString() ??
                                    '-'),
                            _buildInfoRow(
                                context,
                                'Alamat',
                                getJsonField(upzData, r'$.address')
                                        ?.toString() ??
                                    '-'),
                          ].divide(SizedBox(height: 12.0)),
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!),
                    SizedBox(height: 16.0),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pengurus',
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.outfit(
                                      color: Color(0xFF259148),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                            ),
                            Divider(
                              height: 24.0,
                              thickness: 1.0,
                              color: Color(0xFFE0E3E7),
                            ),
                            _buildInfoRow(
                                context,
                                'Ketua',
                                getJsonField(upzData, r'$.unit_leader')
                                        ?.toString() ??
                                    '-'),
                            _buildInfoRow(
                                context,
                                'Sekretaris',
                                getJsonField(upzData, r'$.unit_assistant')
                                        ?.toString() ??
                                    '-'),
                            _buildInfoRow(
                                context,
                                'Bendahara',
                                getJsonField(upzData, r'$.unit_finance')
                                        ?.toString() ??
                                    '-'),
                            _buildInfoRow(context, 'Operator',
                                currentUserData?.name ?? '-'),
                          ].divide(SizedBox(height: 12.0)),
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Text(
            label,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.outfit(
                    color: Color(0xFF57636C),
                    fontWeight: FontWeight.w500,
                  ),
                ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            value,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.outfit(
                    color: Color(0xFF14181B),
                    fontWeight: FontWeight.w600,
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
