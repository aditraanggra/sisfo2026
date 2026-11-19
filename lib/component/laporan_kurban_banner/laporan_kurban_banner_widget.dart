import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'laporan_kurban_banner_model.dart';
export 'laporan_kurban_banner_model.dart';

class LaporanKurbanBannerWidget extends StatefulWidget {
  const LaporanKurbanBannerWidget({super.key});

  @override
  State<LaporanKurbanBannerWidget> createState() =>
      _LaporanKurbanBannerWidgetState();
}

class _LaporanKurbanBannerWidgetState extends State<LaporanKurbanBannerWidget>
    with TickerProviderStateMixin {
  late LaporanKurbanBannerModel _model;
  late AnimationController _rippleController;
  late List<CurvedAnimation> _rippleAnimations;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LaporanKurbanBannerModel());
    _model.initAnimation(this);
    _rippleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
    _rippleAnimations = [
      CurvedAnimation(
        parent: _rippleController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
      ),
      CurvedAnimation(
        parent: _rippleController,
        curve: const Interval(0.15, 0.85, curve: Curves.easeOut),
      ),
      CurvedAnimation(
        parent: _rippleController,
        curve: const Interval(0.30, 1.0, curve: Curves.easeOut),
      ),
    ];
  }

  @override
  void dispose() {
    for (final anim in _rippleAnimations) {
      anim.dispose();
    }
    _rippleController.dispose();
    _model.dispose();
    super.dispose();
  }

  Widget _buildRipple(int index, double beginOpacity) {
    final anim = _rippleAnimations[index];
    return AnimatedBuilder(
      animation: anim,
      builder: (context, child) {
        final t = anim.value;
        final scale = 1.0 + (t * 1.8);
        final opacity = beginOpacity * (1.0 - t);
        return Opacity(
          opacity: opacity.clamp(0.0, 1.0),
          child: Transform.scale(
            scale: scale,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(opacity.clamp(0.0, 1.0)),
                borderRadius: BorderRadius.circular(ModernRadius.md),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ModernSpacing.md),
      child: AnimatedBuilder(
        animation: _model.pulseController,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ModernRadius.lg),
            ),
            child: child,
          );
        },
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => context.pushNamed(LaporanKurbanWidget.routeName),
            borderRadius: BorderRadius.circular(ModernRadius.lg),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [ModernColors.primaryDark, Color(0xFF259148)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(ModernRadius.lg),
              ),
              child: Padding(
                padding: const EdgeInsets.all(ModernSpacing.md),
                child: Row(
                  children: [
                      SizedBox(
                      width: 80,
                      height: 80,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          _buildRipple(2, 0.2),
                          _buildRipple(1, 0.35),
                          _buildRipple(0, 0.5),
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(ModernRadius.md),
                            ),
                            child: const Icon(
                              Icons.assignment_turned_in,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: ModernSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Laporan Kurban',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Buat laporan pelaksanaan kurban',
                            style: GoogleFonts.inter(
                              color: Colors.white.withOpacity(0.85),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
