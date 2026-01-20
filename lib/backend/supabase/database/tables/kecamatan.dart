import '../database.dart';

class KecamatanTable extends SupabaseTable<KecamatanRow> {
  @override
  String get tableName => 'kecamatan';

  @override
  KecamatanRow createRow(Map<String, dynamic> data) => KecamatanRow(data);
}

class KecamatanRow extends SupabaseDataRow {
  KecamatanRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => KecamatanTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get namaKecamatan => getField<String>('nama_kecamatan');
  set namaKecamatan(String? value) => setField<String>('nama_kecamatan', value);

  int get desa => getField<int>('Desa')!;
  set desa(int value) => setField<int>('Desa', value);

  int get dkm => getField<int>('DKM')!;
  set dkm(int value) => setField<int>('DKM', value);
}
