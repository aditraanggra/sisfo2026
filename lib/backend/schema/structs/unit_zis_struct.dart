// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UnitZisStruct extends BaseStruct {
  UnitZisStruct({
    int? id,
    String? unitName,
  })  : _id = id,
        _unitName = unitName;

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

  static UnitZisStruct fromMap(Map<String, dynamic> data) => UnitZisStruct(
        id: castToType<int>(data['id']),
        unitName: data['unit_name'] as String?,
      );

  static UnitZisStruct? maybeFromMap(dynamic data) =>
      data is Map ? UnitZisStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'unit_name': _unitName,
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
      }.withoutNulls;

  static UnitZisStruct fromSerializableMap(Map<String, dynamic> data) =>
      UnitZisStruct(
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
      );

  @override
  String toString() => 'UnitZisStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UnitZisStruct &&
        id == other.id &&
        unitName == other.unitName;
  }

  @override
  int get hashCode => const ListEquality().hash([id, unitName]);
}

UnitZisStruct createUnitZisStruct({
  int? id,
  String? unitName,
}) =>
    UnitZisStruct(
      id: id,
      unitName: unitName,
    );
