import '/auth/custom_auth/auth_util.dart';
import '/backend/cloudinary/cloudinary_upload_helper.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_profile_model.dart';
export 'edit_profile_model.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({
    super.key,
    required this.namaOperator,
    this.noTelp,
    this.fotoProfil,
  });

  final String? namaOperator;
  final String? noTelp;
  final String? fotoProfil;

  static String routeName = 'EditProfile';
  static String routePath = '/editProfile';

  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget>
    with TickerProviderStateMixin {
  late EditProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileModel());

    _model.yourNameTextController ??=
        TextEditingController(text: currentUserData?.name);
    _model.yourNameFocusNode ??= FocusNode();

    _model.noTelpTextController ??=
        TextEditingController(text: FFAppState().profileUPZ.operatorPhone);
    _model.noTelpFocusNode ??= FocusNode();

    animationsMap.addAll({
      'stackOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 750.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 90.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textFieldOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 750.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 90.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textFieldOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 750.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 90.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 750.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 90.0),
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: responsiveVisibility(
        context: context,
        desktop: false,
      )
          ? AppBar(
              backgroundColor: Color(0xFF1A3C34),
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 54.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                'Edit Profil',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            )
          : null,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 32.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120.0,
                      height: 120.0,
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  storageFolderPath: 'upz/avatar',
                                  maxWidth: 100.00,
                                  maxHeight: 100.00,
                                  imageQuality: 80,
                                  allowPhoto: true,
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  textColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  pickerFontFamily: 'Outfit',
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  safeSetState(() => _model
                                      .isDataUploading_uploadDataR0t = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  var downloadUrls = <String>[];
                                  try {
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                              blurHash: m.blurHash,
                                              originalFilename:
                                                  m.originalFilename,
                                            ))
                                        .toList();

                                    downloadUrls =
                                        await uploadProfilePhotoToCloudinary(
                                      selectedFiles: selectedMedia,
                                      userId: FFAppState()
                                          .profileUPZ
                                          .userId
                                          .toString(),
                                      noRegister:
                                          FFAppState().profileUPZ.noRegister,
                                    );
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Gagal mengunggah foto: $e')),
                                    );
                                    return;
                                  } finally {
                                    _model.isDataUploading_uploadDataR0t =
                                        false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                          selectedMedia.length &&
                                      downloadUrls.length ==
                                          selectedMedia.length) {
                                    safeSetState(() {
                                      _model.uploadedLocalFile_uploadDataR0t =
                                          selectedUploadedFiles.first;
                                      _model.uploadedFileUrl_uploadDataR0t =
                                          downloadUrls.first;
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text('Gagal mengunggah foto')),
                                    );
                                    return;
                                  }
                                }
                              },
                              child: Container(
                                width: 120.0,
                                height: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 8.0,
                                      color: Colors.black.withOpacity(0.05),
                                      offset: Offset(0.0, 4.0),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Container(
                                    width: 120.0,
                                    height: 120.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      'https://ui-avatars.com/api/?name=${Uri.encodeComponent(currentUserData?.name ?? 'AD')}&background=E1EFED&color=1A3C34',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (!_model.isEdited)
                            Align(
                              alignment: AlignmentDirectional(1.0, 1.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Colors.black.withOpacity(0.1),
                                      offset: Offset(0.0, 2.0),
                                    ),
                                  ],
                                ),
                                child: FlutterFlowIconButton(
                                  borderColor: Color(0xFF259148),
                                  borderRadius: 20.0,
                                  borderWidth: 1.5,
                                  buttonSize: 40.0,
                                  fillColor: Colors.white,
                                  icon: FaIcon(
                                    FontAwesomeIcons.pen,
                                    color: Color(0xFF259148),
                                    size: 16.0,
                                  ),
                                  onPressed: () async {
                                    _model.isEdited = true;
                                    safeSetState(() {});
                                  },
                                ),
                              ),
                            ),
                          if (_model.isEdited)
                            Align(
                              alignment: AlignmentDirectional(1.0, 1.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Colors.black.withOpacity(0.1),
                                      offset: Offset(0.0, 2.0),
                                    ),
                                  ],
                                ),
                                child: FlutterFlowIconButton(
                                  borderColor: Color(0xFF259148),
                                  borderRadius: 20.0,
                                  borderWidth: 1.5,
                                  buttonSize: 40.0,
                                  fillColor: Colors.white,
                                  icon: Icon(
                                    Icons.check,
                                    color: Color(0xFF259148),
                                    size: 18.0,
                                  ),
                                  onPressed: () async {
                                    _model.isEdited = false;
                                    safeSetState(() {});
                                  },
                                ),
                              ),
                            ),
                        ],
                      ),
                    ).animateOnPageLoad(
                        animationsMap['stackOnPageLoadAnimation']!),
                  ],
                ),
              ),
              if (_model.isEdited)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      final selectedMedia =
                          await selectMediaWithSourceBottomSheet(
                        context: context,
                        storageFolderPath: 'upz/avatar',
                        maxWidth: 100.00,
                        maxHeight: 100.00,
                        imageQuality: 80,
                        allowPhoto: true,
                        backgroundColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        textColor: FlutterFlowTheme.of(context).primaryText,
                        pickerFontFamily: 'Outfit',
                      );
                      if (selectedMedia != null &&
                          selectedMedia.every((m) =>
                              validateFileFormat(m.storagePath, context))) {
                        safeSetState(
                            () => _model.isDataUploading_uploadDataR0t = true);
                        var selectedUploadedFiles = <FFUploadedFile>[];

                        var downloadUrls = <String>[];
                        try {
                          selectedUploadedFiles = selectedMedia
                              .map((m) => FFUploadedFile(
                                    name: m.storagePath.split('/').last,
                                    bytes: m.bytes,
                                    height: m.dimensions?.height,
                                    width: m.dimensions?.width,
                                    blurHash: m.blurHash,
                                    originalFilename: m.originalFilename,
                                  ))
                              .toList();

                          downloadUrls = await uploadProfilePhotoToCloudinary(
                            selectedFiles: selectedMedia,
                            userId: FFAppState().profileUPZ.userId.toString(),
                            noRegister: FFAppState().profileUPZ.noRegister,
                          );
                        } finally {
                          _model.isDataUploading_uploadDataR0t = false;
                        }
                        if (selectedUploadedFiles.length ==
                                selectedMedia.length &&
                            downloadUrls.length == selectedMedia.length) {
                          safeSetState(() {
                            _model.uploadedLocalFile_uploadDataR0t =
                                selectedUploadedFiles.first;
                            _model.uploadedFileUrl_uploadDataR0t =
                                downloadUrls.first;
                          });
                        } else {
                          safeSetState(() {});
                          return;
                        }
                      }
                    },
                    child: Text(
                      'Ubah Foto Profil',
                      style: GoogleFonts.inter(
                        color: Color(0xFF259148),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 20.0),
                child: TextFormField(
                  controller: _model.yourNameTextController,
                  focusNode: _model.yourNameFocusNode,
                  textCapitalization: TextCapitalization.words,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Nama Operator',
                    labelStyle: GoogleFonts.inter(
                      color: Color(0xFF6B7280),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    hintStyle: GoogleFonts.inter(
                      color: Color(0xFF6B7280),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFE5E7EB),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF259148),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    filled: true,
                    fillColor: Color(0xFFF9FAFB),
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                    prefixIcon: Icon(
                      Icons.person_outline_rounded,
                      color: Color(0xFF6B7280),
                      size: 20.0,
                    ),
                  ),
                  style: GoogleFonts.inter(
                    color: Color(0xFF1F2937),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                  validator: _model.yourNameTextControllerValidator
                      .asValidator(context),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9+\-\s]')),
                  ],
                ).animateOnPageLoad(
                    animationsMap['textFieldOnPageLoadAnimation1']!),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 20.0),
                child: TextFormField(
                  controller: _model.noTelpTextController,
                  focusNode: _model.noTelpFocusNode,
                  textCapitalization: TextCapitalization.none,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'No Telp',
                    labelStyle: GoogleFonts.inter(
                      color: Color(0xFF6B7280),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    hintStyle: GoogleFonts.inter(
                      color: Color(0xFF6B7280),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFE5E7EB),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF259148),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    filled: true,
                    fillColor: Color(0xFFF9FAFB),
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                    prefixIcon: Icon(
                      Icons.phone_outlined,
                      color: Color(0xFF6B7280),
                      size: 20.0,
                    ),
                  ),
                  style: GoogleFonts.inter(
                    color: Color(0xFF1F2937),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                  keyboardType: TextInputType.phone,
                  validator:
                      _model.noTelpTextControllerValidator.asValidator(context),
                  inputFormatters: [
                    if (!isAndroid && !isiOS)
                      TextInputFormatter.withFunction((oldValue, newValue) {
                        return TextEditingValue(
                          selection: newValue.selection,
                          text: newValue.text
                              .toCapitalization(TextCapitalization.words),
                        );
                      }),
                  ],
                ).animateOnPageLoad(
                    animationsMap['textFieldOnPageLoadAnimation2']!),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 48.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Update profil'),
                          content: Text('Data berhasil disimpan'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );

                    context.goNamed(ProfileResponsiveWidget.routeName);
                  },
                  text: 'Simpan Perubahan',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 52.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF259148),
                    textStyle: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(26.0),
                  ),
                ).animateOnPageLoad(
                    animationsMap['buttonOnPageLoadAnimation']!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
