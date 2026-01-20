import '../database.dart';

class ZakatFitrahTable extends SupabaseTable<ZakatFitrahRow> {
  @override
  String get tableName => 'zakat_fitrah';

  @override
  ZakatFitrahRow createRow(Map<String, dynamic> data) => ZakatFitrahRow(data);
}

class ZakatFitrahRow extends SupabaseDataRow {
  ZakatFitrahRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ZakatFitrahTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime? get tglTransaksi => getField<DateTime>('tgl_transaksi');
  set tglTransaksi(DateTime? value) =>
      setField<DateTime>('tgl_transaksi', value);

  String get profileId => getField<String>('profile_id')!;
  set profileId(String value) => setField<String>('profile_id', value);

  String get namaMuzakki => getField<String>('nama_muzakki')!;
  set namaMuzakki(String value) => setField<String>('nama_muzakki', value);

  String? get alamat => getField<String>('alamat');
  set alamat(String? value) => setField<String>('alamat', value);

  double? get jmlZfBeras => getField<double>('jml_zf_beras');
  set jmlZfBeras(double? value) => setField<double>('jml_zf_beras', value);

  int? get jmlZfUang => getField<int>('jml_zf_uang');
  set jmlZfUang(int? value) => setField<int>('jml_zf_uang', value);

  int? get jmlMuzakki => getField<int>('jml_muzakki');
  set jmlMuzakki(int? value) => setField<int>('jml_muzakki', value);

  String? get keterangan => getField<String>('Keterangan');
  set keterangan(String? value) => setField<String>('Keterangan', value);

  int get idTransaksi => getField<int>('id_transaksi')!;
  set idTransaksi(int value) => setField<int>('id_transaksi', value);
}
