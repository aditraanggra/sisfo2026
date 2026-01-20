import '../database.dart';

class RekapSetor2023Table extends SupabaseTable<RekapSetor2023Row> {
  @override
  String get tableName => 'rekap_setor_2023';

  @override
  RekapSetor2023Row createRow(Map<String, dynamic> data) =>
      RekapSetor2023Row(data);
}

class RekapSetor2023Row extends SupabaseDataRow {
  RekapSetor2023Row(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RekapSetor2023Table();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get profileId => getField<String>('profile_id')!;
  set profileId(String value) => setField<String>('profile_id', value);

  int get totalSetor => getField<int>('total_setor')!;
  set totalSetor(int value) => setField<int>('total_setor', value);

  int? get totalSetorZf => getField<int>('total_setor_zf');
  set totalSetorZf(int? value) => setField<int>('total_setor_zf', value);

  int get totalSetorZm => getField<int>('total_setor_zm')!;
  set totalSetorZm(int value) => setField<int>('total_setor_zm', value);

  int? get totalSetorIfs => getField<int>('total_setor_ifs');
  set totalSetorIfs(int? value) => setField<int>('total_setor_ifs', value);

  int? get desaId => getField<int>('desa_id');
  set desaId(int? value) => setField<int>('desa_id', value);

  int? get kecamatanId => getField<int>('kecamatan_id');
  set kecamatanId(int? value) => setField<int>('kecamatan_id', value);

  int get totalSetorZfUang => getField<int>('total_setor_zf_uang')!;
  set totalSetorZfUang(int value) =>
      setField<int>('total_setor_zf_uang', value);

  double get totalSetorZfBeras => getField<double>('total_setor_zf_beras')!;
  set totalSetorZfBeras(double value) =>
      setField<double>('total_setor_zf_beras', value);

  int get totalSetorZfBerasToUang =>
      getField<int>('total_setor_zf_beras_to_uang')!;
  set totalSetorZfBerasToUang(int value) =>
      setField<int>('total_setor_zf_beras_to_uang', value);

  String? get kategoriaUpz => getField<String>('kategoria_upz');
  set kategoriaUpz(String? value) => setField<String>('kategoria_upz', value);

  String? get registerUpz => getField<String>('register_upz');
  set registerUpz(String? value) => setField<String>('register_upz', value);

  String? get namaUpz => getField<String>('nama_upz');
  set namaUpz(String? value) => setField<String>('nama_upz', value);
}
