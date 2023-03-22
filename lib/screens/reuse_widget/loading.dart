import 'package:flutter/material.dart';
import 'package:database_auth/screens/project_resources/import_resources.dart';
import 'package:database_auth/resources/resources.dart';
class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: RGBColorManager.rgbNeonColor.withOpacity(0.4),
      child: Center(
        child: Lottie.asset(AnimationAssets.loading2_animation),
      ),
    );
  }
}
