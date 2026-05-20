import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'step_konfirmasi_model.dart';
export 'step_konfirmasi_model.dart';

class StepKonfirmasiWidget extends StatefulWidget {
  final String? unitName;
  final String? desa;
  final String? kecamatan;
  final int tahunMasehi;
  final int jmlSapi;
  final int jmlKerbau;
  final int jmlKambing;
  final int jmlDomba;
  final bool shohibulDikoreksi;
  final int totalShohibul;
  final int jmlPaketDaging;
  final int jmlPenerima;
  final List<String> kelompokPenerima;
  final File? fotoKegiatan;
  final File? beritaAcara;
  final VoidCallback onKirim;
  final bool isLoading;

  const StepKonfirmasiWidget({
    super.key,
    this.unitName,
    this.desa,
    this.kecamatan,
    required this.tahunMasehi,
    required this.jmlSapi,
    required this.jmlKerbau,
    required this.jmlKambing,
    required this.jmlDomba,
    required this.shohibulDikoreksi,
    required this.totalShohibul,
    required this.jmlPaketDaging,
    required this.jmlPenerima,
    required this.kelompokPenerima,
    this.fotoKegiatan,
    this.beritaAcara,
    required this.onKirim,
    required this.isLoading,
  });

  @override
  State<StepKonfirmasiWidget> createState() => _StepKonfirmasiWidgetState();
}

class _StepKonfirmasiWidgetState extends State<StepKonfirmasiWidget> {
  late StepKonfirmasiModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StepKonfirmasiModel());
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
          Text(
            'Ringkasan Laporan',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: ModernColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Periksa kembali data sebelum dikirim',
            style: GoogleFonts.inter(
              fontSize: 13,
              color: ModernColors.textSecondary,
            ),
          ),
          const SizedBox(height: ModernSpacing.lg),
          _buildSummaryCard(
            icon: Icons.mosque,
            title: 'Masjid & Lokasi',
            children: [
              _buildRow('Nama UPZ', widget.unitName ?? '-'),
              _buildRow('Desa', widget.desa ?? '-'),
              _buildRow('Kecamatan', widget.kecamatan ?? '-'),
              _buildRow('Tahun', '${widget.tahunMasehi}'),
            ],
          ),
          const SizedBox(height: ModernSpacing.md),
          _buildSummaryCard(
            icon: Icons.pets,
            title: 'Hewan Kurban',
            children: [
              if (widget.jmlSapi > 0)
                _buildRow('Sapi', '${widget.jmlSapi}'),
              if (widget.jmlKerbau > 0)
                _buildRow('Kerbau', '${widget.jmlKerbau}'),
              if (widget.jmlKambing > 0)
                _buildRow('Kambing', '${widget.jmlKambing}'),
              if (widget.jmlDomba > 0)
                _buildRow('Domba', '${widget.jmlDomba}'),
              const Divider(height: 16),
              _buildRow('Total Ekor',
                  '${widget.jmlSapi + widget.jmlKerbau + widget.jmlKambing + widget.jmlDomba}'),
              _buildRow(
                'Shohibul Kurban',
                '${widget.totalShohibul}',
                badge: widget.shohibulDikoreksi ? 'Dikoreksi' : null,
              ),
            ],
          ),
          const SizedBox(height: ModernSpacing.md),
          _buildSummaryCard(
            icon: Icons.restaurant,
            title: 'Distribusi',
            children: [
              _buildRow('Paket Daging', '${widget.jmlPaketDaging} paket'),
              _buildRow('Penerima', '${widget.jmlPenerima} orang'),
              if (widget.kelompokPenerima.isNotEmpty)
                _buildRow('Kelompok', widget.kelompokPenerima.join(', ')),
            ],
          ),
          if (widget.fotoKegiatan != null || widget.beritaAcara != null) ...[
            const SizedBox(height: ModernSpacing.md),
            _buildSummaryCard(
              icon: Icons.photo_library,
              title: 'Dokumentasi',
              children: [
                if (widget.fotoKegiatan != null)
                  _buildRow('Foto Kegiatan', '${widget.fotoKegiatan!.path.split('/').last}'),
                if (widget.beritaAcara != null)
                  _buildRow('Berita Acara', '${widget.beritaAcara!.path.split('/').last}'),
              ],
            ),
          ],
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: widget.isLoading ? null : widget.onKirim,
              icon: widget.isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.send_rounded, size: 20),
              label: Text(
                widget.isLoading ? 'Mengirim...' : 'Kirim Laporan',
                style: GoogleFonts.inter(
                    fontSize: 15, fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: ModernColors.primaryAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ModernRadius.sm),
                ),
                elevation: 0,
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSummaryCard({
    required IconData icon,
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(ModernSpacing.md),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(ModernRadius.md),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: ModernColors.primaryAccent),
              const SizedBox(width: ModernSpacing.sm),
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: ModernColors.textPrimary,
                ),
              ),
            ],
          ),
          const Divider(height: 24),
          ...children,
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value, {String? badge}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 13,
                color: ModernColors.textSecondary,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    value,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: ModernColors.textPrimary,
                    ),
                  ),
                ),
                if (badge != null) ...[
                  const SizedBox(width: 6),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                    decoration: BoxDecoration(
                      color: ModernColors.goldAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      badge,
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        color: ModernColors.goldAccent,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
