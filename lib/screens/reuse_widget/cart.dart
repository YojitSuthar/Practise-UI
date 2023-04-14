import 'package:ecommerce/resources/import_resources.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/screens/reuse_widget/reuse_widget.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({
    super.key,
    required this.images,
    required this.child
  });

  final List<String> images;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView.builder(
        itemCount: 5,
        padding: const EdgeInsets.only(top:5).r,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: const EdgeInsets.only(top:15),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12).w,
              height: 97.h,
              decoration: BoxDecoration(
                  color: RGBColorManager.rgbWhiteColor,
                  borderRadius: BorderRadius
                      .circular(20)
                      .w),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10).r,
                          child: Container(
                            height: double.infinity,
                            width: 90,
                            decoration: BoxDecoration(
                                image:   DecorationImage(
                                    image: NetworkImage(
                                        images[index]),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius
                                    .circular(15)
                                    .w),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DesignText(
                                text: StaticProductString.name,
                                fontSize: 17,
                                color: ColorManager.blackColor,
                                padding: 0),
                            DesignText(
                                text: StaticProductString.detail,
                                fontSize: 12,
                                color: ColorManager.greyColor,
                                padding: 0),
                            DesignText(
                                text: StaticProductString.price,
                                fontSize: 12,
                                color: ColorManager.blackColor,
                                padding: 0)
                          ],
                        )
                      ],
                    ),
                    child
                  ]),
            ),
          );
        }));
  }
}

class GestureDetect extends StatelessWidget {
  const GestureDetect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint(StringManager.addToCart);
      },
      child: Container(
          width: 70.w,
          height: 25.h,
          decoration: BoxDecoration(
              color: ColorManager.blackColor,
              borderRadius: BorderRadius
                  .circular(10)
                  .w),
          child: const Center(
              child: Text(StringManager.addToCart,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13)))),
    );
  }
}