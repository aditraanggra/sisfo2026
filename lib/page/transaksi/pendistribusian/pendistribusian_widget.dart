import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/component/date_picker/date_picker_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pendistribusian_model.dart';
export 'pendistribusian_model.dart';

class PendistribusianWidget extends StatefulWidget {
  const PendistribusianWidget({
    super.key,
    int? sisaDanaZf,
    int? sisaDanaZm,
    int? sisaDanaIfs,
    double? sisaBerasZf,
    int? sisaUangZf,
    int? sisaSaldoAmil,
    double? sisaAmilZfBeras,
    int? sisaAmilZfUang,
    int? sisaAmilZm,
    int? sisaAmilIfs,
  })  : this.sisaDanaZf = sisaDanaZf ?? 0,
        this.sisaDanaZm = sisaDanaZm ?? 0,
        this.sisaDanaIfs = sisaDanaIfs ?? 0,
        this.sisaBerasZf = sisaBerasZf ?? 0.0,
        this.sisaUangZf = sisaUangZf ?? 0,
        this.sisaSaldoAmil = sisaSaldoAmil ?? 0,
        this.sisaAmilZfBeras = sisaAmilZfBeras ?? 0.0,
        this.sisaAmilZfUang = sisaAmilZfUang ?? 0,
        this.sisaAmilZm = sisaAmilZm ?? 0,
        this.sisaAmilIfs = sisaAmilIfs ?? 0;

  final int sisaDanaZf;
  final int sisaDanaZm;
  final int sisaDanaIfs;
  final double sisaBerasZf;
  final int sisaUangZf;
  final int sisaSaldoAmil;
  final double sisaAmilZfBeras;
  final int sisaAmilZfUang;
  final int sisaAmilZm;
  final int sisaAmilIfs;

  static String routeName = 'Pendistribusian';
  static String routePath = '/pendistribusian';

  @override
  State<PendistribusianWidget> createState() => _PendistribusianWidgetState();
}

