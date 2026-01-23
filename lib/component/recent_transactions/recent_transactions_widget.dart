import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'recent_transactions_model.dart';
export 'recent_transactions_model.dart';

/// Transaction item data model
class TransactionItem {
  final String title;
  final String category;
  final String date;
  final int amount;
  final bool isIncome;
  final Color iconBackgroundColor;
  final IconData icon;

  const TransactionItem({
    required this.title,
    required this.category,
    required this.date,
    required this.amount,
    required this.isIncome,
    required this.iconBackgroundColor,
    required this.icon,
  });
}

/// Recent Transactions Component
/// Displays recent transactions with filter tabs
class RecentTransactionsWidget extends StatefulWidget {
  const RecentTransactionsWidget({
    super.key,
    this.transactions,
  });

  final List<TransactionItem>? transactions;

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

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
    final transactions = widget.transactions ?? _getSampleTransactions();
    final filteredTransactions = _filterTransactions(transactions);

    if (filteredTransactions.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: Text(
            'Belum ada transaksi',
            style: GoogleFonts.inter(
              color: FlutterFlowTheme.of(context).secondaryText,
              fontSize: 14.0,
            ),
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

  Widget _buildTransactionItem(BuildContext context, TransactionItem item) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Icon
          Container(
            width: 48.0,
            height: 48.0,
            decoration: BoxDecoration(
              color: item.iconBackgroundColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Icon(
              item.icon,
              color: item.iconBackgroundColor,
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
                  item.title,
                  style: GoogleFonts.inter(
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2.0),
                Text(
                  '${item.category} • ${item.date}',
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
                '${item.isIncome ? '+' : '-'} Rp ${_formatNumber(item.amount)}',
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

  List<TransactionItem> _filterTransactions(
      List<TransactionItem> transactions) {
    if (_model.selectedFilter == 'Semua') {
      return transactions;
    } else if (_model.selectedFilter == 'Penerimaan') {
      return transactions
          .where((t) => t.isIncome && t.category != 'Setor')
          .toList();
    } else if (_model.selectedFilter == 'Distribusi') {
      return transactions.where((t) => !t.isIncome).toList();
    } else if (_model.selectedFilter == 'Setor') {
      return transactions.where((t) => t.category == 'Setor').toList();
    }
    return transactions;
  }

  String _formatNumber(int number) {
    return number.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]}.',
        );
  }

  List<TransactionItem> _getSampleTransactions() {
    return const [
      TransactionItem(
        title: 'Infak Jumat',
        category: 'Infak',
        date: '15 Des',
        amount: 3250000,
        isIncome: true,
        iconBackgroundColor: Color(0xFFFF9800),
        icon: Icons.favorite,
      ),
      TransactionItem(
        title: 'Hasan Ali',
        category: 'Fidyah',
        date: '14 Des',
        amount: 48000,
        isIncome: true,
        iconBackgroundColor: Color(0xFFFF9800),
        icon: Icons.restaurant,
      ),
      TransactionItem(
        title: 'Kotak Amal Masjid',
        category: 'Kotak Amal',
        date: '13 Des',
        amount: 1500000,
        isIncome: true,
        iconBackgroundColor: Color(0xFF26A69A),
        icon: Icons.inventory_2,
      ),
      TransactionItem(
        title: 'Distribusi Fakir Miskin',
        category: 'Distribusi',
        date: '12 Des',
        amount: 2500000,
        isIncome: false,
        iconBackgroundColor: Color(0xFFE53935),
        icon: Icons.send,
      ),
    ];
  }
}
