import 'package:flutter/material.dart';
import '../../resources/import_resources.dart';
import '../reuse_widget/reuse_widget.dart';

class ProductView extends StatelessWidget {
  ProductView({Key? key,required this.images}) : super(key: key);
  List images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0,bottom: 15.0).w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: BackIconButton(topPadding: 35),
            ),
            Expanded(
              child: Hero(
                tag: "image",
                child: CarouselSlider.builder(
                    itemCount: images.length,
                    options: CarouselOptions(
                        onPageChanged: (index, reason) {},
                        height: 320.h,
                        viewportFraction: 1,
                        enableInfiniteScroll: false),
                    itemBuilder: (BuildContext context, _, pageIndex) {
                      return Image.network(
                          images[_].toString(),
                          fit: BoxFit.cover);
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
