import 'package:flutter/material.dart';
import 'package:ecommerce/resources/import_resources.dart';
import 'package:ecommerce/resources/resources.dart';

// this is the Loading animation
class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: RGBColorManager.rgbNeonColor.withOpacity(0.4),
      child: Center(
        child: SizedBox(
          height: 100.h,
            child: Lottie.asset(AnimationAssets.loadingAnimation)),
      ),
    );
  }
}
