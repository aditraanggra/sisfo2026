import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'card_setor_zis_beras_model.dart';
export 'card_setor_zis_beras_model.dart';

class CardSetorZisBerasWidget extends StatefulWidget {
  const CardSetorZisBerasWidget({
    super.key,
    String? namaZis,
    required this.nominalSetor,
    required this.updateStateSetor,
    required this.resetSetor,
    required this.setCurrentSetor,
  }) : this.namaZis = namaZis ?? 'nama_zis';

  final String namaZis;
  final double? nominalSetor;
  final Future Function()? updateStateSetor;
  final Future Function()? resetSetor;
  final Future Function()? setCurrentSetor;

  @override
  State<CardSetorZisBerasWidget> createState() =>
      _CardSetorZisBerasWidgetState();
}

class _CardSetorZisBerasWidgetState extends State<CardSetorZisBerasWidget> {
  late CardSetorZisBerasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardSetorZisBerasModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await widget.setCurrentSetor?.call();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
      child: Container(
        width: 402.0,
        height: 80.0,
        decoration: BoxDecoration(
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
          gradient: LinearGradient(
            colors: [Color(0xFF259148), Color(0xFF124F23)],
            stops: [0.0, 1.0],
            begin: AlignmentDirectional(0.5, -1.0),
            end: AlignmentDirectional(-0.5, 1.0),
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.namaZis,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).info,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        formatNumber(
                          widget.nominalSetor,
                          formatType: FormatType.custom,
                          format: '##.## Kg',
                          locale: 'ID',
                        ),
                        '0',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.notoSans(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).info,
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
              child: Theme(
                data: ThemeData(
                  checkboxTheme: CheckboxThemeData(
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  unselectedWidgetColor: FlutterFlowTheme.of(context).info,
                ),
                child: Checkbox(
                  value: _model.checkboxValue ??= false,
                  onChanged: (newValue) async {
                    safeSetState(() => _model.checkboxValue = newValue!);
                    if (newValue!) {
                      unawaited(
                        () async {
                          await widget.updateStateSetor?.call();
                        }(),
                      );
                    } else {
                      unawaited(
                        () async {
                          await widget.resetSetor?.call();
                        }(),
                      );
                    }
                  },
                  side: (FlutterFlowTheme.of(context).info != null)
                      ? BorderSide(
                          width: 2,
                          color: FlutterFlowTheme.of(context).info,
                        )
                      : null,
                  activeColor: Color(0xFFFDC727),
                  checkColor: Color(0xFF259148),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
