import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/auth/custom_auth/auth_util.dart';
import '/backend/cloudinary/cloudinary_upload_helper.dart';
import '/backend/api_requests/api_calls.dart';
import '/app_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'upload_laporan_model.dart';
export 'upload_laporan_model.dart';

class UploadLaporanWidget extends StatefulWidget {
  const UploadLaporanWidget({super.key});

  static String routeName = 'UploadLaporan';
  static String routePath = '/uploadLaporan';

  @override
  State<UploadLaporanWidget> createState() => _UploadLaporanWidgetState();
}

class _UploadLaporanWidgetState extends State<UploadLaporanWidget> {
  late UploadLaporanModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isUploadingAll = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadLaporanModel());
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<void> _handleUploads() async {
    // Check if at least one photo was selected across the forms
    if (_model.uploadedLocalFiles101.isEmpty &&
        _model.uploadedLocalFiles102.isEmpty &&
        _model.uploadedLocalFilesLpz.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Harap pilih minimal satu foto untuk diupload.'),
          backgroundColor: FlutterFlowTheme.of(context).error,
        ),
      );
      return;
    }

    setState(() {
      _isUploadingAll = true;
    });

    try {
      final noRegister = FFAppState().profileUPZ.noRegister.isNotEmpty
          ? FFAppState().profileUPZ.noRegister
          : 'unknown';

      // 1. Convert Formulir 101 to PDF bytes locally
      final Uint8List? bytes101 = _model.uploadedLocalFiles101.isNotEmpty
          ? await convertImagesToPdfBytes(
              selectedFiles: _model.uploadedLocalFiles101
                  .map((f) => SelectedFile(
                      bytes: f.bytes ?? Uint8List(0),
                      originalFilename: f.name ?? 'image'))
                  .toList(),
            )
          : null;

      // 2. Convert Formulir 102 to PDF bytes locally
      final Uint8List? bytes102 = _model.uploadedLocalFiles102.isNotEmpty
          ? await convertImagesToPdfBytes(
              selectedFiles: _model.uploadedLocalFiles102
                  .map((f) => SelectedFile(
                      bytes: f.bytes ?? Uint8List(0),
                      originalFilename: f.name ?? 'image'))
                  .toList(),
            )
          : null;

      // 3. Convert LPZ to PDF bytes locally
      final Uint8List? bytesLpz = _model.uploadedLocalFilesLpz.isNotEmpty
          ? await convertImagesToPdfBytes(
              selectedFiles: _model.uploadedLocalFilesLpz
                  .map((f) => SelectedFile(
                      bytes: f.bytes ?? Uint8List(0),
                      originalFilename: f.name ?? 'image'))
                  .toList(),
            )
          : null;

      final now = DateTime.now();
      final trxDate = DateFormat('yyyy-MM-dd').format(now);
      final lpzYear = now.year;

      final response = await TransactionEndPointGroup.uploadLpzCall.call(
        token: currentAuthenticationToken,
        unitId: FFAppState().profileUPZ.id,
        trxDate: trxDate,
        lpzYear: lpzYear,
        form101: bytes101 != null
            ? FFUploadedFile(name: '${noRegister}_form101.pdf', bytes: bytes101)
            : null,
        form102: bytes102 != null
            ? FFUploadedFile(name: '${noRegister}_form102.pdf', bytes: bytes102)
            : null,
        lpz: bytesLpz != null
            ? FFUploadedFile(name: '${noRegister}_lpz.pdf', bytes: bytesLpz)
            : null,
      );

      if (mounted) {
        if (response.succeeded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Berhasil mengupload laporan!'),
              backgroundColor: FlutterFlowTheme.of(context).success,
            ),
          );
          context.pop();
        } else {
          final jsonObj = response.jsonBody;
          final errorMsg = (jsonObj is Map && jsonObj['message'] != null)
              ? jsonObj['message'].toString()
              : 'Unknown error';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Gagal mengupload: $errorMsg'),
              backgroundColor: FlutterFlowTheme.of(context).error,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Terjadi kesalahan: $e'),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isUploadingAll = false;
        });
      }
    }
  }

  Widget _buildSection({
    required String title,
    required String subtitle,
    required List<FFUploadedFile> selectedFiles,
    required VoidCallback onSelectMedia,
    required VoidCallback onClear,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1.0,
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      subtitle,
                      style: GoogleFonts.inter(
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              if (selectedFiles.isNotEmpty)
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 20.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.clear_rounded,
                    color: FlutterFlowTheme.of(context).error,
                    size: 24.0,
                  ),
                  onPressed: onClear,
                ),
            ],
          ),
          const SizedBox(height: 16.0),
          if (selectedFiles.isEmpty)
            InkWell(
              onTap: onSelectMedia,
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                width: double.infinity,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 1.0,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 28.0,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Ambil Foto',
                      style: GoogleFonts.inter(
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (selectedFiles.isNotEmpty)
            Container(
              height: 100.0,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: selectedFiles.length,
                separatorBuilder: (context, _) => const SizedBox(width: 8.0),
                itemBuilder: (context, index) {
                  final file = selectedFiles[index];
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.memory(
                      file.bytes!,
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFF1A3C34),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Upload Laporan',
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Instruksi Info
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                        ),
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Icon(
                                Icons.info_outline_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 20.0,
                              ),
                            ),
                            const SizedBox(width: 12.0),
                            Expanded(
                              child: Text(
                                'Gunakan kamera atau galeri untuk memilih beberapa foto secara bersamaan. Foto akan diubah menjadi PDF secara otomatis.',
                                style: GoogleFonts.inter(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 13.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24.0),

                      // Formulir 101 Section
                      _buildSection(
                        title: 'Formulir 101',
                        subtitle:
                            'Upload foto Formulir 101 (bisa lebih dari 1)',
                        selectedFiles: _model.uploadedLocalFiles101,
                        onClear: () {
                          setState(() {
                            _model.uploadedLocalFiles101.clear();
                          });
                        },
                        onSelectMedia: () async {
                          final selectedMedia = await selectMedia(
                            imageQuality: 80,
                            multiImage: true,
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
                            setState(() {
                              _model.uploadedLocalFiles101 = selectedMedia
                                  .map((m) => FFUploadedFile(
                                        name: m.storagePath.split('/').last,
                                        bytes: m.bytes,
                                        height: m.dimensions?.height,
                                        width: m.dimensions?.width,
                                        blurHash: m.blurHash,
                                      ))
                                  .toList();
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 16.0),

                      // Formulir 102 Section
                      _buildSection(
                        title: 'Formulir 102',
                        subtitle:
                            'Upload foto Formulir 102 (bisa lebih dari 1)',
                        selectedFiles: _model.uploadedLocalFiles102,
                        onClear: () {
                          setState(() {
                            _model.uploadedLocalFiles102.clear();
                          });
                        },
                        onSelectMedia: () async {
                          final selectedMedia = await selectMedia(
                            imageQuality: 80,
                            multiImage: true,
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
                            setState(() {
                              _model.uploadedLocalFiles102 = selectedMedia
                                  .map((m) => FFUploadedFile(
                                        name: m.storagePath.split('/').last,
                                        bytes: m.bytes,
                                        height: m.dimensions?.height,
                                        width: m.dimensions?.width,
                                        blurHash: m.blurHash,
                                      ))
                                  .toList();
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 16.0),

                      // LPZ Section
                      _buildSection(
                        title: 'Laporan Pengelolaan ZIS (LPZ)',
                        subtitle: 'Upload foto LPZ (bisa lebih dari 1)',
                        selectedFiles: _model.uploadedLocalFilesLpz,
                        onClear: () {
                          setState(() {
                            _model.uploadedLocalFilesLpz.clear();
                          });
                        },
                        onSelectMedia: () async {
                          final selectedMedia = await selectMedia(
                            imageQuality: 80,
                            multiImage: true,
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
                            setState(() {
                              _model.uploadedLocalFilesLpz = selectedMedia
                                  .map((m) => FFUploadedFile(
                                        name: m.storagePath.split('/').last,
                                        bytes: m.bytes,
                                        height: m.dimensions?.height,
                                        width: m.dimensions?.width,
                                        blurHash: m.blurHash,
                                      ))
                                  .toList();
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 32.0),

                      // Submit Button
                      FFButtonWidget(
                        onPressed: _isUploadingAll ? null : _handleUploads,
                        text:
                            _isUploadingAll ? 'Mengupload...' : 'Kirim Laporan',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF1A3C34),
                          textStyle: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                          elevation: 0.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                          disabledColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                      const SizedBox(height: 32.0),
                    ],
                  ),
                ),
              ),

              // Loading Overlay
              if (_isUploadingAll)
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
