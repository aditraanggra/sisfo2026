import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/component/date_picker/date_picker_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'zakat_mal_model.dart';
export 'zakat_mal_model.dart';

/// Zakat Mal transaction form page with modern UI styling
/// Requirements: 9.1, 9.2, 9.3, 9.4, 9.5, 10.1, 10.2, 10.3
class ZakatMalWidget extends StatefulWidget {
  const ZakatMalWidget({super.key});

  static String routeName = 'ZakatMal';
  static String routePath = '/zakatMal';

  @override
  State<ZakatMalWidget> createState() => _ZakatMalWidgetState();
}

class _ZakatMalWidgetState extends State<ZakatMalWidget>
    with TickerProviderStateMixin {
  late ZakatMalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Animation controller for submit button press feedback
  late AnimationController _buttonAnimationController;
  late Animation<double> _buttonScaleAnimation;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZakatMalModel());

    _model.namaMuzakkiTextController ??= TextEditingController();
    _model.namaMuzakkiFocusNode ??= FocusNode();

    _model.muzakkiPhoneTextController ??= TextEditingController();
    _model.muzakkiPhoneFocusNode ??= FocusNode();

    _model.jmlZakatMalTextController ??= TextEditingController();
    _model.jmlZakatMalFocusNode ??= FocusNode();

    _model.keteranganTextController ??= TextEditingController();
    _model.keteranganFocusNode ??= FocusNode();

    _buttonAnimationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    _buttonScaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.98,
    ).animate(CurvedAnimation(
      parent: _buttonAnimationController,
      curve: Curves.easeInOut,
    ));

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    _buttonAnimationController.dispose();
    super.dispose();
  }

  /// Build modern styled input decoration
  /// Requirements: 9.1, 9.2, 9.3, 9.4, 9.5
  InputDecoration _buildModernInputDecoration({
    required String labelText,
    String? hintText,
    String? prefixText,
    Widget? suffixIcon,
    bool hasError = false,
  }) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      prefixText: prefixText,
      labelStyle: GoogleFonts.inter(
        color: FlutterFlowTheme.of(context).secondaryText,
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
      ),
      hintStyle: GoogleFonts.inter(
        color: FlutterFlowTheme.of(context).secondaryText.withOpacity(0.7),
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
      ),
      floatingLabelStyle: GoogleFonts.inter(
        color: hasError ? FlutterFlowTheme.of(context).error : FlutterFlowTheme.of(context).primary,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      enabledBorder: OutlineInputBorder(
        borderSide: hasError
            ? BorderSide(color: FlutterFlowTheme.of(context).error, width: 1.5)
            : BorderSide.none,
        borderRadius: BorderRadius.circular(ModernRadius.lg),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).primary,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(ModernRadius.lg),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).error,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(ModernRadius.lg),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).error,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(ModernRadius.lg),
      ),
      filled: true,
      fillColor: FlutterFlowTheme.of(context).primaryBackground,
      contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      suffixIcon: suffixIcon,
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
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 48.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).info,
                    size: 20.0,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
                title: Text(
                  'Penerimaan Zakat Mal',
                  style: GoogleFonts.inter(
                    color: FlutterFlowTheme.of(context).info,
                    fontSize: 16.0,
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(ModernRadius.xl),
                      boxShadow: ModernShadows.cardShadow,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(ModernSpacing.md),
                      child: Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildDatePickerSection(),
                            _buildMuzakkiDataSection(),
                            _buildJenisZakatDropdown(),
                            _buildNominalZakatMalSection(),
                            _buildKeteranganSection(),
                            _buildSubmitButton(),
                            SizedBox(height: ModernSpacing.md),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDatePickerSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: Text(
            'PILIH TANGGAL',
            style: GoogleFonts.inter(
              color: FlutterFlowTheme.of(context).secondaryText,
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),
        wrapWithModel(
          model: _model.datePickerModel,
          updateCallback: () => safeSetState(() {}),
          child: DatePickerWidget(),
        ),
      ],
    );
  }

  Widget _buildMuzakkiDataSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: Text(
            'DATA MUZAKKI',
            style: GoogleFonts.inter(
              color: FlutterFlowTheme.of(context).secondaryText,
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: SizedBox(
            height: 56.0,
            child: TextFormField(
              controller: _model.namaMuzakkiTextController,
              focusNode: _model.namaMuzakkiFocusNode,
              onChanged: (_) => EasyDebounce.debounce(
                '_model.namaMuzakkiTextController',
                Duration(milliseconds: 2000),
                () => safeSetState(() {}),
              ),
              autofocus: false,
              obscureText: false,
              decoration: _buildModernInputDecoration(
                labelText: 'Nama Muzakki / Donatur',
                suffixIcon: _model.namaMuzakkiTextController!.text.isNotEmpty
                    ? InkWell(
                        onTap: () async {
                          _model.namaMuzakkiTextController?.clear();
                          safeSetState(() {});
                        },
                        child: Icon(
                          Icons.clear,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 22,
                        ),
                      )
                    : null,
              ),
              style: GoogleFonts.inter(
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
              cursorColor: FlutterFlowTheme.of(context).primary,
              validator: _model.namaMuzakkiTextControllerValidator
                  .asValidator(context),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: SizedBox(
            height: 56.0,
            child: TextFormField(
              controller: _model.muzakkiPhoneTextController,
              focusNode: _model.muzakkiPhoneFocusNode,
              onChanged: (_) => EasyDebounce.debounce(
                '_model.muzakkiPhoneTextController',
                Duration(milliseconds: 2000),
                () => safeSetState(() {}),
              ),
              autofocus: false,
              obscureText: false,
              decoration: _buildModernInputDecoration(
                labelText: 'No Handphone',
                hintText: '08xxxxxxxxxx',
                suffixIcon: _model.muzakkiPhoneTextController!.text.isNotEmpty
                    ? InkWell(
                        onTap: () async {
                          _model.muzakkiPhoneTextController?.clear();
                          safeSetState(() {});
                        },
                        child: Icon(
                          Icons.clear,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 22,
                        ),
                      )
                    : null,
              ),
              style: GoogleFonts.inter(
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
              cursorColor: FlutterFlowTheme.of(context).primary,
              keyboardType: TextInputType.phone,
              validator: _model.muzakkiPhoneTextControllerValidator
                  .asValidator(context),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]'))
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildJenisZakatDropdown() {
    return Align(
      alignment: AlignmentDirectional(-1.0, -1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
        child: FlutterFlowDropDown<String>(
          controller: _model.jenisZMValueController ??=
              FormFieldController<String>(null),
          options: ['Profesi', 'Perdagangan', 'Pertanian', 'Harta'],
          onChanged: (val) => safeSetState(() => _model.jenisZMValue = val),
          width: double.infinity,
          height: 56.0,
          textStyle: GoogleFonts.inter(
            color: FlutterFlowTheme.of(context).primaryText,
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
          hintText: 'Pilih Jenis Zakat Mal',
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 24.0,
          ),
          fillColor: FlutterFlowTheme.of(context).primaryBackground,
          elevation: 0,
          borderColor: Colors.transparent,
          borderWidth: 0,
          borderRadius: ModernRadius.lg,
          margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
          hidesUnderline: true,
          isSearchable: false,
          isMultiSelect: false,
        ),
      ),
    );
  }

  Widget _buildNominalZakatMalSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: Text(
            'NOMINAL ZAKAT MAL',
            style: GoogleFonts.inter(
              color: FlutterFlowTheme.of(context).secondaryText,
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: TextFormField(
            controller: _model.jmlZakatMalTextController,
            focusNode: _model.jmlZakatMalFocusNode,
            onChanged: (_) => EasyDebounce.debounce(
              '_model.jmlZakatMalTextController',
              Duration(milliseconds: 2000),
              () => safeSetState(() {}),
            ),
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'Isi Nominal',
              labelStyle: GoogleFonts.inter(
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
              hintStyle: GoogleFonts.inter(
                color: FlutterFlowTheme.of(context).secondaryText.withOpacity(0.7),
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
              floatingLabelStyle: GoogleFonts.inter(
                color: FlutterFlowTheme.of(context).primary,
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(ModernRadius.sm),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).primary,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(ModernRadius.sm),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(ModernRadius.sm),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(ModernRadius.sm),
              ),
              suffixIcon: _model.jmlZakatMalTextController!.text.isNotEmpty
                  ? InkWell(
                      onTap: () async {
                        _model.jmlZakatMalTextController?.clear();
                        safeSetState(() {});
                      },
                      child: Icon(
                        Icons.clear,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 22,
                      ),
                    )
                  : null,
            ),
            style: GoogleFonts.inter(
              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 22.0,
              fontWeight: FontWeight.w500,
            ),
            cursorColor: FlutterFlowTheme.of(context).primary,
            maxLines: null,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator:
                _model.jmlZakatMalTextControllerValidator.asValidator(context),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildKeteranganSection() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 16.0),
      child: SizedBox(
        height: 56.0,
        child: TextFormField(
          controller: _model.keteranganTextController,
          focusNode: _model.keteranganFocusNode,
          onChanged: (_) => EasyDebounce.debounce(
            '_model.keteranganTextController',
            Duration(milliseconds: 2000),
            () => safeSetState(() {}),
          ),
          autofocus: false,
          obscureText: false,
          decoration: _buildModernInputDecoration(
            labelText: 'Keterangan',
            suffixIcon: _model.keteranganTextController!.text.isNotEmpty
                ? InkWell(
                    onTap: () async {
                      _model.keteranganTextController?.clear();
                      safeSetState(() {});
                    },
                    child: Icon(
                      Icons.clear,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 22,
                    ),
                  )
                : null,
          ),
          style: GoogleFonts.inter(
            color: FlutterFlowTheme.of(context).primaryText,
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
          cursorColor: FlutterFlowTheme.of(context).primary,
          validator:
              _model.keteranganTextControllerValidator.asValidator(context),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
      child: AnimatedBuilder(
        animation: _buttonScaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _buttonScaleAnimation.value,
            child: child,
          );
        },
        child: GestureDetector(
          onTapDown: (_) {
            _buttonAnimationController.forward();
          },
          onTapUp: (_) {
            _buttonAnimationController.reverse();
          },
          onTapCancel: () {
            _buttonAnimationController.reverse();
          },
          child: FFButtonWidget(
            onPressed: () async {
              if (_model.formKey.currentState == null ||
                  !_model.formKey.currentState!.validate()) {
                return;
              }
              if (_model.datePickerModel.datePicked == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Tanggal Belum Dipilih',
                      style: GoogleFonts.inter(
                        color: FlutterFlowTheme.of(context).info,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).error,
                  ),
                );
                return;
              }
              if (_model.jenisZMValue == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Jenis Zakat Mal Belum Dipilih',
                      style: GoogleFonts.inter(
                        color: FlutterFlowTheme.of(context).info,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).error,
                  ),
                );
                return;
              }
              await TransactionEndPointGroup.addZakatMalCall.call(
                token: currentAuthenticationToken,
                unitId: FFAppState().profileUPZ.id,
                trxDate: _model.datePickerModel.datePicked?.toString(),
                muzakkiName: _model.namaMuzakkiTextController.text,
                noTelp: _model.muzakkiPhoneTextController.text,
                categoryMaal: _model.jenisZMValue,
                amount: int.tryParse(_model.jmlZakatMalTextController.text),
                desc: _model.keteranganTextController.text,
              );
              var confirmDialogResponse = await showDialog<bool>(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text(
                          'Konfirmasi',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        content: Text(
                          'Muzakki atas nama ${_model.namaMuzakkiTextController.text} akan berzakat Mal sebesar ${formatNumber(
                            functions.strToInt(
                                _model.jmlZakatMalTextController.text),
                            formatType: FormatType.custom,
                            currency: 'Rp ',
                            format: '###,###',
                            locale: 'ID',
                          )}',
                          style: GoogleFonts.inter(),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(alertDialogContext, false),
                            child: Text(
                              'Batal',
                              style: GoogleFonts.inter(
                                color: FlutterFlowTheme.of(context).secondaryText,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(alertDialogContext, true),
                            child: Text(
                              'Proses',
                              style: GoogleFonts.inter(
                                color: FlutterFlowTheme.of(context).primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ) ??
                  false;
              if (confirmDialogResponse) {
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return AlertDialog(
                      title: Text(
                        'Berhasil',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      content: Text(
                        'Transaksi Berhasil',
                        style: GoogleFonts.inter(),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(alertDialogContext),
                          child: Text(
                            'Ok',
                            style: GoogleFonts.inter(
                              color: FlutterFlowTheme.of(context).primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );

                context.goNamed(HomeWidget.routeName);
              }
            },
            text: 'Simpan',
            options: FFButtonOptions(
              width: double.infinity,
              height: 52.0,
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primaryDark,
              textStyle: GoogleFonts.inter(
                color: FlutterFlowTheme.of(context).info,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
              elevation: 0.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(ModernRadius.lg),
            ),
          ),
        ),
      ),
    );
  }
}
