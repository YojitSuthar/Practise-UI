import 'package:ecommerce/main_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/product_categorylist.dart';
import '../../resources/color_manager.dart';
import '../reuse_widget/buttons/category_button.dart';
import '../reuse_widget/buttons/icon_button.dart';
import '../reuse_widget/circle_avatar.dart';
import '../reuse_widget/text_design.dart';
import 'all_product.dart';


class HomeScreenPersistentHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

    return Container(
      padding: EdgeInsets.only(top: 15,left: 15,right: 15),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 280.0.w,
                  height: 45.0.h,
                  decoration: BoxDecoration(
                      color: RGBColorManager.rgbWhiteColor,
                      borderRadius: BorderRadius.circular(20.w)),
                  child: Row(
                    children: [
                      IcnButton(
                          onPressed: () {
                            debugPrint("search icon");
                          },
                          iconSize: 0,
                          child: SizedBox(
                            height: 25,
                            child: Image.asset(
                              IconsAssets.searchLogo,
                            ),
                          )),
                      Expanded(
                        child: TextFormField(
                          controller: null,
                          cursorHeight: 24,
                          cursorRadius: const Radius.circular(10).w,
                          cursorColor: ColorManager.blackColor,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                            const EdgeInsets.only(left: 11).r,
                            hintText: "Search",
                            // border: OutlineInputBorder(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                IcnButton(
                    iconSize: 0,
                    onPressed: () {
                      Get.toNamed("/FilterScreen");
                    },
                    child: CrcleAvatar(
                      radius: 23,
                      color: ColorManager.blackColor,
                      child: Image.asset(
                        IconsAssets.filterLogo,
                      ),
                    ))
              ],
            ),
          ),
          DesignText(
              fontSize: 20,
              text: "Categories",
              color: ColorManager.blackColor),
          Padding(
            padding: const EdgeInsets.only(top: 8).r,
            child: SizedBox(
              height: 25.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: ProductCategory().category.length,
                itemBuilder: (BuildContext context, index) {
                  return CategoryButton(
                    label: ProductCategory().category[index],
                    index: index,
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DesignText(
                  fontSize: 18,
                  text: "TopDress",
                  color: ColorManager.blackColor),
              DesignText(
                  fontSize: 12,
                  text: "View all",
                  color: ColorManager.darkGreyColor),
            ],
          ),
          Expanded(
            child: AllProduct(),
          )
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  double get maxExtent => 800.0;

  @override
  double get minExtent => 0.0;
}