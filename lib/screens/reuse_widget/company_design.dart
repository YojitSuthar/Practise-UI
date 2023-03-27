import 'package:database_auth/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:database_auth/screens/project_resources/import_resources.dart';


class CompanyDesign extends StatelessWidget {
  const CompanyDesign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: 45, right: 4, top:20, bottom: 80)
          .r,
      width: 250.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                IconsAssets.shoppingbaglogo,
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10).r,
                child: Text(
                  StringManager.companyName,
                  style: fontSizeFamilyTextStyle(25, "academia"),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 5, top: 5).r,
            child: Text(StringManager.companySlogan,
                style: fontFamilyWeightTextStyle(
                    FontWeight.bold, "Gruppo")),
          ),
        ],
      ),
    );
  }
}