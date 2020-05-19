import 'package:flutter/material.dart';
import 'package:water_bottle/pages/BottleDetailPage.dart';
import 'package:water_bottle/utils/theme_colors.dart';
import 'package:water_bottle/widgets/reusableWidgets.dart';
import 'package:google_fonts/google_fonts.dart';

class BottlesListItemWidget extends StatefulWidget {
  @override
  _BottleListItemWidgetState createState() => _BottleListItemWidgetState();
}

class _BottleListItemWidgetState extends State<BottlesListItemWidget> {
  ScrollController scrollController;

  List<String> allDescription=["This water bottle keeps your water cool all day long","Great Handle and Nice looking. For the Young and Cool"];
  String description;

  @override
  void initState(){
  super.initState();
  scrollController = ScrollController();
    scrollController.addListener(changeDesc);
   setState(() {
     description=allDescription[0];
   });
  }

  changeDesc(){
    var value=scrollController.offset.round();
    var descIndex=(value/150).round();
    print(value);
    setState(() {
      description=allDescription[descIndex];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(

        children: <Widget>[
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, BottleDetailPage.id);
            },
            child: Container(
              height: 320,
              padding: EdgeInsets.only(top:10.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                controller: scrollController,
                children: <Widget>[
                  SizedBox(width: 50.0,),
                  bottleCard(price: "20", category: "Bilsiri", imageUrl: "assets/images/water1.png",name: "Blue Jack" ),
                  SizedBox(width: 10.0,),
                  bottleCard(price: "20", category: "Bilsiri", imageUrl: "assets/images/water2.png",name: "Blue Jack" ),
                  SizedBox(width: 10.0,),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 10.0),
            child: Text("Description", style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.w500, fontSize: 20.0),),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 10.0),
            child: Text(description, style: TextStyle(fontFamily: "Montserrat",  fontSize: 16.0),),
          ),
        ],
      ),
    );
  }
  bottleCard({String imageUrl,String name, String category, String price }){
 return Stack(
   children: <Widget>[
    Container(
      height: 300,
      width: 220.0,
      child: Container(
        decoration: BoxDecoration(
          color:ThemeColors.firstBtnColor, //Color(0xFF399D63),
          borderRadius: BorderRadius.circular(15.0),
        ),
        height: 240,
        width: 220,
        child: Column(
          children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(height: 15.0,),
                        Text("FROM",style:TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: "Montserrat"),),
                        Text("\$$price",style: TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: "Montserrat", fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(width: 15.0,),
                  ],
                ),
            Image(
              image: AssetImage(imageUrl),
              height: 160,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 15.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: hm * 1,),
                    Text(category,style: TextStyle(color: Colors.white, fontSize: 18.0, fontFamily: "Montserrat",fontWeight: FontWeight.bold),),
                    Text(name,style: TextStyle(color: Colors.white, fontSize: 25.0,fontFamily: "Montserrat", fontWeight: FontWeight.w500),),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
     Padding(
       padding:  EdgeInsets.only(top:275.0, left: 100.0),
       child: Container(
         height:50,
         width:50,
         decoration:BoxDecoration(
           shape: BoxShape.circle,
           color:Colors.black,
         ),
         child:IconButton(
           icon:Icon(Icons.add_shopping_cart, color:Colors.white),
         ),
       ),
     ),
   ],
 );
  }
}
