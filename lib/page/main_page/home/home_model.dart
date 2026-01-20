import '/backend/api_requests/api_calls.dart';
import '/component/card_dana/card_dana_widget.dart';
import '/component/card_dana_beras/card_dana_beras_widget.dart';
import '/component/profile_home/profile_home_widget.dart';
import '/component/quick_actions/quick_actions_widget.dart';
import '/component/modern_header/modern_header_widget.dart';
import '/component/modern_balance_card/modern_balance_card_widget.dart';
import '/component/modern_dana_overview/modern_dana_overview_widget.dart';
import '/component/modern_quick_actions/modern_quick_actions_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  bool isCurrentUser = true;

  int? sisaDanaZf = 0;

  int? sisaDanaZm = 0;

  int? sisaDanaIfs = 0;

  double? sisaBerasZf = 0.0;

  int? sisaUangZf = 0;

  int? sisaAmil;

  int? sisaHaZfUang = 0;

  double? sisaHaZfBeras = 0.0;

  int? sisaHaZm = 0;

  int? sisaHaIfs = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get UPZ)] action in Home widget.
  ApiCallResponse? apiResultpvw;
  // Model for profileHome component.
  late ProfileHomeModel profileHomeModel;
  // Stores action output result for [Backend Call - API (Get UPZ)] action in profileHome widget.
  ApiCallResponse? responseDataUpz;
  // Model for ModernHeader component.
  late ModernHeaderModel modernHeaderModel;
  // Model for ModernBalanceCard component.
  late ModernBalanceCardModel modernBalanceCardModel;
  // Model for ModernDanaOverview component.
  late ModernDanaOverviewModel modernDanaOverviewModel;
  // Model for ModernQuickActions component.
  late ModernQuickActionsModel modernQuickActionsModel;
  // Model for CardDana component.
  late CardDanaModel cardDanaModel1;
  // Model for CardDanaBeras component.
  late CardDanaBerasModel cardDanaBerasModel1;
  // Model for CardDana component.
  late CardDanaModel cardDanaModel2;
  // Model for CardDana component.
  late CardDanaModel cardDanaModel3;
  // Model for CardDana component.
  late CardDanaModel cardDanaModel4;
  // Model for CardDanaBeras component.
  late CardDanaBerasModel cardDanaBerasModel2;
  // Model for CardDana component.
  late CardDanaModel cardDanaModel5;
  // Model for CardDana component.
  late CardDanaModel cardDanaModel6;
  // Model for QuickActions component.
  late QuickActionsModel quickActionsModel;

  /// Query cache managers for this widget.

  final _getUpzDataManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> getUpzData({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _getUpzDataManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetUpzDataCache() => _getUpzDataManager.clear();
  void clearGetUpzDataCacheKey(String? uniqueKey) =>
      _getUpzDataManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    profileHomeModel = createModel(context, () => ProfileHomeModel());
    modernHeaderModel = createModel(context, () => ModernHeaderModel());
    modernBalanceCardModel =
        createModel(context, () => ModernBalanceCardModel());
    modernDanaOverviewModel =
        createModel(context, () => ModernDanaOverviewModel());
    modernQuickActionsModel =
        createModel(context, () => ModernQuickActionsModel());
    cardDanaModel1 = createModel(context, () => CardDanaModel());
    cardDanaBerasModel1 = createModel(context, () => CardDanaBerasModel());
    cardDanaModel2 = createModel(context, () => CardDanaModel());
    cardDanaModel3 = createModel(context, () => CardDanaModel());
    cardDanaModel4 = createModel(context, () => CardDanaModel());
    cardDanaBerasModel2 = createModel(context, () => CardDanaBerasModel());
    cardDanaModel5 = createModel(context, () => CardDanaModel());
    cardDanaModel6 = createModel(context, () => CardDanaModel());
    quickActionsModel = createModel(context, () => QuickActionsModel());
  }

  @override
  void dispose() {
    profileHomeModel.dispose();
    modernHeaderModel.dispose();
    modernBalanceCardModel.dispose();
    modernDanaOverviewModel.dispose();
    modernQuickActionsModel.dispose();
    cardDanaModel1.dispose();
    cardDanaBerasModel1.dispose();
    cardDanaModel2.dispose();
    cardDanaModel3.dispose();
    cardDanaModel4.dispose();
    cardDanaBerasModel2.dispose();
    cardDanaModel5.dispose();
    cardDanaModel6.dispose();
    quickActionsModel.dispose();

    /// Dispose query cache managers for this widget.

    clearGetUpzDataCache();
  }
}
