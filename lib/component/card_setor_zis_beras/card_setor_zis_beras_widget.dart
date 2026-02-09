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
    bool isSelected = _model.checkboxValue ?? false;

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.transparent
              : FlutterFlowTheme.of(context).secondaryBackground,
          gradient: isSelected
              ? LinearGradient(
                  colors: [Color(0xFF259148), Color(0xFF124F23)],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(0.5, -1.0),
                  end: AlignmentDirectional(-0.5, 1.0),
                )
              : null,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
          border: isSelected
              ? null
              : Border.all(
                  color: Color(0xFF259148),
                  width: 1.0,
                ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.namaZis,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w600,
                          ),
                          color: isSelected ? Colors.white : Color(0xFF259148),
                          fontSize: 14.0,
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
                              fontWeight: FontWeight.bold,
                            ),
                            color: isSelected
                                ? Colors.white
                                : FlutterFlowTheme.of(context).primaryText,
                            fontSize: 18.0,
                          ),
                    ),
                  ),
                ],
              ),
              Theme(
                data: ThemeData(
                  checkboxTheme: CheckboxThemeData(
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  unselectedWidgetColor: Color(0xFF259148),
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
                  side: BorderSide(
                    width: 2,
                    color: isSelected ? Colors.white : Color(0xFF259148),
                  ),
                  activeColor: Colors.white,
                  checkColor: Color(0xFF259148),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
