// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListTrxSetorStruct extends BaseStruct {
  ListTrxSetorStruct({
    List<DataSetorStruct>? dataSetor,
  }) : _dataSetor = dataSetor;

  // "data_setor" field.
  List<DataSetorStruct>? _dataSetor;
  List<DataSetorStruct> get dataSetor => _dataSetor ?? const [];
  set dataSetor(List<DataSetorStruct>? val) => _dataSetor = val;

  void updateDataSetor(Function(List<DataSetorStruct>) updateFn) {
    updateFn(_dataSetor ??= []);
  }

  bool hasDataSetor() => _dataSetor != null;

  static ListTrxSetorStruct fromMap(Map<String, dynamic> data) =>
      ListTrxSetorStruct(
        dataSetor: getStructList(
          data['data_setor'],
          DataSetorStruct.fromMap,
        ),
      );

  static ListTrxSetorStruct? maybeFromMap(dynamic data) => data is Map
      ? ListTrxSetorStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data_setor': _dataSetor?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data_setor': serializeParam(
          _dataSetor,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static ListTrxSetorStruct fromSerializableMap(Map<String, dynamic> data) =>
      ListTrxSetorStruct(
        dataSetor: deserializeStructParam<DataSetorStruct>(
          data['data_setor'],
          ParamType.DataStruct,
          true,
          structBuilder: DataSetorStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ListTrxSetorStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ListTrxSetorStruct &&
        listEquality.equals(dataSetor, other.dataSetor);
  }

  @override
  int get hashCode => const ListEquality().hash([dataSetor]);
}

ListTrxSetorStruct createListTrxSetorStruct() => ListTrxSetorStruct();
