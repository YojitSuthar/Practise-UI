import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';
import '../../resources/resources.dart';
import '../reuse_widget/reuse_widget.dart';
import '../screens.dart';

class ProfileShoppingCart extends StatelessWidget {
  const ProfileShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackIconButton(
                      topPadding: 0,
                    ),
                    CrcleAvatar(
                        radius: 21,
                        color: RGBColorManager.rgbWhiteColor,
                        child: Image.asset(IconsAssets.shoppingBagLogo)),
                  ],
                ),
              ),
              const Expanded(child: ShoppingCart()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100.h,
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        
        decoration:  BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: const BorderRadius.only(topRight: Radius.circular(25),topLeft:Radius.circular(25), )
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DesignText(
                    text: "Total (3 item)",
                    fontSize: 15,
                    color: ColorManager.grey400Color,
                    padding: 0),
                DesignText(
                    text: "\$500",
                    fontSize: 20,
                    color: ColorManager.blackColor,
                    padding: 0)
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed("/CartDelivery");
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(350.w, 50.h),
                    backgroundColor: ColorManager.blackColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius
                            .circular(20)
                            .w)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DesignText(text: "Processed to checkout",
                        fontSize: 15,
                        color: ColorManager.whiteColor,
                        padding: 0),
                    Image.asset(IconsAssets.rightArrowWhiteLogo, height:30,)

                  ],
                ))
          ],
        ),
      ),
    );
  }
}
