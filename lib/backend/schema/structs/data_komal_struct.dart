// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataKomalStruct extends BaseStruct {
  DataKomalStruct({
    int? id,
    UnitZisStruct? unitZis,
    String? trxDate,
    int? amount,
  })  : _id = id,
        _unitZis = unitZis,
        _trxDate = trxDate,
        _amount = amount;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "unit_zis" field.
  UnitZisStruct? _unitZis;
  UnitZisStruct get unitZis => _unitZis ?? UnitZisStruct();
  set unitZis(UnitZisStruct? val) => _unitZis = val;

  void updateUnitZis(Function(UnitZisStruct) updateFn) {
    updateFn(_unitZis ??= UnitZisStruct());
  }

  bool hasUnitZis() => _unitZis != null;

  // "trx_date" field.
  String? _trxDate;
  String get trxDate => _trxDate ?? '';
  set trxDate(String? val) => _trxDate = val;

  bool hasTrxDate() => _trxDate != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  set amount(int? val) => _amount = val;

  void incrementAmount(int amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  static DataKomalStruct fromMap(Map<String, dynamic> data) => DataKomalStruct(
        id: castToType<int>(data['id']),
        unitZis: data['unit_zis'] is UnitZisStruct
            ? data['unit_zis']
            : UnitZisStruct.maybeFromMap(data['unit_zis']),
        trxDate: data['trx_date'] as String?,
        amount: castToType<int>(data['amount']),
      );

  static DataKomalStruct? maybeFromMap(dynamic data) => data is Map
      ? DataKomalStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'unit_zis': _unitZis?.toMap(),
        'trx_date': _trxDate,
        'amount': _amount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'unit_zis': serializeParam(
          _unitZis,
          ParamType.DataStruct,
        ),
        'trx_date': serializeParam(
          _trxDate,
          ParamType.String,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.int,
        ),
      }.withoutNulls;

  static DataKomalStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataKomalStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        unitZis: deserializeStructParam(
          data['unit_zis'],
          ParamType.DataStruct,
          false,
          structBuilder: UnitZisStruct.fromSerializableMap,
        ),
        trxDate: deserializeParam(
          data['trx_date'],
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
  String toString() => 'DataKomalStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataKomalStruct &&
        id == other.id &&
        unitZis == other.unitZis &&
        trxDate == other.trxDate &&
        amount == other.amount;
  }

  @override
  int get hashCode => const ListEquality().hash([id, unitZis, trxDate, amount]);
}

DataKomalStruct createDataKomalStruct({
  int? id,
  UnitZisStruct? unitZis,
  String? trxDate,
  int? amount,
}) =>
    DataKomalStruct(
      id: id,
      unitZis: unitZis ?? UnitZisStruct(),
      trxDate: trxDate,
      amount: amount,
    );
