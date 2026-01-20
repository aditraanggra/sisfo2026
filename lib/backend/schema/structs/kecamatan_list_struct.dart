// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KecamatanListStruct extends BaseStruct {
  KecamatanListStruct({
    bool? success,
    String? message,
    List<DataKecamatanStruct>? dataKecamatan,
  })  : _success = success,
        _message = message,
        _dataKecamatan = dataKecamatan;

  // "success" field.
  bool? _success;
  bool get success => _success ?? false;
  set success(bool? val) => _success = val;

  bool hasSuccess() => _success != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "dataKecamatan" field.
  List<DataKecamatanStruct>? _dataKecamatan;
  List<DataKecamatanStruct> get dataKecamatan => _dataKecamatan ?? const [];
  set dataKecamatan(List<DataKecamatanStruct>? val) => _dataKecamatan = val;

  void updateDataKecamatan(Function(List<DataKecamatanStruct>) updateFn) {
    updateFn(_dataKecamatan ??= []);
  }

  bool hasDataKecamatan() => _dataKecamatan != null;

  static KecamatanListStruct fromMap(Map<String, dynamic> data) =>
      KecamatanListStruct(
        success: data['success'] as bool?,
        message: data['message'] as String?,
        dataKecamatan: getStructList(
          data['dataKecamatan'],
          DataKecamatanStruct.fromMap,
        ),
      );

  static KecamatanListStruct? maybeFromMap(dynamic data) => data is Map
      ? KecamatanListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'success': _success,
        'message': _message,
        'dataKecamatan': _dataKecamatan?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'success': serializeParam(
          _success,
          ParamType.bool,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'dataKecamatan': serializeParam(
          _dataKecamatan,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static KecamatanListStruct fromSerializableMap(Map<String, dynamic> data) =>
      KecamatanListStruct(
        success: deserializeParam(
          data['success'],
          ParamType.bool,
          false,
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        dataKecamatan: deserializeStructParam<DataKecamatanStruct>(
          data['dataKecamatan'],
          ParamType.DataStruct,
          true,
          structBuilder: DataKecamatanStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'KecamatanListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is KecamatanListStruct &&
        success == other.success &&
        message == other.message &&
        listEquality.equals(dataKecamatan, other.dataKecamatan);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([success, message, dataKecamatan]);
}

KecamatanListStruct createKecamatanListStruct({
  bool? success,
  String? message,
}) =>
    KecamatanListStruct(
      success: success,
      message: message,
    );
