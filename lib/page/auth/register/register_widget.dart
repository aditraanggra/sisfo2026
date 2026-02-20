import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'register_model.dart';
export 'register_model.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  static String routeName = 'Register';
  static String routePath = '/register';

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget>
    with TickerProviderStateMixin {
  late RegisterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterModel());

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  String? _getPasswordStrength(String password) {
    if (password.isEmpty) return null;
    if (password.length < 6) return 'Lemah';
    if (password.length < 8) return 'Sedang';
    if (password.length >= 8 &&
        password.contains(RegExp(r'[A-Z]')) &&
        password.contains(RegExp(r'[0-9]'))) {
      return 'Kuat';
    }
    return 'Sedang';
  }

  Color _getPasswordStrengthColor(String? strength) {
    switch (strength) {
      case 'Lemah':
        return Color(0xFFEF4444);
      case 'Sedang':
        return Color(0xFFF59E0B);
      case 'Kuat':
        return Color(0xFF259148);
      default:
        return Colors.transparent;
    }
  }

  Future<void> _handleRegister() async {
    if (_model.formKey.currentState == null ||
        !_model.formKey.currentState!.validate()) {
      return;
    }

    safeSetState(() => _model.isLoading = true);

    try {
      _model.registerResponse = await AuthEndPointGroup.registerUserCall.call(
        name: _model.nameRegTextController?.text ?? '',
        email: _model.emailRegTextController?.text ?? '',
        password: _model.passRegTextController?.text ?? '',
        confirmPassword: _model.passRegConfirmTextController?.text ?? '',
      );

      if (_model.registerResponse?.succeeded ?? false) {
        _model.loginResponse = await AuthEndPointGroup.loginUserCall.call(
          email: _model.emailRegTextController?.text ?? '',
          password: _model.passRegTextController?.text ?? '',
        );

        if (_model.loginResponse?.succeeded ?? false) {
          GoRouter.of(context).prepareAuthEvent();
          await authManager.signIn(
            authenticationToken:
                UserDataStruct.maybeFromMap(_model.loginResponse?.jsonBody)
                    ?.token,
            authUid: UserDataStruct.maybeFromMap(_model.loginResponse?.jsonBody)
                ?.user
                .id
                .toString(),
            userData:
                UserDataStruct.maybeFromMap(_model.loginResponse?.jsonBody)
                    ?.user,
          );

          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Registrasi berhasil! Selamat datang.',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Color(0xFF259148),
                duration: Duration(milliseconds: 3000),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
            context.goNamed(
              RegistrationTypeWidget.routeName,
              extra: <String, dynamic>{
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.rightToLeft,
                ),
              },
            );
          }
        } else {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Registrasi berhasil, silakan login manual',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Color(0xFF259148),
                duration: Duration(milliseconds: 4000),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
            context.goNamed(LoginWidget.routeName);
          }
        }
      } else {
        if (mounted) {
          final errorMsg = AuthEndPointGroup.loginUserCall
                  .authMassage(_model.registerResponse?.jsonBody ?? '') ??
              'Registrasi gagal. Silakan coba lagi.';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                errorMsg,
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Color(0xFFEF4444),
              duration: Duration(milliseconds: 4000),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        }
      }
    } finally {
      safeSetState(() => _model.isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: SafeArea(
            top: true,
            child: Stack(
              children: [
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(height: 40.0),
                      _buildHeader(),
                      SizedBox(height: 32.0),
                      _buildForm(),
                      SizedBox(height: 24.0),
                      _buildLoginLink(),
                      SizedBox(height: 40.0),
                    ],
                  ).animateOnPageLoad(
                      animationsMap['columnOnPageLoadAnimation']!),
                ),
                if (_model.isLoading)
                  Container(
                    color: Colors.black.withOpacity(0.4),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SpinKitFadingFour(
                              color: Color(0xFF259148),
                              size: 40.0,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Memproses...',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF1A1A1A),
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
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo.png',
          width: 160.0,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 12.0),
        Text(
          'Sistem Informasi Zakat Infak Sedekah',
          style: GoogleFonts.inter(
            color: Color(0xFF6B7280),
            fontSize: 13.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 32.0),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Color(0xFFF0FDF4),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'Buat Akun Operator UPZ',
            style: GoogleFonts.inter(
              color: Color(0xFF259148),
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Form(
      key: _model.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInputField(
            label: 'Nama Lengkap',
            controller: _model.nameRegTextController,
            focusNode: _model.nameRegFocusNode,
            hint: 'Masukkan nama lengkap',
            icon: Icons.person_outline_rounded,
            validator: (val) => _model.validateName(context, val),
          ),
          SizedBox(height: 20.0),
          _buildInputField(
            label: 'Email',
            controller: _model.emailRegTextController,
            focusNode: _model.emailRegFocusNode,
            hint: 'contoh@email.com',
            icon: Icons.mail_outline_rounded,
            keyboardType: TextInputType.emailAddress,
            validator: (val) => _model.validateEmail(context, val),
          ),
          SizedBox(height: 20.0),
          _buildPasswordField(
            label: 'Password',
            controller: _model.passRegTextController,
            focusNode: _model.passRegFocusNode,
            visibility: _model.passRegVisibility,
            onToggle: () => safeSetState(
                () => _model.passRegVisibility = !_model.passRegVisibility),
            validator: (val) => _model.validatePassword(context, val),
            showStrength: true,
          ),
          SizedBox(height: 20.0),
          _buildPasswordField(
            label: 'Konfirmasi Password',
            controller: _model.passRegConfirmTextController,
            focusNode: _model.passRegConfirmFocusNode,
            visibility: _model.passRegConfirmVisibility,
            onToggle: () => safeSetState(() => _model.passRegConfirmVisibility =
                !_model.passRegConfirmVisibility),
            validator: (val) => _model.validateConfirmPassword(context, val),
          ),
          SizedBox(height: 32.0),
          _buildSubmitButton(),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController? controller,
    required FocusNode? focusNode,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            color: Color(0xFF1A1A1A),
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.0),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFF9FAFB),
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: Color(0xFFE5E7EB),
              width: 1.0,
            ),
          ),
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            autofocus: false,
            autofillHints: keyboardType == TextInputType.emailAddress
                ? [AutofillHints.email]
                : [AutofillHints.name],
            obscureText: false,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.inter(
                color: Color(0xFF9CA3AF),
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(icon, color: Color(0xFF9CA3AF), size: 22.0),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              errorStyle: GoogleFonts.inter(
                fontSize: 12.0,
              ),
            ),
            style: GoogleFonts.inter(
              color: Color(0xFF1A1A1A),
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField({
    required String label,
    required TextEditingController? controller,
    required FocusNode? focusNode,
    required bool visibility,
    required VoidCallback onToggle,
    required String? Function(String?)? validator,
    bool showStrength = false,
  }) {
    final password = controller?.text ?? '';
    final strength = showStrength ? _getPasswordStrength(password) : null;
    final strengthColor = _getPasswordStrengthColor(strength);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            color: Color(0xFF1A1A1A),
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.0),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFF9FAFB),
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: Color(0xFFE5E7EB),
              width: 1.0,
            ),
          ),
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            autofocus: false,
            autofillHints: [AutofillHints.password],
            obscureText: !visibility,
            onChanged: showStrength ? (_) => safeSetState(() {}) : null,
            decoration: InputDecoration(
              hintText: 'Masukkan $label'.toLowerCase(),
              hintStyle: GoogleFonts.inter(
                color: Color(0xFF9CA3AF),
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(Icons.lock_outline_rounded,
                    color: Color(0xFF9CA3AF), size: 22.0),
              ),
              suffixIcon: InkWell(
                onTap: onToggle,
                focusNode: FocusNode(skipTraversal: true),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(
                    visibility
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Color(0xFF9CA3AF),
                    size: 22.0,
                  ),
                ),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              errorStyle: GoogleFonts.inter(
                fontSize: 12.0,
              ),
            ),
            style: GoogleFonts.inter(
              color: Color(0xFF1A1A1A),
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
            validator: validator,
          ),
        ),
        if (showStrength && password.isNotEmpty) ...[
          SizedBox(height: 8.0),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: strength == 'Lemah'
                        ? 0.33
                        : strength == 'Sedang'
                            ? 0.66
                            : 1.0,
                    backgroundColor: Color(0xFFE5E7EB),
                    valueColor: AlwaysStoppedAnimation<Color>(strengthColor),
                    minHeight: 4,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text(
                strength ?? '',
                style: GoogleFonts.inter(
                  color: strengthColor,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 52.0,
      child: ElevatedButton(
        onPressed: _model.isLoading ? null : _handleRegister,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF1A3C34),
          foregroundColor: Colors.white,
          disabledBackgroundColor: Color(0xFF9CA3AF),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26.0),
          ),
        ),
        child: Text(
          'Daftar',
          style: GoogleFonts.inter(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Sudah punya akun? ',
          style: GoogleFonts.inter(
            color: Color(0xFF6B7280),
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        GestureDetector(
          onTap: () {
            context.pushNamed(
              LoginWidget.routeName,
              extra: <String, dynamic>{
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                ),
              },
            );
          },
          child: Text(
            'Masuk di sini',
            style: GoogleFonts.inter(
              color: Color(0xFF259148),
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
