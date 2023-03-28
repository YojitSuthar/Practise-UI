import 'package:ecommerce/screens/home_screen/provider/bottum_navigation/bottum_navigation.dart';
import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';

class BottumTabButton extends StatelessWidget {
  BottumTabButton({
    super.key,
    required this.inDex,
    required this.OnSelectImageAsset,
    required this.notSelectImageAsset
  });

  int inDex;
  String OnSelectImageAsset;
  String notSelectImageAsset;

  @override
  Widget build(BuildContext context) {
    final abc = Provider.of<BottumNavigation>(context, listen: false);
    return Consumer<BottumNavigation>(builder: (context, value, child) {
      return IconButton(
          enableFeedback: false,
          onPressed: () {
            if (abc.contain.contains(inDex)) {
              debugPrint("change");
              abc.change(inDex);
            } else {
              debugPrint("else change");
              abc.contain.clear();
              abc.change(inDex);
              abc.add(inDex);
            }
          },
          icon: abc.contain.contains(inDex)
              ? Container(
                 height: 30,
            child: Image.asset(
              OnSelectImageAsset,
            ),
          )
              : Container(
            height: 25,
            child: Image.asset(
              notSelectImageAsset,
            ),
          ));
    });
  }
}
