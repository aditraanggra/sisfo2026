import '../database.dart';

class DesaTable extends SupabaseTable<DesaRow> {
  @override
  String get tableName => 'desa';

  @override
  DesaRow createRow(Map<String, dynamic> data) => DesaRow(data);
}

class DesaRow extends SupabaseDataRow {
  DesaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DesaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get kecamatanId => getField<int>('kecamatan_id');
  set kecamatanId(int? value) => setField<int>('kecamatan_id', value);

  String? get namaDesa => getField<String>('nama_desa');
  set namaDesa(String? value) => setField<String>('nama_desa', value);
}
