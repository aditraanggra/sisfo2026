// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SekolahSdStruct extends BaseStruct {
  SekolahSdStruct({
    int? id,
    String? nama,
    String? kecamatan,
    String? npsn,
    int? kecamatanId,
  })  : _id = id,
        _nama = nama,
        _kecamatan = kecamatan,
        _npsn = npsn,
        _kecamatanId = kecamatanId;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "nama" field.
  String? _nama;
  String get nama => _nama ?? '';
  set nama(String? val) => _nama = val;

  bool hasNama() => _nama != null;

  // "kecamatan" field.
  String? _kecamatan;
  String get kecamatan => _kecamatan ?? '';
  set kecamatan(String? val) => _kecamatan = val;

  bool hasKecamatan() => _kecamatan != null;

  // "npsn" field.
  String? _npsn;
  String get npsn => _npsn ?? '';
  set npsn(String? val) => _npsn = val;

  bool hasNpsn() => _npsn != null;

  // "kecamatan_id" field.
  int? _kecamatanId;
  int get kecamatanId => _kecamatanId ?? 0;
  set kecamatanId(int? val) => _kecamatanId = val;

  void incrementKecamatanId(int amount) => kecamatanId = kecamatanId + amount;

  bool hasKecamatanId() => _kecamatanId != null;

  static SekolahSdStruct fromMap(Map<String, dynamic> data) => SekolahSdStruct(
        id: castToType<int>(data['id']),
        nama: data['nama'] as String?,
        kecamatan: data['kecamatan'] as String?,
        npsn: data['npsn'] as String?,
        kecamatanId: castToType<int>(data['kecamatan_id']),
      );

  static SekolahSdStruct? maybeFromMap(dynamic data) => data is Map
      ? SekolahSdStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'nama': _nama,
        'kecamatan': _kecamatan,
        'npsn': _npsn,
        'kecamatan_id': _kecamatanId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'nama': serializeParam(
          _nama,
          ParamType.String,
        ),
        'kecamatan': serializeParam(
          _kecamatan,
          ParamType.String,
        ),
        'npsn': serializeParam(
          _npsn,
          ParamType.String,
        ),
        'kecamatan_id': serializeParam(
          _kecamatanId,
          ParamType.int,
        ),
      }.withoutNulls;

  static SekolahSdStruct fromSerializableMap(Map<String, dynamic> data) =>
      SekolahSdStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        nama: deserializeParam(
          data['nama'],
          ParamType.String,
          false,
        ),
        kecamatan: deserializeParam(
          data['kecamatan'],
          ParamType.String,
          false,
        ),
        npsn: deserializeParam(
          data['npsn'],
          ParamType.String,
          false,
        ),
        kecamatanId: deserializeParam(
          data['kecamatan_id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'SekolahSdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SekolahSdStruct &&
        id == other.id &&
        nama == other.nama &&
        kecamatan == other.kecamatan &&
        npsn == other.npsn &&
        kecamatanId == other.kecamatanId;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, nama, kecamatan, npsn, kecamatanId]);
}

SekolahSdStruct createSekolahSdStruct({
  int? id,
  String? nama,
  String? kecamatan,
  String? npsn,
  int? kecamatanId,
}) =>
    SekolahSdStruct(
      id: id,
      nama: nama,
      kecamatan: kecamatan,
      npsn: npsn,
      kecamatanId: kecamatanId,
    );
