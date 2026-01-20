import '../database.dart';

class InfakTable extends SupabaseTable<InfakRow> {
  @override
  String get tableName => 'infak';

  @override
  InfakRow createRow(Map<String, dynamic> data) => InfakRow(data);
}

class InfakRow extends SupabaseDataRow {
  InfakRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => InfakTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get profileId => getField<String>('profile_id')!;
  set profileId(String value) => setField<String>('profile_id', value);

  DateTime get tglTransaksi => getField<DateTime>('tgl_transaksi')!;
  set tglTransaksi(DateTime value) =>
      setField<DateTime>('tgl_transaksi', value);

  String get namaMuzakki => getField<String>('nama_muzakki')!;
  set namaMuzakki(String value) => setField<String>('nama_muzakki', value);

  String? get alamat => getField<String>('alamat');
  set alamat(String? value) => setField<String>('alamat', value);

  int get jmlInfak => getField<int>('jml_infak')!;
  set jmlInfak(int value) => setField<int>('jml_infak', value);

  String? get keterangan => getField<String>('keterangan');
  set keterangan(String? value) => setField<String>('keterangan', value);

  int get idTransaksi => getField<int>('id_transaksi')!;
  set idTransaksi(int value) => setField<int>('id_transaksi', value);
}
