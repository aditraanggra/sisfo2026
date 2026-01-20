// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataPendisStruct extends BaseStruct {
  DataPendisStruct({
    int? id,
    UnitStruct? unit,
    String? trxDate,
    String? desc,
    String? createdAt,
    String? updatedAt,
    String? mustahikName,
    String? nik,
    String? fundType,
    String? asnaf,
    String? program,
    double? totalRice,
    int? totalAmount,
    int? beneficiary,
  })  : _id = id,
        _unit = unit,
        _trxDate = trxDate,
        _desc = desc,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _mustahikName = mustahikName,
        _nik = nik,
        _fundType = fundType,
        _asnaf = asnaf,
        _program = program,
        _totalRice = totalRice,
        _totalAmount = totalAmount,
        _beneficiary = beneficiary;

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

  // "mustahik_name" field.
  String? _mustahikName;
  String get mustahikName => _mustahikName ?? '';
  set mustahikName(String? val) => _mustahikName = val;

  bool hasMustahikName() => _mustahikName != null;

  // "nik" field.
  String? _nik;
  String get nik => _nik ?? '';
  set nik(String? val) => _nik = val;

  bool hasNik() => _nik != null;

  // "fund_type" field.
  String? _fundType;
  String get fundType => _fundType ?? '';
  set fundType(String? val) => _fundType = val;

  bool hasFundType() => _fundType != null;

  // "asnaf" field.
  String? _asnaf;
  String get asnaf => _asnaf ?? '';
  set asnaf(String? val) => _asnaf = val;

  bool hasAsnaf() => _asnaf != null;

  // "program" field.
  String? _program;
  String get program => _program ?? '';
  set program(String? val) => _program = val;

  bool hasProgram() => _program != null;

  // "total_rice" field.
  double? _totalRice;
  double get totalRice => _totalRice ?? 0.0;
  set totalRice(double? val) => _totalRice = val;

  void incrementTotalRice(double amount) => totalRice = totalRice + amount;

  bool hasTotalRice() => _totalRice != null;

  // "total_amount" field.
  int? _totalAmount;
  int get totalAmount => _totalAmount ?? 0;
  set totalAmount(int? val) => _totalAmount = val;

  void incrementTotalAmount(int amount) => totalAmount = totalAmount + amount;

  bool hasTotalAmount() => _totalAmount != null;

  // "beneficiary" field.
  int? _beneficiary;
  int get beneficiary => _beneficiary ?? 0;
  set beneficiary(int? val) => _beneficiary = val;

  void incrementBeneficiary(int amount) => beneficiary = beneficiary + amount;

  bool hasBeneficiary() => _beneficiary != null;

  static DataPendisStruct fromMap(Map<String, dynamic> data) =>
      DataPendisStruct(
        id: castToType<int>(data['id']),
        unit: data['unit'] is UnitStruct
            ? data['unit']
            : UnitStruct.maybeFromMap(data['unit']),
        trxDate: data['trx_date'] as String?,
        desc: data['desc'] as String?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
        mustahikName: data['mustahik_name'] as String?,
        nik: data['nik'] as String?,
        fundType: data['fund_type'] as String?,
        asnaf: data['asnaf'] as String?,
        program: data['program'] as String?,
        totalRice: castToType<double>(data['total_rice']),
        totalAmount: castToType<int>(data['total_amount']),
        beneficiary: castToType<int>(data['beneficiary']),
      );

  static DataPendisStruct? maybeFromMap(dynamic data) => data is Map
      ? DataPendisStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'unit': _unit?.toMap(),
        'trx_date': _trxDate,
        'desc': _desc,
        'created_at': _createdAt,
        'updated_at': _updatedAt,
        'mustahik_name': _mustahikName,
        'nik': _nik,
        'fund_type': _fundType,
        'asnaf': _asnaf,
        'program': _program,
        'total_rice': _totalRice,
        'total_amount': _totalAmount,
        'beneficiary': _beneficiary,
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
        'mustahik_name': serializeParam(
          _mustahikName,
          ParamType.String,
        ),
        'nik': serializeParam(
          _nik,
          ParamType.String,
        ),
        'fund_type': serializeParam(
          _fundType,
          ParamType.String,
        ),
        'asnaf': serializeParam(
          _asnaf,
          ParamType.String,
        ),
        'program': serializeParam(
          _program,
          ParamType.String,
        ),
        'total_rice': serializeParam(
          _totalRice,
          ParamType.double,
        ),
        'total_amount': serializeParam(
          _totalAmount,
          ParamType.int,
        ),
        'beneficiary': serializeParam(
          _beneficiary,
          ParamType.int,
        ),
      }.withoutNulls;

  static DataPendisStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataPendisStruct(
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
        mustahikName: deserializeParam(
          data['mustahik_name'],
          ParamType.String,
          false,
        ),
        nik: deserializeParam(
          data['nik'],
          ParamType.String,
          false,
        ),
        fundType: deserializeParam(
          data['fund_type'],
          ParamType.String,
          false,
        ),
        asnaf: deserializeParam(
          data['asnaf'],
          ParamType.String,
          false,
        ),
        program: deserializeParam(
          data['program'],
          ParamType.String,
          false,
        ),
        totalRice: deserializeParam(
          data['total_rice'],
          ParamType.double,
          false,
        ),
        totalAmount: deserializeParam(
          data['total_amount'],
          ParamType.int,
          false,
        ),
        beneficiary: deserializeParam(
          data['beneficiary'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DataPendisStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataPendisStruct &&
        id == other.id &&
        unit == other.unit &&
        trxDate == other.trxDate &&
        desc == other.desc &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        mustahikName == other.mustahikName &&
        nik == other.nik &&
        fundType == other.fundType &&
        asnaf == other.asnaf &&
        program == other.program &&
        totalRice == other.totalRice &&
        totalAmount == other.totalAmount &&
        beneficiary == other.beneficiary;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        unit,
        trxDate,
        desc,
        createdAt,
        updatedAt,
        mustahikName,
        nik,
        fundType,
        asnaf,
        program,
        totalRice,
        totalAmount,
        beneficiary
      ]);
}

DataPendisStruct createDataPendisStruct({
  int? id,
  UnitStruct? unit,
  String? trxDate,
  String? desc,
  String? createdAt,
  String? updatedAt,
  String? mustahikName,
  String? nik,
  String? fundType,
  String? asnaf,
  String? program,
  double? totalRice,
  int? totalAmount,
  int? beneficiary,
}) =>
    DataPendisStruct(
      id: id,
      unit: unit ?? UnitStruct(),
      trxDate: trxDate,
      desc: desc,
      createdAt: createdAt,
      updatedAt: updatedAt,
      mustahikName: mustahikName,
      nik: nik,
      fundType: fundType,
      asnaf: asnaf,
      program: program,
      totalRice: totalRice,
      totalAmount: totalAmount,
      beneficiary: beneficiary,
    );
