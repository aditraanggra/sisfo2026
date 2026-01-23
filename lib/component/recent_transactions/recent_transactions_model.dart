import '/flutter_flow/flutter_flow_util.dart';
import 'recent_transactions_widget.dart' show RecentTransactionsWidget;
import 'package:flutter/material.dart';

class RecentTransactionsModel
    extends FlutterFlowModel<RecentTransactionsWidget> {
  /// Selected filter tab
  String selectedFilter = 'Semua';

  /// Filter options
  final List<String> filterOptions = [
    'Semua',
    'Penerimaan',
    'Distribusi',
    'Setor'
  ];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
