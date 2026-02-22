import 'dart:io';

void main() {
  final directories = [
    Directory('lib/page/transaksi'),
    Directory('lib/page/main_page/laporan'),
    Directory('lib/page/main_page/home'),
    Directory('lib/page/misc_page/tahun_pengelolaan'),
  ];

  final replacements = {
    'ModernColors.backgroundCard':
        'FlutterFlowTheme.of(context).secondaryBackground',
    'ModernColors.backgroundPrimary':
        'FlutterFlowTheme.of(context).primaryBackground',
    'ModernColors.textPrimary': 'FlutterFlowTheme.of(context).primaryText',
    'ModernColors.textSecondary': 'FlutterFlowTheme.of(context).secondaryText',
    'ModernColors.backgroundMint':
        'FlutterFlowTheme.of(context).backgroundMint',
    'ModernColors.primaryAccent': 'FlutterFlowTheme.of(context).primary',
    'ModernColors.primaryDark': 'FlutterFlowTheme.of(context).primaryDark',
    'ModernColors.expenseRed': 'FlutterFlowTheme.of(context).error',
    'ModernColors.incomeGreen': 'FlutterFlowTheme.of(context).success',
    'ModernColors.goldAccent': 'FlutterFlowTheme.of(context).warning',
    'ModernColors.textOnDark': 'FlutterFlowTheme.of(context).info',
  };

  for (final dir in directories) {
    if (!dir.existsSync()) {
      print('Directory ${dir.path} does not exist.');
      continue;
    }
    final files = dir
        .listSync(recursive: true)
        .whereType<File>()
        .where((f) => f.path.endsWith('.dart'));
    int count = 0;
    for (final file in files) {
      String content = file.readAsStringSync();
      bool changed = false;
      replacements.forEach((key, value) {
        if (content.contains(key)) {
          content = content.replaceAll(key, value);
          changed = true;
        }
      });
      if (changed) {
        file.writeAsStringSync(content);
        print('Updated ${file.path}');
        count++;
      }
    }
    print('Updated $count files in ${dir.path}');
  }
}
