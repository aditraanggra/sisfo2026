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
import '/component/skeleton_loader/skeleton_loader_widget.dart';
import 'infak_model.dart';
export 'infak_model.dart';

class InfakWidget extends StatefulWidget {
  const InfakWidget({super.key, this.tglTransaksi, this.namaMuzakki});

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
    _model.totalMunfiqTextController ??= TextEditingController();
    _model.totalMunfiqFocusNode ??= FocusNode();
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

    _loadPrograms();
  }

  Future<void> _loadPrograms() async {
    setState(() => _model.isLoadingPrograms = true);
    try {
      // TODO: Ganti dengan API call setelah backend ready
      // final response = await MasterDataEndPointGroup.getProgramsCall.call(token: currentAuthenticationToken);
      // if (response.succeeded) {
      //   _model.programs = List<Map<String, dynamic>>.from(response.jsonBody['data']);
      // }

      // Sementara pakai data hardcoded
      await Future.delayed(const Duration(milliseconds: 300));
      _model.programs = [
        {'id': 1, 'name': 'Kemanusiaan', 'icon': 'favorite'},
        {'id': 2, 'name': 'Dakwah', 'icon': 'mosque'},
        {'id': 3, 'name': 'Pendidikan', 'icon': 'school'},
        {'id': 4, 'name': 'Kesehatan', 'icon': 'local_hospital'},
        {'id': 5, 'name': 'Ekonomi', 'icon': 'trending_up'},
      ];
    } catch (e) {
      _model.programsError = 'Gagal memuat data program';
    }
    setState(() => _model.isLoadingPrograms = false);
  }

  @override
  void dispose() {
    _model.dispose();
    _buttonAnimationController.dispose();
    super.dispose();
  }

  IconData _getProgramIcon(String? iconName) {
    switch (iconName) {
      case 'favorite':
        return Icons.favorite_rounded;
      case 'mosque':
        return Icons.mosque_rounded;
      case 'school':
        return Icons.school_rounded;
      case 'local_hospital':
        return Icons.local_hospital_rounded;
      case 'trending_up':
        return Icons.trending_up_rounded;
      default:
        return Icons.volunteer_activism_rounded;
    }
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
                _buildInfakTypeSelector(),
                const SizedBox(height: 16),
                if (_model.isTerikatProgram) _buildProgramSelector(),
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
        'Penerimaan Infak Sedekah',
        style: GoogleFonts.inter(
            color: ModernColors.textOnDark,
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
      elevation: 0,
    );
  }

  Widget _buildInfakTypeSelector() {
    return Container(
      decoration: BoxDecoration(
        color: ModernColors.backgroundCard,
        borderRadius: BorderRadius.circular(ModernRadius.xl),
        boxShadow: ModernShadows.cardShadow,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'JENIS INFAK SEDEKAH',
            style: GoogleFonts.inter(
              color: ModernColors.textSecondary,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildTypeOption(
                  title: 'Tidak Terikat',
                  subtitle: 'Infak umum',
                  icon: Icons.volunteer_activism_rounded,
                  isSelected: !_model.isTerikatProgram,
                  onTap: () => setState(() {
                    _model.isTerikatProgram = false;
                    _model.selectedProgramId = null;
                    _model.selectedProgramName = null;
                  }),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildTypeOption(
                  title: 'Terikat Program',
                  subtitle: 'Pilih program',
                  icon: Icons.assignment_rounded,
                  isSelected: _model.isTerikatProgram,
                  onTap: () => setState(() => _model.isTerikatProgram = true),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTypeOption({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? ModernColors.primaryDark.withOpacity(0.1)
              : ModernColors.backgroundPrimary,
          borderRadius: BorderRadius.circular(ModernRadius.lg),
          border: Border.all(
            color: isSelected ? ModernColors.primaryDark : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected
                    ? ModernColors.primaryDark
                    : Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: Icon(icon,
                  color: isSelected ? Colors.white : Colors.grey.shade600,
                  size: 24),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: GoogleFonts.inter(
                color: isSelected
                    ? ModernColors.primaryDark
                    : ModernColors.textPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              subtitle,
              style: GoogleFonts.inter(
                  color: ModernColors.textSecondary, fontSize: 11),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgramSelector() {
    return Container(
      decoration: BoxDecoration(
        color: ModernColors.backgroundCard,
        borderRadius: BorderRadius.circular(ModernRadius.xl),
        boxShadow: ModernShadows.cardShadow,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PILIH PROGRAM',
            style: GoogleFonts.inter(
              color: ModernColors.textSecondary,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12),
          if (_model.isLoadingPrograms)
            const SkeletonLoaderWidget(
              type: SkeletonType.chips,
              itemCount: 5,
            )
          else if (_model.programsError != null)
            Center(
              child: Column(
                children: [
                  Icon(Icons.error_outline,
                      color: ModernColors.expenseRed, size: 40),
                  const SizedBox(height: 8),
                  Text(_model.programsError!,
                      style: GoogleFonts.inter(color: ModernColors.expenseRed)),
                  TextButton(
                      onPressed: _loadPrograms, child: const Text('Coba Lagi')),
                ],
              ),
            )
          else
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _model.programs
                  .map((program) => _buildProgramChip(program))
                  .toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildProgramChip(Map<String, dynamic> program) {
    final isSelected = _model.selectedProgramId == program['id'];
    return GestureDetector(
      onTap: () => setState(() {
        _model.selectedProgramId = program['id'];
        _model.selectedProgramName = program['name'];
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? ModernColors.primaryDark
              : ModernColors.backgroundPrimary,
          borderRadius: BorderRadius.circular(ModernRadius.lg),
          border: Border.all(
            color: isSelected ? ModernColors.primaryDark : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _getProgramIcon(program['icon']),
              color: isSelected ? Colors.white : ModernColors.primaryDark,
              size: 18,
            ),
            const SizedBox(width: 8),
            Text(
              program['name'],
              style: GoogleFonts.inter(
                color: isSelected ? Colors.white : ModernColors.textPrimary,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
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
            // Selected program indicator
            if (_model.isTerikatProgram &&
                _model.selectedProgramName != null) ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: ModernColors.primaryDark.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(ModernRadius.md),
                ),
                child: Row(
                  children: [
                    Icon(Icons.check_circle,
                        color: ModernColors.primaryDark, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'Program: ${_model.selectedProgramName}',
                      style: GoogleFonts.inter(
                        color: ModernColors.primaryDark,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],

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

            // Nama Munfik
            const SizedBox(height: 16),
            Text(
              'DATA MUNFIK',
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
              decoration: _buildInputDecoration(labelText: 'Nama Munfik'),
              style: GoogleFonts.inter(
                  color: ModernColors.textPrimary, fontSize: 16),
              cursorColor: ModernColors.primaryAccent,
              validator: _model.namaMuzakkiTextControllerValidator
                  ?.asValidator(context),
            ),

            // Nominal
            const SizedBox(height: 16),
            Text(
              'NOMINAL INFAK',
              style: GoogleFonts.inter(
                color: ModernColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _model.jmlInfakTextController,
              focusNode: _model.jmlInfakFocusNode,
              onChanged: (_) => EasyDebounce.debounce(
                '_model.jmlInfakTextController',
                const Duration(milliseconds: 500),
                () => safeSetState(() {}),
              ),
              decoration: InputDecoration(
                labelText: 'Isi Nominal',
                prefixText: 'Rp ',
                labelStyle: GoogleFonts.inter(
                    color: ModernColors.textSecondary, fontSize: 16),
                prefixStyle: GoogleFonts.inter(
                    color: ModernColors.textPrimary,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
                floatingLabelStyle: GoogleFonts.inter(
                    color: ModernColors.primaryAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).alternate, width: 2),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: ModernColors.primaryAccent, width: 2),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: ModernColors.expenseRed, width: 2),
                ),
                suffixIcon: _model.jmlInfakTextController!.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear,
                            color: ModernColors.primaryAccent, size: 22),
                        onPressed: () {
                          _model.jmlInfakTextController?.clear();
                          safeSetState(() {});
                        },
                      )
                    : null,
              ),
              style: GoogleFonts.inter(
                  color: ModernColors.textPrimary,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
              cursorColor: ModernColors.primaryAccent,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator:
                  _model.jmlInfakTextControllerValidator?.asValidator(context),
            ),

            // Total Munfiq
            const SizedBox(height: 16),
            Text(
              'TOTAL MUNFIQ',
              style: GoogleFonts.inter(
                color: ModernColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _model.totalMunfiqTextController,
              focusNode: _model.totalMunfiqFocusNode,
              decoration: _buildInputDecoration(labelText: 'Jumlah Munfiq'),
              style: GoogleFonts.inter(
                  color: ModernColors.textPrimary, fontSize: 16),
              cursorColor: ModernColors.primaryAccent,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: _model.totalMunfiqTextControllerValidator
                  ?.asValidator(context),
            ),

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

  InputDecoration _buildInputDecoration({required String labelText}) {
    return InputDecoration(
      labelText: labelText,
      labelStyle:
          GoogleFonts.inter(color: ModernColors.textSecondary, fontSize: 16),
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

    if (_model.isTerikatProgram && _model.selectedProgramId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Pilih program terlebih dahulu',
              style: GoogleFonts.inter(color: ModernColors.textOnDark)),
          backgroundColor: ModernColors.expenseRed,
        ),
      );
      return;
    }

    // Build description with program info if applicable
    String desc = _model.keteranganTextController?.text ?? '';
    if (_model.isTerikatProgram && _model.selectedProgramName != null) {
      desc = '[Program: ${_model.selectedProgramName}] $desc'.trim();
    }

    await TransactionEndPointGroup.addSedekahCall.call(
      trxDate: _model.datePickerModel.datePicked?.toString(),
      token: currentAuthenticationToken,
      unitId: FFAppState().profileUPZ.id,
      munfiqName: _model.namaMuzakkiTextController?.text,
      amount: int.tryParse(_model.jmlInfakTextController?.text ?? ''),
      totalMunfiq:
          int.tryParse(_model.totalMunfiqTextController?.text ?? '1') ?? 1,
      desc: desc,
      // TODO: Tambahkan programId setelah backend support
      // programId: _model.selectedProgramId,
    );

    if (!mounted) return;

    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Berhasil',
            style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
        content: Text(
          _model.isTerikatProgram
              ? 'Transaksi Infak Program ${_model.selectedProgramName} Berhasil'
              : 'Transaksi Infak Berhasil',
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
    _model.jmlInfakTextController?.clear();
    _model.totalMunfiqTextController?.clear();
    _model.keteranganTextController?.clear();
    setState(() {
      _model.isTerikatProgram = false;
      _model.selectedProgramId = null;
      _model.selectedProgramName = null;
    });

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
