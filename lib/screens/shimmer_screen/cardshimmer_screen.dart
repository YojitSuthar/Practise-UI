import 'package:flutter/material.dart';
import 'package:ecommerce/resources/import_resources.dart';

class CardShimmer extends StatelessWidget {
  const CardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade400,
                child: ListView.builder(
                  itemBuilder: (_, __) => SizedBox(
                    height: 118,
                    width: double.infinity,
                    child: Card(
                      elevation: 4,
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: double.infinity,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  itemCount: 6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}