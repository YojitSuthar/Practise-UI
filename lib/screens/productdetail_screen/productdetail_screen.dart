import 'package:ecommerce/models/product_model/productdata_model.dart';
import 'package:ecommerce/screens/screens.dart';
import 'package:ecommerce/screens/reuse_widget/reuse_widget.dart';
import '../../resources/resources.dart';
import '../../resources/import_resources.dart';
import '../../data/data.dart';
import 'package:flutter/material.dart';
import 'provider/page_index.dart';

class ProductDetailsView extends StatelessWidget {
  ProductDetailsView({Key? key,required this.index,required this.model}) : super(key: key);
  int index;
  List<Product>model;
  int pageIndex=0;

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
                 GestureDetector(
                   onDoubleTap: (){
                     debugPrint("Navigate image");
                     Get.to(ProductView(images: model[index].images!,));
                   },
                   child: Hero(
                     tag: "image",
                     child: CarouselSlider.builder(
                          itemCount: model[index].images!.length ,
                          options: CarouselOptions(
                              onPageChanged: (index, reason) {
                                pageIndex=activeIndex.changeIndex(index,pageIndex);
                              },
                              height: 320.h,
                              viewportFraction: 1,
                              enableInfiniteScroll: false),
                          itemBuilder: (BuildContext context, _, pageIndex) {
                            return Image.network(
                                model[index].images![_],
                                fit: BoxFit.cover);
                          }),
                   ),
                 ),

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
                            BackIconButton(topPadding: 30),
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
                                activeIndex: pageIndex,
                                count:  model[index].images!.length,
                                effect: ExpandingDotsEffect(
                                    dotHeight: 7.h,
                                    dotWidth: 8.w,
                                    activeDotColor: ColorManager.blackColor,
                                    dotColor: ColorManager.greyColor),
                              );
                            }),
                            Padding(
                              padding: const EdgeInsets.only(
                                      left: 80, right: 15, bottom: 5)
                                  .r,
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
                              text: model[index].title.toString(),
                              fontSize: 15,
                              color: ColorManager.blackColor),
                          DesignText(
                              padding: 0,
                              text: model[index].brand.toString(),
                              fontSize: 12,
                              color: ColorManager.greyColor
                          ),
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
                        itemCount: ProductCategory.clothSize.length,
                        itemBuilder: (BuildContext context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 5).r,
                            child: CrcleAvatar(
                              radius: 25,
                              color: RGBColorManager.rgbWhiteColor,
                              child: Text(
                                ProductCategory.clothSize[index],
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
                    model[index].description.toString(),
                    style: TextStyle(
                        fontSize: 15, color: ColorManager.darkGreyColor),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlackButton(
          iconAsset: IconsAssets.applyLogo,
          buttonName: "Add to Cart",
          onPressed: () {
            Get.back();
          },
        ),
      ),
    );
  }
}
