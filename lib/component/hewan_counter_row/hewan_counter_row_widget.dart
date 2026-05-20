import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'hewan_counter_row_model.dart';
export 'hewan_counter_row_model.dart';

class HewanCounterRowWidget extends StatefulWidget {
  final IconData icon;
  final String label;
  final String? subtitle;
  final Color iconColor;
  final int value;
  final ValueChanged<int> onChanged;

  const HewanCounterRowWidget({
    super.key,
    required this.icon,
    required this.label,
    this.subtitle,
    required this.iconColor,
    required this.value,
    required this.onChanged,
  });

  @override
  State<HewanCounterRowWidget> createState() => _HewanCounterRowWidgetState();
}

class _HewanCounterRowWidgetState extends State<HewanCounterRowWidget> {
  late HewanCounterRowModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HewanCounterRowModel());
  }

  @override
  void didUpdateWidget(HewanCounterRowWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _model.syncValue(widget.value);
    }
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: ModernSpacing.md, vertical: ModernSpacing.sm),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(ModernRadius.md),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: widget.iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(ModernRadius.sm),
            ),
            child: Icon(widget.icon, color: widget.iconColor, size: 22),
          ),
          const SizedBox(width: ModernSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.label,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: ModernColors.textPrimary,
                  ),
                ),
                if (widget.subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    widget.subtitle!,
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      color: ModernColors.textSecondary,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildMinusButton(),
              SizedBox(
                width: 56,
                child: TextFormField(
                  controller: _model.countController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                  ],
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: ModernColors.textPrimary,
                  ),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    border: InputBorder.none,
                    isDense: true,
                  ),
                  onChanged: (v) {
                    final parsed = int.tryParse(v) ?? 0;
                    _model.syncValue(parsed);
                    widget.onChanged(parsed);
                  },
                ),
              ),
              _buildPlusButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMinusButton() {
    final isDisabled = widget.value <= 0;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isDisabled
            ? null
            : () => widget.onChanged(widget.value - 1),
        borderRadius: BorderRadius.circular(ModernRadius.sm),
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: isDisabled
                ? Colors.grey.withOpacity(0.1)
                : ModernColors.expenseRed.withOpacity(0.1),
            borderRadius: BorderRadius.circular(ModernRadius.sm),
          ),
          child: Icon(
            Icons.remove,
            color: isDisabled ? Colors.grey.shade300 : ModernColors.expenseRed,
            size: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildPlusButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => widget.onChanged(widget.value + 1),
        borderRadius: BorderRadius.circular(ModernRadius.sm),
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: ModernColors.primaryAccent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(ModernRadius.sm),
          ),
          child: const Icon(
            Icons.add,
            color: ModernColors.primaryAccent,
            size: 18,
          ),
        ),
      ),
    );
  }
}
