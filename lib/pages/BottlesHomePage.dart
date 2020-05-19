import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:water_bottle/widgets/BottlesListItemWidget.dart';
import 'package:water_bottle/utils/theme_colors.dart';
import 'package:water_bottle/widgets/reusableWidgets.dart';

class BottlesHomePage extends StatefulWidget {
  static String id="/bottleshome";
  @override
  _BottlesHomePageState createState() => _BottlesHomePageState();
}

class _BottlesHomePageState extends State<BottlesHomePage> with SingleTickerProviderStateMixin {

  TabController tabController;
  @override
  void initState(){
    tabController=TabController(vsync: this, length: 3);
    super.initState();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: hm * 1.0),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding:  EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.menu, color: Colors.black, size:35.0,),
                  ),
                  FloatingActionButton(
                    mini: true,
                    elevation: 0.0,
                    backgroundColor:Colors.grey.withOpacity(0.3),
                    child: Icon(Icons.shopping_cart, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top:1.0, left: 15.0),
            child: Text("Water\nBottles", style:TextStyle(fontSize: tm * 5.0, color: Colors.black,fontWeight:FontWeight.w500, fontFamily: "Montserrat",)),
            //TextStyle(),),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              color: Colors.white,
            ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: TabBar(
                  controller: tabController,
                  indicatorColor: ThemeColors.secondBtnColor,
                  labelColor: Colors.blueGrey,
                  unselectedLabelColor: Colors.grey.withOpacity(0.9),
                  isScrollable: true,
                  tabs: <Widget>[
                    Tab(
                      child: Text("Bisleri", style: TextStyle(fontSize: tm * 2.8,fontFamily: "Monserrat", fontWeight: FontWeight.w400),),
                    ),
                    Tab(
                      child: Text("Regular", style: TextStyle(fontSize: tm * 2.8,fontFamily: "Monserrat", fontWeight: FontWeight.w400),),
                    ),
                    Tab(
                      child: Text("Awasa", style: TextStyle(fontSize: tm * 2.8,fontFamily: "Monserrat", fontWeight: FontWeight.w400),),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height-250,
                padding: EdgeInsets.only(top:15.0),
                child: TabBarView(
                  controller: tabController,
                  children: <Widget>[
                    BottlesListItemWidget(),
                    BottlesListItemWidget(),
                    BottlesListItemWidget(),
                  ],
                ),
              ),
            ],
          ),
          ),
        ],
      ),
    );
  }
}
