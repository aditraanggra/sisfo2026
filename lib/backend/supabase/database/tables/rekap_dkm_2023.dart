import '../database.dart';

class RekapDkm2023Table extends SupabaseTable<RekapDkm2023Row> {
  @override
  String get tableName => 'rekap_dkm_2023';

  @override
  RekapDkm2023Row createRow(Map<String, dynamic> data) => RekapDkm2023Row(data);
}

class RekapDkm2023Row extends SupabaseDataRow {
  RekapDkm2023Row(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RekapDkm2023Table();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get profileId => getField<String>('profile_id');
  set profileId(String? value) => setField<String>('profile_id', value);

  String? get kategoriaUpz => getField<String>('kategoria_upz');
  set kategoriaUpz(String? value) => setField<String>('kategoria_upz', value);

  String? get registerUpz => getField<String>('register_upz');
  set registerUpz(String? value) => setField<String>('register_upz', value);

  String? get namaUpz => getField<String>('nama_upz');
  set namaUpz(String? value) => setField<String>('nama_upz', value);

  int? get kecamatanId => getField<int>('kecamatan_id');
  set kecamatanId(int? value) => setField<int>('kecamatan_id', value);

  int? get desaId => getField<int>('desa_id');
  set desaId(int? value) => setField<int>('desa_id', value);

  int get totalZis => getField<int>('total_zis')!;
  set totalZis(int value) => setField<int>('total_zis', value);

  int get totalPendis => getField<int>('total_pendis')!;
  set totalPendis(int value) => setField<int>('total_pendis', value);

  int get totalSetor => getField<int>('total_setor')!;
  set totalSetor(int value) => setField<int>('total_setor', value);

  int get totalMuzakki => getField<int>('total_muzakki')!;
  set totalMuzakki(int value) => setField<int>('total_muzakki', value);

  int get totalMustahik => getField<int>('total_mustahik')!;
  set totalMustahik(int value) => setField<int>('total_mustahik', value);
}
