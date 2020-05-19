import 'package:flutter/material.dart';
import 'package:water_bottle/pages/HomePage.dart';
import 'pages/BottleDetailPage.dart';
import 'pages/BottlesHomePage.dart';
import 'pages/HomePage.dart';
import 'pages/LoginPage.dart';
import 'pages/PlaceOrderPage.dart';
import 'pages/SignupPage.dart';
import 'utils/sizeconfig.dart';

void main() => runApp(WaterBottle());

class WaterBottle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          double hm = SizeConfig.heightMultiplier;
          double tm = SizeConfig.textMultiplier;
          double im = SizeConfig.imageSizeMultiplier;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Water Bottles',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: HomePage.id,
            routes: {
              HomePage.id: (context) => HomePage(),
              LoginPage.id: (context) => LoginPage(),
              SignUpPage.id: (context) => SignUpPage(),
              BottlesHomePage.id: (context) => BottlesHomePage(),
              PlaceOrderPage.id: (context) => PlaceOrderPage(),
              BottleDetailPage.id: (context) => BottleDetailPage(),
            },
          );
        });
      },
    );
  }
}
