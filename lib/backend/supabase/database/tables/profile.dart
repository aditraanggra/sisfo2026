import '../database.dart';

class ProfileTable extends SupabaseTable<ProfileRow> {
  @override
  String get tableName => 'profile';

  @override
  ProfileRow createRow(Map<String, dynamic> data) => ProfileRow(data);
}

class ProfileRow extends SupabaseDataRow {
  ProfileRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProfileTable();

  String get profileId => getField<String>('profile_id')!;
  set profileId(String value) => setField<String>('profile_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get namaOperator => getField<String>('nama_operator');
  set namaOperator(String? value) => setField<String>('nama_operator', value);

  String? get namaUpz => getField<String>('nama_upz');
  set namaUpz(String? value) => setField<String>('nama_upz', value);

  String get registerUpz => getField<String>('register_upz')!;
  set registerUpz(String value) => setField<String>('register_upz', value);

  String? get alamat => getField<String>('alamat');
  set alamat(String? value) => setField<String>('alamat', value);

  int? get kecamatanId => getField<int>('kecamatan_id');
  set kecamatanId(int? value) => setField<int>('kecamatan_id', value);

  int get desaId => getField<int>('desa_id')!;
  set desaId(int value) => setField<int>('desa_id', value);

  String? get ketua => getField<String>('ketua');
  set ketua(String? value) => setField<String>('ketua', value);

  String? get sekretaris => getField<String>('sekretaris');
  set sekretaris(String? value) => setField<String>('sekretaris', value);

  String? get bendahara => getField<String>('bendahara');
  set bendahara(String? value) => setField<String>('bendahara', value);

  String? get skUpload => getField<String>('sk_upload');
  set skUpload(String? value) => setField<String>('sk_upload', value);

  String? get avatar => getField<String>('avatar');
  set avatar(String? value) => setField<String>('avatar', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get kategoriaUpz => getField<String>('kategoria_upz');
  set kategoriaUpz(String? value) => setField<String>('kategoria_upz', value);

  bool get isVerified => getField<bool>('is_verified')!;
  set isVerified(bool value) => setField<bool>('is_verified', value);

  int? get hargaPerkulak => getField<int>('harga_perkulak');
  set hargaPerkulak(int? value) => setField<int>('harga_perkulak', value);

  int? get hargaBeras => getField<int>('harga_beras');
  set hargaBeras(int? value) => setField<int>('harga_beras', value);

  String? get noSk => getField<String>('no_sk');
  set noSk(String? value) => setField<String>('no_sk', value);

  String? get namaKecamatan => getField<String>('nama_kecamatan');
  set namaKecamatan(String? value) => setField<String>('nama_kecamatan', value);

  String? get namaDesa => getField<String>('nama_desa');
  set namaDesa(String? value) => setField<String>('nama_desa', value);

  bool? get menuZf => getField<bool>('menu_zf');
  set menuZf(bool? value) => setField<bool>('menu_zf', value);

  bool? get menuQurban => getField<bool>('menu_qurban');
  set menuQurban(bool? value) => setField<bool>('menu_qurban', value);
}
