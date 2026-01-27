import '/backend/schema/structs/index.dart';
import '/component/date_picker/date_picker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/form_validators.dart';
import '/index.dart';
import 'zakat_fitrah_widget.dart' show ZakatFitrahWidget;
import 'package:flutter/material.dart';

class ZakatFitrahModel extends FlutterFlowModel<ZakatFitrahWidget> {
  ///  Local state fields for this page.

  double totalBeras = 0.0;

  int totalUang = 0;

  int? harga1 = 38000;

  int? harga2 = 46000;

  /// Payment types from API
  List<ZfPaymentTypeStruct> paymentTypes = [];
  List<ZfPaymentTypeStruct> berasTypes = [];
  List<ZfPaymentTypeStruct> uangTypes = [];
  bool isLoadingPaymentTypes = true;
  ZfPaymentTypeStruct? selectedBerasType;
  ZfPaymentTypeStruct? selectedUangType;

  /// Real-time validation error messages
  String? namaMuzakkiError;
  String? jmMuzakkiError;
  String? nominalInfakError;

  /// Form submission state
  bool isSubmitting = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for DatePicker component.
  late DatePickerModel datePickerModel;
  // State field(s) for jenisZF widget.
  FormFieldController<String>? jenisZFValueController;
  // State field(s) for hargaPerKulak widget.
  FormFieldController<String>? hargaPerKulakValueController;

  /// Selected jenis ZF value getter
  String? get jenisZFValue => jenisZFValueController?.value;

  /// Selected harga per kulak value getter
  String? get hargaPerKulakValue => hargaPerKulakValueController?.value;
  // State field(s) for namaMuzakki widget.
  FocusNode? namaMuzakkiFocusNode;
  TextEditingController? namaMuzakkiTextController;
  String? Function(BuildContext, String?)? namaMuzakkiTextControllerValidator;
  String? _namaMuzakkiTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nama Muzakki Harus Diisi';
    }

    return null;
  }

  // State field(s) for jmMuzakki widget.
  FocusNode? jmMuzakkiFocusNode;
  TextEditingController? jmMuzakkiTextController;
  String? Function(BuildContext, String?)? jmMuzakkiTextControllerValidator;
  String? _jmMuzakkiTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Jumlah Muzakki Harus Diisi';
    }

    return null;
  }

  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for nominalInfak widget.
  FocusNode? nominalInfakFocusNode;
  TextEditingController? nominalInfakTextController;
  String? Function(BuildContext, String?)? nominalInfakTextControllerValidator;
  // State field(s) for keterangan widget.
  FocusNode? keteranganFocusNode;
  TextEditingController? keteranganTextController;
  String? Function(BuildContext, String?)? keteranganTextControllerValidator;

  @override
  void initState(BuildContext context) {
    datePickerModel = createModel(context, () => DatePickerModel());
    jenisZFValueController = FormFieldController<String>('Beras');
    hargaPerKulakValueController = FormFieldController<String>('Rp. 38.000');
    namaMuzakkiTextControllerValidator = _namaMuzakkiTextControllerValidator;
    jmMuzakkiTextControllerValidator = _jmMuzakkiTextControllerValidator;
    nominalInfakTextControllerValidator = _nominalInfakTextControllerValidator;
  }

  /// Validates Nama Muzakki field in real-time
  void validateNamaMuzakki(String? value) {
    namaMuzakkiError = FormValidators.validateRequired(value, 'Nama Muzakki');
  }

  /// Validates Jumlah Muzakki field in real-time
  void validateJmMuzakki(String? value) {
    jmMuzakkiError = FormValidators.validateNumeric(value, 'Jumlah Muzakki');
  }

  /// Validates Nominal Infak field in real-time
  void validateNominalInfak(String? value) {
    nominalInfakError = FormValidators.validateCurrency(
      value,
      fieldName: 'Nominal Infak',
      minValue: 1000,
    );
  }

  /// Private validator for Nominal Infak
  String? _nominalInfakTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nominal Infak wajib diisi';
    }
    // Parse the formatted currency value
    final cleanValue = val.replaceAll('.', '').trim();
    final numValue = int.tryParse(cleanValue);
    if (numValue == null) {
      return 'Nominal Infak harus berupa angka';
    }
    if (numValue < 1000) {
      return 'Nominal Infak minimal Rp 1.000';
    }
    return null;
  }

  @override
  void dispose() {
    datePickerModel.dispose();
    namaMuzakkiFocusNode?.dispose();
    namaMuzakkiTextController?.dispose();

    jmMuzakkiFocusNode?.dispose();
    jmMuzakkiTextController?.dispose();

    nominalInfakFocusNode?.dispose();
    nominalInfakTextController?.dispose();

    keteranganFocusNode?.dispose();
    keteranganTextController?.dispose();

    jenisZFValueController?.dispose();
    hargaPerKulakValueController?.dispose();
  }
}
