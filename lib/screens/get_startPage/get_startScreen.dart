import 'package:flutter/material.dart';
import 'package:ecommerce/resources/import_resources.dart';
import 'package:ecommerce/resources/resources.dart';


class GetStartPage extends StatelessWidget {
  static const String id = "GetStartPage";

  const GetStartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              height: 350.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: RGBColorManager.rgbBlackColor,
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.greyColor,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(150).w,
                      bottomRight: const Radius.circular(150).w)),
              child:
                  Image.asset(ProjectImage.companyLogo, fit: BoxFit.scaleDown),
            ),
            Padding(
              padding: const EdgeInsets.all(35.0).w,
              child: Text(
                StringManager.companyName,
                style: fontSizeFamilyTextStyle(40, "academia"),
              ),
            ),
            Text(StringManager.companySlogan,
                style: fontSizeFamilyWeightTextStyle(
                    16, "Gruppo", FontWeightManager.bold)),
            Container(
                margin: const EdgeInsets.only(top: 80).r,
                child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed("/LoginPage");
                      debugPrint("Button pressed");
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize:  Size(200.w, 50.h),
                        backgroundColor: RGBColorManager.rgbNeonColor,

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40).w)),
                    child: Text(
                      StringManager.getStartPageButtonLabel,
                      style: fontSizeColorTextStyle(17,ColorManager.blackColor),
                    )))
          ],
        ),
      ),
    );
  }
}
