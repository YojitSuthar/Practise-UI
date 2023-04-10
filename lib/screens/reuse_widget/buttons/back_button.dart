import 'package:flutter/material.dart';
import '../../../resources/import_resources.dart';
import '../../../resources/resources.dart';

class BackIconButton extends StatelessWidget {
  BackIconButton({Key? key, required this.topPadding}) : super(key: key);

  double topPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          top: topPadding,
        ).r,
        child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Image.asset(IconsAssets.backButtonLogo)));
  }
}
