// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataUPZStruct extends BaseStruct {
  DataUPZStruct({
    bool? success,
    String? message,
    UpzStruct? upz,
  })  : _success = success,
        _message = message,
        _upz = upz;

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

  // "upz" field.
  UpzStruct? _upz;
  UpzStruct get upz => _upz ?? UpzStruct();
  set upz(UpzStruct? val) => _upz = val;

  void updateUpz(Function(UpzStruct) updateFn) {
    updateFn(_upz ??= UpzStruct());
  }

  bool hasUpz() => _upz != null;

  static DataUPZStruct fromMap(Map<String, dynamic> data) => DataUPZStruct(
        success: data['success'] as bool?,
        message: data['message'] as String?,
        upz: data['upz'] is UpzStruct
            ? data['upz']
            : UpzStruct.maybeFromMap(data['upz']),
      );

  static DataUPZStruct? maybeFromMap(dynamic data) =>
      data is Map ? DataUPZStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'success': _success,
        'message': _message,
        'upz': _upz?.toMap(),
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
        'upz': serializeParam(
          _upz,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static DataUPZStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataUPZStruct(
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
        upz: deserializeStructParam(
          data['upz'],
          ParamType.DataStruct,
          false,
          structBuilder: UpzStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DataUPZStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataUPZStruct &&
        success == other.success &&
        message == other.message &&
        upz == other.upz;
  }

  @override
  int get hashCode => const ListEquality().hash([success, message, upz]);
}

DataUPZStruct createDataUPZStruct({
  bool? success,
  String? message,
  UpzStruct? upz,
}) =>
    DataUPZStruct(
      success: success,
      message: message,
      upz: upz ?? UpzStruct(),
    );
