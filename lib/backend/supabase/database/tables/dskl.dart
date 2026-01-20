import '../database.dart';

class DsklTable extends SupabaseTable<DsklRow> {
  @override
  String get tableName => 'dskl';

  @override
  DsklRow createRow(Map<String, dynamic> data) => DsklRow(data);
}

class DsklRow extends SupabaseDataRow {
  DsklRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DsklTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime? get tglTransaksi => getField<DateTime>('tgl_transaksi');
  set tglTransaksi(DateTime? value) =>
      setField<DateTime>('tgl_transaksi', value);

  String? get profileId => getField<String>('profile_id');
  set profileId(String? value) => setField<String>('profile_id', value);

  String? get jenisDskl => getField<String>('jenis_dskl');
  set jenisDskl(String? value) => setField<String>('jenis_dskl', value);

  String? get namaMuzakki => getField<String>('nama_muzakki');
  set namaMuzakki(String? value) => setField<String>('nama_muzakki', value);

  String? get alamat => getField<String>('alamat');
  set alamat(String? value) => setField<String>('alamat', value);

  int? get jmlKotakAmal => getField<int>('jml_kotak_amal');
  set jmlKotakAmal(int? value) => setField<int>('jml_kotak_amal', value);

  int? get jmlQurbanSapi => getField<int>('jml_qurban_sapi');
  set jmlQurbanSapi(int? value) => setField<int>('jml_qurban_sapi', value);

  int? get hargaQurbanSapi => getField<int>('harga_qurban_sapi');
  set hargaQurbanSapi(int? value) => setField<int>('harga_qurban_sapi', value);

  int? get jmlQurbanKambing => getField<int>('jml_qurban_kambing');
  set jmlQurbanKambing(int? value) =>
      setField<int>('jml_qurban_kambing', value);

  int? get hargaQurbanKambing => getField<int>('harga_qurban_kambing');
  set hargaQurbanKambing(int? value) =>
      setField<int>('harga_qurban_kambing', value);

  int? get jmlQurbanDomba => getField<int>('jml_qurban_domba');
  set jmlQurbanDomba(int? value) => setField<int>('jml_qurban_domba', value);

  int? get hargaQurbanDomba => getField<int>('harga_qurban_domba');
  set hargaQurbanDomba(int? value) =>
      setField<int>('harga_qurban_domba', value);

  String? get keterangan => getField<String>('keterangan');
  set keterangan(String? value) => setField<String>('keterangan', value);

  int? get totalQurban => getField<int>('total_qurban');
  set totalQurban(int? value) => setField<int>('total_qurban', value);

  int get idTransaksi => getField<int>('id_transaksi')!;
  set idTransaksi(int value) => setField<int>('id_transaksi', value);
}
