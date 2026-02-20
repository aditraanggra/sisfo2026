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
import 'fidyah_model.dart';
export 'fidyah_model.dart';

class FidyahWidget extends StatefulWidget {
  const FidyahWidget({super.key});

  static String routeName = 'Fidyah';
  static String routePath = '/fidyah';

  @override
  State<FidyahWidget> createState() => _FidyahWidgetState();
}

class _FidyahWidgetState extends State<FidyahWidget>
    with TickerProviderStateMixin {
  late FidyahModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController _buttonAnimationController;
  late Animation<double> _buttonScaleAnimation;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FidyahModel());
    _model.namaMuzakkiTextController ??= TextEditingController();
    _model.namaMuzakkiFocusNode ??= FocusNode();
    _model.jmlHariTextController ??= TextEditingController();
    _model.jmlHariFocusNode ??= FocusNode();
    _model.nominalPerHariTextController ??= TextEditingController();
    _model.nominalPerHariFocusNode ??= FocusNode();
    _model.keteranganTextController ??= TextEditingController();
    _model.keteranganFocusNode ??= FocusNode();

    _buttonAnimationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _buttonScaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(
      CurvedAnimation(
          parent: _buttonAnimationController, curve: Curves.easeInOut),
    );
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: ModernColors.backgroundPrimary,
        appBar: _buildAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoCard(),
                const SizedBox(height: 16),
                _buildFormCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: ModernColors.primaryDark,
      automaticallyImplyLeading: false,
      leading: FlutterFlowIconButton(
        borderRadius: 30,
        buttonSize: 48,
        icon: Icon(Icons.arrow_back_rounded,
            color: ModernColors.textOnDark, size: 20),
        onPressed: () => context.safePop(),
      ),
      title: Text(
        'Penerimaan Fidyah',
        style: GoogleFonts.inter(
            color: ModernColors.textOnDark,
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
      elevation: 0,
    );
  }

  Widget _buildInfoCard() {
    return Container(
      decoration: BoxDecoration(
        color: ModernColors.primaryDark.withOpacity(0.1),
        borderRadius: BorderRadius.circular(ModernRadius.xl),
        border: Border.all(
          color: ModernColors.primaryDark.withOpacity(0.3),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: ModernColors.primaryDark,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.info_outline,
                color: ModernColors.textOnDark, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tentang Fidyah',
                  style: GoogleFonts.inter(
                    color: ModernColors.primaryDark,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Fidyah adalah denda bagi yang tidak bisa berpuasa karena uzur',
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

  Widget _buildFormCard() {
    return Container(
      decoration: BoxDecoration(
        color: ModernColors.backgroundCard,
        borderRadius: BorderRadius.circular(ModernRadius.xl),
        boxShadow: ModernShadows.cardShadow,
      ),
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _model.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date picker
            Text(
              'PILIH TANGGAL',
              style: GoogleFonts.inter(
                color: ModernColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            wrapWithModel(
              model: _model.datePickerModel,
              updateCallback: () => safeSetState(() {}),
              child: DatePickerWidget(),
            ),

            // Nama Pembayar
            const SizedBox(height: 16),
            Text(
              'DATA PEMBAYAR',
              style: GoogleFonts.inter(
                color: ModernColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _model.namaMuzakkiTextController,
              focusNode: _model.namaMuzakkiFocusNode,
              decoration: _buildInputDecoration(labelText: 'Nama Pembayar'),
              style: GoogleFonts.inter(
                  color: ModernColors.textPrimary, fontSize: 16),
              cursorColor: ModernColors.primaryAccent,
              validator: _model.namaMuzakkiTextControllerValidator
                  ?.asValidator(context),
            ),

            // Jumlah Hari
            const SizedBox(height: 16),
            Text(
              'JUMLAH HARI',
              style: GoogleFonts.inter(
                color: ModernColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _model.jmlHariTextController,
              focusNode: _model.jmlHariFocusNode,
              onChanged: (_) => EasyDebounce.debounce(
                '_model.jmlHariTextController',
                const Duration(milliseconds: 500),
                () => safeSetState(() {}),
              ),
              decoration: _buildInputDecoration(
                labelText: 'Jumlah Hari',
                suffixText: 'hari',
              ),
              style: GoogleFonts.inter(
                  color: ModernColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              cursorColor: ModernColors.primaryAccent,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator:
                  _model.jmlHariTextControllerValidator?.asValidator(context),
            ),

            // Nominal Per Hari
            const SizedBox(height: 16),
            Text(
              'NOMINAL PER HARI',
              style: GoogleFonts.inter(
                color: ModernColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _model.nominalPerHariTextController,
              focusNode: _model.nominalPerHariFocusNode,
              onChanged: (_) => EasyDebounce.debounce(
                '_model.nominalPerHariTextController',
                const Duration(milliseconds: 500),
                () => safeSetState(() {}),
              ),
              decoration: InputDecoration(
                labelText: 'Nominal Per Hari',
                prefixText: 'Rp ',
                labelStyle: GoogleFonts.inter(
                    color: ModernColors.textSecondary, fontSize: 16),
                prefixStyle: GoogleFonts.inter(
                    color: ModernColors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
                floatingLabelStyle: GoogleFonts.inter(
                    color: ModernColors.primaryAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(ModernRadius.lg),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: ModernColors.primaryAccent, width: 2),
                  borderRadius: BorderRadius.circular(ModernRadius.lg),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: ModernColors.expenseRed, width: 1.5),
                  borderRadius: BorderRadius.circular(ModernRadius.lg),
                ),
                filled: true,
                fillColor: ModernColors.backgroundPrimary,
                contentPadding: const EdgeInsets.all(16),
              ),
              style: GoogleFonts.inter(
                  color: ModernColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              cursorColor: ModernColors.primaryAccent,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),

            // Total Fidyah
            if (_model.totalFidyah > 0) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ModernColors.primaryDark.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(ModernRadius.lg),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Fidyah',
                      style: GoogleFonts.inter(
                        color: ModernColors.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      formatNumber(
                        _model.totalFidyah,
                        formatType: FormatType.decimal,
                        decimalType: DecimalType.automatic,
                        currency: 'Rp ',
                      ),
                      style: GoogleFonts.inter(
                        color: ModernColors.primaryDark,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],

            // Keterangan
            const SizedBox(height: 16),
            TextFormField(
              controller: _model.keteranganTextController,
              focusNode: _model.keteranganFocusNode,
              decoration:
                  _buildInputDecoration(labelText: 'Keterangan (opsional)'),
              style: GoogleFonts.inter(
                  color: ModernColors.textPrimary, fontSize: 16),
              cursorColor: ModernColors.primaryAccent,
              maxLines: 2,
            ),

            // Submit button
            const SizedBox(height: 24),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration({
    required String labelText,
    String? suffixText,
  }) {
    return InputDecoration(
      labelText: labelText,
      suffixText: suffixText,
      labelStyle:
          GoogleFonts.inter(color: ModernColors.textSecondary, fontSize: 16),
      suffixStyle:
          GoogleFonts.inter(color: ModernColors.textSecondary, fontSize: 14),
      floatingLabelStyle: GoogleFonts.inter(
          color: ModernColors.primaryAccent,
          fontSize: 14,
          fontWeight: FontWeight.w500),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(ModernRadius.lg),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ModernColors.primaryAccent, width: 2),
        borderRadius: BorderRadius.circular(ModernRadius.lg),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ModernColors.expenseRed, width: 1.5),
        borderRadius: BorderRadius.circular(ModernRadius.lg),
      ),
      filled: true,
      fillColor: ModernColors.backgroundPrimary,
      contentPadding: const EdgeInsets.all(16),
    );
  }

  Widget _buildSubmitButton() {
    return AnimatedBuilder(
      animation: _buttonScaleAnimation,
      builder: (context, child) =>
          Transform.scale(scale: _buttonScaleAnimation.value, child: child),
      child: GestureDetector(
        onTapDown: (_) => _buttonAnimationController.forward(),
        onTapUp: (_) => _buttonAnimationController.reverse(),
        onTapCancel: () => _buttonAnimationController.reverse(),
        child: FFButtonWidget(
          onPressed: _handleSubmit,
          text: 'Simpan',
          options: FFButtonOptions(
            width: double.infinity,
            height: 52,
            color: ModernColors.primaryDark,
            textStyle: GoogleFonts.inter(
                color: ModernColors.textOnDark,
                fontSize: 16,
                fontWeight: FontWeight.w600),
            elevation: 0,
            borderRadius: BorderRadius.circular(ModernRadius.lg),
          ),
        ),
      ),
    );
  }

  Future<void> _handleSubmit() async {
    if (!(_model.formKey.currentState?.validate() ?? false)) return;

    if (_model.datePickerModel.datePicked == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Tanggal belum diisi',
              style: GoogleFonts.inter(color: ModernColors.textOnDark)),
          backgroundColor: ModernColors.expenseRed,
        ),
      );
      return;
    }

    if (_model.totalFidyah <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Jumlah hari dan nominal harus diisi',
              style: GoogleFonts.inter(color: ModernColors.textOnDark)),
          backgroundColor: ModernColors.expenseRed,
        ),
      );
      return;
    }

    await TransactionEndPointGroup.addFidyahCall.call(
      trxDate: _model.datePickerModel.datePicked?.toString(),
      token: currentAuthenticationToken,
      unitId: FFAppState().profileUPZ.id,
      name: _model.namaMuzakkiTextController?.text,
      totalDay: int.tryParse(_model.jmlHariTextController?.text ?? '0'),
      amount: _model.totalFidyah,
    );

    if (!mounted) return;

    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Berhasil',
            style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
        content: Text(
          'Transaksi Fidyah Berhasil',
          style: GoogleFonts.inter(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('Ok',
                style: GoogleFonts.inter(
                    color: ModernColors.primaryAccent,
                    fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );

    // Reset form
    _model.namaMuzakkiTextController?.clear();
    _model.jmlHariTextController?.clear();
    _model.nominalPerHariTextController?.clear();
    _model.keteranganTextController?.clear();

    context.pushNamed(
      HomeWidget.routeName,
      extra: <String, dynamic>{
        kTransitionInfoKey: TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.leftToRight),
      },
    );
  }
}
