import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start API Supabase Group Code

class APISupabaseGroup {
  static String getBaseUrl() =>
      'https://jxzqpwcahrynoeplktoe.supabase.co/rest/v1/';
  static Map<String, String> headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp4enFwd2NhaHJ5bm9lcGxrdG9lIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTM5MDM5NzAsImV4cCI6MjAwOTQ3OTk3MH0.5vFWSuZIY6_9Yt1L1bC0J-Qg2n5yJOB2dLjXuUQ0V3c',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp4enFwd2NhaHJ5bm9lcGxrdG9lIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTM5MDM5NzAsImV4cCI6MjAwOTQ3OTk3MH0.5vFWSuZIY6_9Yt1L1bC0J-Qg2n5yJOB2dLjXuUQ0V3c',
  };
  static GetSDCall getSDCall = GetSDCall();
  static GetSDRowCall getSDRowCall = GetSDRowCall();
  static GetSMPRowCall getSMPRowCall = GetSMPRowCall();
  static GetSMPCall getSMPCall = GetSMPCall();
}

class GetSDCall {
  Future<ApiCallResponse> call({
    String? kecamatanId = '',
  }) async {
    final baseUrl = APISupabaseGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get SD',
      apiUrl: '${baseUrl}sd?kecamatan_id=eq.${kecamatanId}',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp4enFwd2NhaHJ5bm9lcGxrdG9lIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTM5MDM5NzAsImV4cCI6MjAwOTQ3OTk3MH0.5vFWSuZIY6_9Yt1L1bC0J-Qg2n5yJOB2dLjXuUQ0V3c',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp4enFwd2NhaHJ5bm9lcGxrdG9lIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTM5MDM5NzAsImV4cCI6MjAwOTQ3OTk3MH0.5vFWSuZIY6_9Yt1L1bC0J-Qg2n5yJOB2dLjXuUQ0V3c',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetSDRowCall {
  Future<ApiCallResponse> call({
    String? npsn = '',
  }) async {
    final baseUrl = APISupabaseGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get SD Row',
      apiUrl: '${baseUrl}sd?npsn=eq.${npsn}',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp4enFwd2NhaHJ5bm9lcGxrdG9lIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTM5MDM5NzAsImV4cCI6MjAwOTQ3OTk3MH0.5vFWSuZIY6_9Yt1L1bC0J-Qg2n5yJOB2dLjXuUQ0V3c',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp4enFwd2NhaHJ5bm9lcGxrdG9lIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTM5MDM5NzAsImV4cCI6MjAwOTQ3OTk3MH0.5vFWSuZIY6_9Yt1L1bC0J-Qg2n5yJOB2dLjXuUQ0V3c',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? namaSekolah(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].nama''',
      ));
  String? noNpsn(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].npsn''',
      ));
}

class GetSMPRowCall {
  Future<ApiCallResponse> call({
    String? npsn = '',
  }) async {
    final baseUrl = APISupabaseGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get SMP Row',
      apiUrl: '${baseUrl}smp?npsn=eq.${npsn}',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp4enFwd2NhaHJ5bm9lcGxrdG9lIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTM5MDM5NzAsImV4cCI6MjAwOTQ3OTk3MH0.5vFWSuZIY6_9Yt1L1bC0J-Qg2n5yJOB2dLjXuUQ0V3c',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp4enFwd2NhaHJ5bm9lcGxrdG9lIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTM5MDM5NzAsImV4cCI6MjAwOTQ3OTk3MH0.5vFWSuZIY6_9Yt1L1bC0J-Qg2n5yJOB2dLjXuUQ0V3c',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? namaSekolah(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].nama''',
      ));
  String? noNpsn(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].npsn''',
      ));
}

