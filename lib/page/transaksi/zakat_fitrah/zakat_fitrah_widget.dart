import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/component/date_picker/date_picker_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/form_validators.dart';
import '/services/dialog_service.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'zakat_fitrah_model.dart';
export 'zakat_fitrah_model.dart';

/// Zakat Fitrah transaction form page with modern UI styling
/// Requirements: 9.1, 9.2, 9.3, 9.4, 9.5, 10.1, 10.2, 10.3
class ZakatFitrahWidget extends StatefulWidget {
  const ZakatFitrahWidget({super.key});

  static String routeName = 'ZakatFitrah';
  static String routePath = '/zakatFitrah';

  @override
  State<ZakatFitrahWidget> createState() => _ZakatFitrahWidgetState();
}

class _ZakatFitrahWidgetState extends State<ZakatFitrahWidget>
    with TickerProviderStateMixin {
  late ZakatFitrahModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Animation controller for submit button press feedback
  // Requirements: 10.6 - Scale animation on press (0.98)
  late AnimationController _buttonAnimationController;
  // late Animation<double> _buttonScaleAnimation; // Unused - removed

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZakatFitrahModel());

    _model.namaMuzakkiTextController ??= TextEditingController();
    _model.namaMuzakkiFocusNode ??= FocusNode();
    _model.namaMuzakkiFocusNode!.addListener(() {
      if (!_model.namaMuzakkiFocusNode!.hasFocus) {
        _model.validateNamaMuzakki(_model.namaMuzakkiTextController?.text);
        safeSetState(() {});
      }
    });

    _model.jmMuzakkiTextController ??= TextEditingController();
    _model.jmMuzakkiFocusNode ??= FocusNode();
    _model.jmMuzakkiFocusNode!.addListener(() {
      if (!_model.jmMuzakkiFocusNode!.hasFocus) {
        _model.validateJmMuzakki(_model.jmMuzakkiTextController?.text);
        safeSetState(() {});
      }
    });

    _model.switchValue = false;
    _model.nominalInfakTextController ??= TextEditingController();
    _model.nominalInfakFocusNode ??= FocusNode();
    _model.nominalInfakFocusNode!.addListener(() {
      if (!_model.nominalInfakFocusNode!.hasFocus) {
        _model.validateNominalInfak(_model.nominalInfakTextController?.text);
        safeSetState(() {});
      }
    });

    _model.keteranganTextController ??= TextEditingController();
    _model.keteranganFocusNode ??= FocusNode();

    // Initialize button animation controller for press feedback
    // Requirements: 10.6 - Scale animation on press (0.98)
    _buttonAnimationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    // Animation removed - not currently used in implementation
    // _buttonScaleAnimation = Tween<double>(
    //   begin: 1.0,
    //   end: 0.98,
    // ).animate(CurvedAnimation(
    //   parent: _buttonAnimationController,
    //   curve: Curves.easeInOut,
    // ));

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
        color: ModernColors.textSecondary,
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
      ),
      hintStyle: GoogleFonts.inter(
        color: ModernColors.textSecondary.withOpacity(0.7),
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
      ),
      floatingLabelStyle: GoogleFonts.inter(
        color: hasError ? ModernColors.expenseRed : ModernColors.primaryAccent,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      // Requirements: 9.1 - Border radius 12-16px (using 16px)
      enabledBorder: OutlineInputBorder(
        borderSide: hasError
            ? BorderSide(color: ModernColors.expenseRed, width: 1.5)
            : BorderSide.none,
        borderRadius: BorderRadius.circular(ModernRadius.lg),
      ),
      // Requirements: 9.3 - Green border (#259148) for focused state
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ModernColors.primaryAccent,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(ModernRadius.lg),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ModernColors.expenseRed,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(ModernRadius.lg),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ModernColors.expenseRed,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(ModernRadius.lg),
      ),
      // Requirements: 9.2 - Light gray background (#F5F7F5) for inactive state
      filled: true,
      fillColor: ModernColors.backgroundPrimary,
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
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          // Updated background color to modern off-white
          // Requirements: 1.4 - Off-white (#F5F7F5) as primary background
          backgroundColor: ModernColors.backgroundPrimary,
          appBar: responsiveVisibility(
            context: context,
            desktop: false,
          )
              ? AppBar(
                  // Requirements: 1.1 - Dark green (#1A3C34) for headers
                  backgroundColor: ModernColors.primaryDark,
                  automaticallyImplyLeading: false,
                  leading: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 48.0,
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: ModernColors.textOnDark,
                      size: 20.0,
                    ),
                    onPressed: () async {
                      context.pop();
                    },
                  ),
                  title: Text(
                    'Penerimaan Zakat Fitrah',
                    style: GoogleFonts.inter(
                      color: ModernColors.textOnDark,
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
                    // Modern card wrapper for form
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ModernColors.backgroundCard,
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Text(
                                  'PILIH TANGGAL',
                                  style: GoogleFonts.inter(
                                    color: ModernColors.textSecondary,
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Text(
                                  'JENIS TRANSAKSI ZF',
                                  style: GoogleFonts.inter(
                                    color: ModernColors.textSecondary,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: FlutterFlowRadioButton(
                                  options: ['Beras', 'Uang'].toList(),
                                  onChanged: (val) async {
                                    safeSetState(() {});
                                    _model.totalBeras = 0.0;
                                    _model.totalUang = 0;
                                    safeSetState(() {});
                                    safeSetState(() {
                                      _model.jmMuzakkiTextController?.clear();
                                    });
                                  },
                                  controller: _model.jenisZFValueController ??=
                                      FormFieldController<String>(null),
                                  optionHeight: 32.0,
                                  textStyle: GoogleFonts.inter(
                                    color: ModernColors.textSecondary,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  selectedTextStyle: GoogleFonts.inter(
                                    color: ModernColors.textPrimary,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 24.0, 0.0),
                                  buttonPosition: RadioButtonPosition.left,
                                  direction: Axis.horizontal,
                                  radioButtonColor: ModernColors.primaryAccent,
                                  inactiveRadioButtonColor:
                                      ModernColors.textSecondary,
                                  toggleable: true,
                                  horizontalAlignment: WrapAlignment.start,
                                  verticalAlignment: WrapCrossAlignment.start,
                                ),
                              ),
                              if (_model.jenisZFValue == 'Uang')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: Text(
                                          'PILIH NOMINAL UANG',
                                          style: GoogleFonts.inter(
                                            color: ModernColors.textSecondary,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          'Nominal uang berdasarkan penetapan harga per kulak Zakat Fitrah tahun 2025 M / 1446 H ( No. 400/05/Setda/02/2025 )',
                                          style: GoogleFonts.inter(
                                            color: ModernColors.textSecondary,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 8.0),
                                        child: FlutterFlowRadioButton(
                                          options: ['Rp. 38.000', 'Rp. 46.000']
                                              .toList(),
                                          onChanged: (val) async {
                                            safeSetState(() {});
                                            _model.totalUang = 0;
                                            safeSetState(() {});
                                            safeSetState(() {
                                              _model.jmMuzakkiTextController
                                                  ?.clear();
                                            });
                                          },
                                          controller: _model
                                                  .hargaPerKulakValueController ??=
                                              FormFieldController<String>(null),
                                          optionHeight: 32.0,
                                          textStyle: GoogleFonts.inter(
                                            color: ModernColors.textSecondary,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          selectedTextStyle: GoogleFonts.inter(
                                            color: ModernColors.textPrimary,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          buttonPosition:
                                              RadioButtonPosition.left,
                                          direction: Axis.horizontal,
                                          radioButtonColor:
                                              ModernColors.primaryAccent,
                                          inactiveRadioButtonColor:
                                              ModernColors.textSecondary,
                                          toggleable: false,
                                          horizontalAlignment:
                                              WrapAlignment.start,
                                          verticalAlignment:
                                              WrapCrossAlignment.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Text(
                                  'DATA MUZAKKI',
                                  style: GoogleFonts.inter(
                                    color: ModernColors.textSecondary,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Requirements: 9.5 - Height 56px
                                    SizedBox(
                                      height: 56.0,
                                      child: TextFormField(
                                        controller:
                                            _model.namaMuzakkiTextController,
                                        focusNode: _model.namaMuzakkiFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: _buildModernInputDecoration(
                                          labelText: 'Nama Muzakki / Donatur',
                                          hasError:
                                              _model.namaMuzakkiError != null,
                                        ),
                                        style: GoogleFonts.inter(
                                          color: ModernColors.textPrimary,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        cursorColor: ModernColors.primaryAccent,
                                        validator: _model
                                            .namaMuzakkiTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    // Inline error message for real-time validation
                                    if (_model.namaMuzakkiError != null)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 4.0, 0.0, 0.0),
                                        child: Text(
                                          _model.namaMuzakkiError!,
                                          style: GoogleFonts.inter(
                                            color: ModernColors.expenseRed,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 8.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextFormField(
                                            controller:
                                                _model.jmMuzakkiTextController,
                                            focusNode:
                                                _model.jmMuzakkiFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.jmMuzakkiTextController',
                                              Duration(milliseconds: 200),
                                              () async {
                                                _model.totalUang = _model
                                                            .jenisZFValue ==
                                                        'Uang'
                                                    ? (int.parse(_model
                                                            .jmMuzakkiTextController
                                                            .text) *
                                                        ((_model.jenisZFValue ==
                                                                    'Uang') &&
                                                                (_model.hargaPerKulakValue ==
                                                                    'Rp. 38.000')
                                                            ? _model.harga1!
                                                            : _model.harga2!))
                                                    : 0;
                                                _model.totalBeras =
                                                    valueOrDefault<double>(
                                                  _model.jenisZFValue == 'Beras'
                                                      ? (double.parse(_model
                                                              .jmMuzakkiTextController
                                                              .text) *
                                                          2.7)
                                                      : 0.0,
                                                  0.0,
                                                );
                                                safeSetState(() {});
                                              },
                                            ),
                                            autofocus: false,
                                            textCapitalization:
                                                TextCapitalization.none,
                                            textInputAction:
                                                TextInputAction.send,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Jumlah Muzakki',
                                              labelStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    font: GoogleFonts.notoSans(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    font: GoogleFonts.notoSans(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color:
                                                      _model.jmMuzakkiError !=
                                                              null
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .error
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF259148),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              suffixIcon: _model
                                                      .jmMuzakkiTextController!
                                                      .text
                                                      .isNotEmpty
                                                  ? InkWell(
                                                      onTap: () async {
                                                        _model
                                                            .jmMuzakkiTextController
                                                            ?.clear();
                                                        _model.totalUang = 0;
                                                        _model.totalBeras = 0.0;
                                                        safeSetState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.clear,
                                                        color:
                                                            Color(0xFF259148),
                                                        size: 22,
                                                      ),
                                                    )
                                                  : null,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.notoSans(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            keyboardType: const TextInputType
                                                .numberWithOptions(
                                                decimal: true),
                                            validator: _model
                                                .jmMuzakkiTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              if (!isAndroid && !isiOS)
                                                TextInputFormatter.withFunction(
                                                    (oldValue, newValue) {
                                                  return TextEditingValue(
                                                    selection:
                                                        newValue.selection,
                                                    text: newValue.text
                                                        .toCapitalization(
                                                            TextCapitalization
                                                                .none),
                                                  );
                                                }),
                                              FilteringTextInputFormatter.allow(
                                                  RegExp('[0-9]'))
                                            ],
                                          ),
                                          // Inline error message for real-time validation
                                          if (_model.jmMuzakkiError != null)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 4.0, 0.0, 0.0),
                                              child: Text(
                                                _model.jmMuzakkiError!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .notoSans(),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Orang',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.notoSans(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  if ((_model.totalBeras > 0.0) ||
                                      (_model.totalUang > 0))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Color(0xFF259148),
                                        size: 24.0,
                                      ),
                                    ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Switch(
                                    value: _model.switchValue!,
                                    onChanged: (newValue) async {
                                      safeSetState(
                                          () => _model.switchValue = newValue);
                                    },
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor: Color(0xFFC4FFD2),
                                    inactiveTrackColor: Color(0xFFDDDDDD),
                                    inactiveThumbColor: Color(0xFFC9C9C9),
                                  ),
                                  Text(
                                    'Tambah Infak',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.notoSans(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ],
                              ),
                              if (_model.switchValue ?? true)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextFormField(
                                        controller:
                                            _model.nominalInfakTextController,
                                        focusNode: _model.nominalInfakFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Nominal Infak',
                                          hintText: 'Contoh: 100.000',
                                          prefixText: 'Rp ',
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.notoSans(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.notoSans(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: _model.nominalInfakError !=
                                                      null
                                                  ? FlutterFlowTheme.of(context)
                                                      .error
                                                  : FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF259148),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.notoSans(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .nominalInfakTextControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [
                                          CurrencyInputFormatter(),
                                        ],
                                      ),
                                      // Inline error message for real-time validation
                                      if (_model.nominalInfakError != null)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 4.0, 0.0, 0.0),
                                          child: Text(
                                            _model.nominalInfakError!,
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  font: GoogleFonts.notoSans(),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 16.0),
                                child: TextFormField(
                                  controller: _model.keteranganTextController,
                                  focusNode: _model.keteranganFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Keterangan',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.notoSans(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.notoSans(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
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
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSans(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  validator: _model
                                      .keteranganTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: _model.isSubmitting
                                        ? null
                                        : () async {
                                            if (_model.formKey.currentState ==
                                                    null ||
                                                !_model.formKey.currentState!
                                                    .validate()) {
                                              return;
                                            }
                                            if (_model.datePickerModel
                                                    .datePicked ==
                                                null) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Tanggal Belum Dipilih',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .notoSans(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .error,
                                                ),
                                              );
                                              return;
                                            }

                                            // Parse nominal infak from formatted currency
                                            final nominalInfak = _model
                                                        .switchValue ==
                                                    true
                                                ? CurrencyInputFormatter
                                                    .parseFormattedCurrency(_model
                                                        .nominalInfakTextController
                                                        .text)
                                                : null;

                                            // Show confirmation dialog BEFORE API call
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Konfirmasi'),
                                                          content: Text(
                                                              'Muzakki atas nama ${_model.namaMuzakkiTextController.text} akan berzakat ${_model.jenisZFValue == 'Beras' ? 'Beras' : 'Uang'} sebesar ${_model.jenisZFValue == 'Beras' ? valueOrDefault<String>(
                                                                  formatNumber(
                                                                    _model
                                                                        .totalBeras,
                                                                    formatType:
                                                                        FormatType
                                                                            .custom,
                                                                    format:
                                                                        '##.## Kg',
                                                                    locale:
                                                                        'id_ID',
                                                                  ),
                                                                  '0',
                                                                ) : valueOrDefault<String>(
                                                                  formatNumber(
                                                                    _model
                                                                        .totalUang,
                                                                    formatType:
                                                                        FormatType
                                                                            .custom,
                                                                    currency:
                                                                        'Rp ',
                                                                    format:
                                                                        '###,###',
                                                                    locale:
                                                                        'id_ID',
                                                                  ),
                                                                  '0',
                                                                )}${_model.switchValue == true && nominalInfak != null ? ' dan Infak Sebesar ${CurrencyInputFormatter.formatToCurrencyWithPrefix(nominalInfak)}' : ''}'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child:
                                                                  Text('Batal'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text(
                                                                  'Proses'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;

                                            if (!confirmDialogResponse) {
                                              return;
                                            }

                                            // Set submitting state to disable button
                                            _model.isSubmitting = true;
                                            safeSetState(() {});

                                            try {
                                              // Execute API call AFTER confirmation
                                              await AuthEndPointGroup
                                                  .addZakatFitrahCall
                                                  .call(
                                                token:
                                                    currentAuthenticationToken,
                                                unitId:
                                                    FFAppState().profileUPZ.id,
                                                trxDate: _model
                                                    .datePickerModel.datePicked
                                                    ?.toString(),
                                                muzakkiName: _model
                                                    .namaMuzakkiTextController
                                                    .text,
                                                totalMuzakki: int.tryParse(
                                                    _model
                                                        .jmMuzakkiTextController
                                                        .text),
                                                zfAmount: _model.totalUang,
                                                zfRice: _model.totalBeras,
                                                desc: '-',
                                              );

                                              if (_model.switchValue!) {
                                                await TransactionEndPointGroup
                                                    .addSedekahCall
                                                    .call(
                                                  token:
                                                      currentAuthenticationToken,
                                                  unitId: FFAppState()
                                                      .profileUPZ
                                                      .id,
                                                  trxDate: _model
                                                      .datePickerModel
                                                      .datePicked
                                                      ?.toString(),
                                                  munfiqName: _model
                                                      .namaMuzakkiTextController
                                                      .text,
                                                  amount: nominalInfak,
                                                  desc: _model
                                                      .keteranganTextController
                                                      .text,
                                                );
                                              }

                                              // Reset submitting state
                                              _model.isSubmitting = false;
                                              safeSetState(() {});

                                              // Build transaction summary for success modal
                                              final transactionSummary =
                                                  <String, String>{
                                                'Nama Muzakki': _model
                                                    .namaMuzakkiTextController
                                                    .text,
                                                'Jenis Zakat':
                                                    _model.jenisZFValue ?? '-',
                                                'Jumlah Muzakki':
                                                    '${_model.jmMuzakkiTextController.text} Orang',
                                              };

                                              if (_model.jenisZFValue ==
                                                  'Beras') {
                                                transactionSummary[
                                                        'Total Beras'] =
                                                    valueOrDefault<String>(
                                                  formatNumber(
                                                    _model.totalBeras,
                                                    formatType:
                                                        FormatType.custom,
                                                    format: '##.## Kg',
                                                    locale: 'id_ID',
                                                  ),
                                                  '0',
                                                );
                                              } else {
                                                transactionSummary[
                                                        'Total Uang'] =
                                                    valueOrDefault<String>(
                                                  formatNumber(
                                                    _model.totalUang,
                                                    formatType:
                                                        FormatType.custom,
                                                    currency: 'Rp ',
                                                    format: '###,###',
                                                    locale: 'id_ID',
                                                  ),
                                                  '0',
                                                );
                                              }

                                              if (_model.switchValue == true &&
                                                  nominalInfak != null) {
                                                transactionSummary['Infak'] =
                                                    CurrencyInputFormatter
                                                        .formatToCurrencyWithPrefix(
                                                            nominalInfak);
                                              }

                                              // Show success modal with options
                                              await DialogService
                                                  .showSuccessModal(
                                                context: context,
                                                title: 'Transaksi Berhasil',
                                                message:
                                                    'Data zakat fitrah telah berhasil disimpan.',
                                                transactionSummary:
                                                    transactionSummary,
                                                onAddMore: () {
                                                  // Reset form for new entry
                                                  _model.totalBeras = 0.0;
                                                  _model.totalUang = 0;
                                                  _model.namaMuzakkiError =
                                                      null;
                                                  _model.jmMuzakkiError = null;
                                                  _model.nominalInfakError =
                                                      null;
                                                  safeSetState(() {
                                                    _model
                                                        .namaMuzakkiTextController
                                                        ?.clear();
                                                    _model
                                                        .jmMuzakkiTextController
                                                        ?.clear();
                                                    _model
                                                        .nominalInfakTextController
                                                        ?.clear();
                                                    _model
                                                        .keteranganTextController
                                                        ?.clear();
                                                  });
                                                },
                                                onViewHistory: () {
                                                  context.goNamed(
                                                      HistoriTransaksiWidget
                                                          .routeName);
                                                },
                                              );
                                            } catch (e) {
                                              // Reset submitting state on error
                                              _model.isSubmitting = false;
                                              safeSetState(() {});

                                              // Show error dialog
                                              await DialogService
                                                  .showErrorDialog(
                                                context: context,
                                                message:
                                                    'Gagal menyimpan transaksi. Silakan coba lagi.',
                                                onRetry: () {
                                                  // User can retry by pressing the button again
                                                },
                                              );
                                            }
                                          },
                                    text: _model.isSubmitting
                                        ? 'Memproses...'
                                        : 'Proses Transaksi',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: _model.isSubmitting
                                          ? Color(0xFF259148).withOpacity(0.6)
                                          : Color(0xFF259148),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.notoSans(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
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
      ),
    );
  }
}
