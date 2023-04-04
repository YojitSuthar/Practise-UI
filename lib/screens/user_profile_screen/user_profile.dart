import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';
import '../../provider/theme_mode.dart';
import '../reuse_widget/buttons/button_2.dart';
import 'user_resources.dart';

class UserProfile extends StatelessWidget {
  UserProfile({Key? key}) : super(key: key);
  final userPreferences = UserPreferences();

  @override
  Widget build(BuildContext context) {
    final DarkTheme = Provider.of<ThemeChange>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackIconButton(),
              Center(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 5).r,
                      height: 70.h,
                      width: 80.w,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.pink,
                          image: DecorationImage(
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
                      width: 205.w,
                      margin: const EdgeInsets.only(right: 33, top: 15).r,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: RadioButtonList().data.length,
                        itemBuilder: (BuildContext context, index) {
                          return CustoumRadioButton(
                            label: RadioButtonList().data[index],
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
                    keyboardType: TextInputType.number,
                    label: "Age",
                  )),
              Label(
                  label: "Email",
                  child: UserTextField(
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
              Container(
                margin: const EdgeInsets.only(bottom: 15, top: 15),
                padding: const EdgeInsets.all(22).w,
                height: 310.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    // color: Colors.pink,
                    border: Border.all(
                        color: ColorManager.greyOpacityColor, width: 2.3.w),
                    borderRadius: BorderRadius.circular(30)),
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
                          perform:DarkTheme.themeDarkTrue,
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
            ],
          ),
        ),
      ),
    );
  }
}

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
