import 'package:ecommerce/user_preferences/user_preferences.dart';
import 'package:flutter/material.dart';
import '../../provider/provider_resources.dart';
import '../../resources/resources.dart';
import 'package:ecommerce/resources/import_resources.dart';
import 'all_product.dart';
import 'package:ecommerce/screens/reuse_widget/reuse_widget.dart';
import '../../listdata/data.dart';
import 'provider/bottum_navigation/bottum_navigation.dart';
import 'package:ecommerce/screens/screens.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final userPreferences = UserPreferences();

  bool icon = true;

  final List _pages = [
    HomeScreen(),
    const ShoppingCart(),
    WishListScreen(),
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
            return _pages[value.selected];
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
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.w),
                    topRight: Radius.circular(25.w))),
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
  HomeScreen({
    super.key,
  });

  TextEditingController searchCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchData=Provider.of<SearchProductData>(context,listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 15, right: 15.0, left: 15.0).w,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: ColorManager.whiteColor,
                expandedHeight: 145.h,
                flexibleSpace: FlexibleSpaceBar(
                    background: Container(
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
                                Get.toNamed("/Categories");
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
                        child: RichTwoTxt(
                            text_1: "Welcome\n",
                            text_2: "Our Fashions App",
                            textSize_1: 30,
                            textSize_2: 25),
                      ),
                    ],
                  ),
                )),
              ),
            ];
          },
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchWidget(
                  textCtrl: searchCtrl,
                  onPressed: () {
                    debugPrint("search icon");
                    Get.to(SearchProduct(
                      searchText: searchCtrl.text.trim(),
                    ));
                    searchCtrl.text = "";
                    searchData.loading=true;
                  },
                  child: IcnButton(
                      iconSize: 0,
                      onPressed: () {
                        Get.toNamed("/FilterScreen");
                      },
                      child: CrcleAvatar(
                        radius: 23,
                        color: ColorManager.blackColor,
                        child: Image.asset(
                          IconsAssets.filterLogo,
                        ),
                      ))),
              DesignText(
                  padding: 8,
                  fontSize: 20,
                  text: "Categories",
                  color: ColorManager.blackColor),
              Padding(
                padding: const EdgeInsets.only(top: 8).r,
                child: SizedBox(
                  height: 25.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ProductCategory.category.length,
                    itemBuilder: (BuildContext context, index) {
                      return CategoryButton(
                        label: ProductCategory.category[index],
                        index: index,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DesignText(
                      padding: 8,
                      fontSize: 18,
                      text: "TopDress",
                      color: ColorManager.blackColor),
                  DesignText(
                      padding: 8,
                      fontSize: 12,
                      text: "View all",
                      color: ColorManager.darkGreyColor),
                ],
              ),
              Expanded(
                child: Consumer<ProductData>(builder: (context, value, child) {
                  return value.loading
                      ? const LoadingListPage()
                      : const AllProduct();
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}


