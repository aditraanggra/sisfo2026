import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/auth/custom_auth/auth_util.dart';
import '/backend/cloudinary/cloudinary_upload_helper.dart';
import '/backend/cloudinary/cloudinary_service.dart';

import '/backend/api_requests/api_calls.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';

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
  bool _hasSubmittedOnce = false;
  bool _isLoadingCheck = true;
  bool _hasUploadedLpz = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadLaporanModel());
    _checkLpzStatus();
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  Future<void> _checkLpzStatus() async {
    try {
      final currentYear = DateTime.now().year;
      final response = await TransactionEndPointGroup.getLpzCall.call(
        token: currentAuthenticationToken,
        year: currentYear,
      );

      if (response.succeeded) {
        final dataList =
            TransactionEndPointGroup.getLpzCall.dataListLpz(response.jsonBody);
        if (dataList != null && dataList.isNotEmpty) {
          if (mounted) {
            setState(() {
              _hasUploadedLpz = true;
              _isLoadingCheck = false;
            });
          }
          return;
        }
      }
    } catch (e) {
      print('Error checking LPZ status: $e');
    }

    if (mounted) {
      setState(() {
        _isLoadingCheck = false;
      });
    }
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  /// Check if a file is a PDF based on its name
  bool _isPdfFile(FFUploadedFile file) {
    final name = (file.name ?? '').toLowerCase();
    return name.endsWith('.pdf');
  }

  /// Upload a section's files to Cloudinary.
  /// If the section contains a single PDF, upload it directly.
  /// Otherwise, convert all images to a multi-page PDF and upload.
  Future<String?> _uploadSection({
    required List<FFUploadedFile> files,
    required String noRegister,
    required String namaUpz,
    required String fileName,
    required String folder,
    required String prefix,
  }) async {
    if (files.isEmpty) return null;

    // Check if the first (or only) file is a PDF
    final firstFile = files.first;
    if (_isPdfFile(firstFile) &&
        firstFile.bytes != null &&
        firstFile.bytes!.isNotEmpty) {
      // Upload the PDF directly without conversion
      final cloudinary = CloudinaryService();
      final String tgl = DateTime.now().year.toString() +
          DateTime.now().month.toString().padLeft(2, '0') +
          DateTime.now().day.toString().padLeft(2, '0');
      final String reg =
          noRegister.replaceAll(RegExp(r'[^a-zA-Z0-9_\-]'), '_').toLowerCase();
      final String nama =
          namaUpz.replaceAll(RegExp(r'[^a-zA-Z0-9_\-]'), '_').toLowerCase();
      final String uniqueSuffix =
          DateTime.now().millisecondsSinceEpoch.toString();
      final String publicId = '${prefix}_${tgl}_${reg}_${nama}_$uniqueSuffix';

      final response = await cloudinary.uploadPdfBytes(
        firstFile.bytes!,
        folder: folder,
        publicId: publicId,
        fileName: fileName,
      );

      if (response.success && response.secureUrl != null) {
        return response.secureUrl;
      } else {
        print('Cloudinary direct PDF upload failed: ${response.error}');
        return null;
      }
    }

    // Otherwise, convert images to PDF and upload
    return await convertImagesToPdfAndUpload(
      selectedFiles: files
          .map((f) => SelectedFile(
              bytes: f.bytes ?? Uint8List(0),
              originalFilename: f.name ?? 'image'))
          .toList(),
      noRegister: noRegister,
      namaUpz: namaUpz,
      fileName: fileName,
      folder: folder,
      prefix: prefix,
    );
  }

  /// Show bottom sheet to pick between image (camera/gallery) or PDF file
  Future<List<FFUploadedFile>?> _showFilePickerOptions() async {
    final choice = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 12.0),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    'Pilih Sumber File',
                    style: GoogleFonts.inter(
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.camera_alt,
                      color: FlutterFlowTheme.of(context).primary),
                  title: Text(
                    'Ambil Foto (Kamera/Galeri)',
                    style: GoogleFonts.inter(
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    'Pilih beberapa foto, akan dikonversi ke PDF',
                    style: GoogleFonts.inter(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 12.0,
                    ),
                  ),
                  onTap: () => Navigator.pop(context, 'image'),
                ),
                ListTile(
                  leading:
                      Icon(Icons.picture_as_pdf, color: Colors.red.shade600),
                  title: Text(
                    'Pilih File PDF',
                    style: GoogleFonts.inter(
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    'Upload dokumen PDF yang sudah jadi',
                    style: GoogleFonts.inter(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 12.0,
                    ),
                  ),
                  onTap: () => Navigator.pop(context, 'pdf'),
                ),
                const SizedBox(height: 8.0),
              ],
            ),
          ),
        );
      },
    );

    if (choice == null) return null;

    if (choice == 'pdf') {
      // Use file_picker to select a PDF
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        withData: true,
        allowMultiple: false,
      );
      if (result == null || result.files.isEmpty) return null;
      final file = result.files.first;
      if (file.bytes == null) return null;
      return [
        FFUploadedFile(
          name: file.name,
          bytes: file.bytes,
          originalFilename: file.name,
        ),
      ];
    } else {
      // Use image picker for multi-image selection
      final selectedMedia = await selectMedia(
        imageQuality: 80,
        multiImage: true,
      );
      if (selectedMedia != null &&
          selectedMedia
              .every((m) => validateFileFormat(m.storagePath, context))) {
        return selectedMedia
            .map((m) => FFUploadedFile(
                  name: m.storagePath.split('/').last,
                  bytes: m.bytes,
                  height: m.dimensions?.height,
                  width: m.dimensions?.width,
                  blurHash: m.blurHash,
                ))
            .toList();
      }
      return null;
    }
  }

  Future<void> _handleUploads() async {
    final missingDocs = <String>[];
    if (_model.uploadedLocalFiles101.isEmpty) missingDocs.add('Formulir 101');
    if (_model.uploadedLocalFiles102.isEmpty) missingDocs.add('Formulir 102');
    if (_model.uploadedLocalFilesLpz.isEmpty) missingDocs.add('LPZ');

    if (missingDocs.isNotEmpty) {
      setState(() {
        _hasSubmittedOnce = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Harap lengkapi dokumen untuk: ${missingDocs.join(', ')}'),
          backgroundColor: FlutterFlowTheme.of(context).error,
          behavior: SnackBarBehavior.floating,
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
      final namaUpz = FFAppState().profileUPZ.unitName.isNotEmpty
          ? FFAppState().profileUPZ.unitName
          : 'unknown';

      // Build dynamic folder path: sisfo/form/{year}/{district}/{village}/{noReg}_{unitName}
      final currentYear = DateTime.now().year.toString();
      final district = FFAppState().profileUPZ.districtName.isNotEmpty
          ? FFAppState()
              .profileUPZ
              .districtName
              .replaceAll(RegExp(r'[^a-zA-Z0-9_\-]'), '_')
              .replaceAll(RegExp(r'_+'), '_')
              .toLowerCase()
          : 'unknown_district';
      final village = FFAppState().profileUPZ.villageName.isNotEmpty
          ? FFAppState()
              .profileUPZ
              .villageName
              .replaceAll(RegExp(r'[^a-zA-Z0-9_\-]'), '_')
              .replaceAll(RegExp(r'_+'), '_')
              .toLowerCase()
          : 'unknown_village';
      final unitFolder = '${noRegister}_${namaUpz}'
          .replaceAll(RegExp(r'[^a-zA-Z0-9_\-]'), '_')
          .replaceAll(RegExp(r'_+'), '_')
          .toLowerCase();
      final dynamicFolder =
          'sisfo/form/$currentYear/$district/$village/$unitFolder';

      // 1. Upload Formulir 101
      String? form101Url;
      if (_model.uploadedLocalFiles101.isNotEmpty) {
        form101Url = await _uploadSection(
          files: _model.uploadedLocalFiles101,
          noRegister: noRegister,
          namaUpz: namaUpz,
          fileName: '${noRegister}_form101.pdf',
          folder: dynamicFolder,
          prefix: 'form101',
        );
      }

      // 2. Upload Formulir 102
      String? form102Url;
      if (_model.uploadedLocalFiles102.isNotEmpty) {
        form102Url = await _uploadSection(
          files: _model.uploadedLocalFiles102,
          noRegister: noRegister,
          namaUpz: namaUpz,
          fileName: '${noRegister}_form102.pdf',
          folder: dynamicFolder,
          prefix: 'form102',
        );
      }

      // 3. Upload LPZ
      String? lpzUrl;
      if (_model.uploadedLocalFilesLpz.isNotEmpty) {
        lpzUrl = await _uploadSection(
          files: _model.uploadedLocalFilesLpz,
          noRegister: noRegister,
          namaUpz: namaUpz,
          fileName: '${noRegister}_lpz.pdf',
          folder: dynamicFolder,
          prefix: 'lpz',
        );
      }

      // Check if all uploads succeeded
      if (form101Url == null || form102Url == null || lpzUrl == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Gagal mengupload file ke Cloudinary. Pastikan koneksi internet stabil dan coba lagi.'),
              backgroundColor: FlutterFlowTheme.of(context).error,
            ),
          );
        }
        return;
      }

      // Debug: verify Cloudinary URLs before sending to API
      print('LPZ Upload - form101Url: $form101Url');
      print('LPZ Upload - form102Url: $form102Url');
      print('LPZ Upload - lpzUrl: $lpzUrl');

      final now = DateTime.now();
      final trxDate = DateFormat('yyyy-MM-dd').format(now);
      final lpzYear = now.year;

      // 4. Send Cloudinary URLs to the backend
      final response = await TransactionEndPointGroup.uploadLpzCall.call(
        token: currentAuthenticationToken,
        unitId: FFAppState().profileUPZ.id,
        trxDate: trxDate,
        lpzYear: lpzYear,
        form101Url: form101Url,
        form102Url: form102Url,
        lpzUrl: lpzUrl,
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
    final hasError = _hasSubmittedOnce && selectedFiles.isEmpty;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: hasError
            ? FlutterFlowTheme.of(context).error.withOpacity(0.05)
            : FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: hasError
              ? FlutterFlowTheme.of(context).error
              : FlutterFlowTheme.of(context).alternate,
          width: hasError ? 1.5 : 1.0,
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
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: title,
                            style: GoogleFonts.inter(
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: ' *',
                            style: GoogleFonts.inter(
                              color: FlutterFlowTheme.of(context).error,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
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
                    color: hasError
                        ? FlutterFlowTheme.of(context).error.withOpacity(0.5)
                        : FlutterFlowTheme.of(context).alternate,
                    width: hasError ? 1.5 : 1.0,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.upload_file,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 28.0,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Pilih File',
                      style: GoogleFonts.inter(
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      'Foto atau PDF',
                      style: GoogleFonts.inter(
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 11.0,
                        fontWeight: FontWeight.w400,
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
                  final isPdf = _isPdfFile(file);
                  if (isPdf) {
                    // Show PDF icon placeholder
                    return Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: Colors.red.shade200,
                          width: 1.0,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.picture_as_pdf,
                            color: Colors.red.shade600,
                            size: 32.0,
                          ),
                          const SizedBox(height: 4.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Text(
                              file.name ?? 'PDF',
                              style: GoogleFonts.inter(
                                color: Colors.red.shade700,
                                fontSize: 9.0,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
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
              if (_isLoadingCheck)
                Center(
                  child: CircularProgressIndicator(
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                )
              else if (_hasUploadedLpz)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle_rounded,
                          color: FlutterFlowTheme.of(context).success,
                          size: 80.0,
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          'Terima kasih sudah mengunggah laporan',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
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
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 20.0,
                                ),
                              ),
                              const SizedBox(width: 12.0),
                              Expanded(
                                child: Text(
                                  'Upload foto (akan dikonversi otomatis ke PDF) atau langsung upload file PDF untuk setiap formulir.',
                                  style: GoogleFonts.inter(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
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
                          subtitle: 'Upload foto atau PDF Formulir 101',
                          selectedFiles: _model.uploadedLocalFiles101,
                          onClear: () {
                            setState(() {
                              _model.uploadedLocalFiles101.clear();
                            });
                          },
                          onSelectMedia: () async {
                            final pickedFiles = await _showFilePickerOptions();
                            if (pickedFiles != null && pickedFiles.isNotEmpty) {
                              setState(() {
                                _model.uploadedLocalFiles101 = pickedFiles;
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 16.0),

                        // Formulir 102 Section
                        _buildSection(
                          title: 'Formulir 102',
                          subtitle: 'Upload foto atau PDF Formulir 102',
                          selectedFiles: _model.uploadedLocalFiles102,
                          onClear: () {
                            setState(() {
                              _model.uploadedLocalFiles102.clear();
                            });
                          },
                          onSelectMedia: () async {
                            final pickedFiles = await _showFilePickerOptions();
                            if (pickedFiles != null && pickedFiles.isNotEmpty) {
                              setState(() {
                                _model.uploadedLocalFiles102 = pickedFiles;
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 16.0),

                        // LPZ Section
                        _buildSection(
                          title: 'Laporan Pengelolaan ZIS (LPZ)',
                          subtitle: 'Upload foto atau PDF LPZ',
                          selectedFiles: _model.uploadedLocalFilesLpz,
                          onClear: () {
                            setState(() {
                              _model.uploadedLocalFilesLpz.clear();
                            });
                          },
                          onSelectMedia: () async {
                            final pickedFiles = await _showFilePickerOptions();
                            if (pickedFiles != null && pickedFiles.isNotEmpty) {
                              setState(() {
                                _model.uploadedLocalFilesLpz = pickedFiles;
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 32.0),

                        // Validation Info
                        if (_hasSubmittedOnce &&
                            (_model.uploadedLocalFiles101.isEmpty ||
                                _model.uploadedLocalFiles102.isEmpty ||
                                _model.uploadedLocalFilesLpz.isEmpty))
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 20.0,
                                ),
                                const SizedBox(width: 8.0),
                                Expanded(
                                  child: Text(
                                    'Harap lengkapi semua dokumen yang wajib (*) sebelum mengirim.',
                                    style: GoogleFonts.inter(
                                      color: FlutterFlowTheme.of(context).error,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        // Submit Button
                        FFButtonWidget(
                          onPressed: _isUploadingAll ? null : _handleUploads,
                          text: _isUploadingAll
                              ? 'Mengupload...'
                              : 'Kirim Laporan',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 50.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: (_model.uploadedLocalFiles101.isNotEmpty &&
                                    _model.uploadedLocalFiles102.isNotEmpty &&
                                    _model.uploadedLocalFilesLpz.isNotEmpty)
                                ? Color(0xFF1A3C34)
                                : Color(0xFF1A3C34).withOpacity(0.5),
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
