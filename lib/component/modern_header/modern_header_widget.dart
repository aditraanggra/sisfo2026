import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'modern_header_model.dart';
export 'modern_header_model.dart';

/// Modern header component with gradient background and user info
/// Requirements: 3.1, 3.2, 3.3, 3.4, 3.5
///
/// Features:
/// - Dark green gradient background (#1A3C34 to #0D1F1A) (Req 3.1)
/// - Greeting text "Welcome Back" with user name (Req 3.2)
/// - Circular profile avatar with border (Req 3.3)
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left side: Avatar and greeting
              Expanded(
                child: Row(
                  children: [
                    // Requirements: 3.3 - Circular profile avatar with border
                    _buildAvatar(),
                    const SizedBox(width: ModernSpacing.md),
                    // Requirements: 3.2 - Greeting text "Welcome Back" with user name
                    Expanded(
                      child: _buildGreeting(),
                    ),
                  ],
                ),
              ),
              // Right side: Notification icon
              // Requirements: 3.5 - Notification icon with badge indicator
              _buildNotificationIcon(),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the circular avatar with border
  /// Requirements: 3.3
  Widget _buildAvatar() {
    return GestureDetector(
      onTap: widget.onAvatarTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
            width: 2,
          ),
        ),
        child: ClipOval(
          child: widget.avatarUrl != null && widget.avatarUrl!.isNotEmpty
              ? Image.network(
                  widget.avatarUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      _buildDefaultAvatar(),
                )
              : _buildDefaultAvatar(),
        ),
      ),
    );
  }

  /// Builds default avatar with user initial
  Widget _buildDefaultAvatar() {
    final initial =
        widget.userName.isNotEmpty ? widget.userName[0].toUpperCase() : 'U';
    return Container(
      color: ModernColors.primaryAccent,
      child: Center(
        child: Text(
          initial,
          style: FlutterFlowTheme.of(context).titleMedium.override(
                fontFamily: 'Inter',
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }

  /// Builds the greeting text section
  /// Requirements: 3.2
  Widget _buildGreeting() {
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
        const SizedBox(height: 2),
        Text(
          widget.userName,
          style: FlutterFlowTheme.of(context).titleMedium.override(
                fontFamily: 'Inter',
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
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
