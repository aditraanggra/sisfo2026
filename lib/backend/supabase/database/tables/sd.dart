import '../database.dart';

class SdTable extends SupabaseTable<SdRow> {
  @override
  String get tableName => 'sd';

  @override
  SdRow createRow(Map<String, dynamic> data) => SdRow(data);
}

class SdRow extends SupabaseDataRow {
  SdRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SdTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nama => getField<String>('nama');
  set nama(String? value) => setField<String>('nama', value);

  String? get kecamatan => getField<String>('kecamatan');
  set kecamatan(String? value) => setField<String>('kecamatan', value);

  String? get npsn => getField<String>('npsn');
  set npsn(String? value) => setField<String>('npsn', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get kecamatanId => getField<int>('kecamatan_id');
  set kecamatanId(int? value) => setField<int>('kecamatan_id', value);
}
