import '../database.dart';

class RekapDskl2023Table extends SupabaseTable<RekapDskl2023Row> {
  @override
  String get tableName => 'rekap_dskl_2023';

  @override
  RekapDskl2023Row createRow(Map<String, dynamic> data) =>
      RekapDskl2023Row(data);
}

class RekapDskl2023Row extends SupabaseDataRow {
  RekapDskl2023Row(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RekapDskl2023Table();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get profileId => getField<String>('profile_id');
  set profileId(String? value) => setField<String>('profile_id', value);

  int? get totalDskl => getField<int>('total_dskl');
  set totalDskl(int? value) => setField<int>('total_dskl', value);

  int? get totalKotakAmal => getField<int>('total_kotak_amal');
  set totalKotakAmal(int? value) => setField<int>('total_kotak_amal', value);

  int? get totalFidyah => getField<int>('total_fidyah');
  set totalFidyah(int? value) => setField<int>('total_fidyah', value);

  int? get totalQurban => getField<int>('total_qurban');
  set totalQurban(int? value) => setField<int>('total_qurban', value);

  int? get desaId => getField<int>('desa_id');
  set desaId(int? value) => setField<int>('desa_id', value);

  int? get kecamatanId => getField<int>('kecamatan_id');
  set kecamatanId(int? value) => setField<int>('kecamatan_id', value);

  String? get kategoriaUpz => getField<String>('kategoria_upz');
  set kategoriaUpz(String? value) => setField<String>('kategoria_upz', value);

  String? get registerUpz => getField<String>('register_upz');
  set registerUpz(String? value) => setField<String>('register_upz', value);

  String? get namaUpz => getField<String>('nama_upz');
  set namaUpz(String? value) => setField<String>('nama_upz', value);
}
