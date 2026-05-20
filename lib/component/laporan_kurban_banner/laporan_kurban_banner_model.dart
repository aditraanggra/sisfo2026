import '/flutter_flow/flutter_flow_util.dart';
import 'laporan_kurban_banner_widget.dart' show LaporanKurbanBannerWidget;
import 'package:flutter/material.dart';

class LaporanKurbanBannerModel
    extends FlutterFlowModel<LaporanKurbanBannerWidget> {
  late AnimationController pulseController;
  late Animation<double> pulseAnimation;
  double pulseValue = 0.0;

  void initAnimation(SingleTickerProviderStateMixin vsync) {
    pulseController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 2000),
    );
    pulseAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: pulseController, curve: Curves.easeInOut),
    );
    pulseAnimation.addListener(() {
      pulseValue = pulseAnimation.value;
    });
    pulseController.repeat(reverse: true);
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    pulseController.dispose();
  }
}
