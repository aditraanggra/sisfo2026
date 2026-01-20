// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListTrxInfakStruct extends BaseStruct {
  ListTrxInfakStruct({
    List<DataIfsStruct>? dataIfs,
    LinksIfsStruct? linksIfs,
    MetaStruct? meta,
  })  : _dataIfs = dataIfs,
        _linksIfs = linksIfs,
        _meta = meta;

  // "data_ifs" field.
  List<DataIfsStruct>? _dataIfs;
  List<DataIfsStruct> get dataIfs => _dataIfs ?? const [];
  set dataIfs(List<DataIfsStruct>? val) => _dataIfs = val;

  void updateDataIfs(Function(List<DataIfsStruct>) updateFn) {
    updateFn(_dataIfs ??= []);
  }

  bool hasDataIfs() => _dataIfs != null;

  // "links_ifs" field.
  LinksIfsStruct? _linksIfs;
  LinksIfsStruct get linksIfs => _linksIfs ?? LinksIfsStruct();
  set linksIfs(LinksIfsStruct? val) => _linksIfs = val;

  void updateLinksIfs(Function(LinksIfsStruct) updateFn) {
    updateFn(_linksIfs ??= LinksIfsStruct());
  }

  bool hasLinksIfs() => _linksIfs != null;

  // "meta" field.
  MetaStruct? _meta;
  MetaStruct get meta => _meta ?? MetaStruct();
  set meta(MetaStruct? val) => _meta = val;

  void updateMeta(Function(MetaStruct) updateFn) {
    updateFn(_meta ??= MetaStruct());
  }

  bool hasMeta() => _meta != null;

  static ListTrxInfakStruct fromMap(Map<String, dynamic> data) =>
      ListTrxInfakStruct(
        dataIfs: getStructList(
          data['data_ifs'],
          DataIfsStruct.fromMap,
        ),
        linksIfs: data['links_ifs'] is LinksIfsStruct
            ? data['links_ifs']
            : LinksIfsStruct.maybeFromMap(data['links_ifs']),
        meta: data['meta'] is MetaStruct
            ? data['meta']
            : MetaStruct.maybeFromMap(data['meta']),
      );

  static ListTrxInfakStruct? maybeFromMap(dynamic data) => data is Map
      ? ListTrxInfakStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data_ifs': _dataIfs?.map((e) => e.toMap()).toList(),
        'links_ifs': _linksIfs?.toMap(),
        'meta': _meta?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data_ifs': serializeParam(
          _dataIfs,
          ParamType.DataStruct,
          isList: true,
        ),
        'links_ifs': serializeParam(
          _linksIfs,
          ParamType.DataStruct,
        ),
        'meta': serializeParam(
          _meta,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ListTrxInfakStruct fromSerializableMap(Map<String, dynamic> data) =>
      ListTrxInfakStruct(
        dataIfs: deserializeStructParam<DataIfsStruct>(
          data['data_ifs'],
          ParamType.DataStruct,
          true,
          structBuilder: DataIfsStruct.fromSerializableMap,
        ),
        linksIfs: deserializeStructParam(
          data['links_ifs'],
          ParamType.DataStruct,
          false,
          structBuilder: LinksIfsStruct.fromSerializableMap,
        ),
        meta: deserializeStructParam(
          data['meta'],
          ParamType.DataStruct,
          false,
          structBuilder: MetaStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ListTrxInfakStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ListTrxInfakStruct &&
        listEquality.equals(dataIfs, other.dataIfs) &&
        linksIfs == other.linksIfs &&
        meta == other.meta;
  }

  @override
  int get hashCode => const ListEquality().hash([dataIfs, linksIfs, meta]);
}

ListTrxInfakStruct createListTrxInfakStruct({
  LinksIfsStruct? linksIfs,
  MetaStruct? meta,
}) =>
    ListTrxInfakStruct(
      linksIfs: linksIfs ?? LinksIfsStruct(),
      meta: meta ?? MetaStruct(),
    );
