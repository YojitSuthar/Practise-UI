import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';
import '../../resources/resources.dart';


class RichTxt extends StatelessWidget {
  RichTxt({
    super.key,
    required this.text_1,
    required this.text_2,
    required this.textSize_1,
    required this.textSize_2,
  });

  String text_1;
  String text_2;
  double textSize_1;
  double textSize_2;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text_1,
        style: fontWeightSizeColorTextStyle(
          FontWeightManager.bold,
          textSize_1.sp,
          ColorManager.blackColor,
        ),
        children: <TextSpan>[
          TextSpan(
              text: text_2,
              style: fontWeightSizeColorTextStyle(
                FontWeightManager.bold,
                textSize_2.sp,
                ColorManager.greyOpacityColor,
              ))
        ],
      ),
    );
  }
}