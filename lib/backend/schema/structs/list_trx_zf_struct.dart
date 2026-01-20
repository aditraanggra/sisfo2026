// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListTrxZfStruct extends BaseStruct {
  ListTrxZfStruct({
    List<DataZfStruct>? dataZf,
    LinksPageStruct? linksPage,
    MetaStruct? meta,
  })  : _dataZf = dataZf,
        _linksPage = linksPage,
        _meta = meta;

  // "data_zf" field.
  List<DataZfStruct>? _dataZf;
  List<DataZfStruct> get dataZf => _dataZf ?? const [];
  set dataZf(List<DataZfStruct>? val) => _dataZf = val;

  void updateDataZf(Function(List<DataZfStruct>) updateFn) {
    updateFn(_dataZf ??= []);
  }

  bool hasDataZf() => _dataZf != null;

  // "links_page" field.
  LinksPageStruct? _linksPage;
  LinksPageStruct get linksPage => _linksPage ?? LinksPageStruct();
  set linksPage(LinksPageStruct? val) => _linksPage = val;

  void updateLinksPage(Function(LinksPageStruct) updateFn) {
    updateFn(_linksPage ??= LinksPageStruct());
  }

  bool hasLinksPage() => _linksPage != null;

  // "meta" field.
  MetaStruct? _meta;
  MetaStruct get meta => _meta ?? MetaStruct();
  set meta(MetaStruct? val) => _meta = val;

  void updateMeta(Function(MetaStruct) updateFn) {
    updateFn(_meta ??= MetaStruct());
  }

  bool hasMeta() => _meta != null;

  static ListTrxZfStruct fromMap(Map<String, dynamic> data) => ListTrxZfStruct(
        dataZf: getStructList(
          data['data_zf'],
          DataZfStruct.fromMap,
        ),
        linksPage: data['links_page'] is LinksPageStruct
            ? data['links_page']
            : LinksPageStruct.maybeFromMap(data['links_page']),
        meta: data['meta'] is MetaStruct
            ? data['meta']
            : MetaStruct.maybeFromMap(data['meta']),
      );

  static ListTrxZfStruct? maybeFromMap(dynamic data) => data is Map
      ? ListTrxZfStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data_zf': _dataZf?.map((e) => e.toMap()).toList(),
        'links_page': _linksPage?.toMap(),
        'meta': _meta?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data_zf': serializeParam(
          _dataZf,
          ParamType.DataStruct,
          isList: true,
        ),
        'links_page': serializeParam(
          _linksPage,
          ParamType.DataStruct,
        ),
        'meta': serializeParam(
          _meta,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ListTrxZfStruct fromSerializableMap(Map<String, dynamic> data) =>
      ListTrxZfStruct(
        dataZf: deserializeStructParam<DataZfStruct>(
          data['data_zf'],
          ParamType.DataStruct,
          true,
          structBuilder: DataZfStruct.fromSerializableMap,
        ),
        linksPage: deserializeStructParam(
          data['links_page'],
          ParamType.DataStruct,
          false,
          structBuilder: LinksPageStruct.fromSerializableMap,
        ),
        meta: deserializeStructParam(
          data['meta'],
          ParamType.DataStruct,
          false,
          structBuilder: MetaStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ListTrxZfStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ListTrxZfStruct &&
        listEquality.equals(dataZf, other.dataZf) &&
        linksPage == other.linksPage &&
        meta == other.meta;
  }

  @override
  int get hashCode => const ListEquality().hash([dataZf, linksPage, meta]);
}

ListTrxZfStruct createListTrxZfStruct({
  LinksPageStruct? linksPage,
  MetaStruct? meta,
}) =>
    ListTrxZfStruct(
      linksPage: linksPage ?? LinksPageStruct(),
      meta: meta ?? MetaStruct(),
    );
