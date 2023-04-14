
import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/screens/reuse_widget/reuse_widget.dart';
import '../../resources/resources.dart';
import '../../listdata/data.dart';

class UserAccount extends StatelessWidget {
  UserAccount({Key? key}) : super(key: key);

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
                      width: 75,
                      decoration: BoxDecoration(
                          color: ColorManager.greyOpacityColor,
                          image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "https://c4.wallpaperflare.com/wallpaper/100/30/528/anime-naruto-itachi-uchiha-wallpaper-preview.jpg")),
                          borderRadius: BorderRadius.circular(20)),
                      margin: const EdgeInsets.all(11).w,
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
            Box(
              height: 380,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: OptionButton.userAccountOptions_1.length,
                itemBuilder: (BuildContext context, index) {
                  return BoxDesign(
                    child_1: DesignLabel(
                      onTap: () {
                        Get.toNamed(
                            OptionButton.userAccountOptions_1[index]["Navigation"]);
                      },
                      sizeBoxWidth: 230,
                      label_1: OptionButton.userAccountOptions_1[index]["label_1"],
                      iconAsset: OptionButton.userAccountOptions_1[index]
                          ["iconAsset"],
                    ),
                    child_2: IconNavigation(
                      Navigation: OptionButton.userAccountOptions_1[index]
                          ["Navigation"],
                    ),
                  );
                },
              ),
            ),
            Box(
              height: 270,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: OptionButton.userAccountOptions_2.length,
                itemBuilder: (BuildContext context, index) {
                  return BoxDesign(
                    child_1: DesignLabel(
                      onTap: () {
                        Get.toNamed(
                            OptionButton.userAccountOptions_2[index]["Navigation"]);
                      },
                      sizeBoxWidth: 230,
                      label_1: OptionButton.userAccountOptions_2[index]["label_1"],
                      iconAsset: OptionButton.userAccountOptions_2[index]
                          ["iconAsset"],
                    ),
                    child_2: IconNavigation(
                      Navigation: OptionButton.userAccountOptions_2[index]
                          ["Navigation"],
                    ),
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
  IconNavigation({super.key, required this.Navigation});

  String Navigation;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.toNamed(Navigation);
      },
      icon: Image.asset(IconsAssets.rightArrowLogo, height: 15),
    );
  }
}
