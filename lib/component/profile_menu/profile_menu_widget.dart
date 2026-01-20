import '/auth/custom_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_menu_model.dart';
export 'profile_menu_model.dart';

class ProfileMenuWidget extends StatefulWidget {
  const ProfileMenuWidget({super.key});

  @override
  State<ProfileMenuWidget> createState() => _ProfileMenuWidgetState();
}

class _ProfileMenuWidgetState extends State<ProfileMenuWidget> {
  late ProfileMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileMenuModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          context.pushNamed(
            ProfilUPZWidget.routeName,
            queryParameters: {
              'katUpz': serializeParam(
                FFAppState().profileUPZ.categoryId.toString(),
                ParamType.String,
              ),
              'namaUpz': serializeParam(
                FFAppState().profileUPZ.unitName,
                ParamType.String,
              ),
              'alamatUpz': serializeParam(
                FFAppState().profileUPZ.address,
                ParamType.String,
              ),
              'registerUpz': serializeParam(
                FFAppState().profileUPZ.noRegister,
                ParamType.String,
              ),
              'ketua': serializeParam(
                FFAppState().profileUPZ.unitLeader,
                ParamType.String,
              ),
              'sekretaris': serializeParam(
                FFAppState().profileUPZ.unitAssistant,
                ParamType.String,
              ),
              'bendahara': serializeParam(
                FFAppState().profileUPZ.unitFinance,
                ParamType.String,
              ),
              'desa': serializeParam(
                FFAppState().profileUPZ.villageName,
                ParamType.String,
              ),
              'kecamatan': serializeParam(
                FFAppState().profileUPZ.districtName,
                ParamType.String,
              ),
              'operator': serializeParam(
                currentUserData?.name,
                ParamType.String,
              ),
              'noSk': serializeParam(
                FFAppState().profileUPZ.noSk,
                ParamType.String,
              ),
            }.withoutNulls,
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FaIcon(
                  FontAwesomeIcons.book,
                  color: Color(0xFF259148),
                  size: 20.0,
                ),
                Expanded(
                  child: Text(
                    'Profil UPZ',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.notoSans(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 20.0,
                ),
              ].divide(SizedBox(width: 8.0)),
            ),
          ],
        ),
      ),
    );
  }
}
