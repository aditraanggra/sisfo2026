import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/component/date_picker/date_picker_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_validators.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'qurban_model.dart';
export 'qurban_model.dart';

class QurbanWidget extends StatefulWidget {
  const QurbanWidget({super.key});

  static String routeName = 'Qurban';
  static String routePath = '/qurban';

  @override
  State<QurbanWidget> createState() => _QurbanWidgetState();
}

class _QurbanWidgetState extends State<QurbanWidget>
    with TickerProviderStateMixin {
  late QurbanModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QurbanModel());

    _model.jmlSapiTextController ??= TextEditingController();
    _model.jmlSapiFocusNode ??= FocusNode();

    _model.hargaSapiTextController ??= TextEditingController();
    _model.hargaSapiFocusNode ??= FocusNode();

    _model.jmlKambingTextController ??= TextEditingController();
    _model.jmlKambingFocusNode ??= FocusNode();

    _model.hargaKambingTextController ??= TextEditingController();
    _model.hargaKambingFocusNode ??= FocusNode();

    _model.jmlDombaTextController ??= TextEditingController();
    _model.jmlDombaFocusNode ??= FocusNode();

    _model.hargaDombaTextController ??= TextEditingController();
    _model.hargaDombaFocusNode ??= FocusNode();

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
                  'Penerimaan Qurban',
                  style: GoogleFonts.inter(
                    color: ModernColors.textOnDark,
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
                  _buildInfoCard(),
                  SizedBox(height: ModernSpacing.lg),
                  _buildFormCard(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(ModernSpacing.md),
      decoration: BoxDecoration(
        color: ModernColors.primaryDark.withOpacity(0.1),
        borderRadius: BorderRadius.circular(ModernRadius.xl),
        border: Border.all(
          color: ModernColors.primaryDark.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: ModernColors.primaryDark,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.campaign,
              color: ModernColors.textOnDark,
              size: 24,
            ),
          ),
          SizedBox(width: ModernSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tentang Qurban',
                  style: GoogleFonts.inter(
                    color: ModernColors.primaryDark,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Qurban adalah ibadah penyembelihan hewan pada Hari Raya Idul Adha',
                  style: GoogleFonts.inter(
                    color: ModernColors.textSecondary,
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

  Widget _buildFormCard(BuildContext context) {
    return Container(
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
            _buildSectionLabel('PILIH TANGGAL'),
            wrapWithModel(
              model: _model.datePickerModel,
              updateCallback: () => safeSetState(() {}),
              child: DatePickerWidget(),
            ),
            SizedBox(height: ModernSpacing.lg),
            _buildAnimalSection(
              animal: 'Sapi',
              icon: Icons.pets,
              iconBgColor: ModernColors.primaryDark,
              cardBgColor: ModernColors.primaryDark.withOpacity(0.06),
              qtyController: _model.jmlSapiTextController!,
              qtyFocusNode: _model.jmlSapiFocusNode!,
              qtyValidator: _model.jmlSapiTextControllerValidator,
              priceController: _model.hargaSapiTextController!,
              priceFocusNode: _model.hargaSapiFocusNode!,
              priceValidator: _model.hargaSapiTextControllerValidator,
              priceLabel: 'Harga / Ekor',
            ),
            SizedBox(height: ModernSpacing.md),
            _buildAnimalSection(
              animal: 'Kambing',
              icon: Icons.pets,
              iconBgColor: ModernColors.primaryAccent,
              cardBgColor: ModernColors.primaryAccent.withOpacity(0.06),
              qtyController: _model.jmlKambingTextController!,
              qtyFocusNode: _model.jmlKambingFocusNode!,
              qtyValidator: _model.jmlKambingTextControllerValidator,
              priceController: _model.hargaKambingTextController!,
              priceFocusNode: _model.hargaKambingFocusNode!,
              priceValidator: _model.hargaKambingTextControllerValidator,
              priceLabel: 'Harga / Ekor',
            ),
            SizedBox(height: ModernSpacing.md),
            _buildAnimalSection(
              animal: 'Domba',
              icon: Icons.pets,
              iconBgColor: ModernColors.goldAccent,
              cardBgColor: ModernColors.goldAccent.withOpacity(0.06),
              qtyController: _model.jmlDombaTextController!,
              qtyFocusNode: _model.jmlDombaFocusNode!,
              qtyValidator: _model.jmlDombaTextControllerValidator,
              priceController: _model.hargaDombaTextController!,
              priceFocusNode: _model.hargaDombaFocusNode!,
              priceValidator: _model.hargaDombaTextControllerValidator,
              priceLabel: 'Harga / Ekor',
            ),
            SizedBox(height: ModernSpacing.lg),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
              child: Text(
                'KETERANGAN',
                style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w600,
                  color: ModernColors.textSecondary,
                  fontSize: 14.0,
                ),
              ),
            ),
            TextFormField(
              controller: _model.keteranganTextController,
              focusNode: _model.keteranganFocusNode,
              autofocus: false,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Keterangan',
                labelStyle: GoogleFonts.notoSans(
                  color: ModernColors.textSecondary,
                  fontSize: 14,
                ),
                hintStyle: GoogleFonts.notoSans(
                  color: ModernColors.textSecondary.withOpacity(0.7),
                  fontSize: 14,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(ModernRadius.sm),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ModernColors.primaryAccent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(ModernRadius.sm),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ModernColors.expenseRed,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(ModernRadius.sm),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ModernColors.expenseRed,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(ModernRadius.sm),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              style: GoogleFonts.notoSans(
                color: ModernColors.textPrimary,
                fontSize: 14,
              ),
              validator: _model.keteranganTextControllerValidator
                  .asValidator(context),
            ),
            SizedBox(height: ModernSpacing.md),
            _buildOverallTotal(),
            SizedBox(height: ModernSpacing.lg),
            FFButtonWidget(
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
                        style: GoogleFonts.notoSans(
                          color: ModernColors.textOnDark,
                          fontSize: 14,
                        ),
                      ),
                      duration: Duration(milliseconds: 4000),
                      backgroundColor: ModernColors.expenseRed,
                    ),
                  );
                  return;
                }
                final sapiQty =
                    int.tryParse(_model.jmlSapiTextController?.text ?? '0') ??
                        0;
                final sapiPrice = int.tryParse(
                        _model.hargaSapiTextController?.text ?? '0') ??
                    0;
                final kambingQty = int.tryParse(
                        _model.jmlKambingTextController?.text ?? '0') ??
                    0;
                final kambingPrice = int.tryParse(
                        _model.hargaKambingTextController?.text ?? '0') ??
                    0;
                final dombaQty =
                    int.tryParse(_model.jmlDombaTextController?.text ?? '0') ??
                        0;
                final dombaPrice = int.tryParse(
                        _model.hargaDombaTextController?.text ?? '0') ??
                    0;
                final total = (sapiQty * sapiPrice) +
                    (kambingQty * kambingPrice) +
                    (dombaQty * dombaPrice);

                if (total <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Minimal satu hewan harus diisi',
                        style: GoogleFonts.notoSans(
                          color: ModernColors.textOnDark,
                          fontSize: 14,
                        ),
                      ),
                      duration: Duration(milliseconds: 4000),
                      backgroundColor: ModernColors.expenseRed,
                    ),
                  );
                  return;
                }

                var confirmDialogResponse = await showDialog<bool>(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text(
                            'Konfirmasi',
                            style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (sapiQty > 0)
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 4),
                                    child: Text(
                                      'Sapi: $sapiQty ekor × Rp ${CurrencyInputFormatter.formatToCurrency(sapiPrice)}',
                                      style: GoogleFonts.notoSans(fontSize: 14),
                                    ),
                                  ),
                                if (kambingQty > 0)
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 4),
                                    child: Text(
                                      'Kambing: $kambingQty ekor × Rp ${CurrencyInputFormatter.formatToCurrency(kambingPrice)}',
                                      style: GoogleFonts.notoSans(fontSize: 14),
                                    ),
                                  ),
                                if (dombaQty > 0)
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 4),
                                    child: Text(
                                      'Domba: $dombaQty ekor × Rp ${CurrencyInputFormatter.formatToCurrency(dombaPrice)}',
                                      style: GoogleFonts.notoSans(fontSize: 14),
                                    ),
                                  ),
                                Divider(),
                                Text(
                                  'Total: Rp ${CurrencyInputFormatter.formatToCurrency(total)}',
                                  style: GoogleFonts.notoSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext, false),
                              child: Text(
                                'Batal',
                                style: GoogleFonts.notoSans(
                                  color: ModernColors.textSecondary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext, true),
                              child: Text(
                                'Proses',
                                style: GoogleFonts.notoSans(
                                  color: ModernColors.primaryAccent,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ) ??
                    false;
                if (!confirmDialogResponse) return;

                await TransactionEndPointGroup.addQurbanCall.call(
                  token: currentAuthenticationToken,
                  unitId: FFAppState().profileUPZ.id,
                  trxDate: _model.datePickerModel.datePicked?.toString(),
                  sapiQty: sapiQty,
                  sapiPrice: sapiPrice,
                  kambingQty: kambingQty,
                  kambingPrice: kambingPrice,
                  dombaQty: dombaQty,
                  dombaPrice: dombaPrice,
                  total: total,
                  desc: _model.keteranganTextController?.text ?? '',
                );

                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return AlertDialog(
                      title: Text(
                        'Berhasil',
                        style: GoogleFonts.notoSans(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      content: Text(
                        'Transaksi Berhasil',
                        style: GoogleFonts.notoSans(),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(alertDialogContext),
                          child: Text(
                            'Ok',
                            style: GoogleFonts.notoSans(
                              color: ModernColors.primaryAccent,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );

                context.goNamed(HomeWidget.routeName);
              },
              text: 'Simpan',
              options: FFButtonOptions(
                width: double.infinity,
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(
                    24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(
                    0.0, 0.0, 0.0, 0.0),
                color: ModernColors.primaryDark,
                textStyle: GoogleFonts.notoSans(
                  color: ModernColors.textOnDark,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(ModernRadius.sm),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionLabel(String label) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
      child: Text(
        label,
        style: GoogleFonts.notoSans(
          fontWeight: FontWeight.w600,
          color: ModernColors.textSecondary,
          fontSize: 14.0,
        ),
      ),
    );
  }

  Widget _buildAnimalSection({
    required String animal,
    required IconData icon,
    required Color iconBgColor,
    required Color cardBgColor,
    required TextEditingController qtyController,
    required FocusNode qtyFocusNode,
    required String? Function(BuildContext, String?)? qtyValidator,
    required TextEditingController priceController,
    required FocusNode priceFocusNode,
    required String? Function(BuildContext, String?)? priceValidator,
    required String priceLabel,
  }) {
    final qty = int.tryParse(qtyController.text) ?? 0;
    final price =
        int.tryParse(priceController.text.replaceAll('.', '')) ?? 0;
    final total = qty * price;

    return Container(
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(ModernRadius.md),
        border: Border.all(
          color: iconBgColor.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(ModernSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: iconBgColor,
                    borderRadius: BorderRadius.circular(ModernRadius.sm),
                  ),
                  child: Icon(
                    icon,
                    color: ModernColors.textOnDark,
                    size: 20,
                  ),
                ),
                SizedBox(width: ModernSpacing.sm),
                Text(
                  animal,
                  style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: ModernColors.textPrimary,
                  ),
                ),
              ],
            ),
            SizedBox(height: ModernSpacing.md),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.25,
                  child: TextFormField(
                    controller: qtyController,
                    focusNode: qtyFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      'qty_$animal',
                      Duration(milliseconds: 2000),
                      () => safeSetState(() {}),
                    ),
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Jumlah',
                      labelStyle: GoogleFonts.notoSans(
                        color: ModernColors.textSecondary,
                        fontSize: 13,
                      ),
                      hintStyle: GoogleFonts.notoSans(
                        color: ModernColors.textSecondary.withOpacity(0.7),
                        fontSize: 13,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ModernColors.textSecondary.withOpacity(0.3),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(ModernRadius.sm),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ModernColors.primaryAccent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(ModernRadius.sm),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ModernColors.expenseRed,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(ModernRadius.sm),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ModernColors.expenseRed,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(ModernRadius.sm),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      suffixIcon: qtyController.text.isNotEmpty
                          ? InkWell(
                              onTap: () {
                                qtyController.clear();
                                safeSetState(() {});
                              },
                              child: Icon(
                                Icons.clear,
                                color: ModernColors.primaryAccent,
                                size: 18,
                              ),
                            )
                          : null,
                    ),
                    style: GoogleFonts.notoSans(
                      color: ModernColors.textPrimary,
                      fontSize: 14,
                    ),
                    keyboardType: TextInputType.number,
                    validator: qtyValidator.asValidator(context),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                SizedBox(width: ModernSpacing.sm),
                Expanded(
                  child: TextFormField(
                    controller: priceController,
                    focusNode: priceFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      'price_$animal',
                      Duration(milliseconds: 2000),
                      () => safeSetState(() {}),
                    ),
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: priceLabel,
                      labelStyle: GoogleFonts.notoSans(
                        color: ModernColors.textSecondary,
                        fontSize: 13,
                      ),
                      hintStyle: GoogleFonts.notoSans(
                        color: ModernColors.textSecondary.withOpacity(0.7),
                        fontSize: 13,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ModernColors.textSecondary.withOpacity(0.3),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(ModernRadius.sm),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ModernColors.primaryAccent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(ModernRadius.sm),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ModernColors.expenseRed,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(ModernRadius.sm),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ModernColors.expenseRed,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(ModernRadius.sm),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      prefixText: 'Rp ',
                      prefixStyle: GoogleFonts.notoSans(
                        color: ModernColors.textSecondary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      suffixIcon: priceController.text.isNotEmpty
                          ? InkWell(
                              onTap: () {
                                priceController.clear();
                                safeSetState(() {});
                              },
                              child: Icon(
                                Icons.clear,
                                color: ModernColors.primaryAccent,
                                size: 18,
                              ),
                            )
                          : null,
                    ),
                    style: GoogleFonts.notoSans(
                      color: ModernColors.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    keyboardType: TextInputType.number,
                    validator: priceValidator.asValidator(context),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
              ],
            ),
            if (total > 0) ...[
              SizedBox(height: ModernSpacing.sm),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: ModernSpacing.sm,
                  vertical: ModernSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: iconBgColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(ModernRadius.sm),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$qty × Rp ${CurrencyInputFormatter.formatToCurrency(price)}',
                      style: GoogleFonts.notoSans(
                        color: ModernColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Rp ${CurrencyInputFormatter.formatToCurrency(total)}',
                      style: GoogleFonts.notoSans(
                        color: iconBgColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildOverallTotal() {
    final sapiCount =
        int.tryParse(_model.jmlSapiTextController?.text ?? '0') ?? 0;
    final sapiPrice = int.tryParse(
            _model.hargaSapiTextController?.text.replaceAll('.', '') ?? '0') ??
        0;
    final kambingCount =
        int.tryParse(_model.jmlKambingTextController?.text ?? '0') ?? 0;
    final kambingPrice = int.tryParse(
            _model.hargaKambingTextController?.text.replaceAll('.', '') ??
                '0') ??
        0;
    final dombaCount =
        int.tryParse(_model.jmlDombaTextController?.text ?? '0') ?? 0;
    final dombaPrice = int.tryParse(
            _model.hargaDombaTextController?.text.replaceAll('.', '') ?? '0') ??
        0;

    final total = (sapiCount * sapiPrice) +
        (kambingCount * kambingPrice) +
        (dombaCount * dombaPrice);

    if (total > 0) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(ModernSpacing.md),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ModernColors.primaryDark,
              ModernColors.primaryDarkEnd,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(ModernRadius.md),
          boxShadow: ModernShadows.buttonShadow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Keseluruhan',
              style: GoogleFonts.inter(
                color: ModernColors.textOnDark,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Rp ${CurrencyInputFormatter.formatToCurrency(total)}',
              style: GoogleFonts.inter(
                color: ModernColors.textOnDark,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      );
    }
    return SizedBox.shrink();
  }
}
