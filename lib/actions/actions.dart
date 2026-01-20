import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future underDevelpment(BuildContext context) async {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'Sedang dalam pengembangan',
        style: FlutterFlowTheme.of(context).labelMedium.override(
              font: GoogleFonts.notoSans(
                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
              ),
              color: FlutterFlowTheme.of(context).info,
              letterSpacing: 0.0,
              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
            ),
        textAlign: TextAlign.center,
      ),
      duration: Duration(milliseconds: 2500),
      backgroundColor: Color(0xFF259148),
    ),
  );
}

Future choiceDate(BuildContext context) async {}
