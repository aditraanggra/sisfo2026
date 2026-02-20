import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/component/modal_success/modal_success_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'lengkapi_profile_model.dart';
export 'lengkapi_profile_model.dart';

class LengkapiProfileWidget extends StatefulWidget {
  const LengkapiProfileWidget({super.key});

  static String routeName = 'LengkapiProfile';
  static String routePath = '/lengkapiProfile';

  @override
  State<LengkapiProfileWidget> createState() => _LengkapiProfileWidgetState();
}

class _LengkapiProfileWidgetState extends State<LengkapiProfileWidget>
    with TickerProviderStateMixin {
  late LengkapiProfileModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LengkapiProfileModel());

    _model.namaUpzTextController ??= TextEditingController();
    _model.namaUpzFocusNode ??= FocusNode();

    _model.alamatTextController ??= TextEditingController();
    _model.alamatFocusNode ??= FocusNode();

    _model.noSKTextController ??= TextEditingController();
    _model.noSKFocusNode ??= FocusNode();

    _model.ketuaTextController ??= TextEditingController();
    _model.ketuaFocusNode ??= FocusNode();

    _model.sekretarisTextController ??= TextEditingController();
    _model.sekretarisFocusNode ??= FocusNode();

    _model.bendaharaTextController ??= TextEditingController();
    _model.bendaharaFocusNode ??= FocusNode();

    _model.waOperatorTextController ??= TextEditingController();
    _model.waOperatorFocusNode ??= FocusNode();

    _model.dropKecamatanValueController ??= FormFieldController<int>(null);
    _model.dropDesaValueController ??= FormFieldController<int>(null);

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: MiscEndPointGroup.getKecamatanCall.call(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SpinKitFadingFour(
                color: Color(0xFF259148),
                size: 40.0,
              ),
            ),
          );
        }
        final lengkapiProfileGetKecamatanResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            appBar: _buildAppBar(),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 24.0),
                          _buildSectionHeader(
                            title: 'DATA UPZ',
                            showRequired: true,
                          ),
                          SizedBox(height: 16.0),
                          _buildKategoriUpzRadio(),
                          SizedBox(height: 20.0),
                          _buildInputField(
                            label: 'Nama UPZ',
                            controller: _model.namaUpzTextController,
                            focusNode: _model.namaUpzFocusNode,
                            hint: 'Masukkan nama UPZ',
                            icon: Icons.business_outlined,
                            textCapitalization: TextCapitalization.characters,
                            validator: _model.namaUpzTextControllerValidator,
                          ),
                          SizedBox(height: 20.0),
                          _buildInputField(
                            label: 'Alamat UPZ',
                            controller: _model.alamatTextController,
                            focusNode: _model.alamatFocusNode,
                            hint: 'Masukkan alamat lengkap',
                            icon: Icons.location_on_outlined,
                            maxLines: 2,
                            validator: _model.alamatTextControllerValidator,
                          ),
                          SizedBox(height: 20.0),
                          _buildDropdownField(
                            label: 'Kecamatan',
                            hint: 'Pilih Kecamatan',
                            controller: _model.dropKecamatanValueController,
                            options: List<int>.from(
                              MiscEndPointGroup.getKecamatanCall
                                      .listIdKecamatan(
                                    lengkapiProfileGetKecamatanResponse
                                        .jsonBody,
                                  ) ??
                                  [],
                            ),
                            optionLabels: MiscEndPointGroup.getKecamatanCall
                                    .listNameKecamatan(
                                  lengkapiProfileGetKecamatanResponse.jsonBody,
                                ) ??
                                [],
                            value: _model.dropKecamatanValue,
                            onChanged: (val) async {
                              safeSetState(() {
                                _model.dropKecamatanValue = val;
                                _model.dropDesaValue = null;
                                _model.dropDesaValueController =
                                    FormFieldController<int>(null);
                              });
                              if (val != null) {
                                await _loadDesaData(val);
                              }
                            },
                          ),
                          SizedBox(height: 20.0),
                          _buildDesaDropdown(),
                          SizedBox(height: 32.0),
                          _buildSectionHeader(title: 'LEGALITAS UPZ'),
                          SizedBox(height: 16.0),
                          _buildInputField(
                            label: 'Nomor SK UPZ',
                            controller: _model.noSKTextController,
                            focusNode: _model.noSKFocusNode,
                            hint: 'Masukkan nomor SK',
                            icon: Icons.description_outlined,
                            validator: _model.noSKTextControllerValidator,
                          ),
                          SizedBox(height: 32.0),
                          _buildSectionHeader(title: 'PENGURUS UPZ'),
                          SizedBox(height: 16.0),
                          _buildInputField(
                            label: 'Ketua',
                            controller: _model.ketuaTextController,
                            focusNode: _model.ketuaFocusNode,
                            hint: 'Nama ketua UPZ',
                            icon: Icons.person_outline_rounded,
                            validator: _model.ketuaTextControllerValidator,
                          ),
                          SizedBox(height: 20.0),
                          _buildInputField(
                            label: 'Sekretaris',
                            controller: _model.sekretarisTextController,
                            focusNode: _model.sekretarisFocusNode,
                            hint: 'Nama sekretaris UPZ',
                            icon: Icons.person_outline_rounded,
                            validator: _model.sekretarisTextControllerValidator,
                          ),
                          SizedBox(height: 20.0),
                          _buildInputField(
                            label: 'Bendahara',
                            controller: _model.bendaharaTextController,
                            focusNode: _model.bendaharaFocusNode,
                            hint: 'Nama bendahara UPZ',
                            icon: Icons.person_outline_rounded,
                            validator: _model.bendaharaTextControllerValidator,
                          ),
                          SizedBox(height: 32.0),
                          _buildSectionHeader(title: 'KONTAK OPERATOR'),
                          SizedBox(height: 16.0),
                          _buildInputField(
                            label: 'Nomor WhatsApp',
                            controller: _model.waOperatorTextController,
                            focusNode: _model.waOperatorFocusNode,
                            hint: 'Contoh: 0812xxxxxx',
                            icon: Icons.phone_outlined,
                            keyboardType: TextInputType.phone,
                            validator: _model.waOperatorTextControllerValidator,
                          ),
                          SizedBox(height: 40.0),
                          _buildSubmitButton(),
                          SizedBox(height: 40.0),
                        ],
                      ),
                    ),
                  ),
                  if (_model.isLoading) _buildLoadingOverlay(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xFF1A3C34),
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.white, size: 20),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        'Lengkapi Profil UPZ',
        style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: false,
    );
  }

  Widget _buildSectionHeader(
      {required String title, bool showRequired = false}) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            color: Color(0xFF1A3C34),
            fontSize: 13.0,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        if (showRequired) ...[
          SizedBox(width: 4),
          Text(
            '(* Wajib Diisi)',
            style: GoogleFonts.inter(
              color: Color(0xFFEF4444),
              fontSize: 10.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildKategoriUpzRadio() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kategori UPZ',
            style: GoogleFonts.inter(
              color: Color(0xFF1A1A1A),
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12),
          FlutterFlowRadioButton(
            options: ['DKM', 'Desa', 'Kecamatan'].toList(),
            onChanged: (val) => safeSetState(() {}),
            controller: _model.kategoriUpzValueController ??=
                FormFieldController<String>(null),
            optionHeight: 32.0,
            textStyle: GoogleFonts.inter(
              color: Color(0xFF1A1A1A),
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
            selectedTextStyle: GoogleFonts.inter(
              color: Color(0xFF1A3C34),
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
            buttonPosition: RadioButtonPosition.left,
            direction: Axis.horizontal,
            radioButtonColor: Color(0xFF259148),
            inactiveRadioButtonColor: Color(0xFF9CA3AF),
            toggleable: false,
            horizontalAlignment: WrapAlignment.start,
            verticalAlignment: WrapCrossAlignment.center,
          ),
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
    TextCapitalization textCapitalization = TextCapitalization.none,
    int maxLines = 1,
    String? Function(BuildContext, String?)? validator,
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
            obscureText: false,
            keyboardType: keyboardType,
            textCapitalization: textCapitalization,
            maxLines: maxLines,
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
            validator:
                validator != null ? (val) => validator(context, val) : null,
            inputFormatters: [
              if (textCapitalization == TextCapitalization.characters &&
                  !isAndroid &&
                  !isiOS)
                TextInputFormatter.withFunction((oldValue, newValue) {
                  return TextEditingValue(
                    selection: newValue.selection,
                    text: newValue.text
                        .toCapitalization(TextCapitalization.characters),
                  );
                }),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField<T>({
    Key? key,
    required String label,
    required String hint,
    required FormFieldController<T>? controller,
    required List<T> options,
    required List<String> optionLabels,
    required T? value,
    required void Function(T?) onChanged,
  }) {
    final effectiveController = controller ?? FormFieldController<T>(null);
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
          child: FlutterFlowDropDown<T>(
            key: key,
            controller: effectiveController,
            options: options,
            optionLabels: optionLabels,
            onChanged: (val) {
              effectiveController.value = val;
              onChanged(val);
            },
            width: double.infinity,
            height: 52.0,
            textStyle: GoogleFonts.inter(
              color: Color(0xFF1A1A1A),
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
            searchHintTextStyle: GoogleFonts.inter(
              color: Color(0xFF9CA3AF),
              fontSize: 14.0,
            ),
            searchTextStyle: GoogleFonts.inter(
              color: Color(0xFF1A1A1A),
              fontSize: 14.0,
            ),
            hintText: hint,
            searchHintText: 'Cari $label...',
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Color(0xFF9CA3AF),
              size: 24.0,
            ),
            fillColor: Color(0xFFF9FAFB),
            elevation: 2.0,
            borderColor: Colors.transparent,
            borderWidth: 0,
            borderRadius: 12.0,
            margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
            hidesUnderline: true,
            isSearchable: true,
            isMultiSelect: false,
          ),
        ),
      ],
    );
  }

  Widget _buildDesaDropdown() {
    if (_model.dropKecamatanValue == null) {
      return _buildDisabledDropdown(
        label: 'Desa',
        hint: 'Pilih Kecamatan terlebih dahulu',
      );
    }

    _model.dropDesaValueController ??= FormFieldController<int>(null);

    if (_model.isDesaLoading) {
      return _buildDropdownWithLoading(label: 'Desa');
    }

    if (_model.desaIds.isEmpty) {
      return _buildDisabledDropdown(
        label: 'Desa',
        hint: 'Tidak ada data desa',
      );
    }

    return _buildDropdownField<int>(
      label: 'Desa',
      hint: 'Pilih Desa',
      controller: _model.dropDesaValueController,
      options: _model.desaIds,
      optionLabels: _model.desaNames,
      value: _model.dropDesaValue,
      onChanged: (val) => safeSetState(() => _model.dropDesaValue = val),
    );
  }

  Future<void> _loadDesaData(int districtId) async {
    safeSetState(() {
      _model.isDesaLoading = true;
      _model.desaIds = [];
      _model.desaNames = [];
    });

    try {
      final response = await MiscEndPointGroup.getDesaCall.call(
        districtId: districtId.toString(),
      );

      if (response.succeeded) {
        final ids = MiscEndPointGroup.getDesaCall.listDesaId(response.jsonBody);
        final names =
            MiscEndPointGroup.getDesaCall.listDesaName(response.jsonBody);

        safeSetState(() {
          _model.desaIds = ids != null ? List<int>.from(ids) : [];
          _model.desaNames = names ?? [];
          _model.isDesaLoading = false;
        });
      } else {
        safeSetState(() {
          _model.isDesaLoading = false;
        });
      }
    } catch (e) {
      safeSetState(() {
        _model.isDesaLoading = false;
      });
    }
  }

  Widget _buildDisabledDropdown({
    required String label,
    required String hint,
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
            color: Color(0xFFF3F4F6),
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: Color(0xFFE5E7EB),
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Row(
              children: [
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Color(0xFF9CA3AF),
                  size: 24.0,
                ),
                SizedBox(width: 8.0),
                Text(
                  hint,
                  style: GoogleFonts.inter(
                    color: Color(0xFF9CA3AF),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownWithLoading({required String label}) {
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Row(
              children: [
                SizedBox(
                  width: 16.0,
                  height: 16.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    color: Color(0xFF259148),
                  ),
                ),
                SizedBox(width: 12.0),
                Text(
                  'Memuat data...',
                  style: GoogleFonts.inter(
                    color: Color(0xFF9CA3AF),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 52.0,
      child: ElevatedButton(
        onPressed: _model.isLoading ? null : _handleSubmit,
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
          'Simpan Data',
          style: GoogleFonts.inter(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingOverlay() {
    return Container(
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
                'Menyimpan data...',
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
    );
  }

  Future<void> _handleSubmit() async {
    if (_model.formKey.currentState == null ||
        !_model.formKey.currentState!.validate()) {
      return;
    }

    if (_model.dropKecamatanValue == null) {
      _showErrorSnackBar('Kecamatan belum dipilih');
      return;
    }

    if (_model.dropDesaValue == null) {
      _showErrorSnackBar('Desa belum dipilih');
      return;
    }

    safeSetState(() => _model.isLoading = true);

    try {
      _model.saveResponse = await AuthEndPointGroup.addProfileUPZCall.call(
        token: currentAuthenticationToken,
        userId: currentUserData?.id,
        noSk: _model.noSKTextController.text,
        unitName: _model.namaUpzTextController.text,
        noRegister: '3203000${currentUserData?.id.toString()}',
        address: _model.alamatTextController.text,
        unitLeader: _model.ketuaTextController.text,
        unitAssistant: _model.sekretarisTextController.text,
        unitFinance: _model.bendaharaTextController.text,
        operatorPhone: _model.waOperatorTextController.text,
        profileCompletion: 100,
        categoryId: () {
          if (_model.kategoriUpzValue == 'DKM') {
            return 4;
          } else if (_model.kategoriUpzValue == 'Desa') {
            return 3;
          } else {
            return 2;
          }
        }(),
        villageId: _model.dropDesaValue,
        districtId: _model.dropKecamatanValue,
        ricePrice: 10000,
        isVerified: true,
      );

      FFAppState().update(() {
        FFAppState().profileUPZ = UpzStruct(
          id: currentUserData?.id,
          userId: currentUserData?.id,
          noSk: _model.noSKTextController.text,
          unitName: _model.namaUpzTextController.text,
          noRegister: '3203000${currentUserData?.id.toString()}',
          address: _model.alamatTextController.text,
          unitLeader: _model.ketuaTextController.text,
          unitAssistant: _model.sekretarisTextController.text,
          unitFinance: _model.bendaharaTextController.text,
          operatorPhone: _model.waOperatorTextController.text,
          villageId: _model.dropDesaValue,
          districtId: _model.dropKecamatanValue,
        );
      });

      await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        enableDrag: false,
        context: context,
        builder: (context) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: ModalSuccessWidget(),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));

      if (mounted) {
        context.goNamed(
          HomeWidget.routeName,
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.leftToRight,
            ),
          },
        );
      }
    } finally {
      safeSetState(() => _model.isLoading = false);
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.inter(color: Colors.white),
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
