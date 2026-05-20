import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chip_group_model.dart';
export 'chip_group_model.dart';

class ChipOption {
  final String value;
  final String label;

  const ChipOption({required this.value, required this.label});
}

class ChipGroupWidget extends StatefulWidget {
  final List<ChipOption> options;
  final List<String> selected;
  final ValueChanged<List<String>> onChanged;

  const ChipGroupWidget({
    super.key,
    required this.options,
    required this.selected,
    required this.onChanged,
  });

  @override
  State<ChipGroupWidget> createState() => _ChipGroupWidgetState();
}

class _ChipGroupWidgetState extends State<ChipGroupWidget> {
  late ChipGroupModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChipGroupModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: ModernSpacing.sm,
      runSpacing: ModernSpacing.sm,
      children: widget.options.map((option) {
        final isSelected = widget.selected.contains(option.value);
        return FilterChip(
          label: Text(
            option.label,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: isSelected
                  ? ModernColors.textOnDark
                  : ModernColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
          selected: isSelected,
          onSelected: (selected) {
            final updated = List<String>.from(widget.selected);
            if (selected) {
              updated.add(option.value);
            } else {
              updated.remove(option.value);
            }
            widget.onChanged(updated);
          },
          selectedColor: ModernColors.primaryAccent,
          checkmarkColor: Colors.white,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          side: BorderSide(
            color: isSelected
                ? ModernColors.primaryAccent
                : FlutterFlowTheme.of(context).alternate,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ModernRadius.sm * 2),
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: ModernSpacing.sm, vertical: 6),
        );
      }).toList(),
    );
  }
}
