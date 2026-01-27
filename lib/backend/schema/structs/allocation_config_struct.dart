// ignore_for_file: unnecessary_getters_setters

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AllocationConfigStruct extends BaseStruct {
  AllocationConfigStruct({
    int? id,
    String? zisType,
    String? zisTypeLabel,
    int? effectiveYear,
    double? setorPercentage,
    double? kelolaPercentage,
    double? amilPercentage,
    String? description,
    bool? isDefault,
    String? createdAt,
    String? updatedAt,
  })  : _id = id,
        _zisType = zisType,
        _zisTypeLabel = zisTypeLabel,
        _effectiveYear = effectiveYear,
        _setorPercentage = setorPercentage,
        _kelolaPercentage = kelolaPercentage,
        _amilPercentage = amilPercentage,
        _description = description,
        _isDefault = isDefault,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "zis_type" field.
  String? _zisType;
  String get zisType => _zisType ?? '';
  set zisType(String? val) => _zisType = val;

  bool hasZisType() => _zisType != null;

  // "zis_type_label" field.
  String? _zisTypeLabel;
  String get zisTypeLabel => _zisTypeLabel ?? '';
  set zisTypeLabel(String? val) => _zisTypeLabel = val;

  bool hasZisTypeLabel() => _zisTypeLabel != null;

  // "effective_year" field.
  int? _effectiveYear;
  int get effectiveYear => _effectiveYear ?? 0;
  set effectiveYear(int? val) => _effectiveYear = val;

  void incrementEffectiveYear(int amount) =>
      effectiveYear = effectiveYear + amount;

  bool hasEffectiveYear() => _effectiveYear != null;

  // "setor_percentage" field.
  double? _setorPercentage;
  double get setorPercentage => _setorPercentage ?? 30.0;
  set setorPercentage(double? val) => _setorPercentage = val;

  void incrementSetorPercentage(double amount) =>
      setorPercentage = setorPercentage + amount;

  bool hasSetorPercentage() => _setorPercentage != null;

  // "kelola_percentage" field.
  double? _kelolaPercentage;
  double get kelolaPercentage => _kelolaPercentage ?? 70.0;
  set kelolaPercentage(double? val) => _kelolaPercentage = val;

  void incrementKelolaPercentage(double amount) =>
      kelolaPercentage = kelolaPercentage + amount;

  bool hasKelolaPercentage() => _kelolaPercentage != null;

  // "amil_percentage" field.
  double? _amilPercentage;
  double get amilPercentage => _amilPercentage ?? 12.5;
  set amilPercentage(double? val) => _amilPercentage = val;

  void incrementAmilPercentage(double amount) =>
      amilPercentage = amilPercentage + amount;

  bool hasAmilPercentage() => _amilPercentage != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "is_default" field.
  bool? _isDefault;
  bool get isDefault => _isDefault ?? false;
  set isDefault(bool? val) => _isDefault = val;

  bool hasIsDefault() => _isDefault != null;

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

  static AllocationConfigStruct fromMap(Map<String, dynamic> data) =>
      AllocationConfigStruct(
        id: castToType<int>(data['id']),
        zisType: data['zis_type'] as String?,
        zisTypeLabel: data['zis_type_label'] as String?,
        effectiveYear: castToType<int>(data['effective_year']),
        setorPercentage: castToType<double>(data['setor_percentage']),
        kelolaPercentage: castToType<double>(data['kelola_percentage']),
        amilPercentage: castToType<double>(data['amil_percentage']),
        description: data['description'] as String?,
        isDefault: data['is_default'] as bool?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
      );

  static AllocationConfigStruct? maybeFromMap(dynamic data) => data is Map
      ? AllocationConfigStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'zis_type': _zisType,
        'zis_type_label': _zisTypeLabel,
        'effective_year': _effectiveYear,
        'setor_percentage': _setorPercentage,
        'kelola_percentage': _kelolaPercentage,
        'amil_percentage': _amilPercentage,
        'description': _description,
        'is_default': _isDefault,
        'created_at': _createdAt,
        'updated_at': _updatedAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(_id, ParamType.int),
        'zis_type': serializeParam(_zisType, ParamType.String),
        'zis_type_label': serializeParam(_zisTypeLabel, ParamType.String),
        'effective_year': serializeParam(_effectiveYear, ParamType.int),
        'setor_percentage': serializeParam(_setorPercentage, ParamType.double),
        'kelola_percentage':
            serializeParam(_kelolaPercentage, ParamType.double),
        'amil_percentage': serializeParam(_amilPercentage, ParamType.double),
        'description': serializeParam(_description, ParamType.String),
        'is_default': serializeParam(_isDefault, ParamType.bool),
        'created_at': serializeParam(_createdAt, ParamType.String),
        'updated_at': serializeParam(_updatedAt, ParamType.String),
      }.withoutNulls;

  static AllocationConfigStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AllocationConfigStruct(
        id: deserializeParam(data['id'], ParamType.int, false),
        zisType: deserializeParam(data['zis_type'], ParamType.String, false),
        zisTypeLabel:
            deserializeParam(data['zis_type_label'], ParamType.String, false),
        effectiveYear:
            deserializeParam(data['effective_year'], ParamType.int, false),
        setorPercentage:
            deserializeParam(data['setor_percentage'], ParamType.double, false),
        kelolaPercentage: deserializeParam(
            data['kelola_percentage'], ParamType.double, false),
        amilPercentage:
            deserializeParam(data['amil_percentage'], ParamType.double, false),
        description:
            deserializeParam(data['description'], ParamType.String, false),
        isDefault: deserializeParam(data['is_default'], ParamType.bool, false),
        createdAt:
            deserializeParam(data['created_at'], ParamType.String, false),
        updatedAt:
            deserializeParam(data['updated_at'], ParamType.String, false),
      );

  @override
  String toString() => 'AllocationConfigStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AllocationConfigStruct &&
        id == other.id &&
        zisType == other.zisType &&
        zisTypeLabel == other.zisTypeLabel &&
        effectiveYear == other.effectiveYear &&
        setorPercentage == other.setorPercentage &&
        kelolaPercentage == other.kelolaPercentage &&
        amilPercentage == other.amilPercentage &&
        description == other.description &&
        isDefault == other.isDefault &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        zisType,
        zisTypeLabel,
        effectiveYear,
        setorPercentage,
        kelolaPercentage,
        amilPercentage,
        description,
        isDefault,
        createdAt,
        updatedAt,
      ]);
}

AllocationConfigStruct createAllocationConfigStruct({
  int? id,
  String? zisType,
  String? zisTypeLabel,
  int? effectiveYear,
  double? setorPercentage,
  double? kelolaPercentage,
  double? amilPercentage,
  String? description,
  bool? isDefault,
  String? createdAt,
  String? updatedAt,
}) =>
    AllocationConfigStruct(
      id: id,
      zisType: zisType,
      zisTypeLabel: zisTypeLabel,
      effectiveYear: effectiveYear,
      setorPercentage: setorPercentage,
      kelolaPercentage: kelolaPercentage,
      amilPercentage: amilPercentage,
      description: description,
      isDefault: isDefault,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
