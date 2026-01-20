// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LinksStruct extends BaseStruct {
  LinksStruct({
    String? url,
    String? label,
    bool? active,
  })  : _url = url,
        _label = label,
        _active = active;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

  static LinksStruct fromMap(Map<String, dynamic> data) => LinksStruct(
        url: data['url'] as String?,
        label: data['label'] as String?,
        active: data['active'] as bool?,
      );

  static LinksStruct? maybeFromMap(dynamic data) =>
      data is Map ? LinksStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'url': _url,
        'label': _label,
        'active': _active,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'active': serializeParam(
          _active,
          ParamType.bool,
        ),
      }.withoutNulls;

  static LinksStruct fromSerializableMap(Map<String, dynamic> data) =>
      LinksStruct(
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        active: deserializeParam(
          data['active'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'LinksStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LinksStruct &&
        url == other.url &&
        label == other.label &&
        active == other.active;
  }

  @override
  int get hashCode => const ListEquality().hash([url, label, active]);
}

LinksStruct createLinksStruct({
  String? url,
  String? label,
  bool? active,
}) =>
    LinksStruct(
      url: url,
      label: label,
      active: active,
    );
