import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/backend/schema/structs/index.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_model.dart';
export 'login_model.dart';

/// Login page with modern UI styling matching reference design
class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  static String routeName = 'Login';
  static String routePath = '/login';

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget>
    with TickerProviderStateMixin {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() {});
    });

    _model.emailLoginTextController ??= TextEditingController();
    _model.emailLoginFocusNode ??= FocusNode();

    _model.passLoginTextController ??= TextEditingController();
    _model.passLoginFocusNode ??= FocusNode();

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
          backgroundColor: Colors.white,
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // Logo Section
                    SizedBox(height: 48.0),
                    Image.asset(
                      'assets/images/logo.png',
                      width: 180.0,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      'Sistem Informasi Zakat Infak Sedekah',
                      style: GoogleFonts.inter(
                        color: Color(0xFF6B7280),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: 48.0),

                    // Form Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Email Label
                        Text(
                          'Email',
                          style: GoogleFonts.inter(
                            color: Color(0xFF1A1A1A),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        // Email Input
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
                            controller: _model.emailLoginTextController,
                            focusNode: _model.emailLoginFocusNode,
                            autofocus: false,
                            autofillHints: [AutofillHints.email],
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Masukkan email Anda',
                              hintStyle: GoogleFonts.inter(
                                color: Color(0xFF9CA3AF),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                              ),
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Icon(
                                  Icons.mail_outline_rounded,
                                  color: Color(0xFF9CA3AF),
                                  size: 22.0,
                                ),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 16.0,
                              ),
                            ),
                            style: GoogleFonts.inter(
                              color: Color(0xFF1A1A1A),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: _model.emailLoginTextControllerValidator
                                .asValidator(context),
                          ),
                        ),

                        SizedBox(height: 20.0),

                        // Password Label
                        Text(
                          'Password',
                          style: GoogleFonts.inter(
                            color: Color(0xFF1A1A1A),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        // Password Input
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
                            controller: _model.passLoginTextController,
                            focusNode: _model.passLoginFocusNode,
                            autofocus: false,
                            autofillHints: [AutofillHints.password],
                            obscureText: !_model.passLoginVisibility,
                            decoration: InputDecoration(
                              hintText: 'Masukkan password Anda',
                              hintStyle: GoogleFonts.inter(
                                color: Color(0xFF9CA3AF),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                              ),
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Icon(
                                  Icons.lock_outline_rounded,
                                  color: Color(0xFF9CA3AF),
                                  size: 22.0,
                                ),
                              ),
                              suffixIcon: InkWell(
                                onTap: () => safeSetState(
                                  () => _model.passLoginVisibility =
                                      !_model.passLoginVisibility,
                                ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Icon(
                                    _model.passLoginVisibility
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
                            ),
                            style: GoogleFonts.inter(
                              color: Color(0xFF1A1A1A),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                            validator: _model.passLoginTextControllerValidator
                                .asValidator(context),
                          ),
                        ),

                        SizedBox(height: 16.0),

                        // Remember Me & Forgot Password Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Remember Me Checkbox
                            Row(
                              children: [
                                SizedBox(
                                  width: 20.0,
                                  height: 20.0,
                                  child: Checkbox(
                                    value: _model.rememberMe,
                                    onChanged: (value) {
                                      safeSetState(() {
                                        _model.rememberMe = value ?? false;
                                      });
                                    },
                                    activeColor: Color(0xFF259148),
                                    side: BorderSide(
                                      color: Color(0xFFD1D5DB),
                                      width: 1.5,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                Text(
                                  'Ingat Saya',
                                  style: GoogleFonts.inter(
                                    color: Color(0xFF4B5563),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            // Forgot Password Link
                            /* GestureDetector(
                              onTap: () {
                                // Handle forgot password
                              },
                              child: Text(
                                'Lupa Password?',
                                style: GoogleFonts.inter(
                                  color: Color(0xFF259148),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ), */
                          ],
                        ),

                        SizedBox(height: 32.0),

                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          height: 52.0,
                          child: ElevatedButton(
                            onPressed: () async {
                              Function() _navigate = () {};
                              _model.loginResponse =
                                  await AuthEndPointGroup.loginUserCall.call(
                                email: _model.emailLoginTextController.text,
                                password: _model.passLoginTextController.text,
                              );

                              if ((_model.loginResponse?.succeeded ?? true)) {
                                GoRouter.of(context).prepareAuthEvent();
                                await authManager.signIn(
                                  authenticationToken:
                                      UserDataStruct.maybeFromMap(
                                              (_model.loginResponse?.jsonBody ??
                                                  ''))
                                          ?.token,
                                  authUid: UserDataStruct.maybeFromMap(
                                          (_model.loginResponse?.jsonBody ??
                                              ''))
                                      ?.user
                                      .id
                                      .toString(),
                                  userData: UserDataStruct.maybeFromMap(
                                          (_model.loginResponse?.jsonBody ??
                                              ''))
                                      ?.user,
                                );
                                _navigate = () => context.goNamedAuth(
                                    HomeWidget.routeName, context.mounted);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      AuthEndPointGroup.loginUserCall
                                          .authMassage(
                                        (_model.loginResponse?.jsonBody ?? ''),
                                      )!,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor: Color(0xFFEF4444),
                                  ),
                                );
                              }

                              _navigate();
                              safeSetState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF1A3C34),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(26.0),
                              ),
                            ),
                            child: Text(
                              'Masuk',
                              style: GoogleFonts.inter(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 24.0),

                        // Register Link
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              context.pushNamed(
                                RegisterWidget.routeName,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                  ),
                                },
                              );
                            },
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Belum punya akun? ',
                                    style: GoogleFonts.inter(
                                      color: Color(0xFF6B7280),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Daftar',
                                    style: GoogleFonts.inter(
                                      color: Color(0xFF259148),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ).animateOnPageLoad(
                        animationsMap['columnOnPageLoadAnimation']!),
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
