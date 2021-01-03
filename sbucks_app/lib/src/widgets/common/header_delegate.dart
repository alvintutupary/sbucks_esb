import 'dart:math' as math;

import 'package:flutter/material.dart';

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;
  final double expandedHeight;
  final Function(double shrinkOffset, bool overlapsContent) builder;

  const HeaderDelegate({
    @required this.collapsedHeight,
    @required this.expandedHeight,
    @required this.builder,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return this.builder(shrinkOffset, overlapsContent);
  }

  @override
  double get minExtent => this.collapsedHeight;

  @override
  double get maxExtent => math.max(this.collapsedHeight, this.expandedHeight);

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