class GetSMPCall {
  Future<ApiCallResponse> call({
    String? kecamatanId = '',
  }) async {
    final baseUrl = APISupabaseGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get SMP',
      apiUrl: '${baseUrl}smp?kecamatan_id=eq.${kecamatanId}',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp4enFwd2NhaHJ5bm9lcGxrdG9lIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTM5MDM5NzAsImV4cCI6MjAwOTQ3OTk3MH0.5vFWSuZIY6_9Yt1L1bC0J-Qg2n5yJOB2dLjXuUQ0V3c',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp4enFwd2NhaHJ5bm9lcGxrdG9lIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTM5MDM5NzAsImV4cCI6MjAwOTQ3OTk3MH0.5vFWSuZIY6_9Yt1L1bC0J-Qg2n5yJOB2dLjXuUQ0V3c',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End API Supabase Group Code

/// Start AuthEndPoint Group Code

class AuthEndPointGroup {
  static String getBaseUrl() =>
      'https://sisfo-upz-sisfoupz-webapp.2rxwkd.easypanel.host/api/v1';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  static LoginUserCall loginUserCall = LoginUserCall();
  static RegisterUserCall registerUserCall = RegisterUserCall();
  static LogoutUserCall logoutUserCall = LogoutUserCall();
  static GetUPZCall getUPZCall = GetUPZCall();
  static AddZakatFitrahCall addZakatFitrahCall = AddZakatFitrahCall();
  static UpdateZakatFitrahCall updateZakatFitrahCall = UpdateZakatFitrahCall();
  static DeleteZakatFitrahCall deleteZakatFitrahCall = DeleteZakatFitrahCall();
  static GetZakatFitrahCall getZakatFitrahCall = GetZakatFitrahCall();
  static AddProfileUPZCall addProfileUPZCall = AddProfileUPZCall();
  static UpdateProfileUPZCall updateProfileUPZCall = UpdateProfileUPZCall();
}

class LoginUserCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final baseUrl = AuthEndPointGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "password": "${escapeStringForJson(password)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login User',
      apiUrl: '${baseUrl}/login',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? authToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  dynamic user(dynamic response) => getJsonField(
        response,
        r'''$.user''',
      );
  int? userId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user.id''',
      ));
  String? userName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.name''',
      ));
  String? userEmail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.email''',
      ));
  String? authMassage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class RegisterUserCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? password = '',
    String? confirmPassword = '',
  }) async {
    final baseUrl = AuthEndPointGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "email": "${escapeStringForJson(email)}",
  "password": "${escapeStringForJson(password)}",
  "password_confirmation": "${escapeStringForJson(confirmPassword)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register User',
      apiUrl: '${baseUrl}/register',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LogoutUserCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = AuthEndPointGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Logout User',
      apiUrl: '${baseUrl}/logout',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUPZCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = AuthEndPointGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get UPZ',
      apiUrl: '${baseUrl}/unit-zis',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataUpz(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].id''',
      ));
  int? userId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].user_id''',
      ));
  int? categoryId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].category_id''',
      ));
  int? villageId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].village_id''',
      ));
  int? districtId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].district_id''',
      ));
  String? noRegister(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].no_register''',
      ));
  String? unitName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].unit_name''',
      ));
  String? noSk(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].no_sk''',
      ));
  String? address(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].address''',
      ));
  String? unitLead(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].unit_leader''',
      ));
  String? unitAssist(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].unit_assistant''',
      ));
  String? unitFinance(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].unit_finance''',
      ));
  String? opPhone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].operator_phone''',
      ));
  int? ricePrice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].rice_price''',
      ));
  bool? isVerified(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data[:].is_verified''',
      ));
  int? profileCompletion(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].profile_completion''',
      ));
  String? villageName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].village_name''',
      ));
  String? districtName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].district_name''',
      ));
}

class AddZakatFitrahCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? unitId,
    String? trxDate = '',
    String? muzakkiName = '',
    double? zfRice,
    int? zfAmount,
    int? totalMuzakki,
    String? desc = '',
  }) async {
    final baseUrl = AuthEndPointGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "unit_id": ${unitId},
  "trx_date": "${escapeStringForJson(trxDate)}",
  "muzakki_name": "${escapeStringForJson(muzakkiName)}",
  "zf_rice": ${zfRice},
  "zf_amount": ${zfAmount},
  "total_muzakki": ${totalMuzakki},
  "desc": "${escapeStringForJson(desc)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Zakat Fitrah',
      apiUrl: '${baseUrl}/zf',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateZakatFitrahCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? unitId,
    String? trxDate = '',
    String? muzakkiName = '',
    double? zfRice,
    int? zfAmount,
    int? totalMuzakki,
    String? desc = '',
    int? id,
  }) async {
    final baseUrl = AuthEndPointGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "unit_id": ${unitId},
  "trx_date": "${escapeStringForJson(trxDate)}",
  "muzakki_name": "${escapeStringForJson(muzakkiName)}",
  "zf_rice": ${zfRice},
  "zf_amount": ${zfAmount},
  "total_muzakki": ${totalMuzakki},
  "desc": "${escapeStringForJson(desc)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Zakat Fitrah',
      apiUrl: '${baseUrl}/zf/${id}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteZakatFitrahCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? id,
  }) async {
    final baseUrl = AuthEndPointGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Zakat Fitrah',
      apiUrl: '${baseUrl}/zf/${id}',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetZakatFitrahCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = AuthEndPointGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Zakat Fitrah',
      apiUrl: '${baseUrl}/zf',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataListZf(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class AddProfileUPZCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? userId,
    int? categoryId,
    int? villageId,
    int? districtId,
    String? noSk = '',
    String? unitName = '',
    String? noRegister = '',
    String? address = '',
    String? unitLeader = '',
    String? unitAssistant = '',
    String? unitFinance = '',
    String? operatorPhone = '',
    int? ricePrice,
    bool? isVerified,
    int? profileCompletion,
  }) async {
    final baseUrl = AuthEndPointGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": ${userId},
  "category_id": ${categoryId},
  "village_id": ${villageId},
  "district_id": ${districtId},
  "no_sk": "${escapeStringForJson(noSk)}",
  "unit_name": "${escapeStringForJson(unitName)}",
  "no_register": "${escapeStringForJson(noRegister)}",
  "address": "${escapeStringForJson(address)}",
  "unit_leader": "${escapeStringForJson(unitLeader)}",
  "unit_assistant": "${escapeStringForJson(unitAssistant)}",
  "unit_finance": "${escapeStringForJson(unitFinance)}",
  "operator_phone": "${escapeStringForJson(operatorPhone)}",
  "rice_price": ${ricePrice},
  "is_verified": ${isVerified},
  "profile_completion": ${profileCompletion}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Profile UPZ',
      apiUrl: '${baseUrl}/unit-zis',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateProfileUPZCall {
  Future<ApiCallResponse> call({
    int? id,
    int? userId,
    int? categoryId,
    int? villageId,
    int? districtId,
    String? noSk = '',
    String? unitName = '',
    String? noRegister = '',
    String? address = '',
    String? unitLeader = '',
    String? unitAssistant = '',
    String? unitFinance = '',
    String? operatorPhone = '',
    int? ricePrice,
    bool? isVerified,
    String? token = '',
  }) async {
    final baseUrl = AuthEndPointGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": ${userId},
  "category_id": ${categoryId},
  "village_id": ${villageId},
  "district_id": ${districtId},
  "no_sk": "${escapeStringForJson(noSk)}",
  "unit_name": "${escapeStringForJson(unitName)}",
  "no_register": "${escapeStringForJson(noRegister)}",
  "address": "${escapeStringForJson(address)}",
  "unit_leader": "${escapeStringForJson(unitLeader)}",
  "unit_assistant": "${escapeStringForJson(unitAssistant)}",
  "unit_finance": "${escapeStringForJson(unitFinance)}",
  "operator_phone": "${escapeStringForJson(operatorPhone)}",
  "rice_price": ${ricePrice},
  "is_verified": ${isVerified}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Profile UPZ',
      apiUrl: '${baseUrl}/unit-zis/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End AuthEndPoint Group Code

/// Start TransactionEndPoint Group Code

class TransactionEndPointGroup {
  static String getBaseUrl() =>
      'https://sisfo-upz-sisfoupz-webapp.2rxwkd.easypanel.host/api/v1';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Content': 'application/json',
  };
  static AddZakatMalCall addZakatMalCall = AddZakatMalCall();
  static AddSedekahCall addSedekahCall = AddSedekahCall();
  static AddFidyahCall addFidyahCall = AddFidyahCall();
  static AddKotakAmalCall addKotakAmalCall = AddKotakAmalCall();
  static AddPendistribusianCall addPendistribusianCall =
      AddPendistribusianCall();
  static AddSetorZISCall addSetorZISCall = AddSetorZISCall();
  static UpdateSetorZISCall updateSetorZISCall = UpdateSetorZISCall();
  static UpdatePendistribusianCall updatePendistribusianCall =
      UpdatePendistribusianCall();
  static UpdateZakatMalCall updateZakatMalCall = UpdateZakatMalCall();
  static UpdateSedekahCall updateSedekahCall = UpdateSedekahCall();
  static UpdateFidyahCall updateFidyahCall = UpdateFidyahCall();
  static UpdateKotakAmalCall updateKotakAmalCall = UpdateKotakAmalCall();
  static DeleteZakatMalCall deleteZakatMalCall = DeleteZakatMalCall();
  static DeleteSedekahCall deleteSedekahCall = DeleteSedekahCall();
  static DeleteFidyahCall deleteFidyahCall = DeleteFidyahCall();
  static DeleteKotakAmalCall deleteKotakAmalCall = DeleteKotakAmalCall();
  static DeletePendistribusianCall deletePendistribusianCall =
      DeletePendistribusianCall();
  static DeleteSetorZISCall deleteSetorZISCall = DeleteSetorZISCall();
  static GetZakatMaalCall getZakatMaalCall = GetZakatMaalCall();
  static GetSedekahCall getSedekahCall = GetSedekahCall();
  static GetFidyahCall getFidyahCall = GetFidyahCall();
  static GetKotakAmalCall getKotakAmalCall = GetKotakAmalCall();
  static GetPendistribusianCall getPendistribusianCall =
      GetPendistribusianCall();
  static GetSetorZISCall getSetorZISCall = GetSetorZISCall();
}

class AddZakatMalCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? unitId,
    String? trxDate = '',
    String? muzakkiName = '',
    String? categoryMaal = '',
    int? amount,
    String? desc = '',
  }) async {
    final baseUrl = TransactionEndPointGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "unit_id": ${unitId},
  "trx_date": "${escapeStringForJson(trxDate)}",
  "muzakki_name": "${escapeStringForJson(muzakkiName)}",
  "category_maal": "${escapeStringForJson(categoryMaal)}",
  "amount": ${amount},
  "desc": "${escapeStringForJson(desc)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Zakat Mal',
      apiUrl: '${baseUrl}/zm',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Content': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddSedekahCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? unitId,
    String? trxDate = '',
    String? munfiqName = '',
    int? amount,
    String? desc = '',
  }) async {
    final baseUrl = TransactionEndPointGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "unit_id": ${unitId},
  "trx_date": "${escapeStringForJson(trxDate)}",
  "munfiq_name": "${escapeStringForJson(munfiqName)}",
  "amount": ${amount},
  "desc": "${escapeStringForJson(desc)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Sedekah',
      apiUrl: '${baseUrl}/ifs',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Content': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddFidyahCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? unitId,
    String? trxDate = '',
    String? name = '',
    int? totalDay,
    int? amount,
  }) async {
    final baseUrl = TransactionEndPointGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "unit_id": ${unitId},
  "trx_date": "${escapeStringForJson(trxDate)}",
  "name": "${escapeStringForJson(name)}",
  "total_day": ${totalDay},
  "amount": ${amount}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Fidyah',
      apiUrl: '${baseUrl}/fidyah',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Content': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddKotakAmalCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? unitId,
    String? trxDate = '',
    String? desc = '',
    int? amount,
  }) async {
    final baseUrl = TransactionEndPointGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "unit_id": ${unitId},
  "trx_date": "${escapeStringForJson(trxDate)}",
  "amount": ${amount},
  "desc": "${escapeStringForJson(desc)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Kotak Amal',
      apiUrl: '${baseUrl}/kotak_amal',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Content': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddPendistribusianCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? unitId,
    String? trxDate = '',
    int? totalAmount,
    String? mustahikName = '',
    String? nik = '',
    String? fundType = '',
    String? asnaf = '',
    String? program = '',
    double? totalRice,
    int? beneficiary,
  }) async {
    final baseUrl = TransactionEndPointGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "unit_id": ${unitId},
  "trx_date": "${escapeStringForJson(trxDate)}",
  "mustahik_name": "${escapeStringForJson(mustahikName)}",
  "nik": "${escapeStringForJson(nik)}",
  "fund_type": "${escapeStringForJson(fundType)}",
  "asnaf": "${escapeStringForJson(asnaf)}",
  "program": "${escapeStringForJson(program)}",
  "total_rice": ${totalRice},
  "total_amount": ${totalAmount},
  "beneficiary": ${beneficiary}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Pendistribusian',
      apiUrl: '${baseUrl}/pendis',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Content': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddSetorZISCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? unitId,
    String? trxDate = '',
    int? zfAmountDeposit,
    double? zfRiceDeposit,
    int? zmAmountDeposit,
    int? ifsAmountDeposit,
    int? totalDeposit,
    String? status = '',
    String? validation = '',
    String? upload = '',
  }) async {
    final baseUrl = TransactionEndPointGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "unit_id": ${unitId},
  "trx_date": "${escapeStringForJson(trxDate)}",
  "zf_amount_deposit": ${zfAmountDeposit},
  "zf_rice_deposit": ${zfRiceDeposit},
  "zm_amount_deposit": ${zmAmountDeposit},
  "ifs_amount_deposit": ${ifsAmountDeposit},
  "total_deposit": ${totalDeposit},
  "status": "${escapeStringForJson(status)}",
  "validation": "${escapeStringForJson(validation)}",
  "upload": "${escapeStringForJson(upload)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Setor ZIS',
      apiUrl: '${baseUrl}/setor',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Content': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateSetorZISCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? unitId,
    String? trxDate = '',
    int? zfAmountDeposit,
    double? zfRiceDeposit,
    int? zmAmountDeposit,
    int? ifsAmountDeposit,
    int? totalDeposit,
    String? status = '',
    String? validation = '',
    String? upload = '',
    int? id,
  }) async {
    final baseUrl = TransactionEndPointGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "unit_id": ${unitId},
  "trx_date": "${escapeStringForJson(trxDate)}",
  "zf_amount_deposit": ${zfAmountDeposit},
  "zf_rice_deposit": ${zfRiceDeposit},
  "zm_amount_deposit": ${zmAmountDeposit},
  "ifs_amount_deposit": ${ifsAmountDeposit},
  "total_deposit": ${totalDeposit},
  "status": "${escapeStringForJson(status)}",
  "validation": "${escapeStringForJson(validation)}",
  "upload": "${escapeStringForJson(upload)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Setor ZIS',
      apiUrl: '${baseUrl}/setor/${id}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Content': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdatePendistribusianCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? unitId,
    String? trxDate = '',
    int? totalAmount,
    String? mustahikName = '',
    int? riceToAmount,
    String? nik = '',
    String? fundType = '',
    String? asnaf = '',
    String? program = '',
    double? totalRice,
    int? beneficiary,
    int? id,
  }) async {
    final baseUrl = TransactionEndPointGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "unit_id": ${unitId},
  "trx_date": "${escapeStringForJson(trxDate)}",
  "mustahik_name": "${escapeStringForJson(mustahikName)}",
  "nik": "${escapeStringForJson(nik)}",
  "fund_type": "${escapeStringForJson(fundType)}",
  "asnaf": "${escapeStringForJson(asnaf)}",
  "program": "${escapeStringForJson(program)}",
  "total_rice": ${totalRice},
  "total_amount": ${totalAmount},
  "beneficiary": ${beneficiary},
  "rice_to_amount": ${riceToAmount}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Pendistribusian',
      apiUrl: '${baseUrl}/pendis/${id}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Content': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateZakatMalCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? unitId,
    String? trxDate = '',
    String? muzakkiName = '',
    String? categoryMaal = '',
    int? amount,
    String? desc = '',
    int? id,
  }) async {
    final baseUrl = TransactionEndPointGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "unit_id": ${unitId},
  "trx_date": "${escapeStringForJson(trxDate)}",
  "muzakki_name": "${escapeStringForJson(muzakkiName)}",
  "category_maal": "${escapeStringForJson(categoryMaal)}",
  "amount": ${amount},
  "desc": "${escapeStringForJson(desc)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Zakat Mal',
      apiUrl: '${baseUrl}/zm/${id}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Content': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateSedekahCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? unitId,
    String? trxDate = '',
    String? munfiqName = '',
    int? amount,
    String? desc = '',
    int? id,
  }) async {
    final baseUrl = TransactionEndPointGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "unit_id": ${unitId},
  "trx_date": "${escapeStringForJson(trxDate)}",
  "munfiq_name": "${escapeStringForJson(munfiqName)}",
  "amount": ${amount},
  "desc": "${escapeStringForJson(desc)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Sedekah',
      apiUrl: '${baseUrl}/ifs/${id}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Content': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateFidyahCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? unitId,
    String? trxDate = '',
    String? name = '',
    int? amount,
    int? id,
    int? totalDay,
  }) async {
    final baseUrl = TransactionEndPointGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "unit_id": ${unitId},
  "trx_date": "${escapeStringForJson(trxDate)}",
  "name": "${escapeStringForJson(name)}",
  "total_day": ${totalDay},
  "amount": ${amount}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Fidyah',
      apiUrl: '${baseUrl}/fidyah/${id}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Content': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateKotakAmalCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? unitId,
    String? trxDate = '',
    int? amount,
    int? id,
    String? desc = '',
  }) async {
    final baseUrl = TransactionEndPointGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "unit_id": ${unitId},
  "trx_date": "${escapeStringForJson(trxDate)}",
  "amount": ${amount},
  "desc": "${escapeStringForJson(desc)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Kotak Amal',
      apiUrl: '${baseUrl}/kotak_amal/${id}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Content': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteZakatMalCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? id,
  }) async {
    final baseUrl = TransactionEndPointGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Zakat Mal',
      apiUrl: '${baseUrl}/zm/${id}',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-Type': 'application/json',
        'Content': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteSedekahCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? id,
  }) async {
    final baseUrl = TransactionEndPointGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Sedekah',
      apiUrl: '${baseUrl}/ifs/${id}',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-Type': 'application/json',
        'Content': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteFidyahCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? id,
  }) async {
    final baseUrl = TransactionEndPointGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Fidyah',
      apiUrl: '${baseUrl}/fidyah/${id}',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-Type': 'application/json',
        'Content': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteKotakAmalCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? id,
  }) async {
    final baseUrl = TransactionEndPointGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Kotak Amal',
      apiUrl: '${baseUrl}/kotak_amal/${id}',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-Type': 'application/json',
        'Content': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeletePendistribusianCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? id,
  }) async {
    final baseUrl = TransactionEndPointGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Pendistribusian',
      apiUrl: '${baseUrl}/pendis/${id}',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-Type': 'application/json',
        'Content': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteSetorZISCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? id,
  }) async {
    final baseUrl = TransactionEndPointGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Setor ZIS',
      apiUrl: '${baseUrl}/setor/${id}',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-Type': 'application/json',
        'Content': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetZakatMaalCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = TransactionEndPointGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Zakat Maal',
      apiUrl: '${baseUrl}/zm',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Content': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataTrxZakatMal(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetSedekahCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = TransactionEndPointGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Sedekah',
      apiUrl: '${baseUrl}/ifs',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Content': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataTrxInfak(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetFidyahCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = TransactionEndPointGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Fidyah',
      apiUrl: '${baseUrl}/fidyah',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Content': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataListFidyah(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetKotakAmalCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = TransactionEndPointGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Kotak Amal',
      apiUrl: '${baseUrl}/kotak_amal',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Content': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataListKomal(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetPendistribusianCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = TransactionEndPointGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Pendistribusian',
      apiUrl: '${baseUrl}/pendis',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Content': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataListPendis(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetSetorZISCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = TransactionEndPointGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Setor ZIS',
      apiUrl: '${baseUrl}/setor',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Content': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? listDataSetor(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

/// End TransactionEndPoint Group Code

/// Start MiscEndPoint Group Code

class MiscEndPointGroup {
  static String getBaseUrl() =>
      'https://sisfo-upz-sisfoupz-webapp.2rxwkd.easypanel.host/api/v1';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  static GetKecamatanCall getKecamatanCall = GetKecamatanCall();
  static GetDesaCall getDesaCall = GetDesaCall();
  static GetZfPaymentTypesCall getZfPaymentTypesCall = GetZfPaymentTypesCall();
  static GetAllocationConfigActiveCall getAllocationConfigActiveCall =
      GetAllocationConfigActiveCall();
}

class GetKecamatanCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = MiscEndPointGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Kecamatan',
      apiUrl: '${baseUrl}/kecamatan',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? listDataKecamatan(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<String>? listNameKecamatan(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? listIdKecamatan(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? listDistrictCode(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].district_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetDesaCall {
  Future<ApiCallResponse> call({
    String? districtId = '',
    int? id,
  }) async {
    final baseUrl = MiscEndPointGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Desa',
      apiUrl: '${baseUrl}/desa',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {
        'district_id': districtId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? listDesaName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? listDesaId(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? listDesaCode(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].village_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? listDesa(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetZfPaymentTypesCall {
  Future<ApiCallResponse> call({
    bool? all,
    String? type,
  }) async {
    final baseUrl = MiscEndPointGroup.getBaseUrl();

    final Map<String, dynamic> params = {};
    if (all != null) {
      params['all'] = all;
    }
    if (type != null && type.isNotEmpty) {
      params['type'] = type;
    }

    return ApiManager.instance.makeApiCall(
      callName: 'Get ZF Payment Types',
      apiUrl: '${baseUrl}/zf-payment-types',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: params,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? listData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;

  List<int>? listId(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();

  List<String>? listName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();

  List<String>? listType(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();

  List<double>? listRiceAmount(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].rice_amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();

  List<int>? listMoneyAmount(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].money_amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();

  List<bool>? listIsActive(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].is_active''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
}

class GetAllocationConfigActiveCall {
  Future<ApiCallResponse> call({
    String? zisType,
    int? year,
    String? token = '',
  }) async {
    final baseUrl = MiscEndPointGroup.getBaseUrl();

    final Map<String, dynamic> params = {};
    if (zisType != null && zisType.isNotEmpty) {
      params['zis_type'] = zisType;
    }
    if (year != null) {
      params['year'] = year;
    }

    return ApiManager.instance.makeApiCall(
      callName: 'Get Allocation Config Active',
      apiUrl: '${baseUrl}/allocation-configs-active',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: params,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );

  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.id''',
      ));

  String? zisType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.zis_type''',
      ));

  String? zisTypeLabel(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.zis_type_label''',
      ));

  int? effectiveYear(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.effective_year''',
      ));

  double? setorPercentage(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.setor_percentage''',
      ));

  double? kelolaPercentage(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.kelola_percentage''',
      ));

  double? amilPercentage(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.amil_percentage''',
      ));

  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.description''',
      ));

  bool? isDefault(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.is_default''',
      ));

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

