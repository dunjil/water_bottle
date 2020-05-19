import 'package:flutter/material.dart';
import 'package:water_bottle/utils/theme_colors.dart';

class BottleDetailPage extends StatefulWidget {
  static String id = "/bottledetails";

  @override
  _BottleDetailPageState createState() => _BottleDetailPageState();
}

class _BottleDetailPageState extends State<BottleDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                  color: ThemeColors.firstBtnColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
