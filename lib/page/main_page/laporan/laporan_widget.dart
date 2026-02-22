import '/backend/api_requests/api_calls.dart';
import '/component/skeleton_loader/skeleton_loader_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'laporan_model.dart';
export 'laporan_model.dart';

class LaporanWidget extends StatefulWidget {
  const LaporanWidget({super.key});

  static String routeName = 'Laporan';
  static String routePath = '/laporan';

  @override
  State<LaporanWidget> createState() => _LaporanWidgetState();
}

class _LaporanWidgetState extends State<LaporanWidget>
    with SingleTickerProviderStateMixin {
  late LaporanModel _model;
  late TabController _tabController;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LaporanModel());
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        safeSetState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => _loadData());
  }

  @override
  void dispose() {
    _model.dispose();
    _tabController.dispose();

    super.dispose();
  }

  Future<void> _loadData() async {
    safeSetState(() {
      _model.isLoading = true;
    });
    await _model.fetchReportData(context);
    safeSetState(() {});
  }

  String? _getTipeLaporan() {
    switch (_model.selectedPeriod) {
      case ReportPeriod.tahunan:
        return 'Tahunan';
      case ReportPeriod.bulanan:
        return 'Bulanan';
      case ReportPeriod.harian:
        return 'Harian';
      case ReportPeriod.rentang:
        return 'Range';
    }
  }

  Future<void> _generatePdf() async {
    final reportData = _model.reportData;
    if (reportData == null) return;

    await actions.saveToPdf(
      FFAppState().profileUPZ.unitName,
      FFAppState().profileUPZ.noRegister,
      FFAppState().profileUPZ.address,
      FFAppState().profileUPZ.villageName,
      FFAppState().profileUPZ.districtName,
      '${valueOrDefault<String>(
        formatNumber(
          RekapEndPointGroup.rekapZisReportCall
              .totalZfAmount(reportData.jsonBody),
          formatType: FormatType.custom,
          currency: 'Rp ',
          format: '###,###',
          locale: 'ID',
        ),
        '0',
      )} | ${valueOrDefault<String>(
        formatNumber(
          RekapEndPointGroup.rekapZisReportCall
              .totalZfRice(reportData.jsonBody),
          formatType: FormatType.custom,
          format: '##.## Kg',
          locale: 'ID',
        ),
        '0',
      )}',
      valueOrDefault<String>(
        RekapEndPointGroup.rekapZisReportCall
            .totalZfMuzakki(reportData.jsonBody)
            ?.toString(),
        '0',
      ),
      valueOrDefault<String>(
        formatNumber(
          RekapEndPointGroup.rekapZisReportCall
              .totalZmAmount(reportData.jsonBody),
          formatType: FormatType.custom,
          currency: 'Rp ',
          format: '###,###',
          locale: 'ID',
        ),
        '0',
      ),
      RekapEndPointGroup.rekapZisReportCall
          .totalZmMuzakki(reportData.jsonBody)
          ?.toString(),
      valueOrDefault<String>(
        formatNumber(
          RekapEndPointGroup.rekapZisReportCall
              .totalIfsAmount(reportData.jsonBody),
          formatType: FormatType.custom,
          currency: 'Rp ',
          format: '###,###',
          locale: 'ID',
        ),
        '0',
      ),
      valueOrDefault<String>(
        RekapEndPointGroup.rekapZisReportCall
            .totalIfsMunfiq(reportData.jsonBody)
            ?.toString(),
        '0',
      ),
      // Penerima Manfaat Total (using same value for now as original code seemed to duplicate them)
      RekapEndPointGroup.rekapZisReportCall
          .totalPm(reportData.jsonBody)
          ?.toString(),
      RekapEndPointGroup.rekapZisReportCall
          .totalPm(reportData.jsonBody)
          ?.toString(),
      RekapEndPointGroup.rekapZisReportCall
          .totalPm(reportData.jsonBody)
          ?.toString(),
      // Hak Amil PM - adjust if specific field exists
      RekapEndPointGroup.rekapZisReportCall
          .totalPm(reportData.jsonBody)
          ?.toString(),
      RekapEndPointGroup.rekapZisReportCall
          .totalPm(reportData.jsonBody)
          ?.toString(),
      RekapEndPointGroup.rekapZisReportCall
          .totalPm(reportData.jsonBody)
          ?.toString(),

      valueOrDefault<String>(
        '${valueOrDefault<String>(
          formatNumber(
            RekapEndPointGroup.rekapZisReportCall
                .totalPendisZfAmount(reportData.jsonBody),
            formatType: FormatType.custom,
            currency: 'Rp ',
            format: '###,###',
            locale: 'ID',
          ),
          '0',
        )} | ${valueOrDefault<String>(
          formatNumber(
            RekapEndPointGroup.rekapZisReportCall
                .totalPendisZfRice(reportData.jsonBody),
            formatType: FormatType.custom,
            format: '##.## Kg',
            locale: 'ID',
          ),
          '0',
        )}',
        '0',
      ),
      valueOrDefault<String>(
        formatNumber(
          RekapEndPointGroup.rekapZisReportCall
              .totalPendisZm(reportData.jsonBody),
          formatType: FormatType.custom,
          currency: 'Rp ',
          format: '###,###',
          locale: 'ID',
        ),
        '0',
      ),
      valueOrDefault<String>(
        formatNumber(
          RekapEndPointGroup.rekapZisReportCall
              .totalPendisIfs(reportData.jsonBody),
          formatType: FormatType.custom,
          currency: 'Rp ',
          format: '###,###',
          locale: 'ID',
        ),
        '0',
      ),
      '${valueOrDefault<String>(
        formatNumber(
          RekapEndPointGroup.rekapZisReportCall
              .totalSetorZfAmount(reportData.jsonBody),
          formatType: FormatType.custom,
          currency: 'Rp ',
          format: '###,###',
          locale: 'ID',
        ),
        '0',
      )} | ${valueOrDefault<String>(
        formatNumber(
          RekapEndPointGroup.rekapZisReportCall
              .totalSetorZfRice(reportData.jsonBody),
          formatType: FormatType.custom,
          format: '##.## Kg',
          locale: 'ID',
        ),
        '0',
      )}',
      valueOrDefault<String>(
        formatNumber(
          RekapEndPointGroup.rekapZisReportCall
              .totalSetorZm(reportData.jsonBody),
          formatType: FormatType.custom,
          currency: 'Rp ',
          format: '###,###',
          locale: 'ID',
        ),
        '0',
      ),
      valueOrDefault<String>(
        formatNumber(
          RekapEndPointGroup.rekapZisReportCall
              .totalSetorIfs(reportData.jsonBody),
          formatType: FormatType.custom,
          currency: 'Rp ',
          format: '###,###',
          locale: 'ID',
        ),
        '0',
      ),
      () {
        if (FFAppState().profileUPZ.categoryId == 4) {
          return 'Ketua DKM';
        } else if (FFAppState().profileUPZ.categoryId == 3) {
          return 'Kepala Desa';
        } else {
          return 'Camat';
        }
      }(),
      FFAppState().profileUPZ.unitLeader,
      FFAppState().profileUPZ.unitAssistant,
      FFAppState().profileUPZ.unitFinance,
      _model.listSetoran,
      // Tipe Laporan
      _getTipeLaporan(),
      // Bulan
      _model.selectedMonth != null
          ? [
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
            ][_model.selectedMonth! - 1]
          : null,
      // Tanggal
      _model.selectedDate != null
          ? DateFormat('dd/MM/yyyy').format(_model.selectedDate!)
          : null,
      // Tanggal Mulai
      _model.fromDate != null
          ? DateFormat('dd/MM/yyyy').format(_model.fromDate!)
          : null,
      // Tanggal Selesai
      _model.toDate != null
          ? DateFormat('dd/MM/yyyy').format(_model.toDate!)
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: responsiveVisibility(
          context: context,
          desktop: false,
        )
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryDark,
                automaticallyImplyLeading: false,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Laporan Pengelolaan ZIS',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      'UPZ ${FFAppState().profileUPZ.unitName}',
                      style: GoogleFonts.inter(
                        color: Colors.white.withOpacity(0.8),
                        fontWeight: FontWeight.normal,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                centerTitle: true,
                elevation: 0.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Column(
            children: [
              _buildFilterPanel(),
              if (_model.isLoading)
                Expanded(
                  child: Column(
                    children: [
                      SkeletonLoaderWidget(type: SkeletonType.summary),
                      SizedBox(height: 20),
                      Expanded(
                          child: SkeletonLoaderWidget(
                              type: SkeletonType.detailRow, itemCount: 5)),
                    ],
                  ),
                )
              else if (_model.errorMessage != null)
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error_outline,
                            color: FlutterFlowTheme.of(context).error,
                            size: 48),
                        SizedBox(height: 16),
                        Text(
                          _model.errorMessage!,
                          style: GoogleFonts.inter(
                              color:
                                  FlutterFlowTheme.of(context).secondaryText),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _loadData,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryDark,
                          ),
                          child: Text('Coba Lagi',
                              style: TextStyle(color: Colors.white)),
                        )
                      ],
                    ),
                  ),
                )
              else
                Expanded(
                  child: Column(
                    children: [
                      _buildHeaderSummary(context, _model.reportData!),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          border: Border(
                            bottom: BorderSide(color: Colors.grey.shade200),
                          ),
                        ),
                        child: TabBar(
                          controller: _tabController,
                          labelColor: FlutterFlowTheme.of(context).primary,
                          labelStyle: GoogleFonts.inter(
                              fontWeight: FontWeight.w600, fontSize: 13),
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          unselectedLabelStyle: GoogleFonts.inter(
                              fontWeight: FontWeight.normal, fontSize: 13),
                          indicatorColor: FlutterFlowTheme.of(context).primary,
                          indicatorSize: TabBarIndicatorSize.tab,
                          tabs: [
                            Tab(text: 'Penerimaan'),
                            Tab(text: 'Penyaluran'),
                            Tab(text: 'Hak Amil'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          child: TabBarView(
                            controller: _tabController,
                            physics: const BouncingScrollPhysics(),
                            children: [
                              _buildPenerimaanTab(context, _model.reportData!),
                              _buildPenyaluranTab(context, _model.reportData!),
                              _buildHakAmilTab(context, _model.reportData!),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        floatingActionButton: !_model.isLoading && _model.reportData != null
            ? FloatingActionButton.extended(
                onPressed: () async {
                  await _generatePdf();
                },
                backgroundColor: FlutterFlowTheme.of(context).primaryDark,
                elevation: 4.0,
                icon: Icon(
                  Icons.picture_as_pdf_outlined,
                  color: Colors.white,
                ),
                label: Text(
                  'Cetak Laporan',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                  ),
                ),
              )
            : null,
      ),
    );
  }

  Widget _buildFilterPanel() {
    return Container(
      color: FlutterFlowTheme.of(context).secondaryBackground,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: ReportPeriod.values.map((period) {
                final isSelected = _model.selectedPeriod == period;
                String label = '';
                switch (period) {
                  case ReportPeriod.tahunan:
                    label = 'Tahunan';
                    break;
                  case ReportPeriod.bulanan:
                    label = 'Bulanan';
                    break;
                  case ReportPeriod.harian:
                    label = 'Harian';
                    break;
                  case ReportPeriod.rentang:
                    label = 'Rentang';
                    break;
                }
                return Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(label),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) {
                        safeSetState(() {
                          switch (period) {
                            case ReportPeriod.tahunan:
                              _model.setYearly(DateTime.now().year);
                              break;
                            case ReportPeriod.bulanan:
                              _model.setMonthly(
                                  DateTime.now().year, DateTime.now().month);
                              break;
                            case ReportPeriod.harian:
                              _model.setDaily(DateTime.now());
                              break;
                            case ReportPeriod.rentang:
                              final now = DateTime.now();
                              _model.setDateRange(
                                  now.subtract(Duration(days: 7)), now);
                              break;
                          }
                        });
                        _loadData(); // Auto refresh
                      }
                    },
                    selectedColor:
                        FlutterFlowTheme.of(context).primary.withOpacity(0.1),
                    labelStyle: TextStyle(
                      color: isSelected
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).secondaryText,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    backgroundColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected
                            ? FlutterFlowTheme.of(context).primary
                            : Colors.transparent,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 12),
          _buildFilterControls(),
        ],
      ),
    );
  }

  Widget _buildFilterControls() {
    switch (_model.selectedPeriod) {
      case ReportPeriod.tahunan:
        return Row(
          children: [
            IconButton(
              icon: Icon(Icons.chevron_left),
              onPressed: () {
                safeSetState(() => _model.setYearly(_model.selectedYear - 1));
                _loadData();
              },
            ),
            Text(
              '${_model.selectedYear}',
              style:
                  GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            IconButton(
              icon: Icon(Icons.chevron_right),
              onPressed: () {
                safeSetState(() => _model.setYearly(_model.selectedYear + 1));
                _loadData();
              },
            ),
          ],
        );
      case ReportPeriod.bulanan:
        return Row(
          children: [
            DropdownButton<int>(
              value: _model.selectedMonth,
              underline: SizedBox(),
              items: List.generate(12, (index) {
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
                return DropdownMenuItem(
                  value: index + 1,
                  child: Text(monthNames[index]),
                );
              }),
              onChanged: (val) {
                if (val != null) {
                  safeSetState(
                      () => _model.setMonthly(_model.selectedYear, val));
                  _loadData();
                }
              },
            ),
            SizedBox(width: 16),
            DropdownButton<int>(
              value: _model.selectedYear,
              underline: SizedBox(),
              items: List.generate(5, (index) {
                final year = DateTime.now().year - 2 + index;
                return DropdownMenuItem(value: year, child: Text('$year'));
              }),
              onChanged: (val) {
                if (val != null) {
                  safeSetState(
                      () => _model.setMonthly(val, _model.selectedMonth ?? 1));
                  _loadData();
                }
              },
            ),
          ],
        );
      case ReportPeriod.harian:
        return InkWell(
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: _model.selectedDate ?? DateTime.now(),
              firstDate: DateTime(2020),
              lastDate: DateTime(2030),
            );
            if (picked != null) {
              safeSetState(() => _model.setDaily(picked));
              _loadData();
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.calendar_today,
                    size: 16,
                    color: FlutterFlowTheme.of(context).secondaryText),
                SizedBox(width: 8),
                Text(
                  _model.selectedDate != null
                      ? DateFormat('dd/MM/yyyy').format(_model.selectedDate!)
                      : 'Pilih Tanggal',
                  style: GoogleFonts.inter(),
                ),
              ],
            ),
          ),
        );
      case ReportPeriod.rentang:
        return InkWell(
          onTap: () async {
            final picked = await showDateRangePicker(
              context: context,
              firstDate: DateTime(2020),
              lastDate: DateTime(2030),
              initialDateRange: _model.fromDate != null && _model.toDate != null
                  ? DateTimeRange(start: _model.fromDate!, end: _model.toDate!)
                  : null,
            );
            if (picked != null) {
              safeSetState(() => _model.setDateRange(picked.start, picked.end));
              _loadData();
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.date_range,
                    size: 16,
                    color: FlutterFlowTheme.of(context).secondaryText),
                SizedBox(width: 8),
                Text(
                  _model.fromDate != null && _model.toDate != null
                      ? '${DateFormat('dd/MM/yyyy').format(_model.fromDate!)} - ${DateFormat('dd/MM/yyyy').format(_model.toDate!)}'
                      : 'Pilih Rentang',
                  style: GoogleFonts.inter(),
                ),
              ],
            ),
          ),
        );
    }
  }

  Widget _buildHeaderSummary(BuildContext context, ApiCallResponse reportData) {
    String titleUang = 'Total Penerimaan Uang';
    String titleBeras = 'Total Penerimaan Beras';
    int totalUang = 0;
    double totalBeras = 0.0;

    if (_tabController.index == 1) {
      // Penyaluran Tab
      titleUang = 'Total Pendistribusian Uang';
      titleBeras = 'Total Pendistribusian Beras';
      totalUang = valueOrDefault<int>(
          RekapEndPointGroup.rekapZisReportCall
              .totalPendisAmount(reportData.jsonBody),
          0);
      totalBeras = valueOrDefault<double>(
          RekapEndPointGroup.rekapZisReportCall
              .totalPendisRice(reportData.jsonBody),
          0.0);
    } else if (_tabController.index == 2) {
      // Hak Amil Tab
      titleUang = 'Penerimaan Hak Amil Uang';
      titleBeras = 'Penerimaan Hak Amil Beras';
      totalUang = valueOrDefault<int>(
          RekapEndPointGroup.rekapZisReportCall
              .totalHakAmil(reportData.jsonBody),
          0);
      totalBeras = 0.0;
    } else {
      // Penerimaan Tab (default)
      totalUang = (valueOrDefault<int>(
              RekapEndPointGroup.rekapZisReportCall
                  .totalZfAmount(reportData.jsonBody),
              0) +
          valueOrDefault<int>(
              RekapEndPointGroup.rekapZisReportCall
                  .totalZmAmount(reportData.jsonBody),
              0) +
          valueOrDefault<int>(
              RekapEndPointGroup.rekapZisReportCall
                  .totalIfsAmount(reportData.jsonBody),
              0));
      totalBeras = valueOrDefault<double>(
          RekapEndPointGroup.rekapZisReportCall
              .totalZfRice(reportData.jsonBody),
          0.0);
    }

    return Container(
      width: double.infinity,
      color: FlutterFlowTheme.of(context).primaryDark,
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        children: [
          Divider(color: Colors.white.withOpacity(0.1)),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleUang,
                      style: GoogleFonts.inter(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      formatNumber(
                        totalUang,
                        formatType: FormatType.custom,
                        currency: 'Rp ',
                        format: '###,###',
                        locale: 'ID',
                      ),
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 1,
                height: 40,
                color: Colors.white.withOpacity(0.2),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      titleBeras,
                      style: GoogleFonts.inter(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      formatNumber(
                        totalBeras,
                        formatType: FormatType.custom,
                        format: '##.## Kg',
                        locale: 'ID',
                      ),
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPenerimaanTab(BuildContext context, ApiCallResponse reportData) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(ModernSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Zakat Fitrah'),
          SizedBox(height: ModernSpacing.sm),
          _buildDetailCard(
            items: [
              _buildDetailRow(
                'Subtotal Uang',
                formatNumber(
                  RekapEndPointGroup.rekapZisReportCall
                      .totalZfAmount(reportData.jsonBody),
                  formatType: FormatType.custom,
                  currency: 'Rp ',
                  format: '###,###',
                  locale: 'ID',
                ),
                isBoldValue: true,
                valueColor: FlutterFlowTheme.of(context).primary,
              ),
              _buildDetailRow(
                'Subtotal Beras',
                formatNumber(
                  RekapEndPointGroup.rekapZisReportCall
                      .totalZfRice(reportData.jsonBody),
                  formatType: FormatType.custom,
                  format: '##.## Kg',
                  locale: 'ID',
                ),
                isBoldValue: true,
              ),
              _buildDetailRow(
                'Jumlah Muzakki',
                '${RekapEndPointGroup.rekapZisReportCall.totalZfMuzakki(reportData.jsonBody) ?? 0} Jiwa',
              ),
            ],
          ),
          SizedBox(height: ModernSpacing.md),
          _buildSectionTitle('Zakat Maal'),
          SizedBox(height: ModernSpacing.sm),
          _buildDetailCard(
            items: [
              _buildDetailRow(
                'Subtotal Penerimaan',
                formatNumber(
                  RekapEndPointGroup.rekapZisReportCall
                      .totalZmAmount(reportData.jsonBody),
                  formatType: FormatType.custom,
                  currency: 'Rp ',
                  format: '###,###',
                  locale: 'ID',
                ),
                isBoldValue: true,
                valueColor: FlutterFlowTheme.of(context).primary,
              ),
              _buildDetailRow(
                'Jumlah Muzakki',
                '${RekapEndPointGroup.rekapZisReportCall.totalZmMuzakki(reportData.jsonBody) ?? 0} Jiwa',
              ),
            ],
          ),
          SizedBox(height: ModernSpacing.md),
          _buildSectionTitle('Infak & Sedekah'),
          SizedBox(height: ModernSpacing.sm),
          _buildDetailCard(
            items: [
              _buildDetailRow(
                'Subtotal Penerimaan',
                formatNumber(
                  RekapEndPointGroup.rekapZisReportCall
                      .totalIfsAmount(reportData.jsonBody),
                  formatType: FormatType.custom,
                  currency: 'Rp ',
                  format: '###,###',
                  locale: 'ID',
                ),
                isBoldValue: true,
                valueColor: FlutterFlowTheme.of(context).primary,
              ),
              _buildDetailRow(
                'Jumlah Munfiq',
                '${RekapEndPointGroup.rekapZisReportCall.totalIfsMunfiq(reportData.jsonBody) ?? 0} Orang',
              ),
            ],
          ),
          SizedBox(height: 80), // Space for FAB
        ],
      ),
    );
  }

  Widget _buildPenyaluranTab(BuildContext context, ApiCallResponse reportData) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(ModernSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Penyaluran Dana (Uang & Beras)'),
          SizedBox(height: ModernSpacing.sm),
          _buildDetailCard(
            items: [
              _buildDetailRow(
                'Zakat Fitrah Uang',
                formatNumber(
                  RekapEndPointGroup.rekapZisReportCall
                      .totalPendisZfAmount(reportData.jsonBody),
                  formatType: FormatType.custom,
                  currency: 'Rp ',
                  format: '###,###',
                  locale: 'ID',
                ),
                valueColor: FlutterFlowTheme.of(context).error,
              ),
              _buildDetailRow(
                'Zakat Fitrah Beras',
                formatNumber(
                  RekapEndPointGroup.rekapZisReportCall
                      .totalPendisZfRice(reportData.jsonBody),
                  formatType: FormatType.custom,
                  format: '##.## Kg',
                  locale: 'ID',
                ),
                valueColor: FlutterFlowTheme.of(context).error,
              ),
              _buildDetailRow(
                'Zakat Maal',
                formatNumber(
                  RekapEndPointGroup.rekapZisReportCall
                      .totalPendisZm(reportData.jsonBody),
                  formatType: FormatType.custom,
                  currency: 'Rp ',
                  format: '###,###',
                  locale: 'ID',
                ),
                valueColor: FlutterFlowTheme.of(context).error,
              ),
              _buildDetailRow(
                'Infak Sedekah',
                formatNumber(
                  RekapEndPointGroup.rekapZisReportCall
                      .totalPendisIfs(reportData.jsonBody),
                  formatType: FormatType.custom,
                  currency: 'Rp ',
                  format: '###,###',
                  locale: 'ID',
                ),
                valueColor: FlutterFlowTheme.of(context).error,
              ),
            ],
          ),
          SizedBox(height: ModernSpacing.md),

          SizedBox(height: 80), // Space for FAB
        ],
      ),
    );
  }

  Widget _buildHakAmilTab(BuildContext context, ApiCallResponse reportData) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(ModernSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Hak Amil (Uang & Beras)'),
          SizedBox(height: ModernSpacing.sm),
          _buildDetailCard(
            items: [
              _buildDetailRow(
                'Penerimaan Hak Amil',
                '${formatNumber(
                  RekapEndPointGroup.rekapZisReportCall
                      .totalHakAmil(reportData.jsonBody),
                  formatType: FormatType.custom,
                  currency: 'Rp ',
                  format: '###,###',
                  locale: 'ID',
                )} | 0 Kg',
                isBoldValue: true,
              ),
              Divider(height: 24),
              _buildDetailRow(
                'Penyerapan Hak Amil',
                'Rp 0 | 0 Kg',
                isBoldValue: true,
                valueColor: FlutterFlowTheme.of(context).secondaryText,
              ),
            ],
          ),
          SizedBox(height: 80), // Space for FAB
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.inter(
        color: FlutterFlowTheme.of(context).primaryText,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildDetailCard({required List<Widget> items}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(ModernRadius.md),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0, 2),
            blurRadius: 10,
          ),
        ],
      ),
      padding: EdgeInsets.all(ModernSpacing.md),
      child: Column(
        children: items,
      ),
    );
  }

  Widget _buildDetailRow(String label, String value,
      {bool isBoldValue = false, Color? valueColor}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              color: FlutterFlowTheme.of(context).secondaryText,
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.inter(
              color: valueColor ?? FlutterFlowTheme.of(context).primaryText,
              fontSize: 14,
              fontWeight: isBoldValue ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
