// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UpzStruct extends BaseStruct {
  UpzStruct({
    int? id,
    int? userId,
    int? categoryId,
    int? villageId,
    int? districtId,
    String? noSk,
    String? unitName,
    String? noRegister,
    String? address,
    String? unitLeader,
    String? unitAssistant,
    String? unitFinance,
    String? operatorPhone,
    int? ricePrice,
    bool? isVerified,
    int? profileCompletion,
    String? villageName,
    String? districtName,
  })  : _id = id,
        _userId = userId,
        _categoryId = categoryId,
        _villageId = villageId,
        _districtId = districtId,
        _noSk = noSk,
        _unitName = unitName,
        _noRegister = noRegister,
        _address = address,
        _unitLeader = unitLeader,
        _unitAssistant = unitAssistant,
        _unitFinance = unitFinance,
        _operatorPhone = operatorPhone,
        _ricePrice = ricePrice,
        _isVerified = isVerified,
        _profileCompletion = profileCompletion,
        _villageName = villageName,
        _districtName = districtName;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "user_id" field.
  int? _userId;
  int get userId => _userId ?? 0;
  set userId(int? val) => _userId = val;

  void incrementUserId(int amount) => userId = userId + amount;

  bool hasUserId() => _userId != null;

  // "category_id" field.
  int? _categoryId;
  int get categoryId => _categoryId ?? 0;
  set categoryId(int? val) => _categoryId = val;

  void incrementCategoryId(int amount) => categoryId = categoryId + amount;

  bool hasCategoryId() => _categoryId != null;

  // "village_id" field.
  int? _villageId;
  int get villageId => _villageId ?? 0;
  set villageId(int? val) => _villageId = val;

  void incrementVillageId(int amount) => villageId = villageId + amount;

  bool hasVillageId() => _villageId != null;

  // "district_id" field.
  int? _districtId;
  int get districtId => _districtId ?? 0;
  set districtId(int? val) => _districtId = val;

  void incrementDistrictId(int amount) => districtId = districtId + amount;

  bool hasDistrictId() => _districtId != null;

  // "no_sk" field.
  String? _noSk;
  String get noSk => _noSk ?? '';
  set noSk(String? val) => _noSk = val;

  bool hasNoSk() => _noSk != null;

  // "unit_name" field.
  String? _unitName;
  String get unitName => _unitName ?? '';
  set unitName(String? val) => _unitName = val;

  bool hasUnitName() => _unitName != null;

  // "no_register" field.
  String? _noRegister;
  String get noRegister => _noRegister ?? '';
  set noRegister(String? val) => _noRegister = val;

  bool hasNoRegister() => _noRegister != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "unit_leader" field.
  String? _unitLeader;
  String get unitLeader => _unitLeader ?? '';
  set unitLeader(String? val) => _unitLeader = val;

  bool hasUnitLeader() => _unitLeader != null;

  // "unit_assistant" field.
  String? _unitAssistant;
  String get unitAssistant => _unitAssistant ?? '';
  set unitAssistant(String? val) => _unitAssistant = val;

  bool hasUnitAssistant() => _unitAssistant != null;

  // "unit_finance" field.
  String? _unitFinance;
  String get unitFinance => _unitFinance ?? '';
  set unitFinance(String? val) => _unitFinance = val;

  bool hasUnitFinance() => _unitFinance != null;

  // "operator_phone" field.
  String? _operatorPhone;
  String get operatorPhone => _operatorPhone ?? '';
  set operatorPhone(String? val) => _operatorPhone = val;

  bool hasOperatorPhone() => _operatorPhone != null;

  // "rice_price" field.
  int? _ricePrice;
  int get ricePrice => _ricePrice ?? 0;
  set ricePrice(int? val) => _ricePrice = val;

  void incrementRicePrice(int amount) => ricePrice = ricePrice + amount;

  bool hasRicePrice() => _ricePrice != null;

  // "is_verified" field.
  bool? _isVerified;
  bool get isVerified => _isVerified ?? false;
  set isVerified(bool? val) => _isVerified = val;

  bool hasIsVerified() => _isVerified != null;

  // "profile_completion" field.
  int? _profileCompletion;
  int get profileCompletion => _profileCompletion ?? 0;
  set profileCompletion(int? val) => _profileCompletion = val;

  void incrementProfileCompletion(int amount) =>
      profileCompletion = profileCompletion + amount;

  bool hasProfileCompletion() => _profileCompletion != null;

  // "village_name" field.
  String? _villageName;
  String get villageName => _villageName ?? '';
  set villageName(String? val) => _villageName = val;

  bool hasVillageName() => _villageName != null;

  // "district_name" field.
  String? _districtName;
  String get districtName => _districtName ?? '';
  set districtName(String? val) => _districtName = val;

  bool hasDistrictName() => _districtName != null;

  static UpzStruct fromMap(Map<String, dynamic> data) => UpzStruct(
        id: castToType<int>(data['id']),
        userId: castToType<int>(data['user_id']),
        categoryId: castToType<int>(data['category_id']),
        villageId: castToType<int>(data['village_id']),
        districtId: castToType<int>(data['district_id']),
        noSk: data['no_sk'] as String?,
        unitName: data['unit_name'] as String?,
        noRegister: data['no_register'] as String?,
        address: data['address'] as String?,
        unitLeader: data['unit_leader'] as String?,
        unitAssistant: data['unit_assistant'] as String?,
        unitFinance: data['unit_finance'] as String?,
        operatorPhone: data['operator_phone'] as String?,
        ricePrice: castToType<int>(data['rice_price']),
        isVerified: data['is_verified'] as bool?,
        profileCompletion: castToType<int>(data['profile_completion']),
        villageName: data['village_name'] as String?,
        districtName: data['district_name'] as String?,
      );

  static UpzStruct? maybeFromMap(dynamic data) =>
      data is Map ? UpzStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'user_id': _userId,
        'category_id': _categoryId,
        'village_id': _villageId,
        'district_id': _districtId,
        'no_sk': _noSk,
        'unit_name': _unitName,
        'no_register': _noRegister,
        'address': _address,
        'unit_leader': _unitLeader,
        'unit_assistant': _unitAssistant,
        'unit_finance': _unitFinance,
        'operator_phone': _operatorPhone,
        'rice_price': _ricePrice,
        'is_verified': _isVerified,
        'profile_completion': _profileCompletion,
        'village_name': _villageName,
        'district_name': _districtName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.int,
        ),
        'category_id': serializeParam(
          _categoryId,
          ParamType.int,
        ),
        'village_id': serializeParam(
          _villageId,
          ParamType.int,
        ),
        'district_id': serializeParam(
          _districtId,
          ParamType.int,
        ),
        'no_sk': serializeParam(
          _noSk,
          ParamType.String,
        ),
        'unit_name': serializeParam(
          _unitName,
          ParamType.String,
        ),
        'no_register': serializeParam(
          _noRegister,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'unit_leader': serializeParam(
          _unitLeader,
          ParamType.String,
        ),
        'unit_assistant': serializeParam(
          _unitAssistant,
          ParamType.String,
        ),
        'unit_finance': serializeParam(
          _unitFinance,
          ParamType.String,
        ),
        'operator_phone': serializeParam(
          _operatorPhone,
          ParamType.String,
        ),
        'rice_price': serializeParam(
          _ricePrice,
          ParamType.int,
        ),
        'is_verified': serializeParam(
          _isVerified,
          ParamType.bool,
        ),
        'profile_completion': serializeParam(
          _profileCompletion,
          ParamType.int,
        ),
        'village_name': serializeParam(
          _villageName,
          ParamType.String,
        ),
        'district_name': serializeParam(
          _districtName,
          ParamType.String,
        ),
      }.withoutNulls;

  static UpzStruct fromSerializableMap(Map<String, dynamic> data) => UpzStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.int,
          false,
        ),
        categoryId: deserializeParam(
          data['category_id'],
          ParamType.int,
          false,
        ),
        villageId: deserializeParam(
          data['village_id'],
          ParamType.int,
          false,
        ),
        districtId: deserializeParam(
          data['district_id'],
          ParamType.int,
          false,
        ),
        noSk: deserializeParam(
          data['no_sk'],
          ParamType.String,
          false,
        ),
        unitName: deserializeParam(
          data['unit_name'],
          ParamType.String,
          false,
        ),
        noRegister: deserializeParam(
          data['no_register'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        unitLeader: deserializeParam(
          data['unit_leader'],
          ParamType.String,
          false,
        ),
        unitAssistant: deserializeParam(
          data['unit_assistant'],
          ParamType.String,
          false,
        ),
        unitFinance: deserializeParam(
          data['unit_finance'],
          ParamType.String,
          false,
        ),
        operatorPhone: deserializeParam(
          data['operator_phone'],
          ParamType.String,
          false,
        ),
        ricePrice: deserializeParam(
          data['rice_price'],
          ParamType.int,
          false,
        ),
        isVerified: deserializeParam(
          data['is_verified'],
          ParamType.bool,
          false,
        ),
        profileCompletion: deserializeParam(
          data['profile_completion'],
          ParamType.int,
          false,
        ),
        villageName: deserializeParam(
          data['village_name'],
          ParamType.String,
          false,
        ),
        districtName: deserializeParam(
          data['district_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UpzStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UpzStruct &&
        id == other.id &&
        userId == other.userId &&
        categoryId == other.categoryId &&
        villageId == other.villageId &&
        districtId == other.districtId &&
        noSk == other.noSk &&
        unitName == other.unitName &&
        noRegister == other.noRegister &&
        address == other.address &&
        unitLeader == other.unitLeader &&
        unitAssistant == other.unitAssistant &&
        unitFinance == other.unitFinance &&
        operatorPhone == other.operatorPhone &&
        ricePrice == other.ricePrice &&
        isVerified == other.isVerified &&
        profileCompletion == other.profileCompletion &&
        villageName == other.villageName &&
        districtName == other.districtName;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        userId,
        categoryId,
        villageId,
        districtId,
        noSk,
        unitName,
        noRegister,
        address,
        unitLeader,
        unitAssistant,
        unitFinance,
        operatorPhone,
        ricePrice,
        isVerified,
        profileCompletion,
        villageName,
        districtName
      ]);
}

UpzStruct createUpzStruct({
  int? id,
  int? userId,
  int? categoryId,
  int? villageId,
  int? districtId,
  String? noSk,
  String? unitName,
  String? noRegister,
  String? address,
  String? unitLeader,
  String? unitAssistant,
  String? unitFinance,
  String? operatorPhone,
  int? ricePrice,
  bool? isVerified,
  int? profileCompletion,
  String? villageName,
  String? districtName,
}) =>
    UpzStruct(
      id: id,
      userId: userId,
      categoryId: categoryId,
      villageId: villageId,
      districtId: districtId,
      noSk: noSk,
      unitName: unitName,
      noRegister: noRegister,
      address: address,
      unitLeader: unitLeader,
      unitAssistant: unitAssistant,
      unitFinance: unitFinance,
      operatorPhone: operatorPhone,
      ricePrice: ricePrice,
      isVerified: isVerified,
      profileCompletion: profileCompletion,
      villageName: villageName,
      districtName: districtName,
    );
