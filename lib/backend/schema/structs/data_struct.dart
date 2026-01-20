// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataStruct extends BaseStruct {
  DataStruct({
    int? id,
    String? unitName,
    String? noRegiter,
  })  : _id = id,
        _unitName = unitName,
        _noRegiter = noRegiter;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "unit_name" field.
  String? _unitName;
  String get unitName => _unitName ?? '';
  set unitName(String? val) => _unitName = val;

  bool hasUnitName() => _unitName != null;

  // "no_regiter" field.
  String? _noRegiter;
  String get noRegiter => _noRegiter ?? '';
  set noRegiter(String? val) => _noRegiter = val;

  bool hasNoRegiter() => _noRegiter != null;

  static DataStruct fromMap(Map<String, dynamic> data) => DataStruct(
        id: castToType<int>(data['id']),
        unitName: data['unit_name'] as String?,
        noRegiter: data['no_regiter'] as String?,
      );

  static DataStruct? maybeFromMap(dynamic data) =>
      data is Map ? DataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'unit_name': _unitName,
        'no_regiter': _noRegiter,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'unit_name': serializeParam(
          _unitName,
          ParamType.String,
        ),
        'no_regiter': serializeParam(
          _noRegiter,
          ParamType.String,
        ),
      }.withoutNulls;

  static DataStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        unitName: deserializeParam(
          data['unit_name'],
          ParamType.String,
          false,
        ),
        noRegiter: deserializeParam(
          data['no_regiter'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataStruct &&
        id == other.id &&
        unitName == other.unitName &&
        noRegiter == other.noRegiter;
  }

  @override
  int get hashCode => const ListEquality().hash([id, unitName, noRegiter]);
}

DataStruct createDataStruct({
  int? id,
  String? unitName,
  String? noRegiter,
}) =>
    DataStruct(
      id: id,
      unitName: unitName,
      noRegiter: noRegiter,
    );
