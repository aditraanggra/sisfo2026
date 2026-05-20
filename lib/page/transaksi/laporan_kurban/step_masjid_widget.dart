import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_validators.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'step_masjid_model.dart';
export 'step_masjid_model.dart';

class StepMasjidWidget extends StatefulWidget {
  final String? unitName;
  final String? desa;
  final String? kecamatan;
  final int tahunMasehi;
  final ValueChanged<String> onUnitNameChanged;
  final ValueChanged<String> onDesaChanged;
  final ValueChanged<String> onKecamatanChanged;
  final ValueChanged<int> onTahunChanged;

  const StepMasjidWidget({
    super.key,
    this.unitName,
    this.desa,
    this.kecamatan,
    required this.tahunMasehi,
    required this.onUnitNameChanged,
    required this.onDesaChanged,
    required this.onKecamatanChanged,
    required this.onTahunChanged,
  });

  @override
  State<StepMasjidWidget> createState() => _StepMasjidWidgetState();
}

class _StepMasjidWidgetState extends State<StepMasjidWidget> {
  late StepMasjidModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StepMasjidModel());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initData();
    });
  }

  Future<void> _initData() async {
    final profile = FFAppState().profileUPZ;

    if (widget.unitName == null || widget.unitName!.isEmpty) {
      if (profile.unitName != null && profile.unitName!.isNotEmpty) {
        widget.onUnitNameChanged(profile.unitName!);
      }
    }

    await _model.loadData(
      context,
      onKecamatanLoaded: () {
        if (profile.districtName != null &&
            profile.districtName!.isNotEmpty) {
          widget.onKecamatanChanged(profile.districtName!);
        }
      },
      onDesaLoaded: () {
        if (profile.villageName != null &&
            profile.villageName!.isNotEmpty) {
          widget.onDesaChanged(profile.villageName!);
        }
      },
    );
    if (mounted) safeSetState(() {});
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profile = FFAppState().profileUPZ;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(ModernSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Identitas Masjid',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: ModernColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Data profil masjid/UPZ untuk laporan kurban',
            style: GoogleFonts.inter(
              fontSize: 13,
              color: ModernColors.textSecondary,
            ),
          ),
          const SizedBox(height: ModernSpacing.lg),
          TextFormField(
            initialValue: widget.unitName ?? profile.unitName ?? '',
            decoration: InputDecoration(
              labelText: 'Nama UPZ / Masjid',
              labelStyle: GoogleFonts.inter(
                  color: ModernColors.textSecondary, fontSize: 13),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(ModernRadius.sm),
              ),
              prefixIcon: const Icon(Icons.mosque, size: 20),
            ),
            style: GoogleFonts.inter(
                fontSize: 14, color: ModernColors.textPrimary),
            validator: (v) =>
                FormValidators.validateRequired(v, 'Nama UPZ'),
            onChanged: widget.onUnitNameChanged,
          ),
          const SizedBox(height: ModernSpacing.md),
          if (_model.isLoading)
            _buildLoadingDropdown('Kecamatan')
          else
            DropdownButtonFormField<String>(
              value: (() {
                final target = (widget.kecamatan ?? '').trim().toLowerCase();
                if (target.isEmpty) return null;
                final match = _model.kecamatanList.cast<Map<String, dynamic>?>().firstWhere(
                  (k) => ((k?['name'] as String?) ?? '').trim().toLowerCase() == target,
                  orElse: () => null,
                );
                return match?['name'] as String?;
              })(),
              decoration: InputDecoration(
                labelText: 'Kecamatan',
                labelStyle: GoogleFonts.inter(
                    color: ModernColors.textSecondary, fontSize: 13),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(ModernRadius.sm),
                ),
                prefixIcon: const Icon(Icons.location_city, size: 20),
              ),
              items: (_model.kecamatanList)
                  .map((k) => DropdownMenuItem(
                        value: k['name'] as String? ?? '',
                        child: Text(
                          k['name'] as String? ?? '',
                          style: GoogleFonts.inter(fontSize: 14),
                        ),
                      ))
                  .toList(),
              onChanged: (v) {
                if (v != null) widget.onKecamatanChanged(v);
              },
              style: GoogleFonts.inter(
                  fontSize: 14, color: ModernColors.textPrimary),
            ),
          const SizedBox(height: ModernSpacing.md),
          if (_model.isLoading)
            _buildLoadingDropdown('Kelurahan/Desa')
          else
            DropdownButtonFormField<String>(
              value: (() {
                final target = (widget.desa ?? '').trim().toLowerCase();
                if (target.isEmpty) return null;
                final match = _model.desaList.cast<Map<String, dynamic>?>().firstWhere(
                  (d) => ((d?['name'] as String?) ?? '').trim().toLowerCase() == target,
                  orElse: () => null,
                );
                return match?['name'] as String?;
              })(),
              decoration: InputDecoration(
                labelText: 'Kelurahan/Desa',
                labelStyle: GoogleFonts.inter(
                    color: ModernColors.textSecondary, fontSize: 13),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(ModernRadius.sm),
                ),
                prefixIcon: const Icon(Icons.location_on, size: 20),
              ),
              items: (_model.desaList)
                  .map((d) => DropdownMenuItem(
                        value: d['name'] as String? ?? '',
                        child: Text(
                          d['name'] as String? ?? '',
                          style: GoogleFonts.inter(fontSize: 14),
                        ),
                      ))
                  .toList(),
              onChanged: (v) {
                if (v != null) widget.onDesaChanged(v);
              },
              style: GoogleFonts.inter(
                  fontSize: 14, color: ModernColors.textPrimary),
            ),
          const SizedBox(height: ModernSpacing.md),
          DropdownButtonFormField<int>(
            value: widget.tahunMasehi,
            decoration: InputDecoration(
              labelText: 'Tahun Pelaksanaan',
              labelStyle: GoogleFonts.inter(
                  color: ModernColors.textSecondary, fontSize: 13),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(ModernRadius.sm),
              ),
              prefixIcon: const Icon(Icons.calendar_today, size: 20),
            ),
            items: List.generate(10, (i) {
              final year = DateTime.now().year - 2 + i;
              return DropdownMenuItem(
                value: year,
                child: Text(
                  '$year',
                  style: GoogleFonts.inter(fontSize: 14),
                ),
              );
            }),
            onChanged: (v) {
              if (v != null) widget.onTahunChanged(v);
            },
            style: GoogleFonts.inter(
                fontSize: 14, color: ModernColors.textPrimary),
          ),
          const SizedBox(height: ModernSpacing.md),
          Container(
            padding: const EdgeInsets.all(ModernSpacing.sm),
            decoration: BoxDecoration(
              color: ModernColors.backgroundMint,
              borderRadius: BorderRadius.circular(ModernRadius.sm),
            ),
            child: Row(
              children: [
                const Icon(Icons.info_outline,
                    size: 16, color: ModernColors.primaryAccent),
                const SizedBox(width: ModernSpacing.sm),
                Expanded(
                  child: Text(
                    'Data tersimpan dari akun Anda',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: ModernColors.primaryAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingDropdown(String label) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ModernRadius.sm),
        border: Border.all(color: FlutterFlowTheme.of(context).alternate),
      ),
      child: Row(
        children: [
          Icon(Icons.location_city, size: 20,
              color: ModernColors.textSecondary.withOpacity(0.5)),
          const SizedBox(width: 12),
          SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: ModernColors.textSecondary.withOpacity(0.5),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Memuat $label...',
            style: GoogleFonts.inter(
              fontSize: 13,
              color: ModernColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
