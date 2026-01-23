import '/backend/api_requests/api_calls.dart';
import '/component/modern_header/modern_header_widget.dart';
import '/component/modern_dana_overview/modern_dana_overview_widget.dart';
import '/component/modern_quick_actions/modern_quick_actions_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get UPZ)] action in Home widget.
  ApiCallResponse? apiResultpvw;
  // Model for ModernHeader component.
  late ModernHeaderModel modernHeaderModel;
  // Model for ModernDanaOverview component.
  late ModernDanaOverviewModel modernDanaOverviewModel;
  // Model for ModernQuickActions component.
  late ModernQuickActionsModel modernQuickActionsModel;

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
    modernHeaderModel = createModel(context, () => ModernHeaderModel());
    modernDanaOverviewModel =
        createModel(context, () => ModernDanaOverviewModel());
    modernQuickActionsModel =
        createModel(context, () => ModernQuickActionsModel());
  }

  @override
  void dispose() {
    modernHeaderModel.dispose();
    modernDanaOverviewModel.dispose();
    modernQuickActionsModel.dispose();

    /// Dispose query cache managers for this widget.

    clearGetUpzDataCache();
  }
}
