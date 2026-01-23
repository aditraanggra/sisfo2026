import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/component/date_picker/date_picker_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'infak_model.dart';
export 'infak_model.dart';

/// Infak/Sedekah transaction form page with modern UI styling
/// Requirements: 9.1, 9.2, 9.3, 9.4, 9.5, 10.1, 10.2, 10.3
class InfakWidget extends StatefulWidget {
  const InfakWidget({
    super.key,
    this.tglTransaksi,
    this.namaMuzakki,
  });

  final DateTime? tglTransaksi;
  final String? namaMuzakki;

  static String routeName = 'Infak';
  static String routePath = '/infak';

  @override
  State<InfakWidget> createState() => _InfakWidgetState();
}

class _InfakWidgetState extends State<InfakWidget>
    with TickerProviderStateMixin {
  late InfakModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Animation controller for submit button press feedback
  late AnimationController _buttonAnimationController;
  late Animation<double> _buttonScaleAnimation;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InfakModel());

    _model.namaMuzakkiTextController ??= TextEditingController();
    _model.namaMuzakkiFocusNode ??= FocusNode();

    _model.jmlInfakTextController ??= TextEditingController();
    _model.jmlInfakFocusNode ??= FocusNode();

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
      enabledBorder: OutlineInputBorder(
        borderSide: hasError
            ? BorderSide(color: ModernColors.expenseRed, width: 1.5)
            : BorderSide.none,
        borderRadius: BorderRadius.circular(ModernRadius.lg),
      ),
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: ModernColors.backgroundPrimary,
        appBar: responsiveVisibility(
          context: context,
          desktop: false,
        )
            ? AppBar(
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
                    context.safePop();
                  },
                ),
                title: Text(
                  'Penerimaan Infak Sedekah',
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
                                'DATA MUNFIK',
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
                              child: SizedBox(
                                height: 56.0,
                                child: TextFormField(
                                  controller: _model.namaMuzakkiTextController,
                                  focusNode: _model.namaMuzakkiFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: _buildModernInputDecoration(
                                    labelText: 'Nama Munfik',
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
                            ),
                            _buildNominalInfakSection(),
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

  Widget _buildNominalInfakSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: AlignmentDirectional(-1.0, -1.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Text(
              'NOMINAL INFAK',
              style: GoogleFonts.inter(
                color: ModernColors.textSecondary,
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 8.0, 0.0),
          child: TextFormField(
            controller: _model.jmlInfakTextController,
            focusNode: _model.jmlInfakFocusNode,
            onChanged: (_) => EasyDebounce.debounce(
              '_model.jmlInfakTextController',
              Duration(milliseconds: 2000),
              () => safeSetState(() {}),
            ),
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'Isi Nominal',
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
                color: ModernColors.primaryAccent,
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
                  color: ModernColors.primaryAccent,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(ModernRadius.sm),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ModernColors.expenseRed,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(ModernRadius.sm),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ModernColors.expenseRed,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(ModernRadius.sm),
              ),
              suffixIcon: _model.jmlInfakTextController!.text.isNotEmpty
                  ? InkWell(
                      onTap: () async {
                        _model.jmlInfakTextController?.clear();
                        safeSetState(() {});
                      },
                      child: Icon(
                        Icons.clear,
                        color: ModernColors.primaryAccent,
                        size: 22,
                      ),
                    )
                  : null,
            ),
            style: GoogleFonts.inter(
              color: ModernColors.textPrimary,
              fontSize: 22.0,
              fontWeight: FontWeight.w500,
            ),
            cursorColor: ModernColors.primaryAccent,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator:
                _model.jmlInfakTextControllerValidator.asValidator(context),
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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
      child: SizedBox(
        height: 56.0,
        child: TextFormField(
          controller: _model.keteranganTextController,
          focusNode: _model.keteranganFocusNode,
          autofocus: false,
          obscureText: false,
          decoration: _buildModernInputDecoration(
            labelText: 'Keterangan',
          ),
          style: GoogleFonts.inter(
            color: ModernColors.textPrimary,
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
          cursorColor: ModernColors.primaryAccent,
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
                      'Tanggal belum diisi',
                      style: GoogleFonts.inter(
                        color: ModernColors.textOnDark,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: ModernColors.expenseRed,
                  ),
                );
                return;
              }
              await TransactionEndPointGroup.addSedekahCall.call(
                trxDate: _model.datePickerModel.datePicked?.toString(),
                token: currentAuthenticationToken,
                unitId: FFAppState().profileUPZ.id,
                munfiqName: _model.namaMuzakkiTextController.text,
                amount: int.tryParse(_model.jmlInfakTextController.text),
                desc: _model.keteranganTextController.text,
              );

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
                      'Transaksi Infak Berhasil',
                      style: GoogleFonts.inter(),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: Text(
                          'Ok',
                          style: GoogleFonts.inter(
                            color: ModernColors.primaryAccent,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
              safeSetState(() {
                _model.namaMuzakkiTextController?.clear();
                _model.jmlInfakTextController?.clear();
                _model.keteranganTextController?.clear();
              });

              context.pushNamed(
                HomeWidget.routeName,
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.leftToRight,
                  ),
                },
              );
            },
            text: 'Simpan',
            options: FFButtonOptions(
              width: double.infinity,
              height: 52.0,
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: ModernColors.primaryDark,
              textStyle: GoogleFonts.inter(
                color: ModernColors.textOnDark,
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
