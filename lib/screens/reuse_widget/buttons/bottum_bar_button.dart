import 'package:ecommerce/screens/home_screen/provider/bottum_navigation/bottum_navigation.dart';
import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';

// This are the buttons on button tab bar button with changing index abd body

class BottumTabButton extends StatelessWidget {
  BottumTabButton({
    super.key,
    required this.inDex,
    required this.onSelectImageAsset,
    required this.notSelectImageAsset
  });

  int inDex;
  String onSelectImageAsset;
  String notSelectImageAsset;

  @override
  Widget build(BuildContext context) {
    final navigation = Provider.of<BottumNavigation>(context, listen: false);
    return Consumer<BottumNavigation>(builder: (context, value, child) {
      return IconButton(
          enableFeedback: false,
          onPressed: () {
            if (navigation.contain.contains(inDex)) {
              debugPrint("change");
              navigation.change(inDex);
            } else {
              debugPrint("else change");
              navigation.contain.clear();
              navigation.change(inDex);
              navigation.add(inDex);
            }
          },
          icon: navigation.contain.contains(inDex)
              ? SizedBox(
                 height: 30,
            child: Image.asset(
              onSelectImageAsset,
            ),
          )
              : SizedBox(
            height: 25,
            child: Image.asset(
              notSelectImageAsset,
            ),
          ));
    });
  }
}
