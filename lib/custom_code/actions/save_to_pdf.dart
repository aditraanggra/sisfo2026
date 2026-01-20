// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<void> saveToPdf(
  //Kelembagaan
  String? nama,
  String? noReg,
  String? alamat,
  String? desa,
  String? kecamatan,
  //Penerimaan
  // String? totalZis,
  String? totalZf,
  //String? totalMuzakki,
  // String? sisaSaldo,
  //String? tPenerimaanZfUang,
  //String? tPenerimaanZfBeras,
  String? jmlMuzakkiZf,
  String? tPenerimaanZm,
  String? jmlMuzakkiZm,
  String? tPenerimaanIfs,
  String? jmlMunfiqIfs,
  //Pendistribusian
  String? jmlMustahikZf,
  String? jmlMustahikZm,
  String? jmlMustahikIfs,
  String? jmlAmilZf,
  String? jmlAmilZm,
  String? jmlAmilIfs,
  //String? totalPendis,
  String? pendisZf,
  String? pendisZm,
  String? pendisIfs,
  //String? pendisFakir,
  //String? pendisMiskin,
  //String? pendisFs,
  //String? pendisAmil,
  //String? pendisKemanusiaan,
  //String? pendisDakwah,
  //String? pendisOp,
  //Hak Amil
  //String? tHakAmil,
  //String? pHakAmil,
  //String? sHakAmil,
  String? jmlSetorZf,
  String? jmlSetorZm,
  String? jmlSetorIfs,
  //Tanda Tangan
  String? kepda,
  String? ketua,
  String? sekretaris,
  String? bendahara,
) async {
// null safety

  final pdf = pw.Document();

  //final logo = await rootBundle.load('assets/images/KABUPATEN_CIANJUR_(1).png');
  //final imageBytes = logo.buffer.asUint8List();

  //pw.Image logoBaznas = pw.Image(pw.MemoryImage(imageBytes));

  final logo = await networkImage(
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/upzhub-i1h4i5/assets/xqlizqwh4zjg/logo_BAZNAS_CIANJUR.png');

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (context) => [
        pw.Header(
            level: 0,
            child: pw.Container(
                alignment: pw.Alignment.center,
                padding: pw.EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                child: pw.Column(children: [
                  pw.Container(
                      height: 80,
                      padding: pw.EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: pw.Image(logo, fit: pw.BoxFit.contain)),
                  pw.Text('LAPORAN PENGELOLAAN DANA ZIS',
                      style: pw.TextStyle(
                          fontSize: 12, fontWeight: pw.FontWeight.bold)),
                  pw.Text('TAHUN 2025',
                      style: pw.TextStyle(
                          fontSize: 12, fontWeight: pw.FontWeight.bold)),
                ]))),

        //KELEMBAGAAN
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Nama UPZ    :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(nama ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('No Register :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(noReg ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Alamat      :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(alamat ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Desa        :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(desa ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Kecamatan   :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(kecamatan ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        // Generated code for this Divider Widget...
        pw.Divider(
          thickness: 1,
        ),

        //ZAKAT FITRAH
        pw.Text('1. Laporan Penerimaan dan penyaluran Zakat Fitrah',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            textAlign: pw.TextAlign.center),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Total Penerimaan (Uang | Beras)  :',
              style: pw.TextStyle(fontSize: 11)),
          pw.Text(totalZf ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Total Pendistribusian (Uang | Beras)   :',
              style: pw.TextStyle(fontSize: 11)),
          pw.Text(pendisZf ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Jumlah Muzakki   :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(jmlMuzakkiZf ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Jumlah Mustahik   :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(jmlMustahikZf ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Jumlah Amil   :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(jmlAmilZf ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Dana Yang disetor ke BAZNAS (30%)   :',
              style: pw.TextStyle(fontSize: 11)),
          pw.Text(jmlSetorZf ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Divider(
          thickness: 1,
        ),

        //ZAKAT MAL
        pw.Text('2. Laporan Penerimaan dan penyaluran Zakat Mal',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            textAlign: pw.TextAlign.center),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Total Penerimaan :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(tPenerimaanZm ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Total Pendistribusian :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(pendisZm ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Jumlah Muzakki   :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(jmlMuzakkiZm ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Jumlah Mustahik   :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(jmlMustahikZm ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Jumlah Amil   :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(jmlAmilZm ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Dana Yang disetor ke BAZNAS (30%)   :',
              style: pw.TextStyle(fontSize: 11)),
          pw.Text(jmlSetorZm ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Divider(
          thickness: 1,
        ),

        //INFAK SEDEKAH
        pw.Text('3. Laporan Penerimaan dan penyaluran Infak Sedekah',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            textAlign: pw.TextAlign.center),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Total Penerimaan :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(tPenerimaanIfs ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Total Pendistribusian :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(pendisIfs ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Jumlah Muzakki   :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(jmlMunfiqIfs ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Jumlah Mustahik   :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(jmlMustahikIfs ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Jumlah Amil   :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(jmlAmilIfs ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Dana Yang disetor ke BAZNAS (30%)   :',
              style: pw.TextStyle(fontSize: 11)),
          pw.Text(jmlSetorIfs ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Divider(
          thickness: 1,
        ),

        /*
        pw.Text('2. Rincian Penerimaan ZIS',
            style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
            textAlign: pw.TextAlign.center),

        pw.Text(
          '2.A. Zakat Fitrah',
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10),
        ),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Total Penerimaan Uang  :',
              style: pw.TextStyle(fontSize: 11)),
          pw.Text(tPenerimaanZfUang ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Total Penerimaan Beras  :',
              style: pw.TextStyle(fontSize: 11)),
          pw.Text(tPenerimaanZfBeras ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Jumlah Muzakki  :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(jmlMuzakkiZf ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Divider(
          thickness: 1,
        ),
        pw.Text(
          '2.B Zakat Mal',
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10),
        ),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Total Penerimaan  :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(tPenerimaanZm ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Jumlah Muzakki  :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(jmlMuzakkiZm ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Divider(
          thickness: 1,
        ),
        pw.Text(
          '2.C Infak Sedekah',
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10),
        ),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Total Penerimaan  :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(tPenerimaanIfs ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Jumlah Muzakki  :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(jmlMuzakkiIfs ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Divider(
          thickness: 1,
        ),
        pw.Text('3. Rincian Penyaluran ZIS',
            style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
            textAlign: pw.TextAlign.center),
        pw.Text(
          '3.A Berdasarkan Sumber Dana',
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10),
        ),

        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Zakat Fitrah ( 87,5% dari dana yang dikelola)  :',
              style: pw.TextStyle(fontSize: 11)),
          pw.Text(pendisZf ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Zakat Mal ( 87,5% dari dana yang dikelola) :',
              style: pw.TextStyle(fontSize: 11)),
          pw.Text(pendisZm ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Infak Sedekah ( 80% dari dana yang dikelola) :',
              style: pw.TextStyle(fontSize: 11)),
          pw.Text(pendisIfs ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Divider(
          thickness: 1,
        ),
        */

        /*
        pw.Text(
          '3.B Berdasarkan Asnaf',
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10),
        ),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Fakir  :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(pendisFakir ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Miskin  :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(pendisMiskin ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Fiesabilillah  :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(pendisFs ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Amil  :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(pendisAmil ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Divider(
          thickness: 1,
        ),
        pw.Text(
          '3.C Berdasarkan Program',
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10),
        ),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Kemanusiaan  :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(pendisKemanusiaan ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Dakwah  :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(pendisDakwah ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Operasional  :', style: pw.TextStyle(fontSize: 11)),
          pw.Text(pendisOp ?? '', style: pw.TextStyle(fontSize: 11)),
        ]),
        */

        pw.Container(
          alignment: pw.Alignment.bottomCenter,
          padding: pw.EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
          height: 80,
          child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(kepda ?? '', style: pw.TextStyle(fontSize: 11)),
                pw.Text(ketua ?? '', style: pw.TextStyle(fontSize: 11)),
                pw.Text(sekretaris ?? '', style: pw.TextStyle(fontSize: 11)),
                pw.Text(bendahara ?? '', style: pw.TextStyle(fontSize: 11)),
              ]),
        )
      ],
    ),
  );

  //final file = File('${noReg}.pdf');

  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}
