// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataSetorStruct extends BaseStruct {
  DataSetorStruct({
    int? id,
    UnitSetorStruct? unitSetor,
    String? trxDate,
    int? zfAmountDeposit,
    double? zfRiceDeposit,
    int? zmAmountDeposit,
    int? ifsAmountDeposit,
    int? totalDeposit,
    String? status,
    String? validation,
    String? upload,
  })  : _id = id,
        _unitSetor = unitSetor,
        _trxDate = trxDate,
        _zfAmountDeposit = zfAmountDeposit,
        _zfRiceDeposit = zfRiceDeposit,
        _zmAmountDeposit = zmAmountDeposit,
        _ifsAmountDeposit = ifsAmountDeposit,
        _totalDeposit = totalDeposit,
        _status = status,
        _validation = validation,
        _upload = upload;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "unit_setor" field.
  UnitSetorStruct? _unitSetor;
  UnitSetorStruct get unitSetor => _unitSetor ?? UnitSetorStruct();
  set unitSetor(UnitSetorStruct? val) => _unitSetor = val;

  void updateUnitSetor(Function(UnitSetorStruct) updateFn) {
    updateFn(_unitSetor ??= UnitSetorStruct());
  }

  bool hasUnitSetor() => _unitSetor != null;

  // "trx_date" field.
  String? _trxDate;
  String get trxDate => _trxDate ?? '';
  set trxDate(String? val) => _trxDate = val;

  bool hasTrxDate() => _trxDate != null;

  // "zf_amount_deposit" field.
  int? _zfAmountDeposit;
  int get zfAmountDeposit => _zfAmountDeposit ?? 0;
  set zfAmountDeposit(int? val) => _zfAmountDeposit = val;

  void incrementZfAmountDeposit(int amount) =>
      zfAmountDeposit = zfAmountDeposit + amount;

  bool hasZfAmountDeposit() => _zfAmountDeposit != null;

  // "zf_rice_deposit" field.
  double? _zfRiceDeposit;
  double get zfRiceDeposit => _zfRiceDeposit ?? 0.0;
  set zfRiceDeposit(double? val) => _zfRiceDeposit = val;

  void incrementZfRiceDeposit(double amount) =>
      zfRiceDeposit = zfRiceDeposit + amount;

  bool hasZfRiceDeposit() => _zfRiceDeposit != null;

  // "zm_amount_deposit" field.
  int? _zmAmountDeposit;
  int get zmAmountDeposit => _zmAmountDeposit ?? 0;
  set zmAmountDeposit(int? val) => _zmAmountDeposit = val;

  void incrementZmAmountDeposit(int amount) =>
      zmAmountDeposit = zmAmountDeposit + amount;

  bool hasZmAmountDeposit() => _zmAmountDeposit != null;

  // "ifs_amount_deposit" field.
  int? _ifsAmountDeposit;
  int get ifsAmountDeposit => _ifsAmountDeposit ?? 0;
  set ifsAmountDeposit(int? val) => _ifsAmountDeposit = val;

  void incrementIfsAmountDeposit(int amount) =>
      ifsAmountDeposit = ifsAmountDeposit + amount;

  bool hasIfsAmountDeposit() => _ifsAmountDeposit != null;

  // "total_deposit" field.
  int? _totalDeposit;
  int get totalDeposit => _totalDeposit ?? 0;
  set totalDeposit(int? val) => _totalDeposit = val;

  void incrementTotalDeposit(int amount) =>
      totalDeposit = totalDeposit + amount;

  bool hasTotalDeposit() => _totalDeposit != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "validation" field.
  String? _validation;
  String get validation => _validation ?? '';
  set validation(String? val) => _validation = val;

  bool hasValidation() => _validation != null;

  // "upload" field.
  String? _upload;
  String get upload => _upload ?? '';
  set upload(String? val) => _upload = val;

  bool hasUpload() => _upload != null;

  static DataSetorStruct fromMap(Map<String, dynamic> data) => DataSetorStruct(
        id: castToType<int>(data['id']),
        unitSetor: data['unit_setor'] is UnitSetorStruct
            ? data['unit_setor']
            : UnitSetorStruct.maybeFromMap(data['unit_setor']),
        trxDate: data['trx_date'] as String?,
        zfAmountDeposit: castToType<int>(data['zf_amount_deposit']),
        zfRiceDeposit: castToType<double>(data['zf_rice_deposit']),
        zmAmountDeposit: castToType<int>(data['zm_amount_deposit']),
        ifsAmountDeposit: castToType<int>(data['ifs_amount_deposit']),
        totalDeposit: castToType<int>(data['total_deposit']),
        status: data['status'] as String?,
        validation: data['validation'] as String?,
        upload: data['upload'] as String?,
      );

  static DataSetorStruct? maybeFromMap(dynamic data) => data is Map
      ? DataSetorStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'unit_setor': _unitSetor?.toMap(),
        'trx_date': _trxDate,
        'zf_amount_deposit': _zfAmountDeposit,
        'zf_rice_deposit': _zfRiceDeposit,
        'zm_amount_deposit': _zmAmountDeposit,
        'ifs_amount_deposit': _ifsAmountDeposit,
        'total_deposit': _totalDeposit,
        'status': _status,
        'validation': _validation,
        'upload': _upload,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'unit_setor': serializeParam(
          _unitSetor,
          ParamType.DataStruct,
        ),
        'trx_date': serializeParam(
          _trxDate,
          ParamType.String,
        ),
        'zf_amount_deposit': serializeParam(
          _zfAmountDeposit,
          ParamType.int,
        ),
        'zf_rice_deposit': serializeParam(
          _zfRiceDeposit,
          ParamType.double,
        ),
        'zm_amount_deposit': serializeParam(
          _zmAmountDeposit,
          ParamType.int,
        ),
        'ifs_amount_deposit': serializeParam(
          _ifsAmountDeposit,
          ParamType.int,
        ),
        'total_deposit': serializeParam(
          _totalDeposit,
          ParamType.int,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'validation': serializeParam(
          _validation,
          ParamType.String,
        ),
        'upload': serializeParam(
          _upload,
          ParamType.String,
        ),
      }.withoutNulls;

  static DataSetorStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataSetorStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        unitSetor: deserializeStructParam(
          data['unit_setor'],
          ParamType.DataStruct,
          false,
          structBuilder: UnitSetorStruct.fromSerializableMap,
        ),
        trxDate: deserializeParam(
          data['trx_date'],
          ParamType.String,
          false,
        ),
        zfAmountDeposit: deserializeParam(
          data['zf_amount_deposit'],
          ParamType.int,
          false,
        ),
        zfRiceDeposit: deserializeParam(
          data['zf_rice_deposit'],
          ParamType.double,
          false,
        ),
        zmAmountDeposit: deserializeParam(
          data['zm_amount_deposit'],
          ParamType.int,
          false,
        ),
        ifsAmountDeposit: deserializeParam(
          data['ifs_amount_deposit'],
          ParamType.int,
          false,
        ),
        totalDeposit: deserializeParam(
          data['total_deposit'],
          ParamType.int,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        validation: deserializeParam(
          data['validation'],
          ParamType.String,
          false,
        ),
        upload: deserializeParam(
          data['upload'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DataSetorStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataSetorStruct &&
        id == other.id &&
        unitSetor == other.unitSetor &&
        trxDate == other.trxDate &&
        zfAmountDeposit == other.zfAmountDeposit &&
        zfRiceDeposit == other.zfRiceDeposit &&
        zmAmountDeposit == other.zmAmountDeposit &&
        ifsAmountDeposit == other.ifsAmountDeposit &&
        totalDeposit == other.totalDeposit &&
        status == other.status &&
        validation == other.validation &&
        upload == other.upload;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        unitSetor,
        trxDate,
        zfAmountDeposit,
        zfRiceDeposit,
        zmAmountDeposit,
        ifsAmountDeposit,
        totalDeposit,
        status,
        validation,
        upload
      ]);
}

DataSetorStruct createDataSetorStruct({
  int? id,
  UnitSetorStruct? unitSetor,
  String? trxDate,
  int? zfAmountDeposit,
  double? zfRiceDeposit,
  int? zmAmountDeposit,
  int? ifsAmountDeposit,
  int? totalDeposit,
  String? status,
  String? validation,
  String? upload,
}) =>
    DataSetorStruct(
      id: id,
      unitSetor: unitSetor ?? UnitSetorStruct(),
      trxDate: trxDate,
      zfAmountDeposit: zfAmountDeposit,
      zfRiceDeposit: zfRiceDeposit,
      zmAmountDeposit: zmAmountDeposit,
      ifsAmountDeposit: ifsAmountDeposit,
      totalDeposit: totalDeposit,
      status: status,
      validation: validation,
      upload: upload,
    );
