// ignore_for_file: unnecessary_getters_setters

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ZfPaymentTypeStruct extends BaseStruct {
  ZfPaymentTypeStruct({
    int? id,
    String? name,
    String? type,
    double? riceAmount,
    int? moneyAmount,
    String? skReference,
    bool? isActive,
    String? createdAt,
    String? updatedAt,
  })  : _id = id,
        _name = name,
        _type = type,
        _riceAmount = riceAmount,
        _moneyAmount = moneyAmount,
        _skReference = skReference,
        _isActive = isActive,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "rice_amount" field.
  double? _riceAmount;
  double get riceAmount => _riceAmount ?? 0.0;
  set riceAmount(double? val) => _riceAmount = val;

  void incrementRiceAmount(double amount) => riceAmount = riceAmount + amount;

  bool hasRiceAmount() => _riceAmount != null;

  // "money_amount" field.
  int? _moneyAmount;
  int get moneyAmount => _moneyAmount ?? 0;
  set moneyAmount(int? val) => _moneyAmount = val;

  void incrementMoneyAmount(int amount) => moneyAmount = moneyAmount + amount;

  bool hasMoneyAmount() => _moneyAmount != null;

  // "sk_reference" field.
  String? _skReference;
  String get skReference => _skReference ?? '';
  set skReference(String? val) => _skReference = val;

  bool hasSkReference() => _skReference != null;

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? true;
  set isActive(bool? val) => _isActive = val;

  bool hasIsActive() => _isActive != null;

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

  static ZfPaymentTypeStruct fromMap(Map<String, dynamic> data) =>
      ZfPaymentTypeStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        type: data['type'] as String?,
        riceAmount: castToType<double>(data['rice_amount']),
        moneyAmount: castToType<int>(data['money_amount']),
        skReference: data['sk_reference'] as String?,
        isActive: data['is_active'] as bool?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
      );

  static ZfPaymentTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? ZfPaymentTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'type': _type,
        'rice_amount': _riceAmount,
        'money_amount': _moneyAmount,
        'sk_reference': _skReference,
        'is_active': _isActive,
        'created_at': _createdAt,
        'updated_at': _updatedAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'rice_amount': serializeParam(
          _riceAmount,
          ParamType.double,
        ),
        'money_amount': serializeParam(
          _moneyAmount,
          ParamType.int,
        ),
        'sk_reference': serializeParam(
          _skReference,
          ParamType.String,
        ),
        'is_active': serializeParam(
          _isActive,
          ParamType.bool,
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

  static ZfPaymentTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      ZfPaymentTypeStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        riceAmount: deserializeParam(
          data['rice_amount'],
          ParamType.double,
          false,
        ),
        moneyAmount: deserializeParam(
          data['money_amount'],
          ParamType.int,
          false,
        ),
        skReference: deserializeParam(
          data['sk_reference'],
          ParamType.String,
          false,
        ),
        isActive: deserializeParam(
          data['is_active'],
          ParamType.bool,
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
  String toString() => 'ZfPaymentTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ZfPaymentTypeStruct &&
        id == other.id &&
        name == other.name &&
        type == other.type &&
        riceAmount == other.riceAmount &&
        moneyAmount == other.moneyAmount &&
        skReference == other.skReference &&
        isActive == other.isActive &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        type,
        riceAmount,
        moneyAmount,
        skReference,
        isActive,
        createdAt,
        updatedAt,
      ]);
}

ZfPaymentTypeStruct createZfPaymentTypeStruct({
  int? id,
  String? name,
  String? type,
  double? riceAmount,
  int? moneyAmount,
  String? skReference,
  bool? isActive,
  String? createdAt,
  String? updatedAt,
}) =>
    ZfPaymentTypeStruct(
      id: id,
      name: name,
      type: type,
      riceAmount: riceAmount,
      moneyAmount: moneyAmount,
      skReference: skReference,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
