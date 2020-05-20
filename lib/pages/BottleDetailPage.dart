import 'package:flutter/material.dart';
import 'package:water_bottle/pages/CheckOutPage.dart';
import 'package:water_bottle/utils/theme_colors.dart';

class BottleDetailPage extends StatefulWidget {
  static String id = "/bottledetails";

  @override
  _BottleDetailPageState createState() => _BottleDetailPageState();
}

class _BottleDetailPageState extends State<BottleDetailPage> {
  String imageUrl = "assets/images/water2.png";

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
                  color: ThemeColors.secondBtnColor,
                ),
              ),
              Positioned(
                top: MediaQuery
                    .of(context)
                    .size
                    .height / 2,
                child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 2,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      )
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.white,),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: MediaQuery
                    .of(context)
                    .size
                    .width - 60),
                child: FloatingActionButton(
                  onPressed: () {
                    print("View Shopping Cart");
                  },
                  child: Icon(
                    Icons.shopping_cart, color: Colors.white, size: 25.0,),
                  mini: true,
                  backgroundColor: ThemeColors.secondBtnColor.withOpacity(0.6),
                  elevation: 0.0,
                ),
              ),
              Positioned(
                top: 10,
                left: MediaQuery
                    .of(context)
                    .size
                    .width - 30,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(child: Text("1", style: TextStyle(
                      fontWeight: FontWeight.bold, fontFamily: "Montserrat"),)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 70, left: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Category", style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 20.0,
                        fontFamily: "Montserrat"),),
                    Text("Regular", style: TextStyle(color: Colors.white,
                        fontSize: 35.0,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500),),
                    SizedBox(height: 15.0,),
                    Text("FROM", style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 20.0,
                        fontFamily: "Montserrat"),),
                    Text("\$20", style: TextStyle(color: Colors.white,
                        fontSize: 30.0,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500),),
                    SizedBox(height: 25.0,),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ThemeColors.firstBtnColor,
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, CheckOutPage.id);
                        },
                        icon: Icon(Icons.shopping_cart, color: Colors.white,
                          size: 25,),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery
                    .of(context)
                    .size
                    .height / 4,
                left: MediaQuery
                    .of(context)
                    .size
                    .width / 3,
                child: Image(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                  height: 250.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery
                    .of(context)
                    .size
                    .height / 1.8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 10.0),
                      child: Text("Description", style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                          fontSize: 28.0),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 20.0),
                      child: Text(
                        "This is water bottle is clean, portable, handy and pricy,This is water bottle is clean, portable, handy and pricy,This is water bottle is clean, portable, handy and pricy",
                        style: TextStyle(
                            fontFamily: "Montserrat", fontSize: 18.0),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 10.0),
                      child: Text("Details", style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                          fontSize: 25.0),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 10.0),
                      child: Text("Color: Black", style: TextStyle(
                          fontFamily: "Montserrat", fontSize: 18.0),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 10.0),
                      child: Text("Volumn: 2ltrs", style: TextStyle(
                          fontFamily: "Montserrat", fontSize: 18.0),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