/// End MiscEndPoint Group Code

/// Start RekapEndPoint Group Code

class RekapEndPointGroup {
  static String getBaseUrl() =>
      'https://sisfo-upz-sisfoupz-webapp.2rxwkd.easypanel.host/api/v1';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  static RekapZISCall rekapZISCall = RekapZISCall();
  static RekapPendisCall rekapPendisCall = RekapPendisCall();
  static RekapHakAmilCall rekapHakAmilCall = RekapHakAmilCall();
  static RekapSetorCall rekapSetorCall = RekapSetorCall();
  static RekapAlokasiCall rekapAlokasiCall = RekapAlokasiCall();
}

class RekapZISCall {
  Future<ApiCallResponse> call({
    String? period = '',
    String? unitId = '',
    String? token = '',
  }) async {
    final baseUrl = RekapEndPointGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Rekap ZIS',
      apiUrl: '${baseUrl}/rekap/zis',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'period': period,
        'unit_id': unitId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataRekapZis(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  double? totalZfRice(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data[:].total_zf_rice''',
      ));
  int? totalZfAmount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].total_zf_amount''',
      ));
  int? totalZfMuzakki(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].total_zf_muzakki''',
      ));
  int? totalZmAmount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].total_zm_amount''',
      ));
  int? totalZmMuzakki(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].total_zm_muzakki''',
      ));
  int? totalIfsAmount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].total_ifs_amount''',
      ));
  int? totalIfsMunfiq(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].total_ifs_munfiq''',
      ));
}

class RekapPendisCall {
  Future<ApiCallResponse> call({
    String? periode = '',
    String? token = '',
    int? unitId,
  }) async {
    final baseUrl = RekapEndPointGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Rekap Pendis',
      apiUrl: '${baseUrl}/rekap/pendis',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'periode': periode,
        'unit_id': unitId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalPendisZfUang(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].total_pendis.zf_amount''',
      ));
  double? totalPendisZfBeras(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data[:].total_pendis.zf_rice''',
      ));
  int? totalPendisZm(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].total_pendis.zm''',
      ));
  int? totalPenerimaManfaat(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].t_pm''',
      ));
  int? totalPendisIfs(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].total_pendis.ifs''',
      ));
  int? totalFakirUang(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].asnaf.fakir.amount''',
      ));
  double? totalFakirBeras(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data[:].asnaf.fakir.rice''',
      ));
  int? totalMiskinUang(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].asnaf.miskin.amount''',
      ));
  double? totalMiskinBeras(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data[:].asnaf.miskin.rice''',
      ));
  int? totalFisabliliahUang(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].asnaf.fisabilillah.amount''',
      ));
  double? totalFisabililahBeras(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data[:].asnaf.fisabilillah.rice''',
      ));
  int? totalKemanusiaanUang(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].program.kemanusiaan.amount''',
      ));
  double? totalKemanusiaanBeras(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data[:].program.kemanusiaan.rice''',
      ));
  int? totalDakwahUang(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].program.dakwah.amount''',
      ));
  double? totalDakwahBeras(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data[:].program.dakwah.rice''',
      ));
}

