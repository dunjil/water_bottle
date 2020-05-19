import 'package:flutter/material.dart';
import 'package:water_bottle/pages/LoginPage.dart';
import 'package:water_bottle/pages/SignupPage.dart';
import 'package:water_bottle/widgets/reusableWidgets.dart';
import 'package:water_bottle/utils/theme_colors.dart';
class HomePage extends StatefulWidget {
  static String id="/home";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: hm * 99,
        margin: EdgeInsets.only(bottom: hm * 10),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Container(
         margin: EdgeInsets.only(top:hm*12),
          padding: EdgeInsets.only(top:8 * hm, bottom:10 * hm ,left: im * 4, right: im * 4 ),
          decoration: BoxDecoration(
            color: ThemeColors.primaryColor,
            shape: BoxShape.rectangle,
          ),
          child: Center(
            child: Column(
              children: <Widget>[
                logoWidget(),
                SizedBox(height: hm * 11,),
                 Text("Get high quality and affordable water bottles", style: TextStyle(color: ThemeColors.secondBtnColor.withOpacity(0.8), fontSize: tm * 2.5,decoration: TextDecoration.none, ),textAlign: TextAlign.center,),
                SizedBox(height: hm * 8,),
                buildButton(useIcon: false, title: "Login", performFunction: controlLogin,firstColor: ThemeColors.firstBtnColor,secondColor: ThemeColors.firstBtnColor,),
                SizedBox(height: hm * 4,),
                buildButton(useIcon: false, title: "SignUp", performFunction: controlSignUp,firstColor: ThemeColors.secondBtnColor,secondColor: ThemeColors.firstBtnColor,),
              ],
            ),
          ),
        ),
      ),
    );
  }
  controlLogin(){
    Navigator.pushNamed(context, LoginPage.id);
  }
  controlSignUp(){
    Navigator.pushNamed(context, SignUpPage.id);
  }



}
