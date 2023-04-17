import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';
import '../../resources/resources.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({
    Key? key,
    required this.bottumMargin,
    required this.allPadding,
    required this.height,
    required this.borderRadius,
    required this.child,
  }) : super(key: key);

  final double bottumMargin;
  final double allPadding;
  final double height;
  final Widget child;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bottumMargin).r,
      padding: EdgeInsets.all(allPadding).w,
      height: height.h,
      width: double.infinity,
      decoration: BoxDecoration(
          // color: RGBColorManager.rgbWhiteColor,
          color:ColorManager.whiteColor,
          boxShadow: [
            BoxShadow(
              color: ColorManager.grey400Color,
              offset: const Offset(
                5.0,
                1.0,
              ),
              blurRadius: 15.0,
              spreadRadius: 0.1,
            ),
          ],
          borderRadius: BorderRadius.circular(borderRadius).w),
      child: child,
    );
  }
}