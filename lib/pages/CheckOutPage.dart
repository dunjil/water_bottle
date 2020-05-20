import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:water_bottle/pages/OtpPage.dart';
import 'package:water_bottle/utils/theme_colors.dart';
import 'package:water_bottle/widgets/reusableWidgets.dart';

class CheckOutPage extends StatefulWidget {
  static String id = "/checkout1";

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: hm * 2, left: im * 4, right: im * 4),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
                top: hm * 10, bottom: hm * 4, left: im * 1, right: im * 1),
            padding: EdgeInsets.only(
                top: 2 * hm, bottom: 10 * hm, left: im * 5, right: im * 5),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: hm * 2,
                ),
                logoWidget(),
                SizedBox(
                  height: hm * 7,
                ),
                Center(
                    child: Text(
                  "Enter your mobile number to place your order",
                  style: TextStyle(
                    fontSize: tm * 3,
                    color: ThemeColors.secondBtnColor,
                  ),
                  textAlign: TextAlign.center,
                )),
                SizedBox(
                  height: hm * 4.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(top: 3 * hm),
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
                          textController: phoneController,
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
                Center(
                    child: Text(
                  "You will get an OTP sent via SMS",
                  style: TextStyle(
                      fontSize: tm * 2.5,
                      color: ThemeColors.secondBtnColor,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                )),
                SizedBox(
                  height: hm * 4.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: buildButton(
                      useIcon: true,
                      title: "Proceed",
                      performFunction: inputOtpCode,
                      firstColor: ThemeColors.firstBtnColor,
                      secondColor: ThemeColors.secondBtnColor,
                      icon: Icons.arrow_forward),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  inputOtpCode() {
    Navigator.pushNamed(context, OtpPage.id);
  }
}
