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
    with SingleTickerProviderStateMixin {
  late LaporanKurbanBannerModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LaporanKurbanBannerModel());
    _model.initAnimation(this);
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ModernSpacing.md),
      child: AnimatedBuilder(
        animation: _model.pulseController,
        builder: (context, child) {
          final glowOpacity = 0.15 + (_model.pulseValue * 0.35);
          final glowBlur = 8.0 + (_model.pulseValue * 12.0);
          final glowSpread = _model.pulseValue * 6.0;
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ModernRadius.lg),
              boxShadow: [
                BoxShadow(
                  color: ModernColors.primaryDark.withOpacity(glowOpacity),
                  blurRadius: glowBlur,
                  spreadRadius: glowSpread,
                ),
              ],
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
