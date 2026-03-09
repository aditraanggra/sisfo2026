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
    int? zfRiceSoldAmount,
    int? zfRiceSoldPrice,
    String? zfRiceSoldProof,
    bool? isRiceSold,
    double? unsoldRice,
    double? originalRiceQty,
    String? depositDestination,
    String? desc,
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
        _upload = upload,
        _zfRiceSoldAmount = zfRiceSoldAmount,
        _zfRiceSoldPrice = zfRiceSoldPrice,
        _zfRiceSoldProof = zfRiceSoldProof,
        _isRiceSold = isRiceSold,
        _unsoldRice = unsoldRice,
        _originalRiceQty = originalRiceQty,
        _depositDestination = depositDestination,
        _desc = desc;

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

  // "zf_rice_sold_amount" field.
  int? _zfRiceSoldAmount;
  int get zfRiceSoldAmount => _zfRiceSoldAmount ?? 0;
  set zfRiceSoldAmount(int? val) => _zfRiceSoldAmount = val;

  bool hasZfRiceSoldAmount() => _zfRiceSoldAmount != null;

  // "zf_rice_sold_price" field.
  int? _zfRiceSoldPrice;
  int get zfRiceSoldPrice => _zfRiceSoldPrice ?? 0;
  set zfRiceSoldPrice(int? val) => _zfRiceSoldPrice = val;

  bool hasZfRiceSoldPrice() => _zfRiceSoldPrice != null;

  // "zf_rice_sold_proof" field.
  String? _zfRiceSoldProof;
  String get zfRiceSoldProof => _zfRiceSoldProof ?? '';
  set zfRiceSoldProof(String? val) => _zfRiceSoldProof = val;

  bool hasZfRiceSoldProof() => _zfRiceSoldProof != null;

  // "is_rice_sold" field (computed from API).
  bool? _isRiceSold;
  bool get isRiceSold => _isRiceSold ?? false;
  set isRiceSold(bool? val) => _isRiceSold = val;

  bool hasIsRiceSold() => _isRiceSold != null;

  // "unsold_rice" field (computed from API).
  double? _unsoldRice;
  double get unsoldRice => _unsoldRice ?? 0.0;
  set unsoldRice(double? val) => _unsoldRice = val;

  bool hasUnsoldRice() => _unsoldRice != null;

  // "original_rice_qty" field (computed from API).
  double? _originalRiceQty;
  double get originalRiceQty => _originalRiceQty ?? 0.0;
  set originalRiceQty(double? val) => _originalRiceQty = val;

  bool hasOriginalRiceQty() => _originalRiceQty != null;

  // "deposit_destination" field.
  String? _depositDestination;
  String get depositDestination => _depositDestination ?? '';
  set depositDestination(String? val) => _depositDestination = val;

  bool hasDepositDestination() => _depositDestination != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  set desc(String? val) => _desc = val;

  bool hasDesc() => _desc != null;

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
        zfRiceSoldAmount: castToType<int>(data['zf_rice_sold_amount']),
        zfRiceSoldPrice: castToType<int>(data['zf_rice_sold_price']),
        zfRiceSoldProof: data['zf_rice_sold_proof'] as String?,
        isRiceSold: data['is_rice_sold'] as bool?,
        unsoldRice: castToType<double>(data['unsold_rice']),
        originalRiceQty: castToType<double>(data['original_rice_qty']),
        depositDestination: data['deposit_destination'] as String?,
        desc: data['desc'] as String?,
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
        'zf_rice_sold_amount': _zfRiceSoldAmount,
        'zf_rice_sold_price': _zfRiceSoldPrice,
        'zf_rice_sold_proof': _zfRiceSoldProof,
        'is_rice_sold': _isRiceSold,
        'unsold_rice': _unsoldRice,
        'original_rice_qty': _originalRiceQty,
        'deposit_destination': _depositDestination,
        'desc': _desc,
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
        'zf_rice_sold_amount': serializeParam(
          _zfRiceSoldAmount,
          ParamType.int,
        ),
        'zf_rice_sold_price': serializeParam(
          _zfRiceSoldPrice,
          ParamType.int,
        ),
        'zf_rice_sold_proof': serializeParam(
          _zfRiceSoldProof,
          ParamType.String,
        ),
        'is_rice_sold': serializeParam(
          _isRiceSold,
          ParamType.bool,
        ),
        'unsold_rice': serializeParam(
          _unsoldRice,
          ParamType.double,
        ),
        'original_rice_qty': serializeParam(
          _originalRiceQty,
          ParamType.double,
        ),
        'deposit_destination': serializeParam(
          _depositDestination,
          ParamType.String,
        ),
        'desc': serializeParam(
          _desc,
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
        zfRiceSoldAmount: deserializeParam(
          data['zf_rice_sold_amount'],
          ParamType.int,
          false,
        ),
        zfRiceSoldPrice: deserializeParam(
          data['zf_rice_sold_price'],
          ParamType.int,
          false,
        ),
        zfRiceSoldProof: deserializeParam(
          data['zf_rice_sold_proof'],
          ParamType.String,
          false,
        ),
        isRiceSold: deserializeParam(
          data['is_rice_sold'],
          ParamType.bool,
          false,
        ),
        unsoldRice: deserializeParam(
          data['unsold_rice'],
          ParamType.double,
          false,
        ),
        originalRiceQty: deserializeParam(
          data['original_rice_qty'],
          ParamType.double,
          false,
        ),
        depositDestination: deserializeParam(
          data['deposit_destination'],
          ParamType.String,
          false,
        ),
        desc: deserializeParam(
          data['desc'],
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
        upload == other.upload &&
        zfRiceSoldAmount == other.zfRiceSoldAmount &&
        zfRiceSoldPrice == other.zfRiceSoldPrice &&
        zfRiceSoldProof == other.zfRiceSoldProof &&
        isRiceSold == other.isRiceSold &&
        unsoldRice == other.unsoldRice &&
        originalRiceQty == other.originalRiceQty &&
        depositDestination == other.depositDestination &&
        desc == other.desc;
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
        upload,
        zfRiceSoldAmount,
        zfRiceSoldPrice,
        zfRiceSoldProof,
        isRiceSold,
        unsoldRice,
        originalRiceQty,
        depositDestination,
        desc,
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
  int? zfRiceSoldAmount,
  int? zfRiceSoldPrice,
  String? zfRiceSoldProof,
  bool? isRiceSold,
  double? unsoldRice,
  double? originalRiceQty,
  String? depositDestination,
  String? desc,
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
      zfRiceSoldAmount: zfRiceSoldAmount,
      zfRiceSoldPrice: zfRiceSoldPrice,
      zfRiceSoldProof: zfRiceSoldProof,
      isRiceSold: isRiceSold,
      unsoldRice: unsoldRice,
      originalRiceQty: originalRiceQty,
      depositDestination: depositDestination,
      desc: desc,
    );
