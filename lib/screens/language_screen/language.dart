import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';
import '../../resources/resources.dart';
import '../reuse_widget/reuse_widget.dart';

class SelectLanguage extends StatelessWidget {
  SelectLanguage({Key? key}) : super(key: key);

  List<Map<String, String>> country = [
    {
      "flag":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Flag_of_Australia_%28converted%29.svg/125px-Flag_of_Australia_%28converted%29.svg.png",
      "name": "Australia"
    },
    {
      "flag":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Canada_%28Pantone%29.svg/1200px-Flag_of_Canada_%28Pantone%29.svg.png",
      "name": "Canada"
    },
    {
      "flag":
          "https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/125px-Flag_of_India.svg.png",
      "name": "India"
    },
    {
      "flag":
          "https://upload.wikimedia.org/wikipedia/en/thumb/9/9e/Flag_of_Japan.svg/1200px-Flag_of_Japan.svg.png",
      "name": "Japan"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackIconButton(topPadding: 0),
              SearchWidget(
                textCtrl: null,
                onPressed: () {},
                child: IcnButton(
                    iconSize: 0,
                    onPressed: () {
                      debugPrint("Pressed");
                    },
                    child: CrcleAvatar(
                      radius: 23,
                      color: ColorManager.blackColor,
                      child: Image.asset(
                        IconsAssets.filterLogo,
                        height: 25,
                      ),
                    )),
              ),
              DesignText(
                  text: StringManager.countryRegion,
                  fontSize: 18,
                  color: ColorManager.blackColor,
                  padding: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: country.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 20).r,
                      child: CardContainer(
                          height: 65,
                          borderRadius: 25,
                          allPadding: 12,
                          bottumMargin: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 115.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundImage: NetworkImage(                                          country[index]["flag"].toString()),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    DesignText(
                                        text: country[index]["name"].toString(),
                                        fontSize: 15,
                                        color: ColorManager.blackColor,
                                        padding: 0)
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                                child:
                                    Image.asset(IconsAssets.radioDisabledLogo),
                              )
                            ],
                          )),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
