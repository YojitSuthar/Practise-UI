import 'package:ecommerce/data/UserOption.dart';
import 'package:ecommerce/resources/import_resources.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:flutter/material.dart';
import '../reuse_widget/box_design.dart';

class UserAccount extends StatelessWidget {
  UserAccount({Key? key}) : super(key: key);
  OptionButton option=OptionButton();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0).w,
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 80.h,
                    width: 350,

                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: ColorManager.greyOpacityColor,
                            offset: const Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 0.5,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20)),
                    margin: const EdgeInsets.only(top: 50),
                    child: Row(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      "https://c4.wallpaperflare.com/wallpaper/100/30/528/anime-naruto-itachi-uchiha-wallpaper-preview.jpg")),
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(5).w,
                        ),
                        SizedBox(
                          height: 70,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "ABX",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeightManager.bold),
                              ),
                              Text(
                                "ABx@gmail.com",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeightManager.medium,
                                    color: ColorManager.greyOpacityColor),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15, top: 15),
                  padding: const EdgeInsets.all(22).w,
                  height: 400.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    // color: Colors.pink,
                      border: Border.all(
                          color: ColorManager.greyOpacityColor, width: 2.3.w),
                      borderRadius: BorderRadius.circular(30)),
                  child: ListView.builder(
                    itemCount: option.optionButton.length,
                    itemBuilder: (BuildContext context, index) {
                      return BoxDesign(
                        child_1: DesignLabel(
                          label_1:  option.optionButton[index]["label_1"],
                          iconAsset: option.optionButton[index]["iconAsset"],
                        ),
                        child_2: IconNavigation(Navigation: option.optionButton[index]["Navigation"],),
                      );
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class IconNavigation extends StatelessWidget {
  IconNavigation({
    super.key,
    required this.Navigation
  });
  String Navigation;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.toNamed(Navigation);
      },
      icon:
      Image.asset(IconsAssets.rightArrowLogo, height: 15),
    );
  }
}