class RekapHakAmilCall {
  Future<ApiCallResponse> call({
    String? periode = '',
    String? token = '',
    int? unitId,
  }) async {
    final baseUrl = RekapEndPointGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Rekap Hak Amil',
      apiUrl: '${baseUrl}/rekap/hak-amil',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'periode': periode,
        'unit_id': unitId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? realisasiHaZfUang(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].total_pendis_ha.zf_amount''',
      ));
  double? realisasiHaZfBeras(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data[:].total_pendis_ha.zf_rice''',
      ));
  int? realisasiHaZm(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].total_pendis_ha.zm''',
      ));
  int? realisasiHaIfs(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].total_pendis_ha.ifs''',
      ));
  int? totalPm(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].t_pm''',
      ));
}

class RekapSetorCall {
  Future<ApiCallResponse> call({
    String? periode = '',
    String? token = '',
    int? unitId,
  }) async {
    final baseUrl = RekapEndPointGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Rekap Setor',
      apiUrl: '${baseUrl}/rekap/setor',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'periode': periode,
        'unit_id': unitId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? realisasiSetorZis(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  int? realisasiSetorZfUang(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].t_setor_zf_amount''',
      ));
  double? realisasiSetorZfBeras(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data[:].t_setor_zf_rice''',
      ));
  int? realisasiSetorZm(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].t_setor_zm''',
      ));
  int? realisasiSetorIfs(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].t_setor_ifs''',
      ));
}

class RekapAlokasiCall {
  Future<ApiCallResponse> call({
    String? periode = '',
    String? token = '',
    String? unitId = '',
  }) async {
    final baseUrl = RekapEndPointGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Rekap Alokasi',
      apiUrl: '${baseUrl}/rekap/alokasi',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'periode': periode,
        'unit_id': unitId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataAlokasi(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  dynamic listKelolaZis(dynamic response) => getJsonField(
        response,
        r'''$.data[:].total_kelola''',
      );
  int? setorZfUang(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].total_setor.zf_amount''',
      ));
  double? setorZfBeras(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data[:].total_setor.zf_rice''',
      ));
  int? setorZm(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].total_setor.zm''',
      ));
  int? setorIfs(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].total_setor.ifs''',
      ));
  int? kelolaZfUang(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].total_kelola.zf_amount''',
      ));
  double? kelolaZfBeras(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data[:].total_kelola.zf_rice''',
      ));
  int? kelolaZm(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].total_kelola.zm''',
      ));
  dynamic listSetorZis(dynamic response) => getJsonField(
        response,
        r'''$.data[:].total_setor''',
      );
  int? kelolaIfs(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].total_kelola.ifs''',
      ));
  dynamic listHakAmil(dynamic response) => getJsonField(
        response,
        r'''$.data[:].hak_amil''',
      );
  int? hakAmilZfUang(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].hak_amil.zf_amount''',
      ));
  double? hakAmilZfBeras(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data[:].hak_amil.zf_rice''',
      ));
  int? hakAmilZm(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].hak_amil.zm''',
      ));
  int? hakAmilIfs(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].hak_amil.ifs''',
      ));
  dynamic listPendis(dynamic response) => getJsonField(
        response,
        r'''$.data[:].alokasi_pendis''',
      );
  double? pendisZfBeras(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data[:].alokasi_pendis.zf_rice''',
      ));
  int? pendisZfUang(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].alokasi_pendis.zf_amount''',
      ));
  int? pendisZm(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].alokasi_pendis.zm''',
      ));
  int? pendisIfs(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].alokasi_pendis.ifs''',
      ));
  dynamic listHakOp(dynamic response) => getJsonField(
        response,
        r'''$.data[:].hak_op''',
      );
  int? hakOpZfUang(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].hak_op.zf_amount''',
      ));
  double? hakOpZfBeras(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data[:].hak_op.zf_rice''',
      ));
  int? metaTotal(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.meta.total''',
      ));
}

/// End RekapEndPoint Group Code

class GetDataDesaCall {
  static Future<ApiCallResponse> call({
    String? kecamatanId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Data Desa',
      apiUrl:
          'https://aditraanggra.github.io/api-wilayah-indonesia/api/villages/${kecamatanId}.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? desaId(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? desaNama(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetDataKecamatanCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Data Kecamatan',
      apiUrl:
          'https://aditraanggra.github.io/api-wilayah-indonesia//api/districts/3203.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? kecamatanId(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?;
  static List? kecamatanNama(dynamic response) => getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?;
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
