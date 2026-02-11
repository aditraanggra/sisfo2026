import 'package:google_fonts/google_fonts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'modern_header_model.dart';
export 'modern_header_model.dart';

/// Modern header component with gradient background and user info
/// Requirements: 3.1, 3.2, 3.4, 3.5
///
/// Features:
/// - Dark green gradient background (#1A3C34 to #0D1F1A) (Req 3.1)
/// - Greeting text "Welcome Back" with user name and Verified badge (Req 3.2)
/// - Rounded bottom corners (24px) (Req 3.4)
/// - Notification icon with badge indicator (Req 3.5)
class ModernHeaderWidget extends StatefulWidget {
  const ModernHeaderWidget({
    super.key,
    required this.userName,
    this.avatarUrl,
    this.onNotificationTap,
    this.notificationCount = 0,
    this.onAvatarTap,
    this.totalPenerimaanUang,
    this.totalPenerimaanBeras,
    this.noRegister,
  });

  /// User's display name
  final String userName;

  /// URL for user's avatar image (optional)
  final String? avatarUrl;

  /// Callback when notification icon is tapped
  final VoidCallback? onNotificationTap;

  /// Number of unread notifications (shows badge if > 0)
  final int notificationCount;

  /// Callback when avatar is tapped
  final VoidCallback? onAvatarTap;

  /// Total Money Received
  final String? totalPenerimaanUang;

  /// Total Rice Received
  final String? totalPenerimaanBeras;

  /// Unit Registration Number
  final String? noRegister;

  @override
  State<ModernHeaderWidget> createState() => _ModernHeaderWidgetState();
}

class _ModernHeaderWidgetState extends State<ModernHeaderWidget> {
  late ModernHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModernHeaderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    final isVerified = FFAppState().profileUPZ.isVerified == true;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        // Requirements: 3.1 - Dark green gradient background (#1A3C34 to #0D1F1A)
        gradient: ModernGradients.headerGradient,
        // Requirements: 3.4 - Rounded bottom corners (24px)
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(ModernRadius.xxl),
          bottomRight: Radius.circular(ModernRadius.xxl),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            ModernSpacing.md,
            ModernSpacing.md,
            ModernSpacing.md,
            ModernSpacing.lg,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left side: Greeting, Name, and Info
                  Expanded(
                    child: GestureDetector(
                      onTap: widget.onAvatarTap,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildGreeting(isVerified),
                          if (widget.noRegister != null &&
                              widget.noRegister!.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                'No. Reg: ${widget.noRegister}',
                                style: GoogleFonts.inter(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  // Right side: Notification icon
                  _buildNotificationIcon(),
                ],
              ),
              // Reception Data Section (Now moved here, below unit name)
              if (widget.totalPenerimaanUang != null ||
                  widget.totalPenerimaanBeras != null) ...[
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(ModernSpacing.md),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(ModernRadius.md),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Penerimaan Uang',
                              style: GoogleFonts.inter(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 11,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              widget.totalPenerimaanUang ?? 'Rp 0',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 30,
                        color: Colors.white.withOpacity(0.2),
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Penerimaan Beras',
                              style: GoogleFonts.inter(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 11,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              widget.totalPenerimaanBeras ?? '0 Kg',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the greeting text section with Verified badge
  /// Requirements: 3.2
  Widget _buildGreeting(bool isVerified) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Assalamu\'alaikum,',
          style: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: 'Inter',
                color: Colors.white.withOpacity(0.7),
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Flexible(
              child: Text(
                widget.userName,
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (isVerified) ...[
              const SizedBox(width: 8),
              _buildVerifiedBadge(),
            ],
          ],
        ),
      ],
    );
  }

  /// Builds the Verified badge
  Widget _buildVerifiedBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.verified,
            size: 14,
            color: const Color(0xFF4CAF50),
          ),
          const SizedBox(width: 4),
          Text(
            'Verified',
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: 'Inter',
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }

  /// Builds the notification icon with badge
  /// Requirements: 3.5
  Widget _buildNotificationIcon() {
    return GestureDetector(
      onTap: widget.onNotificationTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Outlined notification icon
            const Icon(
              Icons.notifications_outlined,
              color: Colors.white,
              size: 22,
            ),
            // Badge indicator
            if (widget.notificationCount > 0)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: ModernColors.expenseRed,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: ModernColors.primaryDark,
                      width: 1.5,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      widget.notificationCount > 9
                          ? '9+'
                          : widget.notificationCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
