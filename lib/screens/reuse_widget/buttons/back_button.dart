import 'package:flutter/material.dart';
import '../../../resources/import_resources.dart';
import '../../../resources/resources.dart';


class BackIconButton extends StatelessWidget {
  const BackIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 35.0),
        child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Image.asset(IconsAssets.backButtonLogo)));
  }
}
