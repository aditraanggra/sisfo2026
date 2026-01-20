import '/component/dark_light_switch_small/dark_light_switch_small_widget.dart';
import '/component/profile_completion/profile_completion_widget.dart';
import '/component/profile_menu/profile_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_responsive_widget.dart' show ProfileResponsiveWidget;
import 'package:flutter/material.dart';

class ProfileResponsiveModel extends FlutterFlowModel<ProfileResponsiveWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ProfileCompletion component.
  late ProfileCompletionModel profileCompletionModel;
  // Model for ProfileMenu component.
  late ProfileMenuModel profileMenuModel;
  // Model for DarkLightSwitchSmall component.
  late DarkLightSwitchSmallModel darkLightSwitchSmallModel;

  @override
  void initState(BuildContext context) {
    profileCompletionModel =
        createModel(context, () => ProfileCompletionModel());
    profileMenuModel = createModel(context, () => ProfileMenuModel());
    darkLightSwitchSmallModel =
        createModel(context, () => DarkLightSwitchSmallModel());
  }

  @override
  void dispose() {
    profileCompletionModel.dispose();
    profileMenuModel.dispose();
    darkLightSwitchSmallModel.dispose();
  }
}
