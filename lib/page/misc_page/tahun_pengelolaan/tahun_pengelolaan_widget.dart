import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tahun_pengelolaan_model.dart';
export 'tahun_pengelolaan_model.dart';

class TahunPengelolaanWidget extends StatefulWidget {
  const TahunPengelolaanWidget({super.key});

  static String routeName = 'TahunPengelolaan';
  static String routePath = '/tahunPengelolaan';

  @override
  State<TahunPengelolaanWidget> createState() => _TahunPengelolaanWidgetState();
}

class _TahunPengelolaanWidgetState extends State<TahunPengelolaanWidget> {
  late TahunPengelolaanModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TahunPengelolaanModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  List<int> _generateYearOptions() {
    final currentYear = DateTime.now().year;
    return List.generate(4, (index) => currentYear - index);
  }

  void _selectYear(int year) {
    safeSetState(() {
      _model.selectedYear = year;
    });
    FFAppState().year = year;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          year == 0
              ? 'Menampilkan data semua tahun'
              : 'Tahun pengelolaan diatur ke $year',
        ),
        backgroundColor: Color(0xFF259148),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    final yearOptions = _generateYearOptions();
    final currentSelectedYear = FFAppState().year;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF1A3C34),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 24.0,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Tahun Pengelolaan ZIS',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pilih tahun pengelolaan ZIS',
                style: GoogleFonts.inter(
                  color: Color(0xFF1A1A1A),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Data yang ditampilkan akan difilter berdasarkan tahun yang dipilih',
                style: GoogleFonts.inter(
                  color: Color(0xFF6B7280),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 24.0),
              Expanded(
                child: ListView(
                  children: [
                    ...yearOptions.map((year) => _buildYearOption(
                          title: year.toString(),
                          value: year,
                          isSelected: currentSelectedYear == year,
                        )),
                    _buildYearOption(
                      title: 'Semua Tahun',
                      subtitle: 'Tampilkan data dari semua tahun',
                      value: 0,
                      isSelected: currentSelectedYear == 0,
                      isSpecial: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildYearOption({
    required String title,
    String? subtitle,
    required int value,
    required bool isSelected,
    bool isSpecial = false,
  }) {
    return InkWell(
      onTap: () => _selectYear(value),
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFE8F5E9) : Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: isSelected ? Color(0xFF259148) : Color(0xFFE5E7EB),
            width: isSelected ? 2.0 : 1.0,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 44.0,
              height: 44.0,
              decoration: BoxDecoration(
                color: isSpecial ? Color(0xFFE3F2FD) : Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Icon(
                isSpecial ? Icons.calendar_today_rounded : Icons.event_rounded,
                color: isSpecial ? Color(0xFF1976D2) : Color(0xFF259148),
                size: 22.0,
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      color: isSelected ? Color(0xFF1A3C34) : Color(0xFF1A1A1A),
                      fontSize: 16.0,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w500,
                    ),
                  ),
                  if (subtitle != null) ...[
                    SizedBox(height: 2.0),
                    Text(
                      subtitle,
                      style: GoogleFonts.inter(
                        color: Color(0xFF6B7280),
                        fontSize: 13.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle_rounded,
                color: Color(0xFF259148),
                size: 24.0,
              ),
          ],
        ),
      ),
    );
  }
}
