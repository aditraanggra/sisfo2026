import '../database.dart';

class SetorZisTable extends SupabaseTable<SetorZisRow> {
  @override
  String get tableName => 'setor_zis';

  @override
  SetorZisRow createRow(Map<String, dynamic> data) => SetorZisRow(data);
}

class SetorZisRow extends SupabaseDataRow {
  SetorZisRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SetorZisTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get profileId => getField<String>('profile_id');
  set profileId(String? value) => setField<String>('profile_id', value);

  DateTime? get tglSetor => getField<DateTime>('tgl_setor');
  set tglSetor(DateTime? value) => setField<DateTime>('tgl_setor', value);

  int? get totalSetor => getField<int>('total_setor');
  set totalSetor(int? value) => setField<int>('total_setor', value);

  int? get setorZf => getField<int>('setor_zf');
  set setorZf(int? value) => setField<int>('setor_zf', value);

  int? get setorZm => getField<int>('setor_zm');
  set setorZm(int? value) => setField<int>('setor_zm', value);

  int? get setorIfs => getField<int>('setor_ifs');
  set setorIfs(int? value) => setField<int>('setor_ifs', value);

  String? get buktiSetor => getField<String>('bukti_setor');
  set buktiSetor(String? value) => setField<String>('bukti_setor', value);

  String? get keterangan => getField<String>('keterangan');
  set keterangan(String? value) => setField<String>('keterangan', value);

  int get setorZfUang => getField<int>('setor_zf_uang')!;
  set setorZfUang(int value) => setField<int>('setor_zf_uang', value);

  double get setorZfBeras => getField<double>('setor_zf_beras')!;
  set setorZfBeras(double value) => setField<double>('setor_zf_beras', value);

  int get setorZfBerasToUang => getField<int>('setor_zf_beras_to_uang')!;
  set setorZfBerasToUang(int value) =>
      setField<int>('setor_zf_beras_to_uang', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get validasi => getField<String>('validasi');
  set validasi(String? value) => setField<String>('validasi', value);
}
