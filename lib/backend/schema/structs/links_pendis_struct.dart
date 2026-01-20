// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LinksPendisStruct extends BaseStruct {
  LinksPendisStruct({
    String? first,
    String? last,
    String? prev,
    String? next,
  })  : _first = first,
        _last = last,
        _prev = prev,
        _next = next;

  // "first" field.
  String? _first;
  String get first => _first ?? '';
  set first(String? val) => _first = val;

  bool hasFirst() => _first != null;

  // "last" field.
  String? _last;
  String get last => _last ?? '';
  set last(String? val) => _last = val;

  bool hasLast() => _last != null;

  // "prev" field.
  String? _prev;
  String get prev => _prev ?? '';
  set prev(String? val) => _prev = val;

  bool hasPrev() => _prev != null;

  // "next" field.
  String? _next;
  String get next => _next ?? '';
  set next(String? val) => _next = val;

  bool hasNext() => _next != null;

  static LinksPendisStruct fromMap(Map<String, dynamic> data) =>
      LinksPendisStruct(
        first: data['first'] as String?,
        last: data['last'] as String?,
        prev: data['prev'] as String?,
        next: data['next'] as String?,
      );

  static LinksPendisStruct? maybeFromMap(dynamic data) => data is Map
      ? LinksPendisStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'first': _first,
        'last': _last,
        'prev': _prev,
        'next': _next,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'first': serializeParam(
          _first,
          ParamType.String,
        ),
        'last': serializeParam(
          _last,
          ParamType.String,
        ),
        'prev': serializeParam(
          _prev,
          ParamType.String,
        ),
        'next': serializeParam(
          _next,
          ParamType.String,
        ),
      }.withoutNulls;

  static LinksPendisStruct fromSerializableMap(Map<String, dynamic> data) =>
      LinksPendisStruct(
        first: deserializeParam(
          data['first'],
          ParamType.String,
          false,
        ),
        last: deserializeParam(
          data['last'],
          ParamType.String,
          false,
        ),
        prev: deserializeParam(
          data['prev'],
          ParamType.String,
          false,
        ),
        next: deserializeParam(
          data['next'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LinksPendisStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LinksPendisStruct &&
        first == other.first &&
        last == other.last &&
        prev == other.prev &&
        next == other.next;
  }

  @override
  int get hashCode => const ListEquality().hash([first, last, prev, next]);
}

LinksPendisStruct createLinksPendisStruct({
  String? first,
  String? last,
  String? prev,
  String? next,
}) =>
    LinksPendisStruct(
      first: first,
      last: last,
      prev: prev,
      next: next,
    );
