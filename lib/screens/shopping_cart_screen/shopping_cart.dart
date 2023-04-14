import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/screens/reuse_widget/reuse_widget.dart';
import 'package:flutter/material.dart';
import '../../listdata/data.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DesignText(text: "My Cart", fontSize: 18, color: ColorManager.blackColor, padding: 0),
                Cart(images: ProductCategory.images,child: PlusMinus(color: ColorManager.grey400Color),)
              ],
            ),
      )),
    );
  }
}
