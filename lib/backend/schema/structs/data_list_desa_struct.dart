// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataListDesaStruct extends BaseStruct {
  DataListDesaStruct({
    bool? success,
    String? message,
    List<DataDesaStruct>? dataDesa,
  })  : _success = success,
        _message = message,
        _dataDesa = dataDesa;

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

  // "dataDesa" field.
  List<DataDesaStruct>? _dataDesa;
  List<DataDesaStruct> get dataDesa => _dataDesa ?? const [];
  set dataDesa(List<DataDesaStruct>? val) => _dataDesa = val;

  void updateDataDesa(Function(List<DataDesaStruct>) updateFn) {
    updateFn(_dataDesa ??= []);
  }

  bool hasDataDesa() => _dataDesa != null;

  static DataListDesaStruct fromMap(Map<String, dynamic> data) =>
      DataListDesaStruct(
        success: data['success'] as bool?,
        message: data['message'] as String?,
        dataDesa: getStructList(
          data['dataDesa'],
          DataDesaStruct.fromMap,
        ),
      );

  static DataListDesaStruct? maybeFromMap(dynamic data) => data is Map
      ? DataListDesaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'success': _success,
        'message': _message,
        'dataDesa': _dataDesa?.map((e) => e.toMap()).toList(),
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
        'dataDesa': serializeParam(
          _dataDesa,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static DataListDesaStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataListDesaStruct(
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
        dataDesa: deserializeStructParam<DataDesaStruct>(
          data['dataDesa'],
          ParamType.DataStruct,
          true,
          structBuilder: DataDesaStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DataListDesaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DataListDesaStruct &&
        success == other.success &&
        message == other.message &&
        listEquality.equals(dataDesa, other.dataDesa);
  }

  @override
  int get hashCode => const ListEquality().hash([success, message, dataDesa]);
}

DataListDesaStruct createDataListDesaStruct({
  bool? success,
  String? message,
}) =>
    DataListDesaStruct(
      success: success,
      message: message,
    );
