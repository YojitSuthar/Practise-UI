import 'package:ecommerce/provider/apiproductdata.dart';
import 'package:ecommerce/resources/color_manager.dart';
import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';
import '../../services/api_constants.dart';
import '../reuse_widget/reuse_widget.dart';
import '../shimmer_screen/cardshimmer_screen.dart';

class SearchProduct extends StatefulWidget {
  SearchProduct({Key? key, this.searchText}) : super(key: key);
  String? searchText;

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  void getData() {
    final searchData = Provider.of<SearchProductData>(context, listen: false);
    searchData.searchData(APIConstants.searchURL + widget.searchText!);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding:
              const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5).w,
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
              Expanded(
                child: Consumer<SearchProductData>(builder: (context, value, child) {
                  return value.loading?const CardShimmer():ListView.builder(
                      padding: const EdgeInsets.all(2),
                      itemCount: value.productData.length,
                      itemBuilder: (BuildContext context, index) {
                        return SizedBox(
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
                                    value.productData[index]["thumbnail"],
                                    fit: BoxFit.cover),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5).w,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Name:- ${value.productData[index]["title"]}",
                                        softWrap: true,
                                      ),
                                      Text(
                                          "Price_- ${value.productData[index]["price"]}"),
                                      Text(
                                          "Discount:- ${value.productData[index]["discountPercentage"]}"),
                                      Text(
                                          "Brand:- ${value.productData[index]["brand"]}"),
                                      Text(
                                          "${value.productData[index]["category"]}"),
                                    ]),
                              )
                            ]),
                          ),
                        );
                      });
                }),
              )
            ],
          )),
    );
  }
}
