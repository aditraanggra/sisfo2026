// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataIfsStruct extends BaseStruct {
  DataIfsStruct({
    int? id,
    UnitStruct? unit,
    String? trxDate,
    String? desc,
    String? createdAt,
    String? updatedAt,
    String? munfiqName,
    int? amount,
  })  : _id = id,
        _unit = unit,
        _trxDate = trxDate,
        _desc = desc,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _munfiqName = munfiqName,
        _amount = amount;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "unit" field.
  UnitStruct? _unit;
  UnitStruct get unit => _unit ?? UnitStruct();
  set unit(UnitStruct? val) => _unit = val;

  void updateUnit(Function(UnitStruct) updateFn) {
    updateFn(_unit ??= UnitStruct());
  }

  bool hasUnit() => _unit != null;

  // "trx_date" field.
  String? _trxDate;
  String get trxDate => _trxDate ?? '';
  set trxDate(String? val) => _trxDate = val;

  bool hasTrxDate() => _trxDate != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  set desc(String? val) => _desc = val;

  bool hasDesc() => _desc != null;

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

  // "munfiq_name" field.
  String? _munfiqName;
  String get munfiqName => _munfiqName ?? '';
  set munfiqName(String? val) => _munfiqName = val;

  bool hasMunfiqName() => _munfiqName != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  set amount(int? val) => _amount = val;

  void incrementAmount(int amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  static DataIfsStruct fromMap(Map<String, dynamic> data) => DataIfsStruct(
        id: castToType<int>(data['id']),
        unit: data['unit'] is UnitStruct
            ? data['unit']
            : UnitStruct.maybeFromMap(data['unit']),
        trxDate: data['trx_date'] as String?,
        desc: data['desc'] as String?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
        munfiqName: data['munfiq_name'] as String?,
        amount: castToType<int>(data['amount']),
      );

  static DataIfsStruct? maybeFromMap(dynamic data) =>
      data is Map ? DataIfsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'unit': _unit?.toMap(),
        'trx_date': _trxDate,
        'desc': _desc,
        'created_at': _createdAt,
        'updated_at': _updatedAt,
        'munfiq_name': _munfiqName,
        'amount': _amount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'unit': serializeParam(
          _unit,
          ParamType.DataStruct,
        ),
        'trx_date': serializeParam(
          _trxDate,
          ParamType.String,
        ),
        'desc': serializeParam(
          _desc,
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
        'munfiq_name': serializeParam(
          _munfiqName,
          ParamType.String,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.int,
        ),
      }.withoutNulls;

  static DataIfsStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataIfsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        unit: deserializeStructParam(
          data['unit'],
          ParamType.DataStruct,
          false,
          structBuilder: UnitStruct.fromSerializableMap,
        ),
        trxDate: deserializeParam(
          data['trx_date'],
          ParamType.String,
          false,
        ),
        desc: deserializeParam(
          data['desc'],
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
        munfiqName: deserializeParam(
          data['munfiq_name'],
          ParamType.String,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DataIfsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataIfsStruct &&
        id == other.id &&
        unit == other.unit &&
        trxDate == other.trxDate &&
        desc == other.desc &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        munfiqName == other.munfiqName &&
        amount == other.amount;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [id, unit, trxDate, desc, createdAt, updatedAt, munfiqName, amount]);
}

DataIfsStruct createDataIfsStruct({
  int? id,
  UnitStruct? unit,
  String? trxDate,
  String? desc,
  String? createdAt,
  String? updatedAt,
  String? munfiqName,
  int? amount,
}) =>
    DataIfsStruct(
      id: id,
      unit: unit ?? UnitStruct(),
      trxDate: trxDate,
      desc: desc,
      createdAt: createdAt,
      updatedAt: updatedAt,
      munfiqName: munfiqName,
      amount: amount,
    );
