import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'modern_transaction_item_model.dart';
export 'modern_transaction_item_model.dart';

/// Transaction type enum for color coding
/// Requirements: 6.5 - Green for income, red for expense
enum TransactionType { income, expense }

/// Modern transaction item component with consistent styling
/// Requirements: 6.1, 6.2, 6.3, 6.4, 6.5, 6.7
///
/// Features:
/// - Card format with white background (Req 6.1)
/// - Icon on left with rounded background (Req 6.2)
/// - Title and subtitle in middle (Req 6.3)
/// - Amount and time on right (Req 6.4)
/// - Green for income, red for expense (Req 6.5)
/// - Subtle separator/spacing between items (Req 6.7)
class ModernTransactionItemWidget extends StatefulWidget {
  const ModernTransactionItemWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.dateTime,
    required this.type,
    this.iconData,
    this.iconPath,
    this.onTap,
  });

  /// Transaction title (e.g., "Zakat Fitrah")
  final String title;

  /// Transaction subtitle/category (e.g., "Penerimaan")
  final String subtitle;

  /// Transaction amount in integer (will be formatted)
  final int amount;

  /// Transaction date and time
  final DateTime dateTime;

  /// Transaction type for color coding
  final TransactionType type;

  /// Optional icon data (uses default if not provided)
  final IconData? iconData;

  /// Optional icon path for custom icons
  final String? iconPath;

  /// Optional tap callback
  final VoidCallback? onTap;

  @override
  State<ModernTransactionItemWidget> createState() =>
      _ModernTransactionItemWidgetState();
}

class _ModernTransactionItemWidgetState
    extends State<ModernTransactionItemWidget> {
  late ModernTransactionItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModernTransactionItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  /// Get the color based on transaction type
  /// Requirements: 6.5 - Green for income, red for expense
  Color _getAmountColor() {
    return widget.type == TransactionType.income
        ? ModernColors.incomeGreen // #22C55E
        : ModernColors.expenseRed; // #EF4444
  }

  /// Get the icon background color based on transaction type
  Color _getIconBackgroundColor() {
    return widget.type == TransactionType.income
        ? ModernColors.incomeGreen.withOpacity(0.1)
        : ModernColors.expenseRed.withOpacity(0.1);
  }

  /// Get the icon color based on transaction type
  Color _getIconColor() {
    return widget.type == TransactionType.income
        ? ModernColors.incomeGreen
        : ModernColors.expenseRed;
  }

  /// Get default icon based on transaction type
  IconData _getDefaultIcon() {
    return widget.type == TransactionType.income
        ? Icons.arrow_downward_rounded
        : Icons.arrow_upward_rounded;
  }

  /// Format amount with currency
  String _formatAmount() {
    final prefix = widget.type == TransactionType.income ? '+' : '-';
    return '$prefix Rp ${formatNumber(
      widget.amount,
      formatType: FormatType.decimal,
      decimalType: DecimalType.periodDecimal,
    )}';
  }

  /// Format time from DateTime
  String _formatTime() {
    return dateTimeFormat('HH:mm', widget.dateTime);
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);

    // Requirements: 6.1 - Card format with white background
    return Container(
      decoration: BoxDecoration(
        color: ModernColors.backgroundCard,
        borderRadius: BorderRadius.circular(ModernRadius.lg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(ModernRadius.lg),
          child: Padding(
            // Requirements: 6.7 - Subtle spacing
            padding: const EdgeInsets.all(ModernSpacing.md),
            child: Row(
              children: [
                // Requirements: 6.2 - Icon on left with rounded background
                _buildIconSection(),
                const SizedBox(width: ModernSpacing.md),
                // Requirements: 6.3 - Title and subtitle in middle
                Expanded(child: _buildContentSection(theme)),
                // Requirements: 6.4 - Amount and time on right
                _buildAmountSection(theme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Build the icon section with rounded background
  /// Requirements: 6.2
  Widget _buildIconSection() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: _getIconBackgroundColor(),
        borderRadius: BorderRadius.circular(ModernRadius.md),
      ),
      child: Center(
        child: Icon(
          widget.iconData ?? _getDefaultIcon(),
          color: _getIconColor(),
          size: 24,
        ),
      ),
    );
  }

  /// Build the content section with title and subtitle
  /// Requirements: 6.3
  Widget _buildContentSection(FlutterFlowTheme theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.title,
          style: theme.bodyLarge.copyWith(
            fontWeight: FontWeight.w500,
            color: ModernColors.textPrimary,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: ModernSpacing.xs),
        Text(
          widget.subtitle,
          style: theme.bodySmall.copyWith(
            color: ModernColors.textSecondary,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  /// Build the amount section with amount and time
  /// Requirements: 6.4, 6.5
  Widget _buildAmountSection(FlutterFlowTheme theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Requirements: 6.5 - Green for income, red for expense
        Text(
          _formatAmount(),
          style: theme.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: _getAmountColor(),
          ),
        ),
        const SizedBox(height: ModernSpacing.xs),
        Text(
          _formatTime(),
          style: theme.bodySmall.copyWith(
            color: ModernColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
