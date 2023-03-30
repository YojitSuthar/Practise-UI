import 'package:flutter/material.dart';
import 'package:ecommerce/main_resources.dart';
class CustoumRadioButton extends StatelessWidget {
  CustoumRadioButton({
    super.key,
    required this.onSelect,
    required this.label,
  });

  final bool onSelect;
  String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 90,
      decoration: BoxDecoration(
          color: ColorManager.blackColor,
          borderRadius:
          BorderRadius.all(const Radius.circular(9).w)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 15,
            child: onSelect?Image.asset(IconsAssets.radioDisabledLogo,):Image.asset(IconsAssets.radioEnabledLogo),
          ),
          Text(label,style: TextStyle(color: ColorManager.greyColor,fontSize: 17),)
        ],
      ),
    );
  }
}