import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';
import '../../provider/theme_mode.dart';
import 'package:ecommerce/screens/reuse_widget/reuse_widget.dart';
import '../../resources/resources.dart';
import '../../data/data.dart';
import '../../user_preferences/user_preferences.dart';

class UserProfile extends StatelessWidget {
  UserProfile({Key? key}) : super(key: key);
  final userPreferences = UserPreferences();

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<ThemeChange>(context, listen: false);
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0).w,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                leading: BackIconButton(topPadding: 5,),
                backgroundColor: ColorManager.whiteColor,
                expandedHeight: 10.h,
                title:  Text("User profile ",style: TextStyle(color: ColorManager.blackColor,fontSize: 18.sp),),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Center(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              top: 10,
                              bottom: 5,
                            ).r,
                            height: 70.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(const Radius.circular(16).w),
                                color: ColorManager.pinkColor,
                                image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        "https://c4.wallpaperflare.com/wallpaper/100/30/528/anime-naruto-itachi-uchiha-wallpaper-preview.jpg"))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    debugPrint("Tap");
                                  },
                                  child: Container(
                                      margin:
                                      const EdgeInsets.only(right: 5, bottom: 5)
                                          .r,
                                      padding: const EdgeInsets.all(5).w,
                                      decoration: BoxDecoration(
                                          color: ColorManager.whiteColor,
                                          borderRadius: BorderRadius.all(
                                              const Radius.circular(9).w)),
                                      child: Image.asset(
                                        IconsAssets.editLogo,
                                        height: 14.5.h,
                                      )),
                                )
                              ],
                            ),
                          ),
                          Text(
                            "Upload image",
                            style: fontSizeWeightTextStyle(
                                13.sp, FontWeightManager.bold),
                          )
                        ],
                      ),
                    ),
                    Label(
                        label: "Name",
                        child: UserTextField(
                          fieldLength: 15,
                          keyboardType: TextInputType.name,
                          label: "Name",
                        )),
                    SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text(
                              "Gender",
                              style:
                              fontSizeColorTextStyle(18, ColorManager.greyColor),
                            ),
                          ),
                          Container(
                            width: 210.w,
                            margin: const EdgeInsets.only(right: 33, top: 15).r,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: RadioButtonList.data.length,
                              itemBuilder: (BuildContext context, index) {
                                return CustoumRadioButton(
                                  width:  RadioButtonList.data[index]["width"],
                                  label: RadioButtonList.data[index]["label"],
                                  index: index + 20,
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Label(
                        label: "Age",
                        child: UserTextField(
                          fieldLength: 2,
                          keyboardType: TextInputType.number,
                          label: "Age",
                        )),
                    Label(
                        label: "Email",
                        child: UserTextField(
                          fieldLength: 25,
                          keyboardType: TextInputType.emailAddress,
                          label: "Email",
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Setting",
                          style: fontWeightSizeColorTextStyle(
                              FontWeightManager.bold, 16, Colors.black),
                        )),
                    Box(
                      height: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          BoxDesign(
                              child_1: DesignLabel(
                                sizeBoxWidth: 200,
                                label_1: "Language",
                                iconAsset: IconsAssets.languageLogo,
                              ),
                              child_2: const BoxText(
                                label: "English",
                              )),
                          BoxDesign(
                              child_1: DesignLabel(
                                sizeBoxWidth: 200,
                                label_1: "Notification",
                                iconAsset: IconsAssets.notificationLogo,
                              ),
                              child_2: SwitchButton(
                                changed: false,
                              )),
                          BoxDesign(
                              child_1: DesignLabel(
                                sizeBoxWidth: 200,
                                label_1: "Dark Mode",
                                iconAsset: IconsAssets.darkThemeLogo,
                              ),
                              child_2: SwitchButton(
                                changed: false,
                                perform: darkTheme.themeDarkTrue,
                              )),
                          BoxDesign(
                              child_1: DesignLabel(
                                sizeBoxWidth: 200,
                                label_1: "Help Center",
                                iconAsset: IconsAssets.helpCenterLogo,
                              ),
                              child_2: const BoxText(
                                label: "?",
                              )),
                        ],
                      ),
                    ),
                    BlackButton(
                      buttonName: "Log out",
                      iconAsset: IconsAssets.logOutLogo,
                      onPressed: () {
                        userPreferences.logOutsetData(context);
                      },
                    )
                  ]),
                ),
              )
            ],
          ),
        )
        ,
      ),
    );
  }
}

// ignore: must_be_immutable
class Label extends StatelessWidget {
  Label({super.key, required this.label, required this.child});

  String label;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Text(
            label,
            style: fontSizeColorTextStyle(18, ColorManager.greyColor),
          ),
        ),
        child
      ],
    );
  }
}
