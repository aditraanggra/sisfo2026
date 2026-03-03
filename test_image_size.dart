import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

void main() async {
  final img = await networkImage('https://via.placeholder.com/300');
  print('Width: ${img.width}');
  print('Height: ${img.height}');
}
