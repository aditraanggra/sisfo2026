// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListTrxZmStruct extends BaseStruct {
  ListTrxZmStruct({
    List<DataZmStruct>? dataZm,
    LinksZmStruct? linksZm,
    MetaStruct? meta,
  })  : _dataZm = dataZm,
        _linksZm = linksZm,
        _meta = meta;

  // "data_zm" field.
  List<DataZmStruct>? _dataZm;
  List<DataZmStruct> get dataZm => _dataZm ?? const [];
  set dataZm(List<DataZmStruct>? val) => _dataZm = val;

  void updateDataZm(Function(List<DataZmStruct>) updateFn) {
    updateFn(_dataZm ??= []);
  }

  bool hasDataZm() => _dataZm != null;

  // "links_zm" field.
  LinksZmStruct? _linksZm;
  LinksZmStruct get linksZm => _linksZm ?? LinksZmStruct();
  set linksZm(LinksZmStruct? val) => _linksZm = val;

  void updateLinksZm(Function(LinksZmStruct) updateFn) {
    updateFn(_linksZm ??= LinksZmStruct());
  }

  bool hasLinksZm() => _linksZm != null;

  // "meta" field.
  MetaStruct? _meta;
  MetaStruct get meta => _meta ?? MetaStruct();
  set meta(MetaStruct? val) => _meta = val;

  void updateMeta(Function(MetaStruct) updateFn) {
    updateFn(_meta ??= MetaStruct());
  }

  bool hasMeta() => _meta != null;

  static ListTrxZmStruct fromMap(Map<String, dynamic> data) => ListTrxZmStruct(
        dataZm: getStructList(
          data['data_zm'],
          DataZmStruct.fromMap,
        ),
        linksZm: data['links_zm'] is LinksZmStruct
            ? data['links_zm']
            : LinksZmStruct.maybeFromMap(data['links_zm']),
        meta: data['meta'] is MetaStruct
            ? data['meta']
            : MetaStruct.maybeFromMap(data['meta']),
      );

  static ListTrxZmStruct? maybeFromMap(dynamic data) => data is Map
      ? ListTrxZmStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data_zm': _dataZm?.map((e) => e.toMap()).toList(),
        'links_zm': _linksZm?.toMap(),
        'meta': _meta?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data_zm': serializeParam(
          _dataZm,
          ParamType.DataStruct,
          isList: true,
        ),
        'links_zm': serializeParam(
          _linksZm,
          ParamType.DataStruct,
        ),
        'meta': serializeParam(
          _meta,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ListTrxZmStruct fromSerializableMap(Map<String, dynamic> data) =>
      ListTrxZmStruct(
        dataZm: deserializeStructParam<DataZmStruct>(
          data['data_zm'],
          ParamType.DataStruct,
          true,
          structBuilder: DataZmStruct.fromSerializableMap,
        ),
        linksZm: deserializeStructParam(
          data['links_zm'],
          ParamType.DataStruct,
          false,
          structBuilder: LinksZmStruct.fromSerializableMap,
        ),
        meta: deserializeStructParam(
          data['meta'],
          ParamType.DataStruct,
          false,
          structBuilder: MetaStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ListTrxZmStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ListTrxZmStruct &&
        listEquality.equals(dataZm, other.dataZm) &&
        linksZm == other.linksZm &&
        meta == other.meta;
  }

  @override
  int get hashCode => const ListEquality().hash([dataZm, linksZm, meta]);
}

ListTrxZmStruct createListTrxZmStruct({
  LinksZmStruct? linksZm,
  MetaStruct? meta,
}) =>
    ListTrxZmStruct(
      linksZm: linksZm ?? LinksZmStruct(),
      meta: meta ?? MetaStruct(),
    );
