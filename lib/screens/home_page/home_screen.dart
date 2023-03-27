import 'package:database_auth/d.dart';
import 'package:database_auth/data/product_categorylist.dart';
import 'package:database_auth/screens/project_resources/import_resources.dart';
import 'package:database_auth/screens/reuse_widget/category_button.dart';
import 'package:database_auth/user_preferences/user_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../resources/resources.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final userPreferences = UserPreferences();

  bool icon = true;

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
          padding: const EdgeInsets.all(12.0),
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
                        return Button(
                          label: ProductCategory().category[index],
                          index: index,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ok(),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: RGBColorManager.rgbWhiteColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: GNav(
              color: Colors.black87,
              activeColor: Colors.black87,
              onTabChange: (index) {
                print(index);
              },
              gap: 5,
              tabs: const [
                GButton(
                  icon: CupertinoIcons.house_fill,
                  text: "Home",
                ),
                GButton(
                  icon: Icons.shopping_basket_sharp,
                  text: "Cart",
                ),
                GButton(
                  icon: CupertinoIcons.heart_fill,
                  text: "WishList",
                ),
                GButton(
                  icon: CupertinoIcons.profile_circled,
                  text: "Profile",
                ),
              ]),
        ),
      ),
    );
  }
}
