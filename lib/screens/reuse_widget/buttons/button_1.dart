import 'package:ecommerce/auth/sing_up.dart';
import 'package:ecommerce/provider/absorbing.dart';
import 'package:ecommerce/screens/signup_screen/provider/signup_validation.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/resources/import_resources.dart';

class Button extends StatelessWidget {
  final String label;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  Button({super.key,
    required this.label,
    required this.width,
    required this.height,
    required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    final signUp = Provider.of<SignUpValidation>(context, listen: false);
    final absorb = Provider.of<Absorbing>(context, listen: false);
    return Consumer<Absorbing>(builder: (context, value, child) {
      return AbsorbPointer(
        absorbing: value.absorbButton,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                fixedSize: Size(width.w, height.h),
                backgroundColor: value.absorbButton ? RGBColorManager
                    .rgbWhiteColor : RGBColorManager.rgbNeonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius
                        .circular(40)
                        .w)),
            child: Text(
              label,
              style: fontSizeColorTextStyle(17, ColorManager.blackColor),
            )),
      );
    });
  }
}
