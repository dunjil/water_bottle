import 'package:flutter/material.dart';
import 'package:water_bottle/pages/BottlesHomePage.dart';
import 'package:water_bottle/widgets/reusableWidgets.dart';
import 'package:water_bottle/utils/theme_colors.dart';
import 'package:line_icons/line_icons.dart';


class LoginPage extends StatefulWidget {
  static String id="/login";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController,
      sSNController,
      addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top:15 * hm, bottom:10 * hm ,left: im * 8, right: im * 8 ),
        child: Center(
          child: ListView(
            children: <Widget>[
              // logoWidget(),
              SizedBox(
                height: hm * 2,
              ),
              Text("Login", style: TextStyle(fontSize: tm * 5, color: ThemeColors.secondBtnColor, fontWeight: FontWeight.bold),),
              SizedBox(
                height: hm * 4.0,
              ),
              buildTextField(
                  textController: nameController,
                  keyboardType: TextInputType.phone,
                  isLongText: false,
                  isPasswordField: false,
                  labelText: "Your Mobile Number"),
              SizedBox(
                height: hm * 4,
              ),
              buildTextField(
                textController: nameController,
                keyboardType: TextInputType.text,
                isLongText: false,
                labelText: "Password",
                isPasswordField: true,
                icon: Icon(LineIcons.key, size: hm*4,),),
              SizedBox(
                height: hm * 4.0,
              ),
              buildButton(useIcon: false, title: "Login", performFunction: controlLogin,firstColor: ThemeColors.firstBtnColor,secondColor: ThemeColors.firstBtnColor,),
            ],
          ),
        ),
      ),
    );;
  }
  controlLogin(){
    Navigator.pushNamed(context, BottlesHomePage.id);
  }
}
