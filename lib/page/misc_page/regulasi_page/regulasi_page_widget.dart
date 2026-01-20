import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'regulasi_page_model.dart';
export 'regulasi_page_model.dart';

class RegulasiPageWidget extends StatefulWidget {
  const RegulasiPageWidget({super.key});

  static String routeName = 'RegulasiPage';
  static String routePath = '/regulasiPage';

  @override
  State<RegulasiPageWidget> createState() => _RegulasiPageWidgetState();
}

class _RegulasiPageWidgetState extends State<RegulasiPageWidget> {
  late RegulasiPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegulasiPageModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
                title: Text(
                  'Juknis Pengelolaan ZIS',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        font: GoogleFonts.notoSans(
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                        color: Colors.white,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 2.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (FFAppState().profileUPZ.categoryId == 4)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 24.0),
                  child: FlutterFlowPdfViewer(
                    assetPath:
                        'assets/pdfs/UPZ_DKM_RW_JUKLAK_JUKNIS_RAMADHAN_1446_H.pdf',
                    height: 438.89,
                    horizontalScroll: false,
                  ),
                ),
              if (FFAppState().profileUPZ.categoryId == 3)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 24.0),
                  child: FlutterFlowPdfViewer(
                    assetPath:
                        'assets/pdfs/UPZ_DKM_RW_JUKLAK_JUKNIS_RAMADHAN_1446_H.pdf',
                    height: 438.9,
                    horizontalScroll: false,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
