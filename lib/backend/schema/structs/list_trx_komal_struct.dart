// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListTrxKomalStruct extends BaseStruct {
  ListTrxKomalStruct({
    List<DataKomalStruct>? dataKomal,
  }) : _dataKomal = dataKomal;

  // "data_komal" field.
  List<DataKomalStruct>? _dataKomal;
  List<DataKomalStruct> get dataKomal => _dataKomal ?? const [];
  set dataKomal(List<DataKomalStruct>? val) => _dataKomal = val;

  void updateDataKomal(Function(List<DataKomalStruct>) updateFn) {
    updateFn(_dataKomal ??= []);
  }

  bool hasDataKomal() => _dataKomal != null;

  static ListTrxKomalStruct fromMap(Map<String, dynamic> data) =>
      ListTrxKomalStruct(
        dataKomal: getStructList(
          data['data_komal'],
          DataKomalStruct.fromMap,
        ),
      );

  static ListTrxKomalStruct? maybeFromMap(dynamic data) => data is Map
      ? ListTrxKomalStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data_komal': _dataKomal?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data_komal': serializeParam(
          _dataKomal,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static ListTrxKomalStruct fromSerializableMap(Map<String, dynamic> data) =>
      ListTrxKomalStruct(
        dataKomal: deserializeStructParam<DataKomalStruct>(
          data['data_komal'],
          ParamType.DataStruct,
          true,
          structBuilder: DataKomalStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ListTrxKomalStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ListTrxKomalStruct &&
        listEquality.equals(dataKomal, other.dataKomal);
  }

  @override
  int get hashCode => const ListEquality().hash([dataKomal]);
}

ListTrxKomalStruct createListTrxKomalStruct() => ListTrxKomalStruct();
