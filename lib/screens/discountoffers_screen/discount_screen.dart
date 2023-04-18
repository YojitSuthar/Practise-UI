import 'package:ecommerce/resources/import_resources.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/screens/reuse_widget/reuse_widget.dart';
import 'package:flutter/material.dart';

class DiscountScreen extends StatelessWidget {
  DiscountScreen({Key? key}) : super(key: key);

  List<String> images = const[
    ProjectNetworkImage.randomImage6,
    ProjectNetworkImage.randomImage7,
    ProjectNetworkImage.randomImage8,
    ProjectNetworkImage.randomImage9,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackIconButton(topPadding: 0),
              DesignText(
                text: "Discounts",
                fontSize: 20,
                color: ColorManager.blackColor,
                padding: 0,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: images.length,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Container(
                            padding: const EdgeInsets.all(15).w,
                            height: 140.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        images[index]),
                                    fit: BoxFit.fill),
                                color: ColorManager.grey200Color,
                                borderRadius: BorderRadius.circular(20).w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichThreeTxt(
                                    text_1: "50% off\n",
                                    text_2: "On everything today\n",
                                    text_3: "With code: Fscreation\n",
                                    textSize_1: 25,
                                    textSize_2: 15,
                                    textSize_3: 10),
                                BlackButton(
                                  width: 90,
                                  height: 20,
                                  buttonName: "Get now",
                                  onPressed: () {},
                                  borderRadius: 20,
                                )
                              ],
                            ),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
