import '/backend/api_requests/api_calls.dart';
import '/auth/custom_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sukses_laporan_model.dart';
export 'sukses_laporan_model.dart';

class SuksesLaporanWidget extends StatefulWidget {
  final String noReferensi;
  final int reportId;
  final String? unitName;
  final File? fotoKegiatan;
  final File? beritaAcara;

  const SuksesLaporanWidget({
    super.key,
    required this.noReferensi,
    required this.reportId,
    this.unitName,
    this.fotoKegiatan,
    this.beritaAcara,
  });

  static String routeName = 'SuksesLaporan';
  static String routePath = '/sukses-laporan';

  @override
  State<SuksesLaporanWidget> createState() => _SuksesLaporanWidgetState();
}

class _SuksesLaporanWidgetState extends State<SuksesLaporanWidget> {
  late SuksesLaporanModel _model;
  bool _uploading = false;
  double _uploadProgress = 0;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuksesLaporanModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<void> _uploadFiles() async {
    setState(() => _uploading = true);

    final files = <File>[];
    if (widget.fotoKegiatan != null) files.add(widget.fotoKegiatan!);
    if (widget.beritaAcara != null) files.add(widget.beritaAcara!);

    for (var i = 0; i < files.length; i++) {
      final file = files[i];
      final isFoto = file == widget.fotoKegiatan;

      final bytes = await file.readAsBytes();
      final uploadedFile = FFUploadedFile(
        name: file.path.split('/').last,
        bytes: bytes,
      );

      await LaporanKurbanEndPointGroup.uploadDokumentasiCall.call(
        token: currentAuthenticationToken,
        laporanKurbanId: widget.reportId,
        file: uploadedFile,
        jenis: isFoto ? 'foto_kegiatan' : 'berita_acara',
      );

      setState(() {
        _uploadProgress = ((i + 1) / files.length);
      });
    }

    setState(() => _uploading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: ModernColors.primaryDark,
        automaticallyImplyLeading: false,
        title: Text(
          'Laporan Berhasil',
          style: GoogleFonts.inter(
            color: ModernColors.textOnDark,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(ModernSpacing.lg),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFF1D9E75).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: Color(0xFF1D9E75),
                  size: 48,
                ),
              ),
              const SizedBox(height: ModernSpacing.lg),
              Text(
                'Laporan berhasil dikirim',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: ModernColors.textPrimary,
                ),
              ),
              if (widget.unitName != null) ...[
                const SizedBox(height: ModernSpacing.sm),
                Text(
                  widget.unitName!,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: ModernColors.textSecondary,
                  ),
                ),
              ],
              const SizedBox(height: ModernSpacing.lg),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(ModernSpacing.md),
                decoration: BoxDecoration(
                  color: ModernColors.backgroundMint,
                  borderRadius: BorderRadius.circular(ModernRadius.md),
                  border: Border.all(
                    color: ModernColors.primaryAccent.withOpacity(0.3),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Kode Referensi',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: ModernColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: ModernSpacing.sm),
                    Text(
                      widget.noReferensi,
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: ModernColors.primaryDark,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: ModernSpacing.sm),
                    TextButton.icon(
                      onPressed: () {
                        Clipboard.setData(
                            ClipboardData(text: widget.noReferensi));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Kode referensi disalin'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      icon: const Icon(Icons.copy, size: 16),
                      label: Text(
                        'Salin kode',
                        style: GoogleFonts.inter(fontSize: 12),
                      ),
                      style: TextButton.styleFrom(
                        foregroundColor: ModernColors.primaryAccent,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: ModernSpacing.lg),
              if (_uploading) ...[
                LinearProgressIndicator(
                  value: _uploadProgress,
                  backgroundColor:
                      ModernColors.primaryAccent.withOpacity(0.2),
                  valueColor: const AlwaysStoppedAnimation<Color>(
                      ModernColors.primaryAccent),
                ),
                const SizedBox(height: ModernSpacing.sm),
                Text(
                  'Mengunggah dokumentasi...',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: ModernColors.textSecondary,
                  ),
                ),
                const SizedBox(height: ModernSpacing.lg),
              ],
              if (widget.fotoKegiatan != null ||
                  widget.beritaAcara != null)
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed:
                        _uploading ? null : _uploadFiles,
                    icon: const Icon(Icons.cloud_upload_outlined, size: 18),
                    label: Text(
                      'Unggah dokumentasi sekarang',
                      style: GoogleFonts.inter(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: ModernColors.primaryAccent,
                      side: const BorderSide(color: ModernColors.primaryAccent),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(ModernRadius.sm),
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: ModernSpacing.md),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.goNamed('Home'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ModernColors.primaryAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(ModernRadius.sm),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Kembali ke Beranda',
                    style: GoogleFonts.inter(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
