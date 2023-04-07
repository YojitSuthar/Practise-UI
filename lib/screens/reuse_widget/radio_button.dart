import 'package:ecommerce/provider/provider_resources.dart';
import 'package:ecommerce/resources/import_resources.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:flutter/material.dart';

class CustoumRadioButton extends StatelessWidget {
  CustoumRadioButton({
    super.key,
    required this.label,
    required this.index,
  });

  String label;
  int index;

  @override
  Widget build(BuildContext context) {
    final onTap = Provider.of<ChangeColor>(context, listen: false);
    return Consumer<ChangeColor>(builder: (context, value, child) {
      return GestureDetector(
        onTap: () {
          if (value.data.contains(index)) {
            value.remove(index);
          } else {
            value.data.clear();
            value.add(index);
          }
        },
        child: Container(
          width: 85.w,
          margin: const EdgeInsets.only(right: 15).r,
          decoration: BoxDecoration(
              border: Border.all(
                  color: value.data.contains(index)
                      ? ColorManager.blackColor
                      : ColorManager.greyColor,
                  width: 2),
              color: value.data.contains(index)
                  ? ColorManager.blackColor
                  : ColorManager.whiteColor,
              borderRadius: BorderRadius.all(const Radius.circular(9).w)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 15,
                child: value.data.contains(index)
                    ? Image.asset(
                        IconsAssets.radioEnabledLogo,
                      )
                    : Image.asset(IconsAssets.radioDisabledLogo),
              ),
              Text(
                label,
                style: TextStyle(
                    color: value.data.contains(index)
                        ? ColorManager.whiteColor
                        : ColorManager.greyColor,
                    fontSize: 17),
              )
            ],
          ),
        ),
      );
    });
  }
}
