import 'package:ecommerce/resources/import_resources.dart';
import 'package:ecommerce/screens/reuse_widget/reuse_widget.dart';
import 'package:flutter/material.dart';
import '../../listdata/product_categorylist.dart';
import '../../resources/resources.dart';

class ProfileWishListScreen extends StatelessWidget {

  ProfileWishListScreen({Key? key}) : super(key: key);

  List<String> images = const[
    ProjectNetworkImage.randomImage1,
    ProjectNetworkImage.randomImage2,
    ProjectNetworkImage.randomImage3,
    ProjectNetworkImage.randomImage4,
    ProjectNetworkImage.randomImage5,
  ];
  TextEditingController wishListCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:35.0,right: 15.0,left: 15).w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    BackIconButton(topPadding: 0),
                    const SizedBox(width: 5,),
                    DesignText(
                      text: StringManager.wishList,
                      fontSize: 20,
                      color: ColorManager.blackColor,
                      padding: 0,
                    ),
                  ],
                ),
                IcnButton(onPressed: (){}, child:Image.asset(IconsAssets.bellLogo,height: 25,) )
              ],
            ),
            SearchWidget(textCtrl: wishListCtrl,onPressed: (){},child: IcnButton(
                iconSize: 0,
                onPressed: () {
                  Get.toNamed("/FilterScreen");
                },
                child: CrcleAvatar(
                  radius: 25,
                  color: ColorManager.blackColor,
                  child: Image.asset(
                    IconsAssets.barcodeLogo,
                    height: 20,
                  ),
                )),),

            Cart(images: ProductCategory.images,child: const GestureDetect()),

          ],
        ),
      ),
    );
  }
}


