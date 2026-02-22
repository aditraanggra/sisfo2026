import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/component/date_picker/date_picker_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_validators.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'kotak_amal_model.dart';
export 'kotak_amal_model.dart';

class KotakAmalWidget extends StatefulWidget {
  const KotakAmalWidget({
    super.key,
    required this.namaUpz,
    required this.alamatUpz,
  });

  final String? namaUpz;
  final String? alamatUpz;

  static String routeName = 'KotakAmal';
  static String routePath = '/kotakAmal';

  @override
  State<KotakAmalWidget> createState() => _KotakAmalWidgetState();
}

class _KotakAmalWidgetState extends State<KotakAmalWidget>
    with TickerProviderStateMixin {
  late KotakAmalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController _buttonAnimationController;
  late Animation<double> _buttonScaleAnimation;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KotakAmalModel());

    // Initialize button animation
    _buttonAnimationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _buttonScaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.98,
    ).animate(
      CurvedAnimation(
        parent: _buttonAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    _model.namaMuzakkiTextController ??=
        TextEditingController(text: FFAppState().profileUPZ.unitName);
    _model.namaMuzakkiFocusNode ??= FocusNode();

    _model.jmlKotakAmalTextController ??= TextEditingController();
    _model.jmlKotakAmalFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    _buttonAnimationController.dispose();

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
                    color: Colors.white,
                    size: 20.0,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
                title: Text(
                  'Penerimaan Kotak Amal',
                  style: GoogleFonts.inter(
                    color: FlutterFlowTheme.of(context).info,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                actions: [],
                centerTitle: false,
                elevation: 2.0,
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
                  // Info Card
                  _buildInfoCard(),
                  SizedBox(height: ModernSpacing.lg),

                  // Form Card
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(ModernSpacing.md),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(ModernRadius.xl),
                      boxShadow: ModernShadows.cardShadow,
                    ),
                    child: Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PILIH TANGGAL',
                            style: GoogleFonts.inter(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(height: ModernSpacing.sm),
                          wrapWithModel(
                            model: _model.datePickerModel,
                            updateCallback: () => safeSetState(() {}),
                            child: DatePickerWidget(),
                          ),
                          SizedBox(height: ModernSpacing.lg),
                          Text(
                            'DATA PEMBAYAR',
                            style: GoogleFonts.inter(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(height: ModernSpacing.sm),
                          TextFormField(
                            controller: _model.namaMuzakkiTextController,
                            focusNode: _model.namaMuzakkiFocusNode,
                            autofocus: false,
                            obscureText: false,
                            decoration: _buildInputDecoration(
                              labelText: 'Nama Muzakki / Donatur',
                            ),
                            style: GoogleFonts.inter(
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16,
                            ),
                            validator: (value) =>
                                FormValidators.validateRequired(
                                    value, 'Nama Muzakki'),
                          ),
                          SizedBox(height: ModernSpacing.lg),
                          Text(
                            'KOTAK AMAL',
                            style: GoogleFonts.inter(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(height: ModernSpacing.sm),
                          TextFormField(
                            controller: _model.jmlKotakAmalTextController,
                            focusNode: _model.jmlKotakAmalFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.jmlKotakAmalTextController',
                              Duration(milliseconds: 500),
                              () => safeSetState(() {}),
                            ),
                            autofocus: false,
                            obscureText: false,
                            decoration: _buildInputDecoration(
                              labelText: 'Nominal',
                              prefixText: 'Rp ',
                              suffixIcon: _model.jmlKotakAmalTextController!
                                      .text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.jmlKotakAmalTextController
                                            ?.clear();
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
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) =>
                                FormValidators.validateCurrency(value),
                            inputFormatters: [
                              CurrencyInputFormatter(),
                            ],
                          ),
                          SizedBox(height: ModernSpacing.lg),
                          AnimatedBuilder(
                            animation: _buttonScaleAnimation,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: _buttonScaleAnimation.value,
                                child: child,
                              );
                            },
                            child: GestureDetector(
                              onTapDown: (_) =>
                                  _buttonAnimationController.forward(),
                              onTapUp: (_) =>
                                  _buttonAnimationController.reverse(),
                              onTapCancel: () =>
                                  _buttonAnimationController.reverse(),
                              child: Container(
                                width: double.infinity,
                                height: 52,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primaryDark,
                                  borderRadius:
                                      BorderRadius.circular(ModernRadius.lg),
                                  boxShadow: ModernShadows.buttonShadow,
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius:
                                        BorderRadius.circular(ModernRadius.lg),
                                    onTap: () async {
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      if (_model.datePickerModel.datePicked ==
                                          null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Tanggal wajib dipilih',
                                              style: GoogleFonts.inter(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context).error,
                                          ),
                                        );
                                        return;
                                      }

                                      final amount = CurrencyInputFormatter
                                          .parseFormattedCurrency(_model
                                              .jmlKotakAmalTextController.text);

                                      final response =
                                          await TransactionEndPointGroup
                                              .addKotakAmalCall
                                              .call(
                                        token: currentAuthenticationToken,
                                        unitId: FFAppState().profileUPZ.id,
                                        trxDate: _model
                                            .datePickerModel.datePicked
                                            ?.toString(),
                                        amount: amount ?? 0,
                                        desc: '-',
                                      );

                                      if (response.succeeded) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Berhasil'),
                                              content: Text(
                                                  'Transaksi Kotak Amal sebesar Rp ${CurrencyInputFormatter.formatToCurrency(amount ?? 0)} berhasil disimpan'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('OK'),
                                                ),
                                              ],
                                            );
                                          },
                                        );

                                        if (!mounted) return;
                                        context.pushNamed(HomeWidget.routeName);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Transaksi gagal. Silakan coba lagi.',
                                              style: GoogleFonts.inter(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context).error,
                                          ),
                                        );
                                      }
                                    },
                                    child: Center(
                                      child: Text(
                                        'Simpan',
                                        style: GoogleFonts.inter(
                                          color: FlutterFlowTheme.of(context).info,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
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

  // Info card explaining Kotak Amal purpose
  Widget _buildInfoCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(ModernSpacing.md),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryDark.withOpacity(0.1),
        borderRadius: BorderRadius.circular(ModernRadius.xl),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primaryDark.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryDark,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.volunteer_activism,
              color: FlutterFlowTheme.of(context).info,
              size: 24,
            ),
          ),
          SizedBox(width: ModernSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tentang Kotak Amal',
                  style: GoogleFonts.inter(
                    color: FlutterFlowTheme.of(context).primaryDark,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Kotak Amal untuk infak rutin jamaah masjid',
                  style: GoogleFonts.inter(
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method for consistent input decoration
  InputDecoration _buildInputDecoration({
    required String labelText,
    String? prefixText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: GoogleFonts.inter(
        color: FlutterFlowTheme.of(context).secondaryText,
        fontSize: 16,
      ),
      floatingLabelStyle: GoogleFonts.inter(
        color: FlutterFlowTheme.of(context).primary,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      prefixText: prefixText,
      prefixStyle: GoogleFonts.inter(
        color: FlutterFlowTheme.of(context).primaryText,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      suffixIcon: suffixIcon,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(ModernRadius.lg),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).primary,
          width: 2,
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
          width: 2,
        ),
        borderRadius: BorderRadius.circular(ModernRadius.lg),
      ),
      filled: true,
      fillColor: FlutterFlowTheme.of(context).primaryBackground,
      contentPadding: EdgeInsets.all(16),
    );
  }
}
