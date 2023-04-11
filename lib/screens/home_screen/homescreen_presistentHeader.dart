import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';
import '../../provider/apiproductdata.dart';
import '../shimmer_scrren/shimmer_screen.dart';
import 'all_product.dart';



class HomeScreenPersistentHeader extends SliverPersistentHeaderDelegate {

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Consumer<ProductData>(builder: (context,value,child){
      return value.loading ?const LoadingListPage():const AllProduct();
    });
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) =>false;

  @override
  double get maxExtent => 430.0.h;

  @override
  double get minExtent => 0.0.h;
}
