import "package:ecommerce/resources/import_resources.dart";
import "package:flutter/material.dart";
import "../../provider/provider_resources.dart";
import "../../resources/resources.dart";
import "../reuse_widget/reuse_widget.dart";
import "../screens.dart";

class Categories extends StatelessWidget {
  Categories({Key? key}) : super(key: key);

  List<Map<String, String>> cardData = [
    {"icon": IconsAssets.clothLogo, "label": "Clothing", "suffix": "cloth"},
    {"icon": IconsAssets.cosmeticsLogo, "label": "Cosmetics", "suffix": "skin"},
    {"icon": IconsAssets.sneakersLogo, "label": "Shoes", "suffix": "shoes"},
    {"icon": IconsAssets.phoneLogo, "label": "Phones", "suffix": "phone"},
  ];

  void onTap(String suffix) {
    Get.to(SearchProduct(
      searchText: suffix,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final searchData=Provider.of<SearchProductData>(context,listen: false);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackIconButton(topPadding: 0),
                  IcnButton(
                      onPressed: () {},
                      child: Image.asset(
                        IconsAssets.searchLogo,
                        height: 25,
                      ))
                ],
              ),
              DesignText(
                text: StringManager.categories,
                fontSize: 20,
                color: ColorManager.blackColor,
                padding: 0,
              ),
              Expanded(
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cardData.length,
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                          onTap: () {
                            onTap(cardData[index]["suffix"].toString());
                            searchData.loading=true;
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15).r,
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 25, right: 25).r,
                              height: 60.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: ColorManager.blackColor,
                                  borderRadius: BorderRadius.circular(50).w),
                              child: Row(
                                children: [
                                  Image.asset(
                                    cardData[index]["icon"].toString(),
                                    height: 30.h,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10).r,
                                    child: DesignText(
                                        text:
                                            cardData[index]["label"].toString(),
                                        fontSize: 14.sp,
                                        color: ColorManager.whiteColor,
                                        padding: 0),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
