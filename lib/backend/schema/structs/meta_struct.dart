// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MetaStruct extends BaseStruct {
  MetaStruct({
    int? currentPage,
    int? from,
    int? lastPage,
    List<LinksStruct>? links,
    String? path,
    int? perPage,
    int? to,
    int? total,
  })  : _currentPage = currentPage,
        _from = from,
        _lastPage = lastPage,
        _links = links,
        _path = path,
        _perPage = perPage,
        _to = to,
        _total = total;

  // "current_page" field.
  int? _currentPage;
  int get currentPage => _currentPage ?? 0;
  set currentPage(int? val) => _currentPage = val;

  void incrementCurrentPage(int amount) => currentPage = currentPage + amount;

  bool hasCurrentPage() => _currentPage != null;

  // "from" field.
  int? _from;
  int get from => _from ?? 0;
  set from(int? val) => _from = val;

  void incrementFrom(int amount) => from = from + amount;

  bool hasFrom() => _from != null;

  // "last_page" field.
  int? _lastPage;
  int get lastPage => _lastPage ?? 0;
  set lastPage(int? val) => _lastPage = val;

  void incrementLastPage(int amount) => lastPage = lastPage + amount;

  bool hasLastPage() => _lastPage != null;

  // "links" field.
  List<LinksStruct>? _links;
  List<LinksStruct> get links => _links ?? const [];
  set links(List<LinksStruct>? val) => _links = val;

  void updateLinks(Function(List<LinksStruct>) updateFn) {
    updateFn(_links ??= []);
  }

  bool hasLinks() => _links != null;

  // "path" field.
  String? _path;
  String get path => _path ?? '';
  set path(String? val) => _path = val;

  bool hasPath() => _path != null;

  // "per_page" field.
  int? _perPage;
  int get perPage => _perPage ?? 0;
  set perPage(int? val) => _perPage = val;

  void incrementPerPage(int amount) => perPage = perPage + amount;

  bool hasPerPage() => _perPage != null;

  // "to" field.
  int? _to;
  int get to => _to ?? 0;
  set to(int? val) => _to = val;

  void incrementTo(int amount) => to = to + amount;

  bool hasTo() => _to != null;

  // "total" field.
  int? _total;
  int get total => _total ?? 0;
  set total(int? val) => _total = val;

  void incrementTotal(int amount) => total = total + amount;

  bool hasTotal() => _total != null;

  static MetaStruct fromMap(Map<String, dynamic> data) => MetaStruct(
        currentPage: castToType<int>(data['current_page']),
        from: castToType<int>(data['from']),
        lastPage: castToType<int>(data['last_page']),
        links: getStructList(
          data['links'],
          LinksStruct.fromMap,
        ),
        path: data['path'] as String?,
        perPage: castToType<int>(data['per_page']),
        to: castToType<int>(data['to']),
        total: castToType<int>(data['total']),
      );

  static MetaStruct? maybeFromMap(dynamic data) =>
      data is Map ? MetaStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'current_page': _currentPage,
        'from': _from,
        'last_page': _lastPage,
        'links': _links?.map((e) => e.toMap()).toList(),
        'path': _path,
        'per_page': _perPage,
        'to': _to,
        'total': _total,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'current_page': serializeParam(
          _currentPage,
          ParamType.int,
        ),
        'from': serializeParam(
          _from,
          ParamType.int,
        ),
        'last_page': serializeParam(
          _lastPage,
          ParamType.int,
        ),
        'links': serializeParam(
          _links,
          ParamType.DataStruct,
          isList: true,
        ),
        'path': serializeParam(
          _path,
          ParamType.String,
        ),
        'per_page': serializeParam(
          _perPage,
          ParamType.int,
        ),
        'to': serializeParam(
          _to,
          ParamType.int,
        ),
        'total': serializeParam(
          _total,
          ParamType.int,
        ),
      }.withoutNulls;

  static MetaStruct fromSerializableMap(Map<String, dynamic> data) =>
      MetaStruct(
        currentPage: deserializeParam(
          data['current_page'],
          ParamType.int,
          false,
        ),
        from: deserializeParam(
          data['from'],
          ParamType.int,
          false,
        ),
        lastPage: deserializeParam(
          data['last_page'],
          ParamType.int,
          false,
        ),
        links: deserializeStructParam<LinksStruct>(
          data['links'],
          ParamType.DataStruct,
          true,
          structBuilder: LinksStruct.fromSerializableMap,
        ),
        path: deserializeParam(
          data['path'],
          ParamType.String,
          false,
        ),
        perPage: deserializeParam(
          data['per_page'],
          ParamType.int,
          false,
        ),
        to: deserializeParam(
          data['to'],
          ParamType.int,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'MetaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MetaStruct &&
        currentPage == other.currentPage &&
        from == other.from &&
        lastPage == other.lastPage &&
        listEquality.equals(links, other.links) &&
        path == other.path &&
        perPage == other.perPage &&
        to == other.to &&
        total == other.total;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([currentPage, from, lastPage, links, path, perPage, to, total]);
}

MetaStruct createMetaStruct({
  int? currentPage,
  int? from,
  int? lastPage,
  String? path,
  int? perPage,
  int? to,
  int? total,
}) =>
    MetaStruct(
      currentPage: currentPage,
      from: from,
      lastPage: lastPage,
      path: path,
      perPage: perPage,
      to: to,
      total: total,
    );
