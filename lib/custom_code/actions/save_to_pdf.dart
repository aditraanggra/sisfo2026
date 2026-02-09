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
  List<dynamic>? listSetoran,
) async {
  final pdf = pw.Document();

  final logo = await networkImage(
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/upzhub-i1h4i5/assets/xqlizqwh4zjg/logo_BAZNAS_CIANJUR.png');

  final List<pw.ImageProvider?> setoranImages = [];
  if (listSetoran != null) {
    for (var item in listSetoran) {
      final url = item['upload'];
      if (url != null && url is String && url.isNotEmpty) {
        try {
          setoranImages.add(await networkImage(url));
        } catch (e) {
          setoranImages.add(null);
        }
      } else {
        setoranImages.add(null);
      }
    }
  }

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.all(32),
      build: (context) => [
        // HEADER
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Container(
              width: 60,
              height: 60,
              child: pw.Image(logo, fit: pw.BoxFit.contain),
            ),
            pw.SizedBox(width: 16),
            pw.Expanded(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.Text('BADAN AMIL ZAKAT NASIONAL (BAZNAS)',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold)),
                  pw.Text('KABUPATEN CIANJUR',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(height: 4),
                  pw.Text('LAPORAN PENGELOLAAN ZIS',
                      style: pw.TextStyle(
                          fontSize: 12, fontWeight: pw.FontWeight.bold)),
                  pw.Text('TAHUN ${DateTime.now().year}',
                      style: pw.TextStyle(fontSize: 12)),
                ],
              ),
            ),
            pw.SizedBox(width: 60), // Spacer for balance
          ],
        ),
        pw.Divider(thickness: 2),
        pw.SizedBox(height: 10),

        // INFO UPZ
        pw.Container(
          padding: pw.EdgeInsets.all(10),
          decoration: pw.BoxDecoration(
            border: pw.Border.all(color: PdfColors.grey400),
            borderRadius: pw.BorderRadius.circular(4),
          ),
          child: pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow('Nama UPZ', nama),
                    _buildInfoRow('No Register', noReg),
                  ],
                ),
              ),
              pw.SizedBox(width: 16),
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow('Desa/Kelurahan', desa),
                    _buildInfoRow('Kecamatan', kecamatan),
                  ],
                ),
              ),
            ],
          ),
        ),
        pw.SizedBox(height: 20),

        // TABLE DATA
        pw.Table(
          border: pw.TableBorder.all(color: PdfColors.grey400, width: 0.5),
          columnWidths: {
            0: pw.FlexColumnWidth(3),
            1: pw.FlexColumnWidth(1),
          },
          children: [
            // HEADER TABLE
            pw.TableRow(
              decoration: pw.BoxDecoration(color: PdfColors.grey200),
              children: [
                pw.Padding(
                  padding: pw.EdgeInsets.all(6),
                  child: pw.Text('URAIAN',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      textAlign: pw.TextAlign.center),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.all(6),
                  child: pw.Text('JUMLAH',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      textAlign: pw.TextAlign.center),
                ),
              ],
            ),

            // 1. ZAKAT FITRAH
            _buildTableHeaderRow('1. PENERIMAAN DAN PENYALURAN ZAKAT FITRAH'),
            _buildTableRow('Total Penerimaan (Uang | Beras)', totalZf),
            _buildTableRow('Total Pendistribusian (Uang | Beras)', pendisZf),
            _buildTableRow('Jumlah Muzakki', jmlMuzakkiZf),
            _buildTableRow('Jumlah Mustahik', jmlMustahikZf),
            _buildTableRow('Jumlah Amil', jmlAmilZf),
            _buildTableRow('Setoran ke BAZNAS (30%)', jmlSetorZf, isBold: true),

            // 2. ZAKAT MAAL
            _buildTableHeaderRow('2. PENERIMAAN DAN PENYALURAN ZAKAT MAAL'),
            _buildTableRow('Total Penerimaan', tPenerimaanZm),
            _buildTableRow('Total Pendistribusian', pendisZm),
            _buildTableRow('Jumlah Muzakki', jmlMuzakkiZm),
            _buildTableRow('Jumlah Mustahik', jmlMustahikZm),
            _buildTableRow('Jumlah Amil', jmlAmilZm),
            _buildTableRow('Setoran ke BAZNAS (30%)', jmlSetorZm, isBold: true),

            // 3. INFAK SEDEKAH
            _buildTableHeaderRow('3. PENERIMAAN DAN PENYALURAN INFAK SEDEKAH'),
            _buildTableRow('Total Penerimaan', tPenerimaanIfs),
            _buildTableRow('Total Pendistribusian', pendisIfs),
            _buildTableRow('Jumlah Munfiq', jmlMunfiqIfs),
            _buildTableRow('Jumlah Mustahik', jmlMustahikIfs),
            _buildTableRow('Jumlah Amil', jmlAmilIfs),
            _buildTableRow('Setoran ke BAZNAS (30%)', jmlSetorIfs,
                isBold: true),
          ],
        ),

        if (listSetoran != null && listSetoran.isNotEmpty) ...[
          pw.Header(
              level: 1,
              child: pw.Text('REKAP SETORAN UPZ',
                  style: pw.TextStyle(
                      fontSize: 14, fontWeight: pw.FontWeight.bold))),
          pw.SizedBox(height: 20),
          pw.Table(
            border: pw.TableBorder.all(color: PdfColors.grey400, width: 0.5),
            columnWidths: {
              0: pw.FlexColumnWidth(2),
              1: pw.FlexColumnWidth(2),
              2: pw.FlexColumnWidth(2),
              3: pw.FlexColumnWidth(3),
            },
            children: [
              pw.TableRow(
                decoration: pw.BoxDecoration(color: PdfColors.grey200),
                children: [
                  _buildHeaderCell('TANGGAL'),
                  _buildHeaderCell('JUMLAH (Rp)'),
                  _buildHeaderCell('KET (BERAS)'),
                  _buildHeaderCell('BUKTI SETOR'),
                ],
              ),
              ...List.generate(listSetoran.length, (index) {
                final item = listSetoran[index];
                final img =
                    setoranImages.length > index ? setoranImages[index] : null;
                return pw.TableRow(
                  children: [
                    pw.Padding(
                        padding: pw.EdgeInsets.all(5),
                        child: pw.Text(item['trx_date'] ?? '-',
                            style: pw.TextStyle(fontSize: 10))),
                    pw.Padding(
                        padding: pw.EdgeInsets.all(5),
                        child: pw.Text(
                            formatNumber(
                              item['total_deposit'],
                              formatType: FormatType.custom,
                              currency: 'Rp ',
                              format: '###,###',
                              locale: 'ID',
                            ),
                            style: pw.TextStyle(fontSize: 10),
                            textAlign: pw.TextAlign.right)),
                    pw.Padding(
                        padding: pw.EdgeInsets.all(5),
                        child: pw.Text(
                            formatNumber(
                                  item['zf_rice_deposit'],
                                  formatType: FormatType.custom,
                                  format: '###,###',
                                  locale: 'ID',
                                ) +
                                ' Kg',
                            style: pw.TextStyle(fontSize: 10),
                            textAlign: pw.TextAlign.right)),
                    pw.Padding(
                      padding: pw.EdgeInsets.all(5),
                      child: img != null
                          ? pw.Container(
                              height: 80,
                              child: pw.Image(img, fit: pw.BoxFit.contain))
                          : pw.Text('-'),
                    ),
                  ],
                );
              }),
            ],
          ),
          pw.SizedBox(height: 40),
        ],

        // MOVED SIGNATURE SECTION
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            _buildSignatureBlock('Mengetahui,', kepda ?? 'Kepala Desa',
                nama: ''),
            _buildSignatureBlock('Ketua UPZ', ketua),
            pw.SizedBox(width: 10),
            _buildSignatureBlock('Bendahara', bendahara),
          ],
        ),

        pw.SizedBox(height: 40),
        pw.Center(
            child: pw.Text(
                'Laporan ini dicetak otomatis pada ${DateTime.now().year}',
                style: pw.TextStyle(fontSize: 10, color: PdfColors.grey600))),
      ],
    ),
  );

  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}

