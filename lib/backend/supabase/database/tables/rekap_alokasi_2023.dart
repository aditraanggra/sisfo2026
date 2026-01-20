import '../database.dart';

class RekapAlokasi2023Table extends SupabaseTable<RekapAlokasi2023Row> {
  @override
  String get tableName => 'rekap_alokasi_2023';

  @override
  RekapAlokasi2023Row createRow(Map<String, dynamic> data) =>
      RekapAlokasi2023Row(data);
}

class RekapAlokasi2023Row extends SupabaseDataRow {
  RekapAlokasi2023Row(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RekapAlokasi2023Table();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get profileId => getField<String>('profile_id')!;
  set profileId(String value) => setField<String>('profile_id', value);

  int? get zfSetorBaznas => getField<int>('zf_setor_baznas');
  set zfSetorBaznas(int? value) => setField<int>('zf_setor_baznas', value);

  int? get zmSetorBaznas => getField<int>('zm_setor_baznas');
  set zmSetorBaznas(int? value) => setField<int>('zm_setor_baznas', value);

  int? get ifsSetorBaznas => getField<int>('ifs_setor_baznas');
  set ifsSetorBaznas(int? value) => setField<int>('ifs_setor_baznas', value);

  int? get zfKelolaUpz => getField<int>('zf_kelola_upz');
  set zfKelolaUpz(int? value) => setField<int>('zf_kelola_upz', value);

  int? get zmKelolaUpz => getField<int>('zm_kelola_upz');
  set zmKelolaUpz(int? value) => setField<int>('zm_kelola_upz', value);

  int? get ifsKelolaUpz => getField<int>('ifs_kelola_upz');
  set ifsKelolaUpz(int? value) => setField<int>('ifs_kelola_upz', value);

  int? get apZfUpz => getField<int>('ap_zf_upz');
  set apZfUpz(int? value) => setField<int>('ap_zf_upz', value);

  int? get apZmUpz => getField<int>('ap_zm_upz');
  set apZmUpz(int? value) => setField<int>('ap_zm_upz', value);

  int? get apIfsUpz => getField<int>('ap_ifs_upz');
  set apIfsUpz(int? value) => setField<int>('ap_ifs_upz', value);

  int? get totalApUpz => getField<int>('total_ap_upz');
  set totalApUpz(int? value) => setField<int>('total_ap_upz', value);

  int? get haZfUpz => getField<int>('ha_zf_upz');
  set haZfUpz(int? value) => setField<int>('ha_zf_upz', value);

  int? get haZmUpz => getField<int>('ha_zm_upz');
  set haZmUpz(int? value) => setField<int>('ha_zm_upz', value);

  int? get haIfsUpz => getField<int>('ha_ifs_upz');
  set haIfsUpz(int? value) => setField<int>('ha_ifs_upz', value);

  int? get haDsklUpz => getField<int>('ha_dskl_upz');
  set haDsklUpz(int? value) => setField<int>('ha_dskl_upz', value);

  int? get totalHaUpz => getField<int>('total_ha_upz');
  set totalHaUpz(int? value) => setField<int>('total_ha_upz', value);

  int? get apDsklUpz => getField<int>('ap_dskl_upz');
  set apDsklUpz(int? value) => setField<int>('ap_dskl_upz', value);

  int? get hakOperator => getField<int>('hak_operator');
  set hakOperator(int? value) => setField<int>('hak_operator', value);

  double? get apZfBeras => getField<double>('ap_zf_beras');
  set apZfBeras(double? value) => setField<double>('ap_zf_beras', value);

  double? get kelolaZfBeras => getField<double>('kelola_zf_beras');
  set kelolaZfBeras(double? value) =>
      setField<double>('kelola_zf_beras', value);

  int? get kelolaZfUang => getField<int>('kelola_zf_uang');
  set kelolaZfUang(int? value) => setField<int>('kelola_zf_uang', value);

  int? get apZfUang => getField<int>('ap_zf_uang');
  set apZfUang(int? value) => setField<int>('ap_zf_uang', value);

  int? get haZfUang => getField<int>('ha_zf_uang');
  set haZfUang(int? value) => setField<int>('ha_zf_uang', value);

  double? get haZfBeras => getField<double>('ha_zf_beras');
  set haZfBeras(double? value) => setField<double>('ha_zf_beras', value);

  int? get desaId => getField<int>('desa_id');
  set desaId(int? value) => setField<int>('desa_id', value);

  int? get kecamatanId => getField<int>('kecamatan_id');
  set kecamatanId(int? value) => setField<int>('kecamatan_id', value);

  double get setorZfBeras => getField<double>('setor_zf_beras')!;
  set setorZfBeras(double value) => setField<double>('setor_zf_beras', value);

  int get setorZfUang => getField<int>('setor_zf_uang')!;
  set setorZfUang(int value) => setField<int>('setor_zf_uang', value);

  int get setorZfBerasToUang => getField<int>('setor_zf_beras_to_uang')!;
  set setorZfBerasToUang(int value) =>
      setField<int>('setor_zf_beras_to_uang', value);
}
