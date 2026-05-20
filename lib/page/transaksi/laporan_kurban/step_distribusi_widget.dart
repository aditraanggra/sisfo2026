import '/component/chip_group/chip_group_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'step_distribusi_model.dart';
export 'step_distribusi_model.dart';

class StepDistribusiWidget extends StatefulWidget {
  final int jmlPaketDaging;
  final int jmlPenerima;
  final List<String> kelompokPenerima;
  final ValueChanged<double> onPaketDagingChanged;
  final ValueChanged<double> onPenerimaChanged;
  final ValueChanged<List<String>> onKelompokChanged;

  const StepDistribusiWidget({
    super.key,
    required this.jmlPaketDaging,
    required this.jmlPenerima,
    required this.kelompokPenerima,
    required this.onPaketDagingChanged,
    required this.onPenerimaChanged,
    required this.onKelompokChanged,
  });

  @override
  State<StepDistribusiWidget> createState() => _StepDistribusiWidgetState();
}

class _StepDistribusiWidgetState extends State<StepDistribusiWidget> {
  late StepDistribusiModel _model;

  static const List<ChipOption> _kelompokOptions = [
    ChipOption(value: 'warga', label: 'Warga sekitar'),
    ChipOption(value: 'fakir_miskin', label: 'Fakir miskin'),
    ChipOption(value: 'pesantren', label: 'Pondok pesantren'),
    ChipOption(value: 'panti_asuhan', label: 'Panti asuhan'),
    ChipOption(value: 'luar_daerah', label: 'Luar daerah'),
  ];

  @override
  void didUpdateWidget(StepDistribusiWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.jmlPaketDaging != widget.jmlPaketDaging) {
      _model.syncPaketDaging(widget.jmlPaketDaging);
    }
    if (oldWidget.jmlPenerima != widget.jmlPenerima) {
      _model.syncPenerima(widget.jmlPenerima);
    }
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StepDistribusiModel());
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
            'Distribusi Daging',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: ModernColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Informasi paket daging dan penerima manfaat',
            style: GoogleFonts.inter(
              fontSize: 13,
              color: ModernColors.textSecondary,
            ),
          ),
          const SizedBox(height: ModernSpacing.lg),
          _buildCounterSection(
            label: 'Jumlah Paket Daging',
            value: widget.jmlPaketDaging,
            min: 10,
            max: 500,
            suffix: 'paket',
            controller: _model.paketDagingController,
            onChanged: (v) => widget.onPaketDagingChanged(v.toDouble()),
          ),
          const SizedBox(height: ModernSpacing.lg),
          _buildCounterSection(
            label: 'Jumlah Penerima Manfaat',
            value: widget.jmlPenerima,
            min: 10,
            max: 2000,
            suffix: 'orang',
            controller: _model.penerimaController,
            onChanged: (v) => widget.onPenerimaChanged(v.toDouble()),
          ),
          const SizedBox(height: ModernSpacing.lg),
          Text(
            'Kelompok Penerima',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: ModernColors.textPrimary,
            ),
          ),
          const SizedBox(height: ModernSpacing.sm),
          ChipGroupWidget(
            options: _kelompokOptions,
            selected: widget.kelompokPenerima,
            onChanged: widget.onKelompokChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildCounterSection({
    required String label,
    required int value,
    required int min,
    required int max,
    required String suffix,
    required TextEditingController controller,
    required ValueChanged<int> onChanged,
  }) {
    final displayValue = '$value $suffix';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: ModernColors.textPrimary,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: ModernColors.primaryAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                displayValue,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: ModernColors.primaryAccent,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            _buildStepperButton(
              icon: Icons.remove,
              onTap: value > min ? () => onChanged(value - 10) : null,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                controller: controller,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(5),
                ],
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: ModernColors.textPrimary,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(ModernRadius.sm),
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(ModernRadius.sm),
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(ModernRadius.sm),
                    borderSide: const BorderSide(
                      color: ModernColors.primaryAccent,
                      width: 2,
                    ),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                ),
                onChanged: (v) {
                  var parsed = int.tryParse(v) ?? min;
                  if (parsed < min) parsed = min;
                  if (parsed > max) parsed = max;
                  onChanged(parsed);
                },
              ),
            ),
            const SizedBox(width: 8),
            _buildStepperButton(
              icon: Icons.add,
              onTap: value < max ? () => onChanged(value + 10) : null,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStepperButton({
    required IconData icon,
    required VoidCallback? onTap,
  }) {
    final isDisabled = onTap == null;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(ModernRadius.sm),
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: isDisabled
                ? Colors.grey.withOpacity(0.1)
                : ModernColors.primaryAccent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(ModernRadius.sm),
            border: Border.all(
              color: isDisabled
                  ? Colors.grey.withOpacity(0.2)
                  : ModernColors.primaryAccent.withOpacity(0.3),
            ),
          ),
          child: Icon(
            icon,
            color: isDisabled
                ? Colors.grey.shade300
                : ModernColors.primaryAccent,
            size: 20,
          ),
        ),
      ),
    );
  }
}
