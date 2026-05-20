import '/component/hewan_counter_row/hewan_counter_row_widget.dart';
import '/component/shohibul_auto_box/shohibul_auto_box_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'step_hewan_model.dart';
export 'step_hewan_model.dart';

class StepHewanWidget extends StatefulWidget {
  final int jmlSapi;
  final int jmlKerbau;
  final int jmlKambing;
  final int jmlDomba;
  final bool shohibulDikoreksi;
  final int? shohibulManual;
  final String? alasanKoreksi;
  final ValueChanged<int> onSapiChanged;
  final ValueChanged<int> onKerbauChanged;
  final ValueChanged<int> onKambingChanged;
  final ValueChanged<int> onDombaChanged;
  final ValueChanged<int> onShohibulManualChanged;
  final ValueChanged<String> onAlasanKoreksiChanged;
  final VoidCallback onToggleKoreksi;
  final VoidCallback onResetShohibul;

  const StepHewanWidget({
    super.key,
    required this.jmlSapi,
    required this.jmlKerbau,
    required this.jmlKambing,
    required this.jmlDomba,
    required this.shohibulDikoreksi,
    this.shohibulManual,
    this.alasanKoreksi,
    required this.onSapiChanged,
    required this.onKerbauChanged,
    required this.onKambingChanged,
    required this.onDombaChanged,
    required this.onShohibulManualChanged,
    required this.onAlasanKoreksiChanged,
    required this.onToggleKoreksi,
    required this.onResetShohibul,
  });

  @override
  State<StepHewanWidget> createState() => _StepHewanWidgetState();
}

class _StepHewanWidgetState extends State<StepHewanWidget> {
  late StepHewanModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StepHewanModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  int get _totalEkor =>
      widget.jmlSapi + widget.jmlKerbau + widget.jmlKambing + widget.jmlDomba;

  int get _calculatedShohibul =>
      (widget.jmlSapi + widget.jmlKerbau) * 7 +
      widget.jmlKambing +
      widget.jmlDomba;

  double get _estimatedMeat => _totalEkor * 25.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(ModernSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hewan Kurban',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: ModernColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Masukkan jumlah hewan yang disembelih',
            style: GoogleFonts.inter(
              fontSize: 13,
              color: ModernColors.textSecondary,
            ),
          ),
          const SizedBox(height: ModernSpacing.lg),
          HewanCounterRowWidget(
            icon: Icons.pets,
            label: 'Sapi',
            subtitle: '1 sapi = 7 shohibul',
            iconColor: ModernColors.primaryDark,
            value: widget.jmlSapi,
            onChanged: widget.onSapiChanged,
          ),
          const SizedBox(height: ModernSpacing.sm),
          HewanCounterRowWidget(
            icon: Icons.pets,
            label: 'Kerbau',
            subtitle: '1 kerbau = 7 shohibul',
            iconColor: const Color(0xFF8B4513),
            value: widget.jmlKerbau,
            onChanged: widget.onKerbauChanged,
          ),
          const SizedBox(height: ModernSpacing.sm),
          HewanCounterRowWidget(
            icon: Icons.pets,
            label: 'Kambing',
            subtitle: '1 kambing = 1 shohibul',
            iconColor: ModernColors.primaryAccent,
            value: widget.jmlKambing,
            onChanged: widget.onKambingChanged,
          ),
          const SizedBox(height: ModernSpacing.sm),
          HewanCounterRowWidget(
            icon: Icons.pets,
            label: 'Domba',
            subtitle: '1 domba = 1 shohibul',
            iconColor: ModernColors.goldAccent,
            value: widget.jmlDomba,
            onChanged: widget.onDombaChanged,
          ),
          const SizedBox(height: ModernSpacing.lg),
          ShohibulAutoBoxWidget(
            calculatedShohibul: _calculatedShohibul,
            isCorrected: widget.shohibulDikoreksi,
            manualValue: widget.shohibulManual,
            alasanKoreksi: widget.alasanKoreksi,
            onManualValueChanged: widget.onShohibulManualChanged,
            onAlasanChanged: widget.onAlasanKoreksiChanged,
            onToggleKoreksi: widget.onToggleKoreksi,
            onReset: widget.onResetShohibul,
          ),
          const SizedBox(height: ModernSpacing.md),
          _buildStatPills(),
        ],
      ),
    );
  }

  Widget _buildStatPills() {
    return Row(
      children: [
        _buildPill(
          icon: Icons.calculate,
          label: 'Total ekor',
          value: '$_totalEkor',
        ),
        const SizedBox(width: ModernSpacing.sm),
        _buildPill(
          icon: Icons.restaurant,
          label: 'Estimasi daging',
          value: '${_estimatedMeat.toStringAsFixed(0)} kg',
        ),
      ],
    );
  }

  Widget _buildPill({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(ModernSpacing.sm),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(ModernRadius.sm),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: ModernColors.primaryAccent),
            const SizedBox(width: ModernSpacing.sm),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: ModernColors.textSecondary,
                  ),
                ),
                Text(
                  value,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: ModernColors.textPrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
