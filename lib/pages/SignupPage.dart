import 'package:country_code_picker/country_code_picker.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:water_bottle/utils/theme_colors.dart';
import 'package:water_bottle/pages/BottlesHomePage.dart';
import 'package:water_bottle/widgets/reusableWidgets.dart';


class SignUpPage extends StatefulWidget {
  static String id = "/signup";
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController,
      sSNController,
      addressController = TextEditingController();
  String customerType;
  List<String> cTypeList = ["Residential", "Corporate", "Enterprise"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: hm * 2, left: im * 4, right: im * 4),
        child: Material(
          elevation:4.0,
          child: Container(
            margin: EdgeInsets.only(top:hm*8, bottom:hm*8 ),
            padding: EdgeInsets.only(top:2 * hm, bottom:10 * hm ,left: im * 4, right: im * 4 ),
            decoration: BoxDecoration(
              color: ThemeColors.primaryColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(im * 5),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 3,
                  blurRadius: 3,
                  color: ThemeColors.secondBtnColor,
                  offset: Offset.zero,
                )
              ],
            ),
            child: ListView(
              children: <Widget>[
               // logoWidget(),
                SizedBox(
                  height: hm * 2,
                ),
                Text("SignUp", style: TextStyle(fontSize: tm * 5, color: ThemeColors.secondBtnColor, fontWeight: FontWeight.bold),),
                SizedBox(
                  height: hm * 4.0,
                ),
                DropDownField(
                    value: cTypeList[0],
                    icon: Icon(LineIcons.user, size: im * 8, color: ThemeColors.secondBtnColor,),
                    required: true,
                    hintText: 'Select customer type',
                    labelText: 'Customer type*',
                    labelStyle: TextStyle(fontSize: tm * 3, color: ThemeColors.firstBtnColor),
                    hintStyle: TextStyle(fontSize: tm * 2.2, color: ThemeColors.secondBtnColor),
                    items: cTypeList,
                    textStyle: TextStyle(fontSize: tm * 2.5, color: ThemeColors.secondBtnColor),
                    strict: true,
                    setter: (dynamic newValue) {
                      customerType = newValue;
                    }),
                SizedBox(
                  height: hm * 3.0,
                ),
                buildTextField(
                    textController: nameController,
                    keyboardType: TextInputType.text,
                    isLongText: false,
                    isPasswordField: false,
                    labelText: "Your name here"),
                SizedBox(
                  height: hm * 1.0,
                ),
                buildTextField(
                    textController: nameController,
                    keyboardType: TextInputType.multiline,
                    isLongText: true,
                    isPasswordField: false,
                    labelText: "Your address"),
                SizedBox(
                  height: hm * 1.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding:  EdgeInsets.only(top:3*hm),
                        child: CountryCodePicker(
                          onChanged: print,
                          initialSelection: 'NG',
                          favorite: ['+234', 'NG'],
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 3,
                      child: buildTextField(
                          textController: nameController,
                          keyboardType: TextInputType.phone,
                          isLongText: false,
                          isPasswordField: false,
                          labelText: "Your Mobile Number"),
                    )
                  ],

                ),

                SizedBox(
                  height: hm * 3.0,
                ),
                buildButton(useIcon: false, title: "SignUp", performFunction: controlSignUp,firstColor: ThemeColors.secondBtnColor,secondColor: ThemeColors.firstBtnColor,),

              ],
            ),
          ),
        ),
      ),
    );
  }
  controlSignUp(){
    Navigator.pushNamed(context, BottlesHomePage.id);
  }
}
