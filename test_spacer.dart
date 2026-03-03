import 'package:pdf/widgets.dart' as pw;

void main() {
  pw.Row(
    children: [
      pw.Spacer(flex: 15),
      pw.Expanded(flex: 70, child: pw.SizedBox()),
      pw.Spacer(flex: 15),
    ],
  );
  print('success');
}
