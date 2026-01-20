// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransaksiStruct extends BaseStruct {
  TransaksiStruct({
    List<String>? bulan,
    List<int>? zakat,
  })  : _bulan = bulan,
        _zakat = zakat;

  // "bulan" field.
  List<String>? _bulan;
  List<String> get bulan => _bulan ?? const [];
  set bulan(List<String>? val) => _bulan = val;

  void updateBulan(Function(List<String>) updateFn) {
    updateFn(_bulan ??= []);
  }

  bool hasBulan() => _bulan != null;

  // "zakat" field.
  List<int>? _zakat;
  List<int> get zakat => _zakat ?? const [];
  set zakat(List<int>? val) => _zakat = val;

  void updateZakat(Function(List<int>) updateFn) {
    updateFn(_zakat ??= []);
  }

  bool hasZakat() => _zakat != null;

  static TransaksiStruct fromMap(Map<String, dynamic> data) => TransaksiStruct(
        bulan: getDataList(data['bulan']),
        zakat: getDataList(data['zakat']),
      );

  static TransaksiStruct? maybeFromMap(dynamic data) => data is Map
      ? TransaksiStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'bulan': _bulan,
        'zakat': _zakat,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'bulan': serializeParam(
          _bulan,
          ParamType.String,
          isList: true,
        ),
        'zakat': serializeParam(
          _zakat,
          ParamType.int,
          isList: true,
        ),
      }.withoutNulls;

  static TransaksiStruct fromSerializableMap(Map<String, dynamic> data) =>
      TransaksiStruct(
        bulan: deserializeParam<String>(
          data['bulan'],
          ParamType.String,
          true,
        ),
        zakat: deserializeParam<int>(
          data['zakat'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'TransaksiStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TransaksiStruct &&
        listEquality.equals(bulan, other.bulan) &&
        listEquality.equals(zakat, other.zakat);
  }

  @override
  int get hashCode => const ListEquality().hash([bulan, zakat]);
}

TransaksiStruct createTransaksiStruct() => TransaksiStruct();