class _PendistribusianWidgetState extends State<PendistribusianWidget> {
  late PendistribusianModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PendistribusianModel());

    _model.namaMustahikTextController ??= TextEditingController();
    _model.namaMustahikFocusNode ??= FocusNode();

    _model.nomorNIKTextController ??= TextEditingController();
    _model.nomorNIKFocusNode ??= FocusNode();

    _model.berasTextController ??= TextEditingController();
    _model.berasFocusNode ??= FocusNode();

    _model.jumlaUangTextController ??= TextEditingController();
    _model.jumlaUangFocusNode ??= FocusNode();

    _model.penerimaManfaatTextController ??= TextEditingController();
    _model.penerimaManfaatFocusNode ??= FocusNode();

    _model.keteranganTextController ??= TextEditingController();
    _model.keteranganFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: responsiveVisibility(
          context: context,
          desktop: false,
        )
            ? AppBar(
                backgroundColor: Color(0xFF259148),
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 48.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
                title: Text(
                  'Input Data Pendistribusian',
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.notoSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        ),
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                actions: [],
                centerTitle: false,
                elevation: 0.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Container(
            color: Color(0xFFF1F4F8),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 32.0),
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 8.0),
                        child: Text(
                          'TANGGAL TRANSAKSI',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.notoSans(
                                      fontWeight: FontWeight.w600,
                                    ),
                                    letterSpacing: 0.5,
                                  ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 1.0),
                            )
                          ],
                        ),
                        child: wrapWithModel(
                          model: _model.datePickerModel,
                          updateCallback: () => safeSetState(() {}),
                          child: DatePickerWidget(),
                        ),
                      ),
                      SizedBox(height: 24.0),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 8.0),
                        child: Text(
                          'DATA MUSTAHIK',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.notoSans(
                                      fontWeight: FontWeight.w600,
                                    ),
                                    letterSpacing: 0.5,
                                  ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: _model.namaMustahikTextController,
                                focusNode: _model.namaMustahikFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.namaMustahikTextController',
                                  Duration(milliseconds: 2000),
                                  () => safeSetState(() {}),
                                ),
                                autofocus: false,
                                decoration: InputDecoration(
                                  labelText: 'Nama Mustahik',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintText: 'Masukkan nama lengkap',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.notoSans(),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF259148),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  prefixIcon: Icon(
                                    Icons.person_outline,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 20.0,
                                  ),
                                  suffixIcon: _model.namaMustahikTextController!
                                          .text.isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model.namaMustahikTextController
                                                ?.clear();
                                            safeSetState(() {});
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            size: 20,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                        )
                                      : null,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model
                                    .namaMustahikTextControllerValidator
                                    .asValidator(context),
                              ),
                              SizedBox(height: 16.0),
                              TextFormField(
                                controller: _model.nomorNIKTextController,
                                focusNode: _model.nomorNIKFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.nomorNIKTextController',
                                  Duration(milliseconds: 2000),
                                  () => safeSetState(() {}),
                                ),
                                autofocus: false,
                                maxLength: 16,
                                decoration: InputDecoration(
                                  labelText: 'Nomor NIK',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintText: '16 digit NIK',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.notoSans(),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF259148),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  prefixIcon: Icon(
                                    Icons.badge_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 20.0,
                                  ),
                                  suffixIcon: _model.nomorNIKTextController!
                                          .text.isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model.nomorNIKTextController
                                                ?.clear();
                                            safeSetState(() {});
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            size: 20,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                        )
                                      : null,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                keyboardType: TextInputType.number,
                                validator: _model
                                    .nomorNIKTextControllerValidator
                                    .asValidator(context),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 24.0),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 8.0),
                        child: Text(
                          'DETAIL TRANSAKSI',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.notoSans(
                                      fontWeight: FontWeight.w600,
                                    ),
                                    letterSpacing: 0.5,
                                  ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FlutterFlowDropDown<String>(
                                controller:
                                    _model.jenisTransaksiValueController ??=
                                        FormFieldController<String>(
                                  _model.jenisTransaksiValue ??= '',
                                ),
                                options: List<String>.from(
                                    ['zakat fitrah', 'zakat mal', 'infak']),
                                optionLabels: [
                                  'Zakat Fitrah',
                                  'Zakat Mal',
                                  'Infak Sedekah'
                                ],
                                onChanged: (val) async {
                                  safeSetState(
                                      () => _model.jenisTransaksiValue = val);
                                  _model.currentUang = 0;
                                  safeSetState(() {});
                                  safeSetState(() {
                                    _model.jumlaUangTextController?.clear();
                                  });
                                },
                                width: double.infinity,
                                height: 50.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: 'Pilih Sumber Dana',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 1.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                              if (_model.jenisTransaksiValue != 'infak') ...[
                                SizedBox(height: 16.0),
                                FlutterFlowDropDown<String>(
                                  controller:
                                      _model.jenisAsnafValueController ??=
                                          FormFieldController<String>(null),
                                  options: List<String>.from(
                                      ['fakir', 'miskin', 'fisabililah']),
                                  optionLabels: [
                                    'Fakir',
                                    'Miskin',
                                    'Fisabililah'
                                  ],
                                  onChanged: (val) => safeSetState(
                                      () => _model.jenisAsnafValue = val),
                                  width: double.infinity,
                                  height: 50.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  hintText: 'Pilih Asnaf',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderWidth: 1.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ],
                              SizedBox(height: 16.0),
                              FlutterFlowDropDown<String>(
                                controller:
                                    _model.jenisProgramValueController ??=
                                        FormFieldController<String>(
                                  _model.jenisProgramValue ??= '',
                                ),
                                options: List<String>.from(
                                    ['kemanusiaan', 'dakwah']),
                                optionLabels: ['Kemanusiaan', 'Dakwah'],
                                onChanged: (val) => safeSetState(
                                    () => _model.jenisProgramValue = val),
                                width: double.infinity,
                                height: 50.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: 'Pilih Program',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 1.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 24.0),
                      if ((_model.jenisTransaksiValue != 'zakat fitrah') &&
                          (_model.jenisAsnafValue != 'Amil') &&
                          (_model.jenisProgramValue != 'Operasional'))
                        Padding(
                          padding: EdgeInsets.only(bottom: 24.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFFE8F5E9), Colors.white],
                                stops: [0.0, 1.0],
                                begin: AlignmentDirectional(0.0, -1.0),
                                end: AlignmentDirectional(0.0, 1.0),
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: Color(0xFF259148),
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sisa Alokasi Dana',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.notoSans(),
                                          color: Color(0xFF259148),
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _model.jenisTransaksiValue ==
                                                'zakat mal'
                                            ? 'Zakat Mal'
                                            : 'Infak',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font: GoogleFonts.notoSans(),
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Text(
                                        formatNumber(
                                          _model.jenisTransaksiValue ==
                                                  'zakat mal'
                                              ? widget.sisaDanaZm
                                              : widget.sisaDanaIfs,
                                          formatType: FormatType.decimal,
                                          decimalType:
                                              DecimalType.periodDecimal,
                                          currency: 'Rp. ',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              font: GoogleFonts.notoSans(),
                                              color: Color(0xFF259148),
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (_model.jenisTransaksiValue == 'zakat fitrah') ...[
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 0.0, 12.0),
                          child: FlutterFlowRadioButton(
                            options: ['Beras', 'Uang'].toList(),
                            onChanged: (val) async {
                              safeSetState(() {});
                              if (_model.jenisZFValue == 'Beras') {
                                _model.currentUang = 0;
                                safeSetState(() {});
                                safeSetState(() {
                                  _model.berasTextController?.clear();
                                });
                              } else {
                                _model.currentBeras = 0.0;
                                safeSetState(() {});
                                safeSetState(() {
                                  _model.jumlaUangTextController?.clear();
                                });
                              }
                            },
                            controller: _model.jenisZFValueController ??=
                                FormFieldController<String>('Uang'),
                            optionHeight: 40.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  font: GoogleFonts.notoSans(),
                                  fontWeight: FontWeight.w500,
                                ),
                            selectedTextStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.notoSans(),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                            buttonPosition: RadioButtonPosition.left,
                            direction: Axis.horizontal,
                            radioButtonColor: Color(0xFF259148),
                            inactiveRadioButtonColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            toggleable: false,
                            horizontalAlignment: WrapAlignment.start,
                            verticalAlignment: WrapCrossAlignment.start,
                          ),
                        ),
                        if (_model.jenisZFValue == 'Beras')
                          Padding(
                            padding: EdgeInsets.only(bottom: 24.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x33000000),
                                    offset: Offset(0.0, 2.0),
                                  )
                                ],
                              ),
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller:
                                              _model.berasTextController,
                                          focusNode: _model.berasFocusNode,
                                          decoration: InputDecoration(
                                            labelText: 'Jumlah Beras',
                                            hintText: '0.0',
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xFF259148)),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                          ),
                                          keyboardType:
                                              TextInputType.numberWithOptions(
                                                  decimal: true),
                                          validator: _model
                                              .berasTextControllerValidator
                                              .asValidator(context),
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.berasTextController',
                                            Duration(milliseconds: 200),
                                            () async {
                                              if (_model.berasTextController
                                                      .text !=
                                                  '') {
                                                _model.currentBeras =
                                                    double.tryParse(_model
                                                        .berasTextController
                                                        .text);
                                                safeSetState(() {});
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Padding(
                                        padding: EdgeInsets.only(top: 18.0),
                                        child: Text(
                                          'Kg',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (_model.currentBeras! > widget.sisaBerasZf)
                                    Padding(
                                      padding: EdgeInsets.only(top: 8),
                                      child: Row(
                                        children: [
                                          Icon(Icons.error_outline,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              size: 16),
                                          SizedBox(width: 4),
                                          Expanded(
                                            child: Text(
                                              'Jumlah beras tidak boleh melebihi alokasi',
                                              style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if ((_model.jenisAsnafValue != 'Amil') &&
                                      (_model.jenisProgramValue !=
                                          'Operasional'))
                                    Padding(
                                      padding: EdgeInsets.only(top: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Sisa Beras',
                                            style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontStyle: FontStyle.italic),
                                          ),
                                          Text(
                                            formatNumber(
                                              widget.sisaBerasZf,
                                              formatType: FormatType.custom,
                                              format: '##.## Kg',
                                              locale: 'id_ID',
                                            ),
                                            style: TextStyle(
                                                color: Color(0xFF259148),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                      ],
                      if ((_model.jenisTransaksiValue != 'zakat fitrah') ||
                          (_model.jenisZFValue == 'Uang'))
                        Padding(
                          padding: EdgeInsets.only(bottom: 24.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x33000000),
                                  offset: Offset(0.0, 2.0),
                                )
                              ],
                            ),
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: _model.jumlaUangTextController,
                                  focusNode: _model.jumlaUangFocusNode,
                                  decoration: InputDecoration(
                                    labelText: 'Jumlah Uang',
                                    hintText: 'Rp 0',
                                    prefixIcon: Icon(Icons.attach_money,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate),
                                        borderRadius: BorderRadius.circular(8)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF259148)),
                                        borderRadius: BorderRadius.circular(8)),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  keyboardType: TextInputType.number,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.jumlaUangTextController',
                                    Duration(milliseconds: 200),
                                    () async {
                                      if (((_model.jumlaUangTextController
                                                      .text !=
                                                  '') &&
                                              (_model.jenisZFValue ==
                                                  'Uang')) ||
                                          ((_model.jumlaUangTextController
                                                      .text !=
                                                  '') &&
                                              (_model.jenisTransaksiValue ==
                                                  'Zakat Mal')) ||
                                          ((_model.jumlaUangTextController
                                                      .text !=
                                                  '') &&
                                              (_model.jenisTransaksiValue ==
                                                  'Infak Tidak Terikat'))) {
                                        _model.currentUang = int.tryParse(_model
                                            .jumlaUangTextController.text);
                                        safeSetState(() {});
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 8.0),
                        child: Text(
                          'INFO TAMBAHAN',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.notoSans(
                                      fontWeight: FontWeight.w600,
                                    ),
                                    letterSpacing: 0.5,
                                  ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                        ),
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _model.penerimaManfaatTextController,
                              focusNode: _model.penerimaManfaatFocusNode,
                              decoration: InputDecoration(
                                labelText: 'Penerima Manfaat',
                                suffixText: 'Orang',
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate),
                                    borderRadius: BorderRadius.circular(8)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF259148)),
                                    borderRadius: BorderRadius.circular(8)),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                prefixIcon: Icon(Icons.people_outline,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              controller: _model.keteranganTextController,
                              focusNode: _model.keteranganFocusNode,
                              maxLines: 3,
                              decoration: InputDecoration(
                                labelText: 'Keterangan',
                                alignLabelWithHint: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate),
                                    borderRadius: BorderRadius.circular(8)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF259148)),
                                    borderRadius: BorderRadius.circular(8)),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 32),
                      FFButtonWidget(
                        onPressed: () async {
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }

                          if (_model.currentUang! > widget.sisaDanaZm) {
                            if (_model.jenisTransaksiValue == 'zakat mal') {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Info'),
                                    content: Text(
                                        'Nominal melebihi sisa alokasi dana'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              return;
                            }
                          }

                          if (_model.currentUang! > widget.sisaDanaIfs) {
                            if (_model.jenisTransaksiValue == 'infak') {
                              await showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                          title: Text('Info'),
                                          content: Text(
                                              'Nominal melebihi sisa alokasi dana'),
                                          actions: [
                                            TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(ctx),
                                                child: Text('Ok'))
                                          ]));
                              return;
                            }
                          }

                          if (_model.currentBeras! > widget.sisaBerasZf) {
                            if (_model.jenisZFValue == 'Beras') {
                              await showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                          title: Text('Info'),
                                          content: Text(
                                              'Nominal melebihi sisa alokasi beras'),
                                          actions: [
                                            TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(ctx),
                                                child: Text('Ok'))
                                          ]));
                              return;
                            }
                          }

                          var _shouldSetState = false;
                          _model.responsePendisAdd =
                              await TransactionEndPointGroup
                                  .addPendistribusianCall
                                  .call(
                            token: currentAuthenticationToken,
                            unitId: FFAppState().profileUPZ.id,
                            trxDate:
                                _model.datePickerModel.datePicked?.toString(),
                            mustahikName:
                                _model.namaMustahikTextController.text,
                            nik: _model.nomorNIKTextController.text,
                            fundType: _model.jenisTransaksiValue,
                            asnaf: _model.jenisAsnafValue,
                            program: _model.jenisProgramValue,
                            totalAmount: valueOrDefault<int>(
                              int.tryParse(_model.jumlaUangTextController.text),
                              0,
                            ),
                            // keterangan: _model.keteranganTextController.text, // API does not support this yet
                            totalRice: valueOrDefault<double>(
                              double.tryParse(_model.berasTextController.text),
                              0.0,
                            ),
                            beneficiary: valueOrDefault<int>(
                              int.tryParse(
                                  _model.penerimaManfaatTextController.text),
                              0,
                            ),
                          );

                          _shouldSetState = true;
                          if ((_model.responsePendisAdd?.succeeded ?? true)) {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Info'),
                                  content: Text('Transaksi Berhasil'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );

                            context.goNamed(
                              HomeWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.rightToLeft,
                                ),
                              },
                            );
                          } else {
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }

                          if (_shouldSetState) safeSetState(() {});
                        },
                        text: 'Proses Transaksi',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF259148),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.notoSans(
                                      fontWeight: FontWeight.w600,
                                    ),
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
