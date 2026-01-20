import '../database.dart';

class RekapZis2023Table extends SupabaseTable<RekapZis2023Row> {
  @override
  String get tableName => 'rekap_zis_2023';

  @override
  RekapZis2023Row createRow(Map<String, dynamic> data) => RekapZis2023Row(data);
}

class RekapZis2023Row extends SupabaseDataRow {
  RekapZis2023Row(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RekapZis2023Table();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get profileId => getField<String>('profile_id');
  set profileId(String? value) => setField<String>('profile_id', value);

  int? get totalZf => getField<int>('total_zf');
  set totalZf(int? value) => setField<int>('total_zf', value);

  int? get totalZm => getField<int>('total_zm');
  set totalZm(int? value) => setField<int>('total_zm', value);

  int? get totalIfs => getField<int>('total_ifs');
  set totalIfs(int? value) => setField<int>('total_ifs', value);

  int? get totalZfUang => getField<int>('total_zf_uang');
  set totalZfUang(int? value) => setField<int>('total_zf_uang', value);

  double? get totalZfBeras => getField<double>('total_zf_beras');
  set totalZfBeras(double? value) => setField<double>('total_zf_beras', value);

  int? get zfBerasToUang => getField<int>('zf_beras_to_uang');
  set zfBerasToUang(int? value) => setField<int>('zf_beras_to_uang', value);

  int get totalMuzakki => getField<int>('total_muzakki')!;
  set totalMuzakki(int value) => setField<int>('total_muzakki', value);

  int get zfMuzakki => getField<int>('zf_muzakki')!;
  set zfMuzakki(int value) => setField<int>('zf_muzakki', value);

  int get zmMuzakki => getField<int>('zm_muzakki')!;
  set zmMuzakki(int value) => setField<int>('zm_muzakki', value);

  int get ifsMuzakki => getField<int>('ifs_muzakki')!;
  set ifsMuzakki(int value) => setField<int>('ifs_muzakki', value);

  int? get totalZis => getField<int>('total_zis');
  set totalZis(int? value) => setField<int>('total_zis', value);

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
