import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'shohibul_auto_box_model.dart';
export 'shohibul_auto_box_model.dart';

class ShohibulAutoBoxWidget extends StatefulWidget {
  final int calculatedShohibul;
  final bool isCorrected;
  final int? manualValue;
  final String? alasanKoreksi;
  final ValueChanged<int> onManualValueChanged;
  final ValueChanged<String> onAlasanChanged;
  final VoidCallback onToggleKoreksi;
  final VoidCallback onReset;

  const ShohibulAutoBoxWidget({
    super.key,
    required this.calculatedShohibul,
    required this.isCorrected,
    this.manualValue,
    this.alasanKoreksi,
    required this.onManualValueChanged,
    required this.onAlasanChanged,
    required this.onToggleKoreksi,
    required this.onReset,
  });

  @override
  State<ShohibulAutoBoxWidget> createState() => _ShohibulAutoBoxWidgetState();
}

class _ShohibulAutoBoxWidgetState extends State<ShohibulAutoBoxWidget> {
  late ShohibulAutoBoxModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShohibulAutoBoxModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final displayValue = widget.isCorrected
        ? (widget.manualValue ?? widget.calculatedShohibul)
        : widget.calculatedShohibul;

    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.people_alt,
                color: ModernColors.primaryAccent,
                size: 20,
              ),
              const SizedBox(width: ModernSpacing.sm),
              Text(
                'Shohibul Kurban',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: ModernColors.textPrimary,
                ),
              ),
              const Spacer(),
              if (widget.isCorrected)
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: ModernColors.goldAccent.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Dikoreksi',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      color: ModernColors.goldAccent,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: ModernSpacing.sm),
          Text(
            '$displayValue',
            style: GoogleFonts.inter(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: ModernColors.primaryDark,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.isCorrected
                ? 'Nilai telah dikoreksi manual'
                : 'Otomatis: (sapi+kerbau)×7 + kambing + domba',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: ModernColors.textSecondary,
            ),
          ),
          const SizedBox(height: ModernSpacing.sm),
          Row(
            children: [
              TextButton.icon(
                onPressed: widget.onToggleKoreksi,
                icon: Icon(
                  widget.isCorrected ? Icons.edit_off : Icons.edit,
                  size: 16,
                ),
                label: Text(
                  widget.isCorrected ? 'Sembunyikan koreksi' : 'Koreksi',
                  style: GoogleFonts.inter(fontSize: 12),
                ),
                style: TextButton.styleFrom(
                  foregroundColor: ModernColors.primaryAccent,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 4),
                ),
              ),
              if (widget.isCorrected)
                TextButton.icon(
                  onPressed: widget.onReset,
                  icon: const Icon(Icons.refresh, size: 16),
                  label: Text(
                    'Gunakan otomatis',
                    style: GoogleFonts.inter(fontSize: 12),
                  ),
                  style: TextButton.styleFrom(
                    foregroundColor: ModernColors.textSecondary,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 4),
                  ),
                ),
            ],
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Padding(
              padding: const EdgeInsets.only(top: ModernSpacing.sm),
              child: Column(
                children: [
                  TextFormField(
                    initialValue:
                        '${widget.manualValue ?? widget.calculatedShohibul}',
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Jumlah shohibul',
                      labelStyle: GoogleFonts.inter(
                        color: ModernColors.textSecondary,
                        fontSize: 13,
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(ModernRadius.sm),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                    ),
                    style: GoogleFonts.inter(
                        fontSize: 14, color: ModernColors.textPrimary),
                    onChanged: (v) {
                      final parsed = int.tryParse(v);
                      if (parsed != null) {
                        widget.onManualValueChanged(parsed);
                      }
                    },
                  ),
                  const SizedBox(height: ModernSpacing.sm),
                  TextFormField(
                    initialValue: widget.alasanKoreksi,
                    decoration: InputDecoration(
                      labelText: 'Alasan koreksi (opsional)',
                      labelStyle: GoogleFonts.inter(
                        color: ModernColors.textSecondary,
                        fontSize: 13,
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(ModernRadius.sm),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                    ),
                    style: GoogleFonts.inter(
                        fontSize: 14, color: ModernColors.textPrimary),
                    onChanged: widget.onAlasanChanged,
                  ),
                ],
              ),
            ),
            crossFadeState: widget.isCorrected
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }
}
