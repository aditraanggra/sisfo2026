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

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pendistribusian_model.dart';
export 'pendistribusian_model.dart';

class PendistribusianWidget extends StatefulWidget {
  const PendistribusianWidget({
    super.key,
  });

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

    _model.jumlaUangTextController ??= TextEditingController();
    _model.jumlaUangFocusNode ??= FocusNode();

    _model.penerimaManfaatTextController ??= TextEditingController();
    _model.penerimaManfaatFocusNode ??= FocusNode();

    _model.keteranganTextController ??= TextEditingController();
    _model.keteranganFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.rekapAlokasi = RekapEndPointGroup.alokasiReportCall.call(
            token: currentAuthenticationToken,
            unitId: FFAppState().profileUPZ.id,
            year: FFAppState().year,
          );
        }));
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
                backgroundColor: Color(0xFF1A3C34),
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
                  'Pendistribusian ZIS',
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter',
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
                  child: FutureBuilder<ApiCallResponse>(
                    future: _model.rekapAlokasi,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 50.0),
                            child: SizedBox(
                              width: 40.0,
                              height: 40.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFF1A3C34),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      final rekapBody = snapshot.data!.jsonBody;
                      final sisaDanaZfUang = RekapEndPointGroup
                              .alokasiReportCall
                              .alokasiPendisZfUang(rekapBody) ??
                          0;
                      final sisaBerasZf = RekapEndPointGroup.alokasiReportCall
                              .alokasiPendisZfBeras(rekapBody) ??
                          0.0;
                      final sisaDanaZm = RekapEndPointGroup.alokasiReportCall
                              .alokasiPendisZm(rekapBody) ??
                          0;
                      final sisaDanaIfs = RekapEndPointGroup.alokasiReportCall
                              .alokasiPendisIfs(rekapBody) ??
                          0;

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.0),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10.0,
                                  color: Color(0x1A000000),
                                  offset: Offset(0.0, 4.0),
                                )
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 16.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF1A3C34),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.info_outline,
                                          color: Colors.white, size: 20.0),
                                      SizedBox(width: 8.0),
                                      Text(
                                        'Informasi Alokasi Dana',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: GridView(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 12.0,
                                      mainAxisSpacing: 12.0,
                                      childAspectRatio: 2.2,
                                    ),
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    children: [
                                      _buildAlokasiItem(
                                        context,
                                        'Zakat Fitrah (Uang)',
                                        sisaDanaZfUang,
                                        Icons.payments_outlined,
                                        formatType: FormatType.decimal,
                                        currency: 'Rp ',
                                      ),
                                      _buildAlokasiItem(
                                        context,
                                        'Zakat Fitrah (Beras)',
                                        sisaBerasZf,
                                        Icons.eco_outlined,
                                        formatType: FormatType.custom,
                                        format: '##.##',
                                        suffix: ' Kg',
                                      ),
                                      _buildAlokasiItem(
                                        context,
                                        'Zakat Mal',
                                        sisaDanaZm,
                                        Icons.account_balance_wallet_outlined,
                                        formatType: FormatType.decimal,
                                        currency: 'Rp ',
                                      ),
                                      _buildAlokasiItem(
                                        context,
                                        'Infak Sedekah',
                                        sisaDanaIfs,
                                        Icons.volunteer_activism_outlined,
                                        formatType: FormatType.decimal,
                                        currency: 'Rp ',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24.0),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 8.0),
                            child: Text(
                              'TANGGAL TRANSAKSI',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF1A3C34),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.0,
                                  ),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.datePickerModel,
                            updateCallback: () => safeSetState(() {}),
                            child: DatePickerWidget(),
                          ),
                          SizedBox(height: 24.0),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 8.0),
                            child: Text(
                              'IDENTITAS MUSTAHIK',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF1A3C34),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.0,
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
                                  blurRadius: 10.0,
                                  color: Color(0x0D000000),
                                  offset: Offset(0.0, 4.0),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    controller:
                                        _model.namaMustahikTextController,
                                    focusNode: _model.namaMustahikFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Nama Lengkap Mustahik',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                          ),
                                      hintText: 'Masukkan nama mustahik',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFE0E3E7),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF1A3C34),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16.0, 20.0, 16.0, 20.0),
                                      prefixIcon: Icon(
                                        Icons.person_outline,
                                        color: Color(0xFF1A3C34),
                                        size: 20.0,
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 14.0,
                                        ),
                                    validator: _model
                                        .namaMustahikTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 24.0),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 8.0),
                            child: Text(
                              'DETAIL TRANSAKSI',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF1A3C34),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.0,
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
                                      safeSetState(() =>
                                          _model.jenisTransaksiValue = val);
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
                                    fillColor: Colors.white,
                                    elevation: 0.0,
                                    borderColor: Color(0xFFE0E3E7),
                                    borderWidth: 1.0,
                                    borderRadius: 12.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                  if (_model.jenisTransaksiValue !=
                                      'infak') ...[
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
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      hintText: 'Pilih Asnaf',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: Colors.white,
                                      elevation: 0.0,
                                      borderColor: Color(0xFFE0E3E7),
                                      borderWidth: 1.0,
                                      borderRadius: 12.0,
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
                                      font: GoogleFonts.inter(),
                                      fontWeight: FontWeight.w500,
                                    ),
                                selectedTextStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                buttonPosition: RadioButtonPosition.left,
                                direction: Axis.horizontal,
                                radioButtonColor: Color(0xFF1A3C34),
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
                                    color: Colors.black,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xFF1A3C34)),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              keyboardType: TextInputType
                                                  .numberWithOptions(
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
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (_model.currentBeras != null &&
                                          _model.currentBeras! > sisaBerasZf)
                                        Padding(
                                          padding: EdgeInsets.only(top: 8),
                                          child: Row(
                                            children: [
                                              Icon(Icons.error_outline,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  size: 16),
                                              SizedBox(width: 4),
                                              Expanded(
                                                child: Text(
                                                  'Jumlah beras tidak boleh melebihi alokasi',
                                                  style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      fontSize: 12),
                                                ),
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
                                      controller:
                                          _model.jumlaUangTextController,
                                      focusNode: _model.jumlaUangFocusNode,
                                      decoration: InputDecoration(
                                        labelText: 'Jumlah Uang',
                                        hintText: 'Rp 0',
                                        prefixIcon: Icon(Icons.attach_money,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFF1A3C34)),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      keyboardType: TextInputType.number,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.jumlaUangTextController',
                                        Duration(milliseconds: 200),
                                        () async {
                                          if (_model.jumlaUangTextController
                                                  .text !=
                                              '') {
                                            _model.currentUang = int.tryParse(
                                                _model.jumlaUangTextController
                                                    .text);
                                            safeSetState(() {});
                                          }
                                        },
                                      ),
                                    ),
                                    if (_model.currentUang != null &&
                                        _model.currentUang! >
                                            ((_model.jenisTransaksiValue ==
                                                    'zakat fitrah')
                                                ? sisaDanaZfUang
                                                : (_model.jenisTransaksiValue ==
                                                        'zakat mal')
                                                    ? sisaDanaZm
                                                    : sisaDanaIfs))
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
                                                'Jumlah melebihi sisa alokasi ${(_model.jenisTransaksiValue == 'zakat fitrah') ? 'Zakat Fitrah' : (_model.jenisTransaksiValue == 'zakat mal') ? 'Zakat Mal' : 'Infak Sedekah'} (${formatNumber(
                                                  (_model.jenisTransaksiValue ==
                                                          'zakat fitrah')
                                                      ? sisaDanaZfUang
                                                      : (_model.jenisTransaksiValue ==
                                                              'zakat mal')
                                                          ? sisaDanaZm
                                                          : sisaDanaIfs,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.periodDecimal,
                                                  currency: 'Rp ',
                                                  locale: 'id_ID',
                                                )})',
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
                                  ],
                                ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 8.0),
                            child: Text(
                              'INFO TAMBAHAN',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
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
                                  controller:
                                      _model.penerimaManfaatTextController,
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
                                        borderSide: BorderSide(
                                            color: Color(0xFF259148)),
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
                                            color: Color(0xFFE0E3E7)),
                                        borderRadius:
                                            BorderRadius.circular(12.0)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF1A3C34),
                                            width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(12.0)),
                                    filled: true,
                                    fillColor: Colors.white,
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

                              if (_model.jenisTransaksiValue == null ||
                                  _model.jenisTransaksiValue!.isEmpty) {
                                await showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Peringatan'),
                                    content: Text(
                                        'Pilih sumber dana terlebih dahulu'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  ),
                                );
                                return;
                              }

                              if (_model.jenisTransaksiValue != 'infak' &&
                                  (_model.jenisAsnafValue == null ||
                                      _model.jenisAsnafValue!.isEmpty)) {
                                await showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Peringatan'),
                                    content:
                                        Text('Pilih asnaf terlebih dahulu'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  ),
                                );
                                return;
                              }

                              if (_model.jenisProgramValue == null ||
                                  _model.jenisProgramValue!.isEmpty) {
                                await showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Peringatan'),
                                    content:
                                        Text('Pilih program terlebih dahulu'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  ),
                                );
                                return;
                              }

                              if (_model.currentUang != null &&
                                  _model.currentUang! > sisaDanaZm) {
                                if (_model.jenisTransaksiValue == 'zakat mal') {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Info'),
                                        content: Text(
                                            'Nominal melebihi sisa alokasi dana zakat mal'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  return;
                                }
                              }

                              if (_model.currentUang != null &&
                                  _model.currentUang! > sisaDanaIfs) {
                                if (_model.jenisTransaksiValue == 'infak') {
                                  await showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                              title: Text('Info'),
                                              content: Text(
                                                  'Nominal melebihi sisa alokasi dana infak'),
                                              actions: [
                                                TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(ctx),
                                                    child: Text('Ok'))
                                              ]));
                                  return;
                                }
                              }

                              if (_model.currentBeras != null &&
                                  _model.currentBeras! > sisaBerasZf) {
                                if (_model.jenisZFValue == 'Beras') {
                                  await showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                              title: Text('Info'),
                                              content: Text(
                                                  'Nominal melebihi sisa alokasi beras zakat fitrah'),
                                              actions: [
                                                TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(ctx),
                                                    child: Text('Ok'))
                                              ]));
                                  return;
                                }
                              }

                              if (_model.currentUang != null &&
                                  _model.currentUang! > sisaDanaZfUang) {
                                if (_model.jenisZFValue == 'Uang') {
                                  await showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                              title: Text('Info'),
                                              content: Text(
                                                  'Nominal melebihi sisa alokasi uang zakat fitrah'),
                                              actions: [
                                                TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(ctx),
                                                    child: Text('Ok'))
                                              ]));
                                  return;
                                }
                              }

                              final pickedDate =
                                  _model.datePickerModel.datePicked;
                              final formattedDate = pickedDate != null
                                  ? '${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}'
                                  : '';

                              debugPrint('Creating pendis with data:');
                              debugPrint(
                                  '  unitId: ${FFAppState().profileUPZ.id}');
                              debugPrint('  trxDate: $formattedDate');
                              debugPrint(
                                  '  mustahikName: ${_model.namaMustahikTextController.text}');
                              debugPrint(
                                  '  fundType: ${_model.jenisTransaksiValue}');
                              debugPrint('  asnaf: ${_model.jenisAsnafValue}');
                              debugPrint(
                                  '  program: ${_model.jenisProgramValue}');
                              debugPrint(
                                  '  totalAmount: ${_model.currentUang}');
                              debugPrint('  totalRice: ${_model.currentBeras}');
                              debugPrint(
                                  '  beneficiary: ${_model.penerimaManfaatTextController.text}');

                              _model.responsePendisAdd =
                                  await TransactionEndPointGroup
                                      .addPendistribusianCall
                                      .call(
                                token: currentAuthenticationToken,
                                unitId: FFAppState().profileUPZ.id,
                                trxDate: formattedDate,
                                mustahikName:
                                    _model.namaMustahikTextController.text,
                                nik: '0000000000000000',
                                fundType: _model.jenisTransaksiValue,
                                asnaf: _model.jenisAsnafValue,
                                program: _model.jenisProgramValue,
                                totalAmount: valueOrDefault<int>(
                                  _model.currentUang,
                                  0,
                                ),
                                totalRice: valueOrDefault<double>(
                                  _model.currentBeras,
                                  0.0,
                                ),
                                beneficiary: valueOrDefault<int>(
                                  int.tryParse(_model
                                      .penerimaManfaatTextController.text),
                                  0,
                                ),
                              );

                              final response = _model.responsePendisAdd;
                              debugPrint(
                                  'Pendis Response: statusCode=${response?.statusCode}');
                              debugPrint(
                                  'Pendis Response Body: ${response?.jsonBody}');
                              debugPrint(
                                  'Pendis Exception: ${response?.exception}');

                              safeSetState(() {});

                              if (_model.responsePendisAdd?.succeeded ??
                                  false) {
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
                                final response = _model.responsePendisAdd;
                                String errorMessage = 'Terjadi kesalahan';

                                if (response?.jsonBody != null) {
                                  try {
                                    final body = response!.jsonBody;
                                    if (body is Map) {
                                      errorMessage =
                                          body['message']?.toString() ??
                                              body['error']?.toString() ??
                                              body['errors']?.toString() ??
                                              errorMessage;
                                    }
                                  } catch (_) {}
                                }

                                if (errorMessage == 'Terjadi kesalahan' &&
                                    response?.exception != null) {
                                  errorMessage = response!.exceptionMessage;
                                }

                                if (response?.statusCode != null) {
                                  errorMessage =
                                      '$errorMessage (Status: ${response?.statusCode})';
                                }

                                await showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Error'),
                                    content:
                                        Text('Transaksi gagal: $errorMessage'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                            text: 'Proses Transaksi',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF1A3C34),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
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
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAlokasiItem(
    BuildContext context,
    String label,
    dynamic value,
    IconData icon, {
    FormatType formatType = FormatType.decimal,
    String? currency,
    String? format,
    String? suffix,
  }) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(0xFFF1F4F8),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Color(0xFF1A3C34), size: 16.0),
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Inter',
                        fontSize: 10.0,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  formatNumber(
                        value,
                        formatType: formatType,
                        format: format,
                        decimalType: DecimalType.periodDecimal,
                        currency: currency,
                      ) +
                      (suffix ?? ''),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A3C34),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
