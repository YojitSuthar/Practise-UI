import 'package:ecommerce/screens/reuse_widget/reuse_widget.dart';
import '../../resources/resources.dart';
import '../../resources/import_resources.dart';
import '../../data/data.dart';
import 'package:flutter/material.dart';
import 'provider/page_index.dart';



class ProductDetailsView extends StatelessWidget {
  ProductDetailsView({Key? key}) : super(key: key);

  List urlImages = [
    'https://c1.wallpaperflare.com/preview/169/906/352/cactus-cacti-potted-minimal.jpg',
    'https://c1.wallpaperflare.com/preview/152/420/904/x-box-console-joypad-activity.jpg',
    'https://c0.wallpaperflare.com/preview/611/951/728/alarm-alarm-clock-alert-beat.jpg',
    'https://c1.wallpaperflare.com/preview/152/420/904/x-box-console-joypad-activity.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final activeIndex = Provider.of<PageIndex>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CarouselSlider.builder(
                    itemCount: urlImages.length,
                    options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          activeIndex.changeIndex(index);
                        },
                        height: 320.h,
                        viewportFraction: 1,
                        enableInfiniteScroll: false),
                    itemBuilder: (BuildContext context, index, pageIndex) {
                      return Image.network(urlImages[index], fit: BoxFit.cover);
                    }),
                SizedBox(
                  height: 320.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0).w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const BackIconButton(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, top: 35).r,
                              child: CrcleAvatar(
                                color: RGBColorManager.rgbWhiteColor,
                                radius: 22,
                                child: Image.asset(IconsAssets.shoppingBagLogo),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Consumer<PageIndex>(
                                builder: (context, value, child) {
                              return AnimatedSmoothIndicator(
                                activeIndex: value.pageIndex,
                                count: urlImages.length,
                                effect: ExpandingDotsEffect(
                                    dotHeight: 7.h,
                                    dotWidth: 8.w,
                                    activeDotColor: ColorManager.blackColor,
                                    dotColor: ColorManager.greyColor),
                              );
                            }),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 80,
                                right: 15,
                                bottom: 5
                              ).r,
                              child: const AnimatedIconButton(),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DesignText(
                              padding: 0,
                              text: "Roller Rabbit",
                              fontSize: 20,
                              color: Colors.black),
                          DesignText(
                              padding: 0,
                              text: "Vado Odelle Dres",
                              fontSize: 12,
                              color: Colors.grey),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 25.h,
                            width: 92.w,
                            decoration: BoxDecoration(
                                color: RGBColorManager.rgbWhiteColor,
                                borderRadius: BorderRadius.circular(20).w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IcnButton(
                                    onPressed: () {},
                                    child: Image.asset(
                                      IconsAssets.minusLogo,
                                      height: 15,
                                    )),
                                Text(
                                  "1",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeightManager.bold),
                                ),
                                IcnButton(
                                    onPressed: () {},
                                    child: Image.asset(
                                      IconsAssets.addLogo,
                                      height: 15,
                                    )),
                              ],
                            ),
                          ),
                          DesignText(
                              padding: 5,
                              text: "Availability in Stock",
                              fontSize: 13,
                              color: ColorManager.darkGreyColor),
                        ],
                      )
                    ],
                  ),
                  DesignText(
                      padding: 5,
                      text: "Stock",
                      fontSize: 17,
                      color: ColorManager.blackColor),
                  Padding(
                    padding: const EdgeInsets.only(top: 5).r,
                    child: SizedBox(
                      height: 40.h,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: ProductCategory().clothSize.length,
                        itemBuilder: (BuildContext context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: CrcleAvatar(
                              radius: 25,
                              color: RGBColorManager.rgbWhiteColor,
                              child: Text(
                                ProductCategory().clothSize[index],
                                style: fontWeightSizeColorTextStyle(
                                    FontWeightManager.bold,
                                    18,
                                    ColorManager.blackColor),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  DesignText(
                      padding: 5,
                      text: "Description",
                      fontSize: 17,
                      color: ColorManager.blackColor),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud",
                    style: TextStyle(
                        fontSize: 15, color: ColorManager.darkGreyColor),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: BlackButton(
                iconAsset: IconsAssets.applyLogo,
                buttonName: "Add to Cart",
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
