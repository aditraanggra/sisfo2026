// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataKecamatanStruct extends BaseStruct {
  DataKecamatanStruct({
    int? id,
    String? districtCode,
    String? name,
    String? createdAt,
    String? updatedAt,
  })  : _id = id,
        _districtCode = districtCode,
        _name = name,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "district_code" field.
  String? _districtCode;
  String get districtCode => _districtCode ?? '';
  set districtCode(String? val) => _districtCode = val;

  bool hasDistrictCode() => _districtCode != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  static DataKecamatanStruct fromMap(Map<String, dynamic> data) =>
      DataKecamatanStruct(
        id: castToType<int>(data['id']),
        districtCode: data['district_code'] as String?,
        name: data['name'] as String?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
      );

  static DataKecamatanStruct? maybeFromMap(dynamic data) => data is Map
      ? DataKecamatanStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'district_code': _districtCode,
        'name': _name,
        'created_at': _createdAt,
        'updated_at': _updatedAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'district_code': serializeParam(
          _districtCode,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
      }.withoutNulls;

  static DataKecamatanStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataKecamatanStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        districtCode: deserializeParam(
          data['district_code'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DataKecamatanStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataKecamatanStruct &&
        id == other.id &&
        districtCode == other.districtCode &&
        name == other.name &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, districtCode, name, createdAt, updatedAt]);
}

DataKecamatanStruct createDataKecamatanStruct({
  int? id,
  String? districtCode,
  String? name,
  String? createdAt,
  String? updatedAt,
}) =>
    DataKecamatanStruct(
      id: id,
      districtCode: districtCode,
      name: name,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
