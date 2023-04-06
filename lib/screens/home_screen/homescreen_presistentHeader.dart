import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../provider/productdata.dart';
import 'all_product.dart';

class HomeScreenPersistentHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final data = Provider.of<ProductData>(context, listen: false);
    return Consumer<ProductData>(builder: (context,value,child){
      return value.loading ?const Center(child: CircularProgressIndicator()):AllProduct();
    });
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  double get maxExtent => 430.0.h;

  @override
  double get minExtent => 0.0.h;
}