pw.Widget _buildInfoRow(String label, String? value) {
  return pw.Padding(
    padding: pw.EdgeInsets.symmetric(vertical: 2),
    child: pw.Row(
      children: [
        pw.SizedBox(
            width: 80,
            child: pw.Text('$label', style: pw.TextStyle(fontSize: 10))),
        pw.Text(': ', style: pw.TextStyle(fontSize: 10)),
        pw.Expanded(
            child: pw.Text(value ?? '-',
                style: pw.TextStyle(
                    fontSize: 10, fontWeight: pw.FontWeight.bold))),
      ],
    ),
  );
}

pw.TableRow _buildTableHeaderRow(String title) {
  return pw.TableRow(
    children: [
      pw.Padding(
        padding: pw.EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        child: pw.Text(title,
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10)),
      ),
      pw.Padding(padding: pw.EdgeInsets.all(4), child: pw.Text('')),
    ],
  );
}

pw.TableRow _buildTableRow(String label, String? value, {bool isBold = false}) {
  return pw.TableRow(
    children: [
      pw.Padding(
        padding: pw.EdgeInsets.only(left: 16, top: 4, bottom: 4, right: 4),
        child: pw.Text(label,
            style: pw.TextStyle(
                fontSize: 10, fontWeight: isBold ? pw.FontWeight.bold : null)),
      ),
      pw.Padding(
        padding: pw.EdgeInsets.all(4),
        child: pw.Text(value ?? '-',
            style: pw.TextStyle(
                fontSize: 10, fontWeight: isBold ? pw.FontWeight.bold : null),
            textAlign: pw.TextAlign.right),
      ),
    ],
  );
}

pw.Widget _buildSignatureBlock(String title, String? name, {String? nama}) {
  return pw.Column(
    children: [
      pw.Text(title, style: pw.TextStyle(fontSize: 11)),
      pw.SizedBox(height: 50),
      pw.Container(
        width: 120,
        decoration: pw.BoxDecoration(
          border: pw.Border(bottom: pw.BorderSide(width: 1)),
        ),
        child: pw.Text(name ?? '(....................)',
            style: pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold),
            textAlign: pw.TextAlign.center),
      ),
    ],
  );
}

pw.Widget _buildHeaderCell(String text) {
  return pw.Padding(
    padding: pw.EdgeInsets.all(5),
    child: pw.Text(
      text,
      style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10),
      textAlign: pw.TextAlign.center,
    ),
  );
}
