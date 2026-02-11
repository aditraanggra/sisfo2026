import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/component/date_picker/date_picker_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/services/dialog_service.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/component/skeleton_loader/skeleton_loader_widget.dart';
import 'zakat_fitrah_model.dart';
export 'zakat_fitrah_model.dart';

/// Zakat Fitrah transaction form page with modern UI styling
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
  late AnimationController _buttonAnimationController;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZakatFitrahModel());
    _initializeControllers();
    _loadPaymentTypes();
    _buttonAnimationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  Future<void> _loadPaymentTypes() async {
    try {
      final response = await MiscEndPointGroup.getZfPaymentTypesCall.call();

      if (response.succeeded) {
        final dataList = MiscEndPointGroup.getZfPaymentTypesCall
                .listData(response.jsonBody) ??
            [];

        _model.paymentTypes = dataList
            .map((item) =>
                ZfPaymentTypeStruct.fromMap(item as Map<String, dynamic>))
            .where((type) => type.isActive == true)
            .toList();

        // Separate by type
        _model.berasTypes = _model.paymentTypes
            .where((t) => t.type.toLowerCase() == 'beras')
            .toList();
        _model.uangTypes = _model.paymentTypes
            .where((t) => t.type.toLowerCase() == 'uang')
            .toList();

        // Set default selections
        if (_model.berasTypes.isNotEmpty) {
          _model.selectedBerasType = _model.berasTypes.first;
        }
        if (_model.uangTypes.isNotEmpty) {
          _model.selectedUangType = _model.uangTypes.first;
        }
      }
    } catch (e) {
      debugPrint('Error loading payment types: $e');
    } finally {
      _model.isLoadingPaymentTypes = false;
      safeSetState(() {});
    }
  }

  void _initializeControllers() {
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

    _model.keteranganTextController ??= TextEditingController();
    _model.keteranganFocusNode ??= FocusNode();
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
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: ModernColors.backgroundPrimary,
          appBar: _buildAppBar(context),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildSummaryCard(),
                  const SizedBox(height: 16),
                  _buildFormCard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    if (!responsiveVisibility(context: context, desktop: false)) return null;

    return AppBar(
      backgroundColor: ModernColors.primaryDark,
      automaticallyImplyLeading: false,
      elevation: 0,
      leading: FlutterFlowIconButton(
        borderColor: Colors.transparent,
        borderRadius: 30,
        buttonSize: 48,
        icon:
            const Icon(Icons.arrow_back_rounded, color: Colors.white, size: 24),
        onPressed: () => context.pop(),
      ),
      title: Text(
        'Penerimaan Zakat Fitrah',
        style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// Summary card showing real-time calculation
  Widget _buildSummaryCard() {
    final hasData = _model.totalBeras > 0 || _model.totalUang > 0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: hasData
              ? [ModernColors.primaryDark, const Color(0xFF124F23)]
              : [const Color(0xFF2D5A4A), const Color(0xFF1A3C34)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(ModernRadius.xl),
        boxShadow: ModernShadows.cardShadow,
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  _model.jenisZFValue == 'Beras'
                      ? Icons.rice_bowl_rounded
                      : Icons.payments_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Zakat Fitrah',
                      style: GoogleFonts.inter(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      _model.jenisZFValue == 'Beras'
                          ? '${_model.jmMuzakkiTextController?.text ?? '0'} Orang × ${_model.selectedBerasType?.riceAmount ?? 2.7} Kg'
                          : '${_model.jmMuzakkiTextController?.text ?? '0'} Orang × ${_model.selectedUangType != null ? formatNumber(_model.selectedUangType!.moneyAmount, formatType: FormatType.custom, currency: 'Rp. ', format: '###,###', locale: 'id_ID') : 'Rp. 0'}',
                      style: GoogleFonts.inter(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Text(
              _model.jenisZFValue == 'Beras'
                  ? '${formatNumber(_model.totalBeras, formatType: FormatType.custom, format: '##.##', locale: 'id_ID')} Kg'
                  : formatNumber(_model.totalUang,
                      formatType: FormatType.custom,
                      currency: 'Rp ',
                      format: '###,###',
                      locale: 'id_ID'),
              key: ValueKey('${_model.totalBeras}_${_model.totalUang}'),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
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
      child: Form(
        key: _model.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDateSection(),
            _buildDivider(),
            _buildTransactionTypeSection(),
            _buildDivider(),
            _buildMuzakkiDataSection(),
            _buildDivider(),
            _buildDivider(),
            _buildKeteranganSection(),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(height: 1, color: Colors.grey.shade200);
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: ModernColors.backgroundMint,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: ModernColors.primaryAccent, size: 18),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: GoogleFonts.inter(
              color: ModernColors.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('Tanggal Transaksi', Icons.calendar_today_rounded),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: wrapWithModel(
            model: _model.datePickerModel,
            updateCallback: () => safeSetState(() {}),
            child: const DatePickerWidget(),
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionTypeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('Jenis Zakat Fitrah', Icons.category_rounded),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
          child: Row(
            children: [
              _buildTypeChip('Beras', Icons.rice_bowl_rounded,
                  _model.jenisZFValue == 'Beras'),
              const SizedBox(width: 12),
              _buildTypeChip('Uang', Icons.payments_rounded,
                  _model.jenisZFValue == 'Uang'),
            ],
          ),
        ),
        if (_model.jenisZFValue == 'Uang') _buildNominalUangSection(),
      ],
    );
  }

  Widget _buildTypeChip(String label, IconData icon, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _model.jenisZFValueController?.value = label;
          _model.totalBeras = 0.0;
          _model.totalUang = 0;
          safeSetState(() {
            _model.jmMuzakkiTextController?.clear();
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            color: isSelected
                ? ModernColors.primaryAccent
                : ModernColors.backgroundPrimary,
            borderRadius: BorderRadius.circular(ModernRadius.md),
            border: Border.all(
              color: isSelected
                  ? ModernColors.primaryAccent
                  : Colors.grey.shade300,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.white : ModernColors.textSecondary,
                size: 22,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: GoogleFonts.inter(
                  color: isSelected ? Colors.white : ModernColors.textPrimary,
                  fontSize: 15,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNominalUangSection() {
    if (_model.isLoadingPaymentTypes) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: SkeletonLoaderWidget(
          type: SkeletonType.chips,
          itemCount: 6,
        ),
      );
    }

    if (_model.uangTypes.isEmpty) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Text(
          'Tidak ada nominal uang yang tersedia',
          style: GoogleFonts.inter(
            color: ModernColors.textSecondary,
            fontSize: 13,
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pilih Nominal per Kulak',
            style: GoogleFonts.inter(
              color: ModernColors.textSecondary,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: _model.uangTypes.map((type) {
              final isSelected = _model.selectedUangType?.id == type.id;
              return _buildNominalChipFromApi(type, isSelected);
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildNominalChipFromApi(ZfPaymentTypeStruct type, bool isSelected) {
    final formattedAmount = formatNumber(
      type.moneyAmount,
      formatType: FormatType.custom,
      currency: 'Rp. ',
      format: '###,###',
      locale: 'id_ID',
    );

    return GestureDetector(
      onTap: () {
        _model.selectedUangType = type;
        _model.totalUang = 0;
        safeSetState(() {
          _model.jmMuzakkiTextController?.clear();
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected
              ? ModernColors.primaryAccent.withOpacity(0.1)
              : Colors.white,
          borderRadius: BorderRadius.circular(ModernRadius.sm),
          border: Border.all(
            color:
                isSelected ? ModernColors.primaryAccent : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected)
              Padding(
                padding: const EdgeInsets.only(right: 6),
                child: Icon(Icons.check_circle,
                    color: ModernColors.primaryAccent, size: 18),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formattedAmount,
                  style: GoogleFonts.inter(
                    color: isSelected
                        ? ModernColors.primaryAccent
                        : ModernColors.textPrimary,
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
                if (type.name.isNotEmpty)
                  Text(
                    type.name,
                    style: GoogleFonts.inter(
                      color: ModernColors.textSecondary,
                      fontSize: 11,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMuzakkiDataSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('Data Muzakki', Icons.person_rounded),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildModernTextField(
                controller: _model.namaMuzakkiTextController!,
                focusNode: _model.namaMuzakkiFocusNode!,
                label: 'Nama Muzakki / Donatur',
                hint: 'Masukkan nama lengkap',
                prefixIcon: Icons.person_outline_rounded,
                hasError: _model.namaMuzakkiError != null,
                errorText: _model.namaMuzakkiError,
                validator: _model.namaMuzakkiTextControllerValidator
                    .asValidator(context),
              ),
              const SizedBox(height: 16),
              Text(
                'Jumlah Muzakki',
                style: GoogleFonts.inter(
                  color: ModernColors.textSecondary,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              _buildQuickAmountButtons(),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: _buildModernTextField(
                      controller: _model.jmMuzakkiTextController!,
                      focusNode: _model.jmMuzakkiFocusNode!,
                      label: 'Jumlah',
                      hint: '0',
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      hasError: _model.jmMuzakkiError != null,
                      errorText: _model.jmMuzakkiError,
                      validator: _model.jmMuzakkiTextControllerValidator
                          .asValidator(context),
                      onChanged: (val) => _calculateTotal(),
                      suffixWidget: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: ModernColors.backgroundMint,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Orang',
                          style: GoogleFonts.inter(
                            color: ModernColors.primaryAccent,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (_model.totalBeras > 0 || _model.totalUang > 0)
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: ModernColors.incomeGreen.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.check,
                            color: ModernColors.incomeGreen, size: 24),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuickAmountButtons() {
    final amounts = [1, 2, 3, 4, 5];
    return Row(
      children: amounts.map((amount) {
        final isSelected =
            _model.jmMuzakkiTextController?.text == amount.toString();
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: amount < 5 ? 8 : 0),
            child: GestureDetector(
              onTap: () {
                _model.jmMuzakkiTextController?.text = amount.toString();
                _calculateTotal();
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected
                      ? ModernColors.primaryAccent
                      : ModernColors.backgroundPrimary,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isSelected
                        ? ModernColors.primaryAccent
                        : Colors.grey.shade300,
                  ),
                ),
                child: Center(
                  child: Text(
                    '$amount',
                    style: GoogleFonts.inter(
                      color:
                          isSelected ? Colors.white : ModernColors.textPrimary,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  void _calculateTotal() {
    final count = int.tryParse(_model.jmMuzakkiTextController?.text ?? '') ?? 0;

    if (_model.jenisZFValue == 'Uang') {
      // Use selected uang type from API
      final harga = _model.selectedUangType?.moneyAmount ?? 0;
      _model.totalUang = count * harga;
    } else {
      // Use selected beras type from API, fallback to 2.7 kg
      final berasPerOrang = _model.selectedBerasType?.riceAmount ?? 2.7;
      _model.totalBeras = count * berasPerOrang;
    }
    safeSetState(() {});
  }

  Widget _buildKeteranganSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: _buildModernTextField(
        controller: _model.keteranganTextController!,
        focusNode: _model.keteranganFocusNode!,
        label: 'Keterangan',
        hint: 'Tambahkan catatan (opsional)',
        prefixIcon: Icons.notes_rounded,
        maxLines: 2,
        validator:
            _model.keteranganTextControllerValidator.asValidator(context),
      ),
    );
  }

  Widget _buildModernTextField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    String? hint,
    String? prefixText,
    IconData? prefixIcon,
    Widget? suffixWidget,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    bool hasError = false,
    String? errorText,
    int maxLines = 1,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: ModernColors.backgroundPrimary,
            borderRadius: BorderRadius.circular(ModernRadius.md),
            border: Border.all(
              color: hasError
                  ? ModernColors.expenseRed
                  : focusNode.hasFocus
                      ? ModernColors.primaryAccent
                      : Colors.transparent,
              width: hasError || focusNode.hasFocus ? 2 : 0,
            ),
          ),
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            onChanged: onChanged,
            maxLines: maxLines,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            style: GoogleFonts.inter(
              color: ModernColors.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              labelText: label,
              hintText: hint,
              prefixText: prefixText,
              prefixIcon: prefixIcon != null
                  ? Icon(prefixIcon,
                      color: ModernColors.textSecondary, size: 22)
                  : null,
              suffixIcon: suffixWidget != null
                  ? Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: suffixWidget)
                  : null,
              suffixIconConstraints:
                  const BoxConstraints(minHeight: 0, minWidth: 0),
              labelStyle: GoogleFonts.inter(
                color: ModernColors.textSecondary,
                fontSize: 14,
              ),
              hintStyle: GoogleFonts.inter(
                color: ModernColors.textSecondary.withOpacity(0.6),
                fontSize: 14,
              ),
              floatingLabelStyle: GoogleFonts.inter(
                color: hasError
                    ? ModernColors.expenseRed
                    : ModernColors.primaryAccent,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
            validator: validator,
          ),
        ),
        if (hasError && errorText != null)
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 6),
            child: Row(
              children: [
                Icon(Icons.error_outline,
                    color: ModernColors.expenseRed, size: 14),
                const SizedBox(width: 4),
                Text(
                  errorText,
                  style: GoogleFonts.inter(
                    color: ModernColors.expenseRed,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        height: 54,
        child: ElevatedButton(
          onPressed: _model.isSubmitting ? null : _handleSubmit,
          style: ElevatedButton.styleFrom(
            backgroundColor: ModernColors.primaryAccent,
            disabledBackgroundColor:
                ModernColors.primaryAccent.withOpacity(0.5),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ModernRadius.md),
            ),
          ),
          child: _model.isSubmitting
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Memproses...',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle_outline,
                        color: Colors.white, size: 22),
                    const SizedBox(width: 10),
                    Text(
                      'Proses Transaksi',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Future<void> _handleSubmit() async {
    if (_model.formKey.currentState == null ||
        !_model.formKey.currentState!.validate()) {
      return;
    }

    if (_model.datePickerModel.datePicked == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.white),
              const SizedBox(width: 10),
              Text('Tanggal belum dipilih'),
            ],
          ),
          backgroundColor: ModernColors.expenseRed,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
      return;
    }

    if (_model.jenisZFValue == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.white),
              const SizedBox(width: 10),
              Text('Pilih jenis zakat fitrah'),
            ],
          ),
          backgroundColor: ModernColors.expenseRed,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
      return;
    }

    final confirmed = await _showConfirmationDialog(null);
    if (!confirmed) return;

    _model.isSubmitting = true;
    safeSetState(() {});

    try {
      await AuthEndPointGroup.addZakatFitrahCall.call(
        token: currentAuthenticationToken,
        unitId: FFAppState().profileUPZ.id,
        trxDate: _model.datePickerModel.datePicked?.toString(),
        muzakkiName: _model.namaMuzakkiTextController!.text,
        totalMuzakki: int.tryParse(_model.jmMuzakkiTextController!.text),
        zfAmount: _model.totalUang,
        zfRice: _model.totalBeras,
        desc: _model.keteranganTextController!.text.isEmpty
            ? '-'
            : _model.keteranganTextController!.text,
      );

      _model.isSubmitting = false;
      safeSetState(() {});

      await _showSuccessModal(null);
    } catch (e) {
      _model.isSubmitting = false;
      safeSetState(() {});

      await DialogService.showErrorDialog(
        context: context,
        message: 'Gagal menyimpan transaksi. Silakan coba lagi.',
        onRetry: () {},
      );
    }
  }

  Future<bool> _showConfirmationDialog(int? nominalInfak) async {
    final totalText = _model.jenisZFValue == 'Beras'
        ? formatNumber(_model.totalBeras,
            formatType: FormatType.custom, format: '##.## Kg', locale: 'id_ID')
        : formatNumber(_model.totalUang,
            formatType: FormatType.custom,
            currency: 'Rp ',
            format: '###,###',
            locale: 'id_ID');

    return await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ModernRadius.lg)),
            title: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: ModernColors.backgroundMint,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.help_outline,
                      color: ModernColors.primaryAccent),
                ),
                const SizedBox(width: 12),
                Text('Konfirmasi',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600, fontSize: 18)),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildConfirmRow(
                    'Nama', _model.namaMuzakkiTextController!.text),
                _buildConfirmRow('Jenis', _model.jenisZFValue ?? '-'),
                _buildConfirmRow(
                    'Jumlah', '${_model.jmMuzakkiTextController!.text} Orang'),
                _buildConfirmRow('Total', totalText),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: Text('Batal',
                    style:
                        GoogleFonts.inter(color: ModernColors.textSecondary)),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(ctx, true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ModernColors.primaryAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Text('Proses',
                    style: GoogleFonts.inter(
                        color: Colors.white, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ) ??
        false;
  }

  Widget _buildConfirmRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(label,
                style: GoogleFonts.inter(
                    color: ModernColors.textSecondary, fontSize: 14)),
          ),
          Text(': ',
              style: GoogleFonts.inter(color: ModernColors.textSecondary)),
          Expanded(
            child: Text(value,
                style: GoogleFonts.inter(
                    color: ModernColors.textPrimary,
                    fontWeight: FontWeight.w500,
                    fontSize: 14)),
          ),
        ],
      ),
    );
  }

  Future<void> _showSuccessModal(int? nominalInfak) async {
    final transactionSummary = <String, String>{
      'Nama Muzakki': _model.namaMuzakkiTextController!.text,
      'Jenis Zakat': _model.jenisZFValue ?? '-',
      'Jumlah Muzakki': '${_model.jmMuzakkiTextController!.text} Orang',
    };

    if (_model.jenisZFValue == 'Beras') {
      transactionSummary['Total Beras'] = formatNumber(_model.totalBeras,
          formatType: FormatType.custom, format: '##.## Kg', locale: 'id_ID');
    } else {
      transactionSummary['Total Uang'] = formatNumber(_model.totalUang,
          formatType: FormatType.custom,
          currency: 'Rp ',
          format: '###,###',
          locale: 'id_ID');
    }

    await DialogService.showSuccessModal(
      context: context,
      title: 'Transaksi Berhasil',
      message: 'Data zakat fitrah telah berhasil disimpan.',
      transactionSummary: transactionSummary,
      onAddMore: () {
        _model.totalBeras = 0.0;
        _model.totalUang = 0;
        _model.namaMuzakkiError = null;
        _model.jmMuzakkiError = null;
        safeSetState(() {
          _model.namaMuzakkiTextController?.clear();
          _model.jmMuzakkiTextController?.clear();
          _model.keteranganTextController?.clear();
        });
      },
      onViewHistory: () => context.goNamed(HistoriTransaksiWidget.routeName),
    );
  }
}
