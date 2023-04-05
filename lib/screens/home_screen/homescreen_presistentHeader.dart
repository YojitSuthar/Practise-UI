import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/productdata.dart';
import 'all_product.dart';

class HomeScreenPersistentHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AllProduct();
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  double get maxExtent => 550.0;

  @override
  double get minExtent => 0.0;
}
