import 'package:ecommerce/resources/color_manager.dart';
import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';

import '../reuse_widget/reuse_widget.dart';

class SearchProduct extends StatelessWidget {
  const SearchProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(15).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackIconButton(
                topPadding: 30,
              ),
              DesignText(
                color: ColorManager.blackColor,
                padding: 10,
                text: "Search product",
                fontSize: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10).r,
                child: Container(
                  height: 125.h,
                  width: double.infinity,
                  child: Card(
                    color: ColorManager.whiteColor,
                    elevation: 4,
                    child: Row(children: [
                      Container(
                        width: 100.w,
                        height: double.infinity,
                        color: ColorManager.pinkColor,
                        child: Image.network(
                            "https://c4.wallpaperflare.com/wallpaper/135/692/935/astronaut-space-black-background-artwork-hd-wallpaper-preview.jpg",
                            fit: BoxFit.cover),
                      ),

                    ]),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
