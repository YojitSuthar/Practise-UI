import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';
import '../../resources/resources.dart';

// This is custom box Widget which we use in user profile Screens

class Box extends StatelessWidget {
  Box({
    super.key,
    required this.child,
    required this.height,
  });

  Widget child;
  double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 15),
      padding: const EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 0).w,
      height: height.h,
      width: double.infinity,
      decoration: BoxDecoration(
          // color: Colors.pink,
          border:
              Border.all(color: ColorManager.greyOpacityColor, width: 1.5.w),
          borderRadius: BorderRadius.circular(30)),
      child: child,
    );
  }
}

class BoxDesign extends StatelessWidget {
  BoxDesign({
    super.key,
    required this.child_1,
    required this.child_2,
  });

  Widget child_1;
  Widget child_2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        child_1,
        child_2,
      ],
    );
  }
}

class BoxText extends StatelessWidget {
  const BoxText({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: fontWeightSizeColorTextStyle(
          FontWeightManager.medium, 16, ColorManager.greyOpacityColor),
    );
  }
}

class DesignLabel extends StatelessWidget {
  DesignLabel({
    super.key,
    required this.iconAsset,
    required this.label_1,
    required this.sizeBoxWidth,
    this.onTap,
  });

  final String iconAsset;
  final String label_1;
  double sizeBoxWidth;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: sizeBoxWidth.w,
        child: Row(
          children: [
            Container(
              height: 45.h,
              width: 50.w,
              margin: const EdgeInsets.only(right: 15, top: 10).r,
              padding: const EdgeInsets.all(15).w,
              decoration: BoxDecoration(
                color: RGBColorManager.rgbWhiteColor,
                borderRadius: BorderRadius.circular(10).w,
              ),
              child: Image.asset(iconAsset),
            ),
            Text(
              label_1,
              style: fontWeightSizeColorTextStyle(
                  FontWeightManager.bold, 16, Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
