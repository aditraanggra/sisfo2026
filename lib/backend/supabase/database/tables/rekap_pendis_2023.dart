import '../database.dart';

class RekapPendis2023Table extends SupabaseTable<RekapPendis2023Row> {
  @override
  String get tableName => 'rekap_pendis_2023';

  @override
  RekapPendis2023Row createRow(Map<String, dynamic> data) =>
      RekapPendis2023Row(data);
}

class RekapPendis2023Row extends SupabaseDataRow {
  RekapPendis2023Row(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RekapPendis2023Table();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get profileId => getField<String>('profile_id')!;
  set profileId(String value) => setField<String>('profile_id', value);

  int? get totalPendisZfUang => getField<int>('total_pendis_zf_uang');
  set totalPendisZfUang(int? value) =>
      setField<int>('total_pendis_zf_uang', value);

  int? get totalPendisZm => getField<int>('total_pendis_zm');
  set totalPendisZm(int? value) => setField<int>('total_pendis_zm', value);

  int? get totalPendisIfs => getField<int>('total_pendis_ifs');
  set totalPendisIfs(int? value) => setField<int>('total_pendis_ifs', value);

  int? get totalPendisDskl => getField<int>('total_pendis_dskl');
  set totalPendisDskl(int? value) => setField<int>('total_pendis_dskl', value);

  int? get fakir => getField<int>('fakir');
  set fakir(int? value) => setField<int>('fakir', value);

  int? get miskin => getField<int>('miskin');
  set miskin(int? value) => setField<int>('miskin', value);

  int? get ghorimin => getField<int>('ghorimin');
  set ghorimin(int? value) => setField<int>('ghorimin', value);

  int? get mualaf => getField<int>('mualaf');
  set mualaf(int? value) => setField<int>('mualaf', value);

  int? get fiesabilillah => getField<int>('fiesabilillah');
  set fiesabilillah(int? value) => setField<int>('fiesabilillah', value);

  int? get ibnusabil => getField<int>('ibnusabil');
  set ibnusabil(int? value) => setField<int>('ibnusabil', value);

  int? get riqob => getField<int>('riqob');
  set riqob(int? value) => setField<int>('riqob', value);

  int? get amil => getField<int>('amil');
  set amil(int? value) => setField<int>('amil', value);

  int? get operasional => getField<int>('operasional');
  set operasional(int? value) => setField<int>('operasional', value);

  int? get kemanusiaan => getField<int>('kemanusiaan');
  set kemanusiaan(int? value) => setField<int>('kemanusiaan', value);

  int? get kesehatan => getField<int>('kesehatan');
  set kesehatan(int? value) => setField<int>('kesehatan', value);

  int? get pendidikan => getField<int>('pendidikan');
  set pendidikan(int? value) => setField<int>('pendidikan', value);

  int? get ekonomi => getField<int>('ekonomi');
  set ekonomi(int? value) => setField<int>('ekonomi', value);

  int? get dakwah => getField<int>('dakwah');
  set dakwah(int? value) => setField<int>('dakwah', value);

  double? get totalPendisZfBeras => getField<double>('total_pendis_zf_beras');
  set totalPendisZfBeras(double? value) =>
      setField<double>('total_pendis_zf_beras', value);

  int? get totalPendisZf => getField<int>('total_pendis_zf');
  set totalPendisZf(int? value) => setField<int>('total_pendis_zf', value);

  int? get totalPendisZfBerasToUang =>
      getField<int>('total_pendis_zf_beras_to_uang');
  set totalPendisZfBerasToUang(int? value) =>
      setField<int>('total_pendis_zf_beras_to_uang', value);

  int get jmlMustahik => getField<int>('jml_mustahik')!;
  set jmlMustahik(int value) => setField<int>('jml_mustahik', value);

  int? get totalPendis => getField<int>('total_pendis');
  set totalPendis(int? value) => setField<int>('total_pendis', value);

  int get pHaZfUang => getField<int>('p_ha_zf_uang')!;
  set pHaZfUang(int value) => setField<int>('p_ha_zf_uang', value);

  double get pHaZfBeras => getField<double>('p_ha_zf_beras')!;
  set pHaZfBeras(double value) => setField<double>('p_ha_zf_beras', value);

  int get pHaZm => getField<int>('p_ha_zm')!;
  set pHaZm(int value) => setField<int>('p_ha_zm', value);

  int get pHaIfs => getField<int>('p_ha_ifs')!;
  set pHaIfs(int value) => setField<int>('p_ha_ifs', value);

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

  int? get pHaZfBerasToUang => getField<int>('p_ha_zf_beras_to_uang');
  set pHaZfBerasToUang(int? value) =>
      setField<int>('p_ha_zf_beras_to_uang', value);

  int? get totalPendistribusianHakAmil =>
      getField<int>('total_pendistribusian_hak_amil');
  set totalPendistribusianHakAmil(int? value) =>
      setField<int>('total_pendistribusian_hak_amil', value);
}
