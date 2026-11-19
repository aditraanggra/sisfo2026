import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

enum ScreenType { phone, tablet, desktop }

ScreenType getScreenType(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
  if (width < kBreakpointMedium) return ScreenType.phone;
  if (width < kBreakpointLarge) return ScreenType.tablet;
  return ScreenType.desktop;
}

bool isPhoneScreen(BuildContext context) =>
    getScreenType(context) == ScreenType.phone;
bool isTabletScreen(BuildContext context) =>
    getScreenType(context) == ScreenType.tablet;
bool isDesktopScreen(BuildContext context) =>
    getScreenType(context) == ScreenType.desktop;

T responsiveValue<T>({
  required BuildContext context,
  required T phone,
  T? tablet,
  T? desktop,
}) {
  return switch (getScreenType(context)) {
    ScreenType.phone => phone,
    ScreenType.tablet => (tablet ?? phone),
    ScreenType.desktop => (desktop ?? tablet ?? phone),
  };
}

/// Content wrapper that constrains and centers content on wider screens.
///
/// Phone (<768px): full-width, no constraint
/// Tablet (768-991px): max-width 720px, centered with 24px padding
/// Desktop (≥992px): max-width 1120px, centered with 32px padding
///
/// Set [maxWidth] to override the automatic width.
/// Set [isFullWidth] to true to disable centering (e.g., for gradient headers).
class ResponsiveContentWrapper extends StatelessWidget {
  const ResponsiveContentWrapper({
    super.key,
    required this.child,
    this.maxWidth,
    this.isFullWidth = false,
    this.padding,
  });

  final Widget child;
  final double? maxWidth;
  final bool isFullWidth;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final screenType = getScreenType(context);
    final effectiveMaxWidth = maxWidth ??
        switch (screenType) {
          ScreenType.phone => double.infinity,
          ScreenType.tablet => 720.0,
          ScreenType.desktop => 1120.0,
        };
    final effectivePadding = padding ??
        switch (screenType) {
          ScreenType.phone => EdgeInsets.zero,
          ScreenType.tablet => const EdgeInsets.symmetric(horizontal: 24.0),
          ScreenType.desktop => const EdgeInsets.symmetric(horizontal: 32.0),
        };

    if (isFullWidth || screenType == ScreenType.phone) {
      return Padding(padding: effectivePadding, child: child);
    }

    Widget constrainedChild = LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        if (width <= effectiveMaxWidth) return child;
        return Center(
          child: SizedBox(width: effectiveMaxWidth, child: child),
        );
      },
    );

    return Padding(padding: effectivePadding, child: constrainedChild);
  }
}

/// Desktop page header shown when appBar is hidden on wide screens.
///
/// Renders a title bar within the page body only on tablet/desktop,
/// compensating for the absence of the Scaffold AppBar.
class DesktopPageHeader extends StatelessWidget {
  const DesktopPageHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.actions = const [],
  });

  final String title;
  final String? subtitle;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: FlutterFlowTheme.of(context).headlineMedium,
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4.0),
                  Text(
                    subtitle!,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                  ),
                ],
              ],
            ),
          ),
          if (actions.isNotEmpty) ...actions,
        ],
      ),
    );
  }
}
