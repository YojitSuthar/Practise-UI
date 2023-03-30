import 'package:ecommerce/resources/import_resources.dart';
import 'package:ecommerce/screens/reuse_widget/radio_button.dart';
import 'package:flutter/material.dart';
import '../../resources/resources.dart';
import '../../user_preferences/user_preferences.dart';
import '../reuse_widget/textfield/text_field_2.dart';

class UserProfile extends StatelessWidget {
  UserProfile({Key? key}) : super(key: key);
  bool abc = false;
  final userPreferences = UserPreferences();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0).w,
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 110, bottom: 5).r,
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
                                  const EdgeInsets.only(right: 5, bottom: 5).r,
                              padding: const EdgeInsets.all(5).w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
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
                    style:
                        fontSizeWeightTextStyle(13.sp, FontWeightManager.bold),
                  )
                ],
              ),
              Label(
                  label: "Name",
                  child: UserTextField(
                    label: "Name",
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      "Gender",
                      style: fontSizeColorTextStyle(18, ColorManager.greyColor),
                    ),
                  ),
                  Container(
                    width: 230,
                    margin: const EdgeInsets.only(right: 50, top: 15).r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustoumRadioButton(onSelect: abc, label: "Male"),
                        CustoumRadioButton(onSelect: abc, label: "Female"),
                      ],
                    ),
                  )
                ],
              ),
              Label(
                  label: "Age",
                  child: UserTextField(
                    label: "Age",
                  )),
              Label(
                  label: "Email",
                  child: UserTextField(
                    label: "Email",
                  )),
              ElevatedButton(
                onPressed: () {
                  userPreferences.logOutsetData(context);
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(350.w, 50.h),
                    backgroundColor: ColorManager.blackColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20).w)),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Image.asset(IconsAssets.logOutLogo,height: 18,),
                  const SizedBox(width: 15,),
                  Text("Log Out",style: fontSizeWeightTextStyle(17, FontWeightManager.semiBold),)

                ],),
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
