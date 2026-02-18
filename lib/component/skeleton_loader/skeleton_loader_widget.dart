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
  summary, // For summary headers
  detailRow, // For text-only detail rows
  chips, // For wrapped chips
  dashboardStats, // For dashboard statistics (Muzakki/Mustahik)
  dashboardGrid, // For quick actions grid
  transactionFilter, // For transaction filter tabs/chips
  balanceCard, // For gradient balance/summary cards
  header, // For modern header with avatar
  tabs, // For tab bar skeleton
  emptyState, // For empty state placeholder
  slider, // For slider/carousel skeletons
  compactListItem, // For compact list items (no card background)
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
      case SkeletonType.summary:
        return _buildSummarySkeleton();
      case SkeletonType.detailRow:
        return _buildDetailRowSkeleton();
      case SkeletonType.chips:
        return _buildChipsSkeleton();
      case SkeletonType.dashboardStats:
        return _buildDashboardStatsSkeleton();
      case SkeletonType.dashboardGrid:
        return _buildDashboardGridSkeleton();
      case SkeletonType.transactionFilter:
        return _buildTransactionFilterSkeleton();
      case SkeletonType.balanceCard:
        return _buildBalanceCardSkeleton();
      case SkeletonType.header:
        return _buildHeaderSkeleton();
      case SkeletonType.tabs:
        return _buildTabsSkeleton();
      case SkeletonType.emptyState:
        return _buildEmptyStateSkeleton();
      case SkeletonType.slider:
        return _buildSliderSkeleton();
      case SkeletonType.compactListItem:
        return _buildCompactListItemSkeleton();
    }
  }

  /// Builds skeleton for chips (like payment types or programs)
  Widget _buildChipsSkeleton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 0.0), // Context usually adds padding
      child: Wrap(
        spacing: 12.0,
        runSpacing: 12.0,
        children: List.generate(
          widget.itemCount,
          (index) => _buildShimmerBox(
            width: 100.0,
            height: 48.0,
            circular: false,
          ),
        ),
      ),
    );
  }

  /// Builds skeleton for dashboard stats (Muzakki/Mustahik cards)
  Widget _buildDashboardStatsSkeleton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 3.0,
                    color: Color(0x33000000),
                    offset: Offset(0.0, 1.0),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildShimmerBox(
                      width: 40.0, height: 40.0, circular: false), // Icon
                  const SizedBox(height: 12.0),
                  _buildShimmerBox(width: 100.0, height: 12.0), // Label
                  const SizedBox(height: 8.0),
                  _buildShimmerBox(width: 60.0, height: 24.0), // Count
                ],
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 3.0,
                    color: Color(0x33000000),
                    offset: Offset(0.0, 1.0),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildShimmerBox(
                      width: 40.0, height: 40.0, circular: false), // Icon
                  const SizedBox(height: 12.0),
                  _buildShimmerBox(width: 100.0, height: 12.0), // Label
                  const SizedBox(height: 8.0),
                  _buildShimmerBox(width: 60.0, height: 24.0), // Count
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds skeleton for dashboard grid (Quick actions)
  Widget _buildDashboardGridSkeleton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              blurRadius: 3.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 1.0),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildShimmerBox(width: 120.0, height: 16.0), // Title
            const SizedBox(height: 16.0),
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                9, // 3x3 grid
                (index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildShimmerBox(width: 56.0, height: 56.0, circular: true),
                    const SizedBox(height: 8.0),
                    _buildShimmerBox(width: 60.0, height: 10.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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

  /// Builds skeleton for summary cards (like in Laporan page)
  Widget _buildSummarySkeleton() {
    return Container(
      width: double.infinity,
      color: FlutterFlowTheme.of(context).primary,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        children: [
          Divider(color: Colors.white.withOpacity(0.1)),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildShimmerBox(width: 120.0, height: 12.0),
                    const SizedBox(height: 4.0),
                    _buildShimmerBox(width: 160.0, height: 24.0),
                  ],
                ),
              ),
              Container(
                width: 1,
                height: 40,
                color: Colors.white.withOpacity(0.2),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildShimmerBox(width: 120.0, height: 12.0),
                    const SizedBox(height: 4.0),
                    _buildShimmerBox(width: 100.0, height: 24.0),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Builds skeleton for detail rows (text only list items)
  Widget _buildDetailRowSkeleton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
              color: const Color(0x0D000000),
              offset: const Offset(0.0, 2.0),
            ),
          ],
        ),
        child: Column(
          children: List.generate(
            widget.itemCount,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildShimmerBox(width: 100.0, height: 14.0),
                  _buildShimmerBox(width: 120.0, height: 14.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds skeleton for transaction filter tabs
  Widget _buildTransactionFilterSkeleton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildShimmerBox(width: 150.0, height: 18.0),
          const SizedBox(height: 16.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            child: Row(
              children: List.generate(
                5,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: _buildShimmerBox(
                    width: 80.0 + (index * 10.0),
                    height: 36.0,
                    circular: true,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds skeleton for balance/summary cards with gradient
  Widget _buildBalanceCardSkeleton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [Color(0xFF1A3C34), Color(0xFF0D1F1A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: _buildShimmerBox(width: 40.0, height: 40.0),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildShimmerBox(
                        width: 120.0,
                        height: 12.0,
                      ),
                      const SizedBox(height: 4.0),
                      _buildShimmerBox(
                        width: 80.0,
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            _buildShimmerBox(width: 180.0, height: 32.0),
          ],
        ),
      ),
    );
  }

  /// Builds skeleton for modern header with avatar
  Widget _buildHeaderSkeleton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: const [Color(0xFF1A3C34), Color(0xFF0D1F1A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            _buildShimmerBox(width: 56.0, height: 56.0, circular: true),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildShimmerBox(width: 180.0, height: 18.0),
                  const SizedBox(height: 8.0),
                  _buildShimmerBox(width: 120.0, height: 12.0),
                  const SizedBox(height: 12.0),
                  Row(
                    children: [
                      _buildShimmerBox(width: 100.0, height: 14.0),
                      const SizedBox(width: 16.0),
                      _buildShimmerBox(width: 100.0, height: 14.0),
                    ],
                  ),
                ],
              ),
            ),
            _buildShimmerBox(width: 24.0, height: 24.0, circular: true),
          ],
        ),
      ),
    );
  }

  /// Builds skeleton for tab bar
  Widget _buildTabsSkeleton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: List.generate(
          widget.itemCount.clamp(1, 5),
          (index) => Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: _buildShimmerBox(
              width: 60.0 + (index * 15.0),
              height: 16.0,
            ),
          ),
        ),
      ),
    );
  }

  /// Builds skeleton for empty state placeholder
  Widget _buildEmptyStateSkeleton() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildShimmerBox(width: 80.0, height: 80.0, circular: true),
            const SizedBox(height: 16.0),
            _buildShimmerBox(width: 180.0, height: 16.0),
            const SizedBox(height: 8.0),
            _buildShimmerBox(width: 140.0, height: 12.0),
          ],
        ),
      ),
    );
  }

  /// Builds skeleton for slider/carousel
  Widget _buildSliderSkeleton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 150.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 8.0,
              color: const Color(0x1A000000),
              offset: const Offset(0.0, 2.0),
            ),
          ],
        ),
        child: _buildShimmerBox(width: double.infinity, height: 150.0),
      ),
    );
  }

  /// Builds skeleton for compact list items (without card background)
  Widget _buildCompactListItemSkeleton() {
    return Column(
      children: List.generate(
        widget.itemCount,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            children: [
              _buildShimmerBox(width: 40.0, height: 40.0, circular: true),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildShimmerBox(width: double.infinity, height: 14.0),
                    const SizedBox(height: 6.0),
                    _buildShimmerBox(width: 120.0, height: 10.0),
                  ],
                ),
              ),
              const SizedBox(width: 12.0),
              _buildShimmerBox(width: 70.0, height: 14.0),
            ],
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
