import 'package:ecommerce/resources/import_resources.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/screens/reuse_widget/reuse_widget.dart';
import 'package:flutter/material.dart';


class PlusMinus extends StatelessWidget {
   PlusMinus({
    super.key,
    required this.color,
  });

  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      width: 92.w,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20).w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IcnButton(
              onPressed: () {},
              child: Image.asset(
                IconsAssets.minusLogo,
                height: 15,
              )),
          Text(
            "1",
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeightManager.bold),
          ),
          IcnButton(
              onPressed: () {},
              child: Image.asset(
                IconsAssets.addLogo,
                height: 15,
              )),
        ],
      ),
    );
  }
}