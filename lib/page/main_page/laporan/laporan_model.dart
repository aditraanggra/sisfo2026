import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'laporan_widget.dart' show LaporanWidget;
import 'package:flutter/material.dart';

enum ReportPeriod { tahunan, bulanan, harian, rentang }

class LaporanModel extends FlutterFlowModel<LaporanWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores the single consolidated API response
  ApiCallResponse? reportData;
  bool isLoading = false;
  String? errorMessage;

  // Filter State
  ReportPeriod selectedPeriod = ReportPeriod.tahunan;
  int selectedYear = DateTime.now().year;
  int? selectedMonth; // 1-12
  DateTime? selectedDate;
  DateTime? fromDate;
  DateTime? toDate;

  // Helper getters for API parameters
  String get periodeParam {
    switch (selectedPeriod) {
      case ReportPeriod.tahunan:
        return 'tahunan';
      case ReportPeriod.bulanan:
        return 'bulanan';
      case ReportPeriod.harian:
        return 'harian';
      case ReportPeriod.rentang:
        return 'harian'; // Rentang treats as daily with range
    }
  }

  String? get fromDateParam {
    if (fromDate != null) {
      return DateFormat('yyyy-MM-dd').format(fromDate!);
    }
    return null;
  }

  String? get toDateParam {
    if (toDate != null) {
      return DateFormat('yyyy-MM-dd').format(toDate!);
    }
    return null;
  }

  // UI Helpers
  String get periodLabel {
    switch (selectedPeriod) {
      case ReportPeriod.tahunan:
        return 'Tahunan $selectedYear';
      case ReportPeriod.bulanan:
        final monthNames = [
          'Januari',
          'Februari',
          'Maret',
          'April',
          'Mei',
          'Juni',
          'Juli',
          'Agustus',
          'September',
          'Oktober',
          'November',
          'Desember'
        ];
        return '${monthNames[(selectedMonth ?? 1) - 1]} $selectedYear';
      case ReportPeriod.harian:
        if (selectedDate != null) {
          return DateFormat('dd/MM/yyyy').format(selectedDate!);
        }
        return 'Harian';
      case ReportPeriod.rentang:
        if (fromDate != null && toDate != null) {
          return '${DateFormat('dd/MM/yyyy').format(fromDate!)} - ${DateFormat('dd/MM/yyyy').format(toDate!)}';
        }
        return 'Rentang Tanggal';
    }
  }

  Future<void> fetchReportData(BuildContext context) async {
    isLoading = true;
    errorMessage = null;
    // safeSetState is handled by the widget/builder usually, but we can notify listeners if using Provider properly
    // For FlutterFlow models, we often rely on the parent widget to rebuild or use setState inside the widget.
    // However, since we are moving logic here, we need a way to signal updates.
    // We will assume the parent widget calls setState after this future completes or we can use a callback if needed.
    // But standard FF pattern is to await inside the widget.
    // We will leave the state change notification to the Widget side for now,
    // OR we can use built-in notifyListeners() if this extends ChangeNotifier (FlutterFlowModel usually doesn't implicitly, but let's check).
    // Actually FlutterFlowModel doesn't extend ChangeNotifier. The widget calls setState.
    // We will just manage the state variables here.

    try {
      final response = await RekapEndPointGroup.rekapZisReportCall.call(
        unitId: FFAppState().profileUPZ.id,
        periode: periodeParam,
        year: selectedYear,
        fromDate: fromDateParam,
        toDate: toDateParam,
        // month logic needs to be handled if API expects it, strictly speaking rekapZisReportCall
        // in api_calls.dart params: unit_id, periode, year, from_date, to_date.
        // It does NOT seem to have a 'month' parameter.
        // If 'bulanan' is selected, usually APIs need year + month OR from_date/to_date covering the month.
        // Based on previous analysis, we might need to send from_date/to_date for monthly/daily as well
        // IF the backend relies on them for those periods.
        // Let's refine the params based on common usage:
        // For 'bulanan', we likely need to send specific dates or let backend handle 'year' + (missing month param?).
        // Wait, looking at api_calls.dart `RekapZisReportCall` params: unit_id, periode, year, from_date, to_date.
        // There is NO month param. So for monthly, we likely need to send from_date=startOfMonth, to_date=endOfMonth?
        // OR the backend ignores 'month' and just uses 'year'? Unlikely for explicit 'bulanan'.
        // Let's assume we pass the date range for monthly/daily/rentang to be safe,
        // OR checks if we need to add 'month' param to the API definition.
        // The user said: "consume the existing consolidated API endpoint".
        // Let's use specific dates for everything except 'tahunan' to be safe, or just year for tahunan.
        // actually for 'harian', we need 'period_date' maybe?
        // The previous `RekapZISCall` had `period_date`.
        // `RekapZisReportCall` has `from_date` and `to_date`.
        // Let's map accordingly:
        token: currentAuthenticationToken,
      );

      if ((response as ApiCallResponse).succeeded) {
        reportData = response;
      } else {
        errorMessage = response.jsonBody?['message'] ?? 'Gagal memuat data.';
        reportData = null;
      }
    } catch (e) {
      errorMessage = 'Terjadi kesalahan: $e';
      reportData = null;
    } finally {
      isLoading = false;
    }
  }

  // Filter Actions
  void setYearly(int year) {
    selectedPeriod = ReportPeriod.tahunan;
    selectedYear = year;
    selectedMonth = null;
    selectedDate = null;
    fromDate = DateTime(year, 1, 1);
    toDate = DateTime(year, 12, 31);
  }

  void setMonthly(int year, int month) {
    selectedPeriod = ReportPeriod.bulanan;
    selectedYear = year;
    selectedMonth = month;
    selectedDate = null;
    // Calculate start and end of month for API if needed
    fromDate = DateTime(year, month, 1);
    toDate = DateTime(year, month + 1, 0);
  }

  void setDaily(DateTime date) {
    selectedPeriod = ReportPeriod.harian;
    selectedDate = date; // Keep track of specific date
    selectedYear = date.year;
    selectedMonth = date.month;
    fromDate = date;
    toDate = date;
  }

  void setDateRange(DateTime start, DateTime end) {
    selectedPeriod = ReportPeriod.rentang;
    fromDate = start;
    toDate = end;
    selectedYear = start.year; // heuristic
    selectedMonth = null;
    selectedDate = null;
  }

  @override
  void initState(BuildContext context) {
    isLoading = true;
    selectedYear = DateTime.now().year;
    // Default to yearly as requested
    setYearly(selectedYear);
  }

  @override
  void dispose() {}
}
