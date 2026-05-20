import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/backend/cloudinary/cloudinary_service.dart';
import '/backend/cloudinary/cloudinary_config.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'step_dokumentasi_model.dart';
export 'step_dokumentasi_model.dart';

class StepDokumentasiWidget extends StatefulWidget {
  final File? fotoKegiatan;
  final File? beritaAcara;
  final String? fotoKegiatanUrl;
  final String? beritaAcaraUrl;
  final ValueChanged<File?> onFotoKegiatanChanged;
  final ValueChanged<File?> onBeritaAcaraChanged;
  final ValueChanged<String?> onFotoKegiatanUrlChanged;
  final ValueChanged<String?> onBeritaAcaraUrlChanged;
  final ValueChanged<String?> onFotoKegiatanPathChanged;
  final ValueChanged<String?> onBeritaAcaraPathChanged;

  const StepDokumentasiWidget({
    super.key,
    this.fotoKegiatan,
    this.beritaAcara,
    this.fotoKegiatanUrl,
    this.beritaAcaraUrl,
    required this.onFotoKegiatanChanged,
    required this.onBeritaAcaraChanged,
    required this.onFotoKegiatanUrlChanged,
    required this.onBeritaAcaraUrlChanged,
    required this.onFotoKegiatanPathChanged,
    required this.onBeritaAcaraPathChanged,
  });

  @override
  State<StepDokumentasiWidget> createState() => _StepDokumentasiWidgetState();
}

class _StepDokumentasiWidgetState extends State<StepDokumentasiWidget> {
  late StepDokumentasiModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StepDokumentasiModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(ModernSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Dokumentasi',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: ModernColors.textPrimary,
                ),
              ),
              const SizedBox(width: ModernSpacing.sm),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: ModernColors.textSecondary.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Opsional',
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: ModernColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Upload setelah laporan dikirim jika belum siap',
            style: GoogleFonts.inter(
              fontSize: 13,
              color: ModernColors.textSecondary,
            ),
          ),
          const SizedBox(height: ModernSpacing.lg),
          _buildUploadArea(
            label: 'Foto Kegiatan Penyembelihan',
            subtitle: 'Ambil foto atau pilih dari galeri',
            file: widget.fotoKegiatan,
            cloudUrl: widget.fotoKegiatanUrl,
            onPick: () => _pickFile(
              (f) => widget.onFotoKegiatanChanged(f),
              (url) => widget.onFotoKegiatanUrlChanged(url),
              (path) => widget.onFotoKegiatanPathChanged(path),
            ),
            onClear: () {
              widget.onFotoKegiatanChanged(null);
              widget.onFotoKegiatanUrlChanged(null);
              widget.onFotoKegiatanPathChanged(null);
            },
          ),
          const SizedBox(height: ModernSpacing.md),
          _buildUploadArea(
            label: 'Berita Acara / Rekap Panitia',
            subtitle: 'Upload dokumen berita acara',
            file: widget.beritaAcara,
            cloudUrl: widget.beritaAcaraUrl,
            onPick: () => _pickFile(
              (f) => widget.onBeritaAcaraChanged(f),
              (url) => widget.onBeritaAcaraUrlChanged(url),
              (path) => widget.onBeritaAcaraPathChanged(path),
            ),
            onClear: () {
              widget.onBeritaAcaraChanged(null);
              widget.onBeritaAcaraUrlChanged(null);
              widget.onBeritaAcaraPathChanged(null);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildUploadArea({
    required String label,
    required String subtitle,
    required File? file,
    String? cloudUrl,
    required VoidCallback onPick,
    required VoidCallback onClear,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: ModernColors.textPrimary,
          ),
        ),
        const SizedBox(height: ModernSpacing.sm),
        if (file != null)
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ModernRadius.md),
                  image: DecorationImage(
                    image: FileImage(file),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(color: ModernColors.primaryAccent.withOpacity(0.3)),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Material(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: onClear,
                    borderRadius: BorderRadius.circular(20),
                    child: const Padding(
                      padding: EdgeInsets.all(6),
                      child: Icon(Icons.close, color: Colors.white, size: 18),
                    ),
                  ),
                ),
              ),
            ],
          )
        else
          InkWell(
            onTap: onPick,
            borderRadius: BorderRadius.circular(ModernRadius.md),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  vertical: 32, horizontal: ModernSpacing.md),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ModernRadius.md),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 1.5,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.cloud_upload_outlined,
                    size: 36,
                    color: ModernColors.textSecondary.withOpacity(0.5),
                  ),
                  const SizedBox(height: ModernSpacing.sm),
                  Text(
                    subtitle,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: ModernColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Future<void> _pickFile(
      ValueChanged<File> onResult,
      ValueChanged<String?> onUrl,
      ValueChanged<String?> onPath,
  ) async {
    final files = await selectMedia(
      mediaSource: MediaSource.photoGallery,
      maxWidth: 1920,
      imageQuality: 80,
    );
    if (files != null && files.isNotEmpty) {
      final path = files.first.filePath;
      if (path != null) {
        final file = File(path);
        onResult(file);
        onPath(path);

        final uploadResp = await CloudinaryService().uploadImage(
          file,
          folder: CloudinaryConfig.folderDocuments,
        );
        if (uploadResp.success && uploadResp.secureUrl != null) {
          onUrl(uploadResp.secureUrl);
        }
      }
    }
  }
}
