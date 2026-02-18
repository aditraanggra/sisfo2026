import '/component/modern_header/modern_header_widget.dart';
import '/component/modern_dana_overview/modern_dana_overview_widget.dart';
import '/component/modern_quick_actions/modern_quick_actions_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';

import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  late ModernHeaderModel modernHeaderModel;
  late ModernDanaOverviewModel modernDanaOverviewModel;
  late ModernQuickActionsModel modernQuickActionsModel;

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
  }
}
