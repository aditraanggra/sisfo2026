// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UnitSetorStruct extends BaseStruct {
  UnitSetorStruct({
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

  static UnitSetorStruct fromMap(Map<String, dynamic> data) => UnitSetorStruct(
        id: castToType<int>(data['id']),
        unitName: data['unit_name'] as String?,
      );

  static UnitSetorStruct? maybeFromMap(dynamic data) => data is Map
      ? UnitSetorStruct.fromMap(data.cast<String, dynamic>())
      : null;

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

  static UnitSetorStruct fromSerializableMap(Map<String, dynamic> data) =>
      UnitSetorStruct(
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
  String toString() => 'UnitSetorStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UnitSetorStruct &&
        id == other.id &&
        unitName == other.unitName;
  }

  @override
  int get hashCode => const ListEquality().hash([id, unitName]);
}

UnitSetorStruct createUnitSetorStruct({
  int? id,
  String? unitName,
}) =>
    UnitSetorStruct(
      id: id,
      unitName: unitName,
    );
