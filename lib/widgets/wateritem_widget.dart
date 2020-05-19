import 'package:flutter/material.dart';

class WaterItemWidget extends StatelessWidget {
  final String imageUrl;
  final String price;
  final String name;
  final String category;
  WaterItemWidget({this.imageUrl, this.price, this.name, this.category});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Stack(
        children: <Widget>[
          Image.asset(imageUrl),
        ],
      ),
    );
  }
}
