import '../database.dart';

class PendistribusianTable extends SupabaseTable<PendistribusianRow> {
  @override
  String get tableName => 'pendistribusian';

  @override
  PendistribusianRow createRow(Map<String, dynamic> data) =>
      PendistribusianRow(data);
}

class PendistribusianRow extends SupabaseDataRow {
  PendistribusianRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PendistribusianTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime? get tglTransaksi => getField<DateTime>('tgl_transaksi');
  set tglTransaksi(DateTime? value) =>
      setField<DateTime>('tgl_transaksi', value);

  String? get profileId => getField<String>('profile_id');
  set profileId(String? value) => setField<String>('profile_id', value);

  String get namaMustahik => getField<String>('nama_mustahik')!;
  set namaMustahik(String value) => setField<String>('nama_mustahik', value);

  int? get nik => getField<int>('nik');
  set nik(int? value) => setField<int>('nik', value);

  String? get alamat => getField<String>('alamat');
  set alamat(String? value) => setField<String>('alamat', value);

  String get sumberDana => getField<String>('sumber_dana')!;
  set sumberDana(String value) => setField<String>('sumber_dana', value);

  String get asnaf => getField<String>('asnaf')!;
  set asnaf(String value) => setField<String>('asnaf', value);

  String get program => getField<String>('program')!;
  set program(String value) => setField<String>('program', value);

  double? get jmlBeras => getField<double>('jml_beras');
  set jmlBeras(double? value) => setField<double>('jml_beras', value);

  int? get jmlUang => getField<int>('jml_uang');
  set jmlUang(int? value) => setField<int>('jml_uang', value);

  int get penerimaManfaat => getField<int>('penerima_manfaat')!;
  set penerimaManfaat(int value) => setField<int>('penerima_manfaat', value);

  String? get keterangan => getField<String>('keterangan');
  set keterangan(String? value) => setField<String>('keterangan', value);

  int? get jmlBerasKeUang => getField<int>('jml_beras_ke_uang');
  set jmlBerasKeUang(int? value) => setField<int>('jml_beras_ke_uang', value);
}
