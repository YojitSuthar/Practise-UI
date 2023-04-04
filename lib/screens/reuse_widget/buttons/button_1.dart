import 'package:ecommerce/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/resources/import_resources.dart';

class Button extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  Button({super.key,
    required this.label,
     this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            fixedSize: Size(450.w, 45.h),
            backgroundColor: RGBColorManager.rgbNeonColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius
                    .circular(40)
                    .w)),
        child: Text(
          label,
          style: fontSizeColorTextStyle(17, ColorManager.blackColor),
        ));
  }
}
