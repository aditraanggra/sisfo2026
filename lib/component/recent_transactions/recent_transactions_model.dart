import '/backend/api_requests/api_calls.dart';
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

  /// Loading state
  bool isLoading = true;

  /// Error message
  String? errorMessage;

  /// Combined transactions list
  List<TransactionData> allTransactions = [];

  /// API responses cache
  ApiCallResponse? zfResponse;
  ApiCallResponse? zmResponse;
  ApiCallResponse? ifsResponse;
  ApiCallResponse? fidyahResponse;
  ApiCallResponse? kotakAmalResponse;
  ApiCallResponse? pendisResponse;
  ApiCallResponse? setorResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Fetch all transaction data from APIs
  Future<void> fetchAllTransactions(String token, int year) async {
    isLoading = true;
    errorMessage = null;
    allTransactions = [];

    final fromDate = '$year-01-01';
    final toDate = '$year-12-31';

    try {
      // Fetch all transaction types in parallel
      final results = await Future.wait([
        AuthEndPointGroup.getZakatFitrahCall.call(token: token, year: year),
        TransactionEndPointGroup.getZakatMaalCall
            .call(token: token, year: year),
        TransactionEndPointGroup.getSedekahCall.call(token: token, year: year),
        TransactionEndPointGroup.getFidyahCall.call(token: token, year: year),
        TransactionEndPointGroup.getKotakAmalCall
            .call(token: token, year: year),
        TransactionEndPointGroup.getPendistribusianCall
            .call(token: token, year: year),
        TransactionEndPointGroup.getSetorZISCall
            .call(token: token, fromDate: fromDate, toDate: toDate),
      ]);

      zfResponse = results[0];
      zmResponse = results[1];
      ifsResponse = results[2];
      fidyahResponse = results[3];
      kotakAmalResponse = results[4];
      pendisResponse = results[5];
      setorResponse = results[6];

      // Parse and combine all transactions
      _parseTransactions();
    } catch (e) {
      errorMessage = 'Gagal memuat data transaksi';
    }

    isLoading = false;
  }

  void _parseTransactions() {
    // Parse Zakat Fitrah
    if (zfResponse?.succeeded ?? false) {
      final data =
          AuthEndPointGroup.getZakatFitrahCall.dataListZf(zfResponse!.jsonBody);
      if (data != null) {
        for (var item in data) {
          allTransactions.add(TransactionData(
            id: getJsonField(item, r'$.id') ?? 0,
            title: getJsonField(item, r'$.muzakki_name') ?? 'Zakat Fitrah',
            category: 'Zakat Fitrah',
            trxDate: getJsonField(item, r'$.trx_date') ?? '',
            amount: (getJsonField(item, r'$.zf_amount') ?? 0).toInt(),
            rice: (getJsonField(item, r'$.zf_rice') ?? 0).toDouble(),
            isIncome: true,
            type: TransactionType.zakatFitrah,
          ));
        }
      }
    }

    // Parse Zakat Maal
    if (zmResponse?.succeeded ?? false) {
      final data = TransactionEndPointGroup.getZakatMaalCall
          .dataTrxZakatMal(zmResponse!.jsonBody);
      if (data != null) {
        for (var item in data) {
          allTransactions.add(TransactionData(
            id: getJsonField(item, r'$.id') ?? 0,
            title: getJsonField(item, r'$.muzakki_name') ?? 'Zakat Maal',
            category: 'Zakat Maal',
            trxDate: getJsonField(item, r'$.trx_date') ?? '',
            amount: (getJsonField(item, r'$.amount') ?? 0).toInt(),
            isIncome: true,
            type: TransactionType.zakatMaal,
          ));
        }
      }
    }

    // Parse Infak/Sedekah
    if (ifsResponse?.succeeded ?? false) {
      final data = TransactionEndPointGroup.getSedekahCall
          .dataTrxInfak(ifsResponse!.jsonBody);
      if (data != null) {
        for (var item in data) {
          allTransactions.add(TransactionData(
            id: getJsonField(item, r'$.id') ?? 0,
            title: getJsonField(item, r'$.munfiq_name') ?? 'Infak/Sedekah',
            category: 'Infak',
            trxDate: getJsonField(item, r'$.trx_date') ?? '',
            amount: (getJsonField(item, r'$.amount') ?? 0).toInt(),
            isIncome: true,
            type: TransactionType.infak,
          ));
        }
      }
    }

    // Parse Kotak Amal
    if (kotakAmalResponse?.succeeded ?? false) {
      final data = TransactionEndPointGroup.getKotakAmalCall
          .dataListKomal(kotakAmalResponse!.jsonBody);
      if (data != null) {
        for (var item in data) {
          allTransactions.add(TransactionData(
            id: getJsonField(item, r'$.id') ?? 0,
            title: getJsonField(item, r'$.desc') ?? 'Kotak Amal',
            category: 'Kotak Amal',
            trxDate: getJsonField(item, r'$.trx_date') ?? '',
            amount: (getJsonField(item, r'$.amount') ?? 0).toInt(),
            isIncome: true,
            type: TransactionType.kotakAmal,
          ));
        }
      }
    }

    // Parse Fidyah
    if (fidyahResponse?.succeeded ?? false) {
      final data = TransactionEndPointGroup.getFidyahCall
          .dataListFidyah(fidyahResponse!.jsonBody);
      if (data != null) {
        for (var item in data) {
          allTransactions.add(TransactionData(
            id: getJsonField(item, r'$.id') ?? 0,
            title: getJsonField(item, r'$.name') ?? 'Fidyah',
            category: 'Fidyah',
            trxDate: getJsonField(item, r'$.trx_date') ?? '',
            amount: (getJsonField(item, r'$.amount') ?? 0).toInt(),
            isIncome: true,
            type: TransactionType.fidyah,
          ));
        }
      }
    }

    // Parse Pendistribusian
    if (pendisResponse?.succeeded ?? false) {
      final data = TransactionEndPointGroup.getPendistribusianCall
          .dataListPendis(pendisResponse!.jsonBody);
      if (data != null) {
        for (var item in data) {
          allTransactions.add(TransactionData(
            id: getJsonField(item, r'$.id') ?? 0,
            title: getJsonField(item, r'$.mustahik_name') ?? 'Distribusi',
            category: 'Distribusi',
            trxDate: getJsonField(item, r'$.trx_date') ?? '',
            amount: (getJsonField(item, r'$.total_amount') ?? 0).toInt(),
            rice: (getJsonField(item, r'$.total_rice') ?? 0).toDouble(),
            isIncome: false,
            type: TransactionType.distribusi,
            asnaf: getJsonField(item, r'$.asnaf'),
          ));
        }
      }
    }

    // Parse Setor ZIS
    if (setorResponse?.succeeded ?? false) {
      final data = TransactionEndPointGroup.getSetorZISCall
          .listDataSetor(setorResponse!.jsonBody);
      if (data != null) {
        for (var item in data) {
          allTransactions.add(TransactionData(
            id: getJsonField(item, r'$.id') ?? 0,
            title: 'Setor ZIS',
            category: 'Setor',
            trxDate: getJsonField(item, r'$.trx_date') ?? '',
            amount: (getJsonField(item, r'$.total_deposit') ?? 0).toInt(),
            isIncome: false,
            type: TransactionType.setor,
          ));
        }
      }
    }

    // Sort by date descending (newest first)
    allTransactions.sort((a, b) => b.trxDate.compareTo(a.trxDate));
  }

  /// Get filtered transactions based on selected filter
  List<TransactionData> getFilteredTransactions() {
    if (selectedFilter == 'Semua') {
      return allTransactions.take(10).toList();
    } else if (selectedFilter == 'Penerimaan') {
      return allTransactions
          .where((t) => t.isIncome && t.type != TransactionType.setor)
          .take(10)
          .toList();
    } else if (selectedFilter == 'Distribusi') {
      return allTransactions
          .where((t) => t.type == TransactionType.distribusi)
          .take(10)
          .toList();
    } else if (selectedFilter == 'Setor') {
      return allTransactions
          .where((t) => t.type == TransactionType.setor)
          .take(10)
          .toList();
    }
    return allTransactions.take(10).toList();
  }
}

/// Transaction type enum
enum TransactionType {
  zakatFitrah,
  zakatMaal,
  infak,
  kotakAmal,
  distribusi,
  setor,
  fidyah,
}

/// Transaction data model
class TransactionData {
  final int id;
  final String title;
  final String category;
  final String trxDate;
  final int amount;
  final double rice;
  final bool isIncome;
  final TransactionType type;
  final String? asnaf;

  TransactionData({
    required this.id,
    required this.title,
    required this.category,
    required this.trxDate,
    required this.amount,
    this.rice = 0,
    required this.isIncome,
    required this.type,
    this.asnaf,
  });

  /// Format date for display (e.g., "15 Des")
  String get formattedDate {
    if (trxDate.isEmpty) return '';
    try {
      final date = DateTime.parse(trxDate);
      final months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'Mei',
        'Jun',
        'Jul',
        'Agu',
        'Sep',
        'Okt',
        'Nov',
        'Des'
      ];
      return '${date.day} ${months[date.month - 1]}';
    } catch (e) {
      return trxDate;
    }
  }
}
