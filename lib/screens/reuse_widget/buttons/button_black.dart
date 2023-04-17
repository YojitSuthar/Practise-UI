import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';
import '../../../resources/resources.dart';
import '../reuse_widget.dart';

// This are the different colour theme which we are using in whole project
class IconBlackButton extends StatelessWidget {
  IconBlackButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
    required this.iconAsset,
  });

  String buttonName;
  String iconAsset;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          fixedSize: Size(350.w, 50.h),
          backgroundColor: ColorManager.blackColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20).w)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconAsset,
            height: 18,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            buttonName,
            style: fontSizeWeightTextStyle(17, FontWeightManager.semiBold),
          )
        ],
      ),
    );
  }
}


class BlackButton extends StatelessWidget {
   BlackButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
    required this.height,
    required this.width,
    required this.borderRadius,
  });

  final String buttonName;
  final double height;
  final double width;
  final double borderRadius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          fixedSize: Size(width.w, height.h),
          backgroundColor: ColorManager.blackColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius).w)),
      child: DesignText(
          text: buttonName,
          fontSize: 15,
          color: ColorManager.whiteColor,
          padding: 0),
    );
  }
}
