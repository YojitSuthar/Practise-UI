import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';
import '../../resources/resources.dart';
import '../reuse_widget/reuse_widget.dart';

class CartDelivery extends StatelessWidget {
  CartDelivery({Key? key}) : super(key: key);

  final List<Map<String, String>> address = [
    {
      "label": "Street: ",
      "next": "3512 Pearl Street",
    },
    {"label": "City: ", "next": "GandhiNagar"},
    {"label": "State/province/area: ", "next": "Gujrat"},
    {"label": "Phone number: ", "next": "+115151121"},
    {"label": "Zip code: ", "next": "+115151121"},
    {"label": "Country: ", "next": "India"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackIconButton(topPadding: 0),
              DesignText(
                  text: StringManager.deliveryAddress,
                  fontSize: 18,
                  color: ColorManager.blackColor,
                  padding: 0),
              Padding(
                padding: const EdgeInsets.only(top: 15.0).w,
                child: CardContainer(
                    bottumMargin: 0,
                    allPadding: 18,
                    height: 170,
                    borderRadius: 15,
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: ListView.builder(
                                itemCount: address.length,
                                itemBuilder: (BuildContext context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 7).w,
                                    child: RichTwoTxt(
                                        text_1: address[index]["label"].toString(),
                                        text_2: address[index]["next"].toString(),
                                        textSize_1: 13,
                                        textSize_2: 12),
                                  );
                                }))
                      ],
                    ),
                ),
              ),
              DesignText(
                  text: StringManager.productItem,
                  fontSize: 18,
                  color: ColorManager.blackColor,
                  padding: 12),
              SizedBox(
                  height: 175.h,
                  child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (BuildContext context, index) {
                        return CardContainer(
                            bottumMargin: 12,
                            allPadding: 12,
                            height: 75,
                            borderRadius: 20,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20).r,
                                  child: Container(
                                    height: double.infinity,
                                    width: 60.w,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(15),
                                        image: const DecorationImage(
                                            image: NetworkImage(
                                                ProjectNetworkImage
                                                    .randomImage1),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DesignText(
                                        text: StaticProductString.name,
                                        fontSize: 12,
                                        color: ColorManager.blackColor,
                                        padding: 0),
                                    DesignText(
                                        text: StaticProductString.detail,
                                        fontSize: 10,
                                        color: ColorManager.grey400Color,
                                        padding: 0),
                                    DesignText(
                                        text: StaticProductString.price,
                                        fontSize: 11,
                                        color: ColorManager.blackColor,
                                        padding: 0),
                                  ],
                                )
                              ],
                            ));
                      })),
              DesignText(
                  text: StringManager.productItem,
                  fontSize: 18,
                  color: ColorManager.blackColor,
                  padding: 0),
              CardContainer(
                bottumMargin: 12,
                allPadding: 12,
                height: 70,
                borderRadius: 20,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20).r,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        height: double.infinity,
                        width: 55.w,
                        decoration: BoxDecoration(
                          color: ColorManager.blackColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(IconsAssets.couponsLogo),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DesignText(
                            text: StringManager.promoCode,
                            fontSize: 15,
                            color: ColorManager.blackColor,
                            padding: 0),
                        DesignText(
                            text: "#532335",
                            fontSize: 14,
                            color: ColorManager.grey400Color,
                            padding: 0),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 15, right: 15).w,
        width: double.infinity,
        height: 70.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichTwoTxt(
                text_1: "Total price\n ",
                text_2: "\$ 454",
                textSize_1: 13,
                textSize_2: 15),
            BlackButton(
              borderRadius: 30,
              height: 50,
              width: 120,
              onPressed: () {
                debugPrint("Pressed");
                Get.toNamed("/TrackingProduct");
              },
              buttonName: "Place order",
            )
          ],
        ),
      ),
    );
  }
}
