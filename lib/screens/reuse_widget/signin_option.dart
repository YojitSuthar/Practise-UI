import 'package:ecommerce/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/resources/import_resources.dart';

class SignInOption extends StatelessWidget {
  
  final String? label;
  final String? icon_image;
  SignInOption({required this.label, required this.icon_image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: ColorManager.greyOpacityColor),
          borderRadius: BorderRadius.circular(30).w),
      height: 45.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon_image!,
            height: 25,
          ),
          Container(
              margin: const EdgeInsets.only(left: 10),
              child:  Text(
                label!,
                style: fontSizeWeightTextStyle(15,FontWeightManager.medium),
              ))
        ],
      ),
    );
  }
}