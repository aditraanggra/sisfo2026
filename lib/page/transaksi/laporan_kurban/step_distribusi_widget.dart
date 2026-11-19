import '/component/chip_group/chip_group_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/responsive_helper.dart';
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenType = getScreenType(context);
        final double contentWidth = switch (screenType) {
          ScreenType.phone => double.infinity,
          ScreenType.tablet => screenWidth * 0.80,
          ScreenType.desktop => min(screenWidth * 0.55, 720.0),
        };
        return Center(
          child: SizedBox(
            width: contentWidth,
            child: SingleChildScrollView(
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
                  _buildNumberField(
                    label: 'Jumlah Paket Daging',
                    value: widget.jmlPaketDaging,
                    min: 5,
                    max: 9999,
                    suffix: 'paket',
                    controller: _model.paketDagingController,
                    onChanged: (v) => widget.onPaketDagingChanged(v.toDouble()),
                  ),
                  const SizedBox(height: ModernSpacing.lg),
                  _buildNumberField(
                    label: 'Jumlah Penerima Manfaat',
                    value: widget.jmlPenerima,
                    min: 5,
                    max: 9999,
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
            ),
          ),
        );
      },
    );
  }

  Widget _buildNumberField({
    required String label,
    required int value,
    required int min,
    required int max,
    required String suffix,
    required TextEditingController controller,
    required ValueChanged<int> onChanged,
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
        const SizedBox(height: 8),
        TextFormField(
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
            suffixText: suffix,
            suffixStyle: GoogleFonts.inter(
              fontSize: 14,
              color: ModernColors.textSecondary,
            ),
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
                const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
          onChanged: (v) {
            var parsed = int.tryParse(v) ?? min;
            if (parsed < min) parsed = min;
            if (parsed > max) parsed = max;
            onChanged(parsed);
          },
        ),
      ],
    );
  }
}
