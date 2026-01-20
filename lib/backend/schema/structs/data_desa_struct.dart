// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataDesaStruct extends BaseStruct {
  DataDesaStruct({
    int? id,
    int? districtId,
    String? villageCode,
    String? name,
    String? createdAt,
    String? updatedAt,
  })  : _id = id,
        _districtId = districtId,
        _villageCode = villageCode,
        _name = name,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "district_id" field.
  int? _districtId;
  int get districtId => _districtId ?? 0;
  set districtId(int? val) => _districtId = val;

  void incrementDistrictId(int amount) => districtId = districtId + amount;

  bool hasDistrictId() => _districtId != null;

  // "village_code" field.
  String? _villageCode;
  String get villageCode => _villageCode ?? '';
  set villageCode(String? val) => _villageCode = val;

  bool hasVillageCode() => _villageCode != null;

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

  static DataDesaStruct fromMap(Map<String, dynamic> data) => DataDesaStruct(
        id: castToType<int>(data['id']),
        districtId: castToType<int>(data['district_id']),
        villageCode: data['village_code'] as String?,
        name: data['name'] as String?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
      );

  static DataDesaStruct? maybeFromMap(dynamic data) =>
      data is Map ? DataDesaStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'district_id': _districtId,
        'village_code': _villageCode,
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
        'district_id': serializeParam(
          _districtId,
          ParamType.int,
        ),
        'village_code': serializeParam(
          _villageCode,
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

  static DataDesaStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataDesaStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        districtId: deserializeParam(
          data['district_id'],
          ParamType.int,
          false,
        ),
        villageCode: deserializeParam(
          data['village_code'],
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
  String toString() => 'DataDesaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataDesaStruct &&
        id == other.id &&
        districtId == other.districtId &&
        villageCode == other.villageCode &&
        name == other.name &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, districtId, villageCode, name, createdAt, updatedAt]);
}

DataDesaStruct createDataDesaStruct({
  int? id,
  int? districtId,
  String? villageCode,
  String? name,
  String? createdAt,
  String? updatedAt,
}) =>
    DataDesaStruct(
      id: id,
      districtId: districtId,
      villageCode: villageCode,
      name: name,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
