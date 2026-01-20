// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListTrxPendisStruct extends BaseStruct {
  ListTrxPendisStruct({
    List<DataPendisStruct>? dataPendis,
    LinksPendisStruct? linksPendis,
    MetaStruct? meta,
  })  : _dataPendis = dataPendis,
        _linksPendis = linksPendis,
        _meta = meta;

  // "data_pendis" field.
  List<DataPendisStruct>? _dataPendis;
  List<DataPendisStruct> get dataPendis => _dataPendis ?? const [];
  set dataPendis(List<DataPendisStruct>? val) => _dataPendis = val;

  void updateDataPendis(Function(List<DataPendisStruct>) updateFn) {
    updateFn(_dataPendis ??= []);
  }

  bool hasDataPendis() => _dataPendis != null;

  // "links_pendis" field.
  LinksPendisStruct? _linksPendis;
  LinksPendisStruct get linksPendis => _linksPendis ?? LinksPendisStruct();
  set linksPendis(LinksPendisStruct? val) => _linksPendis = val;

  void updateLinksPendis(Function(LinksPendisStruct) updateFn) {
    updateFn(_linksPendis ??= LinksPendisStruct());
  }

  bool hasLinksPendis() => _linksPendis != null;

  // "meta" field.
  MetaStruct? _meta;
  MetaStruct get meta => _meta ?? MetaStruct();
  set meta(MetaStruct? val) => _meta = val;

  void updateMeta(Function(MetaStruct) updateFn) {
    updateFn(_meta ??= MetaStruct());
  }

  bool hasMeta() => _meta != null;

  static ListTrxPendisStruct fromMap(Map<String, dynamic> data) =>
      ListTrxPendisStruct(
        dataPendis: getStructList(
          data['data_pendis'],
          DataPendisStruct.fromMap,
        ),
        linksPendis: data['links_pendis'] is LinksPendisStruct
            ? data['links_pendis']
            : LinksPendisStruct.maybeFromMap(data['links_pendis']),
        meta: data['meta'] is MetaStruct
            ? data['meta']
            : MetaStruct.maybeFromMap(data['meta']),
      );

  static ListTrxPendisStruct? maybeFromMap(dynamic data) => data is Map
      ? ListTrxPendisStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data_pendis': _dataPendis?.map((e) => e.toMap()).toList(),
        'links_pendis': _linksPendis?.toMap(),
        'meta': _meta?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data_pendis': serializeParam(
          _dataPendis,
          ParamType.DataStruct,
          isList: true,
        ),
        'links_pendis': serializeParam(
          _linksPendis,
          ParamType.DataStruct,
        ),
        'meta': serializeParam(
          _meta,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ListTrxPendisStruct fromSerializableMap(Map<String, dynamic> data) =>
      ListTrxPendisStruct(
        dataPendis: deserializeStructParam<DataPendisStruct>(
          data['data_pendis'],
          ParamType.DataStruct,
          true,
          structBuilder: DataPendisStruct.fromSerializableMap,
        ),
        linksPendis: deserializeStructParam(
          data['links_pendis'],
          ParamType.DataStruct,
          false,
          structBuilder: LinksPendisStruct.fromSerializableMap,
        ),
        meta: deserializeStructParam(
          data['meta'],
          ParamType.DataStruct,
          false,
          structBuilder: MetaStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ListTrxPendisStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ListTrxPendisStruct &&
        listEquality.equals(dataPendis, other.dataPendis) &&
        linksPendis == other.linksPendis &&
        meta == other.meta;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([dataPendis, linksPendis, meta]);
}

ListTrxPendisStruct createListTrxPendisStruct({
  LinksPendisStruct? linksPendis,
  MetaStruct? meta,
}) =>
    ListTrxPendisStruct(
      linksPendis: linksPendis ?? LinksPendisStruct(),
      meta: meta ?? MetaStruct(),
    );
