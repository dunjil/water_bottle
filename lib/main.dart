import 'package:flutter/material.dart';
import 'package:water_bottle/pages/HomePage.dart';

import 'pages/BottleDetailPage.dart';
import 'pages/BottlesHomePage.dart';
import 'pages/CheckOutPage.dart';
import 'pages/HomePage.dart';
import 'pages/LoginPage.dart';
import 'pages/OtpPage.dart';
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
              OtpPage.id: (context) => OtpPage(),
              BottleDetailPage.id: (context) => BottleDetailPage(),
              CheckOutPage.id: (context) => CheckOutPage(),
            },
          );
        });
      },
    );
  }
}
