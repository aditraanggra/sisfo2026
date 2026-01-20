// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataZfStruct extends BaseStruct {
  DataZfStruct({
    int? id,
    UnitStruct? unit,
    String? trxDate,
    String? desc,
    String? createdAt,
    String? updatedAt,
    String? muzakkiName,
    double? zfRice,
    int? zfAmount,
    int? totalMuzakki,
  })  : _id = id,
        _unit = unit,
        _trxDate = trxDate,
        _desc = desc,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _muzakkiName = muzakkiName,
        _zfRice = zfRice,
        _zfAmount = zfAmount,
        _totalMuzakki = totalMuzakki;

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

  // "muzakki_name" field.
  String? _muzakkiName;
  String get muzakkiName => _muzakkiName ?? '';
  set muzakkiName(String? val) => _muzakkiName = val;

  bool hasMuzakkiName() => _muzakkiName != null;

  // "zf_rice" field.
  double? _zfRice;
  double get zfRice => _zfRice ?? 0.0;
  set zfRice(double? val) => _zfRice = val;

  void incrementZfRice(double amount) => zfRice = zfRice + amount;

  bool hasZfRice() => _zfRice != null;

  // "zf_amount" field.
  int? _zfAmount;
  int get zfAmount => _zfAmount ?? 0;
  set zfAmount(int? val) => _zfAmount = val;

  void incrementZfAmount(int amount) => zfAmount = zfAmount + amount;

  bool hasZfAmount() => _zfAmount != null;

  // "total_muzakki" field.
  int? _totalMuzakki;
  int get totalMuzakki => _totalMuzakki ?? 0;
  set totalMuzakki(int? val) => _totalMuzakki = val;

  void incrementTotalMuzakki(int amount) =>
      totalMuzakki = totalMuzakki + amount;

  bool hasTotalMuzakki() => _totalMuzakki != null;

  static DataZfStruct fromMap(Map<String, dynamic> data) => DataZfStruct(
        id: castToType<int>(data['id']),
        unit: data['unit'] is UnitStruct
            ? data['unit']
            : UnitStruct.maybeFromMap(data['unit']),
        trxDate: data['trx_date'] as String?,
        desc: data['desc'] as String?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
        muzakkiName: data['muzakki_name'] as String?,
        zfRice: castToType<double>(data['zf_rice']),
        zfAmount: castToType<int>(data['zf_amount']),
        totalMuzakki: castToType<int>(data['total_muzakki']),
      );

  static DataZfStruct? maybeFromMap(dynamic data) =>
      data is Map ? DataZfStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'unit': _unit?.toMap(),
        'trx_date': _trxDate,
        'desc': _desc,
        'created_at': _createdAt,
        'updated_at': _updatedAt,
        'muzakki_name': _muzakkiName,
        'zf_rice': _zfRice,
        'zf_amount': _zfAmount,
        'total_muzakki': _totalMuzakki,
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
        'muzakki_name': serializeParam(
          _muzakkiName,
          ParamType.String,
        ),
        'zf_rice': serializeParam(
          _zfRice,
          ParamType.double,
        ),
        'zf_amount': serializeParam(
          _zfAmount,
          ParamType.int,
        ),
        'total_muzakki': serializeParam(
          _totalMuzakki,
          ParamType.int,
        ),
      }.withoutNulls;

  static DataZfStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataZfStruct(
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
        muzakkiName: deserializeParam(
          data['muzakki_name'],
          ParamType.String,
          false,
        ),
        zfRice: deserializeParam(
          data['zf_rice'],
          ParamType.double,
          false,
        ),
        zfAmount: deserializeParam(
          data['zf_amount'],
          ParamType.int,
          false,
        ),
        totalMuzakki: deserializeParam(
          data['total_muzakki'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DataZfStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataZfStruct &&
        id == other.id &&
        unit == other.unit &&
        trxDate == other.trxDate &&
        desc == other.desc &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        muzakkiName == other.muzakkiName &&
        zfRice == other.zfRice &&
        zfAmount == other.zfAmount &&
        totalMuzakki == other.totalMuzakki;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        unit,
        trxDate,
        desc,
        createdAt,
        updatedAt,
        muzakkiName,
        zfRice,
        zfAmount,
        totalMuzakki
      ]);
}

DataZfStruct createDataZfStruct({
  int? id,
  UnitStruct? unit,
  String? trxDate,
  String? desc,
  String? createdAt,
  String? updatedAt,
  String? muzakkiName,
  double? zfRice,
  int? zfAmount,
  int? totalMuzakki,
}) =>
    DataZfStruct(
      id: id,
      unit: unit ?? UnitStruct(),
      trxDate: trxDate,
      desc: desc,
      createdAt: createdAt,
      updatedAt: updatedAt,
      muzakkiName: muzakkiName,
      zfRice: zfRice,
      zfAmount: zfAmount,
      totalMuzakki: totalMuzakki,
    );
