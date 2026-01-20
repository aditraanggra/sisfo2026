import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'skeleton_loader_model.dart';
export 'skeleton_loader_model.dart';

/// Enum defining the types of skeleton loaders available
enum SkeletonType {
  listItem, // For transaction lists
  card, // For dashboard cards
  profile, // For profile sections
  form, // For form fields
}

class SkeletonLoaderWidget extends StatefulWidget {
  const SkeletonLoaderWidget({
    super.key,
    this.type = SkeletonType.listItem,
    this.itemCount = 3,
  });

  final SkeletonType type;
  final int itemCount;

  @override
  State<SkeletonLoaderWidget> createState() => _SkeletonLoaderWidgetState();
}

class _SkeletonLoaderWidgetState extends State<SkeletonLoaderWidget>
    with SingleTickerProviderStateMixin {
  late SkeletonLoaderModel _model;
  late AnimationController _shimmerController;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SkeletonLoaderModel());

    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shimmerController,
      builder: (context, child) {
        return _buildSkeletonContent();
      },
    );
  }

  Widget _buildSkeletonContent() {
    switch (widget.type) {
      case SkeletonType.listItem:
        return _buildListItemSkeleton();
      case SkeletonType.card:
        return _buildCardSkeleton();
      case SkeletonType.profile:
        return _buildProfileSkeleton();
      case SkeletonType.form:
        return _buildFormSkeleton();
    }
  }

  /// Builds skeleton for list items (transaction lists)
  Widget _buildListItemSkeleton() {
    return Column(
      children: List.generate(
        widget.itemCount,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 3.0,
                  color: const Color(0x33000000),
                  offset: const Offset(0.0, 1.0),
                ),
              ],
            ),
            child: Row(
              children: [
                // Leading icon placeholder
                _buildShimmerBox(width: 48.0, height: 48.0, circular: true),
                const SizedBox(width: 12.0),
                // Content placeholders
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildShimmerBox(width: double.infinity, height: 16.0),
                      const SizedBox(height: 8.0),
                      _buildShimmerBox(width: 150.0, height: 12.0),
                    ],
                  ),
                ),
                const SizedBox(width: 12.0),
                // Trailing amount placeholder
                _buildShimmerBox(width: 80.0, height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds skeleton for dashboard cards
  Widget _buildCardSkeleton() {
    return Column(
      children: List.generate(
        widget.itemCount,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Container(
            width: double.infinity,
            height: 120.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 3.0,
                  color: const Color(0x33000000),
                  offset: const Offset(0.0, 2.0),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildShimmerBox(width: 100.0, height: 14.0),
                        const SizedBox(height: 8.0),
                        _buildShimmerBox(width: 150.0, height: 20.0),
                        const SizedBox(height: 8.0),
                        _buildShimmerBox(width: 120.0, height: 14.0),
                      ],
                    ),
                  ),
                  // Circular progress placeholder
                  _buildShimmerBox(width: 70.0, height: 70.0, circular: true),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds skeleton for profile sections
  Widget _buildProfileSkeleton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Avatar placeholder
          _buildShimmerBox(width: 80.0, height: 80.0, circular: true),
          const SizedBox(height: 16.0),
          // Name placeholder
          _buildShimmerBox(width: 150.0, height: 20.0),
          const SizedBox(height: 8.0),
          // Role/subtitle placeholder
          _buildShimmerBox(width: 100.0, height: 14.0),
          const SizedBox(height: 24.0),
          // Info rows
          ...List.generate(
            widget.itemCount,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  _buildShimmerBox(width: 24.0, height: 24.0, circular: true),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildShimmerBox(width: 80.0, height: 12.0),
                        const SizedBox(height: 4.0),
                        _buildShimmerBox(width: double.infinity, height: 14.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds skeleton for form fields
  Widget _buildFormSkeleton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          widget.itemCount,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Label placeholder
                _buildShimmerBox(width: 100.0, height: 14.0),
                const SizedBox(height: 8.0),
                // Input field placeholder
                _buildShimmerBox(width: double.infinity, height: 48.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds a shimmer box with animation
  Widget _buildShimmerBox({
    required double width,
    required double height,
    bool circular = false,
  }) {
    final baseColor = FlutterFlowTheme.of(context).alternate;
    final highlightColor = FlutterFlowTheme.of(context).primaryBackground;

    return AnimatedBuilder(
      animation: _shimmerController,
      builder: (context, child) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: circular
                ? BorderRadius.circular(height / 2)
                : BorderRadius.circular(8.0),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                baseColor,
                highlightColor,
                baseColor,
              ],
              stops: [
                _calculateStop(0.0),
                _calculateStop(0.5),
                _calculateStop(1.0),
              ],
            ),
          ),
        );
      },
    );
  }

  double _calculateStop(double offset) {
    final animationValue = _shimmerController.value;
    final result = (animationValue + offset - 0.5).clamp(0.0, 1.0);
    return result;
  }
}
