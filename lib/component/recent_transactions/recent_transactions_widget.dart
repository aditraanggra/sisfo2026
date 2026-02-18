import '/auth/custom_auth/auth_util.dart';
import '/component/skeleton_loader/skeleton_loader_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'recent_transactions_model.dart';
export 'recent_transactions_model.dart';

/// Recent Transactions Component
/// Displays recent transactions with filter tabs - connected to real backend data
class RecentTransactionsWidget extends StatefulWidget {
  const RecentTransactionsWidget({
    super.key,
  });

  @override
  State<RecentTransactionsWidget> createState() =>
      _RecentTransactionsWidgetState();
}

class _RecentTransactionsWidgetState extends State<RecentTransactionsWidget> {
  late RecentTransactionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecentTransactionsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _model.fetchAllTransactions(
        currentAuthenticationToken ?? '',
        FFAppState().year,
      );
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'Transaksi Terbaru',
            style: GoogleFonts.inter(
              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16.0),
          // Filter tabs
          _buildFilterTabs(context),
          const SizedBox(height: 16.0),
          // Transaction list
          _buildTransactionList(context),
        ],
      ),
    );
  }

  Widget _buildFilterTabs(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _model.filterOptions.map((filter) {
          final isSelected = _model.selectedFilter == filter;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              onTap: () {
                safeSetState(() {
                  _model.selectedFilter = filter;
                });
              },
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                decoration: BoxDecoration(
                  color:
                      isSelected ? const Color(0xFF259148) : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFF259148)
                        : FlutterFlowTheme.of(context).alternate,
                  ),
                ),
                child: Text(
                  filter,
                  style: GoogleFonts.inter(
                    color: isSelected
                        ? Colors.white
                        : FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTransactionList(BuildContext context) {
    if (_model.isLoading) {
      return Column(
        children: [
          SkeletonLoaderWidget(
            type: SkeletonType.transactionFilter,
          ),
          const SizedBox(height: 16.0),
          SkeletonLoaderWidget(
            type: SkeletonType.listItem,
            itemCount: 3,
          ),
        ],
      );
    }

    // Show error state
    if (_model.errorMessage != null) {
      return Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                color: FlutterFlowTheme.of(context).error,
                size: 32.0,
              ),
              const SizedBox(height: 8.0),
              Text(
                _model.errorMessage!,
                style: GoogleFonts.inter(
                  color: FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(height: 12.0),
              TextButton(
                onPressed: () async {
                  safeSetState(() {
                    _model.isLoading = true;
                  });
                  await _model.fetchAllTransactions(
                    currentAuthenticationToken ?? '',
                    FFAppState().year,
                  );
                  safeSetState(() {});
                },
                child: Text(
                  'Coba Lagi',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF259148),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final filteredTransactions = _model.getFilteredTransactions();

    // Show empty state
    if (filteredTransactions.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.receipt_long_outlined,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 48.0,
              ),
              const SizedBox(height: 12.0),
              Text(
                'Belum ada transaksi',
                style: GoogleFonts.inter(
                  color: FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(filteredTransactions.length, (index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTransactionItem(context, filteredTransactions[index]),
              if (index < filteredTransactions.length - 1)
                Divider(
                  height: 1,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildTransactionItem(BuildContext context, TransactionData item) {
    final iconData = _getIconForType(item.type);
    final iconColor = _getColorForType(item.type, item.isIncome);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Icon
          Container(
            width: 48.0,
            height: 48.0,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Icon(
              iconData,
              color: iconColor,
              size: 24.0,
            ),
          ),
          const SizedBox(width: 12.0),
          // Title and category
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title.isNotEmpty ? item.title : item.category,
                  style: GoogleFonts.inter(
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2.0),
                Text(
                  '${item.category}${item.amount == 0 && item.rice > 0 ? ' (Beras)' : ''} • ${item.formattedDate}',
                  style: GoogleFonts.inter(
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          // Amount and arrow
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${item.isIncome ? '+' : '-'} ${item.amount > 0 ? 'Rp ${_formatNumber(item.amount)}' : (item.rice > 0 ? '${item.rice % 1 == 0 ? item.rice.toInt() : item.rice} Kg Beras' : 'Rp 0')}',
                style: GoogleFonts.inter(
                  color: item.isIncome
                      ? const Color(0xFF259148)
                      : const Color(0xFFE53935),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                item.isIncome ? Icons.arrow_downward : Icons.arrow_upward,
                color: item.isIncome
                    ? const Color(0xFF259148)
                    : const Color(0xFFE53935),
                size: 16.0,
              ),
            ],
          ),
        ],
      ),
    );
  }

  IconData _getIconForType(TransactionType type) {
    switch (type) {
      case TransactionType.zakatFitrah:
        return Icons.grain;
      case TransactionType.zakatMaal:
        return Icons.account_balance_wallet;
      case TransactionType.infak:
        return Icons.favorite;
      case TransactionType.kotakAmal:
        return Icons.inventory_2;
      case TransactionType.distribusi:
        return Icons.send;
      case TransactionType.setor:
        return Icons.upload;
      case TransactionType.fidyah:
        return Icons.restaurant;
    }
  }

  Color _getColorForType(TransactionType type, bool isIncome) {
    if (!isIncome) {
      return const Color(0xFFE53935);
    }
    switch (type) {
      case TransactionType.zakatFitrah:
        return const Color(0xFF4CAF50);
      case TransactionType.zakatMaal:
        return const Color(0xFF2196F3);
      case TransactionType.infak:
        return const Color(0xFFFF9800);
      case TransactionType.kotakAmal:
        return const Color(0xFF26A69A);
      case TransactionType.distribusi:
        return const Color(0xFFE53935);
      case TransactionType.setor:
        return const Color(0xFF9C27B0);
      case TransactionType.fidyah:
        return const Color(0xFFFF9800);
    }
  }

  String _formatNumber(int number) {
    return number.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]}.',
        );
  }
}
