import 'package:flutter/material.dart';
import 'package:ecommerce/screens/home_screen/homescreen_resources.dart';
import '../../resources/resources.dart';
import 'package:ecommerce/resources/import_resources.dart';
import '../reuse_widget/rich_text.dart';
import 'homescreen_presistentHeader.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final userPreferences = UserPreferences();
  bool icon = true;
  final pages = [
    const HomeScreen(),
    const ShoppingCart(),
    const WishList(),
    UserAccount(),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          body: Consumer<BottumNavigation>(builder: (context, value, child) {
            return pages[value.selected];
          }),
          bottomNavigationBar: Container(
            height: 75,
            decoration: BoxDecoration(
                color: RGBColorManager.rgbWhiteColor,
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.greyOpacityColor,
                    offset: const Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                ],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottumTabButton(
                    inDex: 0,
                    onSelectImageAsset: IconsAssets.homeLogo,
                    notSelectImageAsset: IconsAssets.homeUnfilledLogo),
                BottumTabButton(
                    inDex: 1,
                    onSelectImageAsset: IconsAssets.cartLogo,
                    notSelectImageAsset: IconsAssets.cartUnfilledLogo),
                BottumTabButton(
                  inDex: 2,
                  onSelectImageAsset: IconsAssets.wishListLogo,
                  notSelectImageAsset: IconsAssets.wishListUnfilledLogo,
                ),
                BottumTabButton(
                  inDex: 3,
                  onSelectImageAsset: IconsAssets.userLogo,
                  notSelectImageAsset: IconsAssets.userUnfilledLogo,
                ),
              ],
            ),
          )),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: ColorManager.whiteColor,
          expandedHeight: 150.h,
          flexibleSpace: FlexibleSpaceBar(
              background: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0).r,
            child: Container(
              margin: const EdgeInsets.only(top: 45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IcnButton(
                          onPressed: () {
                            debugPrint("dashBoard");
                          },
                          iconSize: 45,
                          child: Image.asset(IconsAssets.dashboardLogo)),
                      IcnButton(
                          iconSize: 45,
                          onPressed: () {
                            debugPrint("User Profile");
                            Get.toNamed("/UserProfile");
                          },
                          child: CrcleAvatar(
                            color: RGBColorManager.rgbWhiteColor,
                            radius: 45,
                            child: Image.asset(IconsAssets.userLogo),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20).r,
                    child: RichTxt(
                        text_1: "Welcome\n",
                        text_2: "Our Fashions App",
                        textSize_1: 35,
                        textSize_2: 25),
                  ),
                ],
              ),
            ),
          )),
        ),
        SliverPersistentHeader(delegate: HomeScreenPersistentHeader())
      ],
    );
  }
}
