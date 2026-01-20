import '../database.dart';

class ZakatMalTable extends SupabaseTable<ZakatMalRow> {
  @override
  String get tableName => 'zakat_mal';

  @override
  ZakatMalRow createRow(Map<String, dynamic> data) => ZakatMalRow(data);
}

class ZakatMalRow extends SupabaseDataRow {
  ZakatMalRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ZakatMalTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get tglTransaksi => getField<DateTime>('tgl_transaksi')!;
  set tglTransaksi(DateTime value) =>
      setField<DateTime>('tgl_transaksi', value);

  String get profileId => getField<String>('profile_id')!;
  set profileId(String value) => setField<String>('profile_id', value);

  String get jenisZakatMal => getField<String>('jenis_zakat_mal')!;
  set jenisZakatMal(String value) => setField<String>('jenis_zakat_mal', value);

  String get namaMuzakki => getField<String>('nama_muzakki')!;
  set namaMuzakki(String value) => setField<String>('nama_muzakki', value);

  String? get alamat => getField<String>('alamat');
  set alamat(String? value) => setField<String>('alamat', value);

  int get jmlZm => getField<int>('jml_zm')!;
  set jmlZm(int value) => setField<int>('jml_zm', value);

  String? get keterangan => getField<String>('keterangan');
  set keterangan(String? value) => setField<String>('keterangan', value);

  int get idTransaksi => getField<int>('id_transaksi')!;
  set idTransaksi(int value) => setField<int>('id_transaksi', value);
}
