import 'package:flutter/material.dart';
import 'package:ecommerce/screens/home_screen/homescreen_resources.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final userPreferences = UserPreferences();
  bool icon = true;
  final pages = [
    AllProduct(),
    const ShoppingCart(),
    const Wishlist(),
    const UserProfile(),
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
          body: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Container(
              margin: const EdgeInsets.only(top: 45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          padding: const EdgeInsets.all(0),
                          iconSize: 45,
                          onPressed: () {
                            debugPrint("dashboard");
                          },
                          icon: Image.asset(
                            IconsAssets.dashboardLogo,
                          )),
                      IconButton(
                          padding: const EdgeInsets.all(0),
                          iconSize: 50,
                          onPressed: () {
                            debugPrint("User logo");
                          },
                          icon: CircleAvatar(
                            radius: 45,
                            backgroundColor: ColorManager.greyOpacityColor,
                            child: Container(
                              padding: const EdgeInsets.all(5).w,
                              child: Image.asset(
                                IconsAssets.userLogo,
                              ),
                            ),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20).r,
                    child: RichText(
                      text: TextSpan(
                        text: 'Welcome,\n',
                        style: TextStyle(
                            color: ColorManager.blackColor,
                            fontSize: 35.sp,
                            fontWeight: FontWeightManager.bold),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Our Fashions App',
                              style: TextStyle(
                                  color: ColorManager.greyOpacityColor,
                                  fontSize: 25.sp,
                                  fontWeight: FontWeightManager.bold))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12).r,
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
                              IconButton(
                                  padding: const EdgeInsets.all(0),
                                  onPressed: () {
                                    debugPrint("search icon");
                                  },
                                  icon: Container(
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
                        IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              debugPrint("Filter");
                            },
                            icon: CircleAvatar(
                              radius: 23,
                              backgroundColor: ColorManager.blackColor,
                              child: Container(
                                padding: const EdgeInsets.all(9).w,
                                child: Image.asset(
                                  IconsAssets.filterLogo,
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13).r,
                    child: Container(
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
                  const SizedBox(
                    height: 20,
                  ),
                 Consumer<BottumNavigation>(builder: (context, value,child){
                   return  Expanded(
                     child: pages[value.selected],
                   );
                 })
                ],
              ),
            ),
          ),
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
                    OnSelectImageAsset: IconsAssets.homeLogo,
                    notSelectImageAsset: IconsAssets.homeUnfilledLogo),
                BottumTabButton(
                    inDex: 1,
                    OnSelectImageAsset: IconsAssets.cartLogo,
                    notSelectImageAsset: IconsAssets.cartUnfilledLogo),
                BottumTabButton(
                  inDex: 2,
                  OnSelectImageAsset: IconsAssets.wishListLogo,
                  notSelectImageAsset: IconsAssets.wishListUnfilledLogo,
                ),
                BottumTabButton(
                  inDex: 3,
                  OnSelectImageAsset: IconsAssets.userLogo,
                  notSelectImageAsset: IconsAssets.userUnfilledLogo,
                ),
              ],
            ),
          )),
    );
  }
}
