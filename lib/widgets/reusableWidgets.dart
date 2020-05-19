import 'package:flutter/material.dart';
import 'package:water_bottle/utils/sizeconfig.dart';
import 'package:nice_button/NiceButton.dart';
import 'package:water_bottle/utils/theme_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

double hm = SizeConfig.heightMultiplier;
double tm = SizeConfig.textMultiplier;
double im = SizeConfig.imageSizeMultiplier;

Widget buildDropdownButton({List<String> itemList, String itemName}) {
  return DropdownButton<String>(
    value: itemList[0],
    onChanged: (value) {
      itemName = value;
    },
    items: itemList.map((item) {
      return DropdownMenuItem(
        child: Text(
          item.toUpperCase(),
          style: TextStyle(fontSize: tm * 2.0),
        ),
        value: item,
      );
    }).toList(),
  );
}

Widget buildTextField(
    {TextEditingController textController,
    String labelText,
    TextInputType keyboardType, bool isLongText, Icon icon, bool isPasswordField}) {
  return TextFormField(
    controller: textController,
    maxLines: isLongText?2:1,
    obscureText: isPasswordField?true:false,
    decoration: InputDecoration(
      prefixIcon:icon,
      hasFloatingPlaceholder: true,
      focusColor: ThemeColors.firstBtnColor,
      labelText: labelText,
      labelStyle: TextStyle(color: ThemeColors.secondBtnColor),
      fillColor: Colors.white,
      focusedBorder:OutlineInputBorder(
      borderSide:  BorderSide(color: ThemeColors.secondBtnColor, width: 2.0),
    // borderRadius: BorderRadius.circular(10.0),
  ),
    ),
    keyboardType:keyboardType,
  );
}

Widget buildButton(
    {String title, bool useIcon, Function performFunction, IconData icon,Color firstColor, Color secondColor }) {
  return NiceButton(
    radius: im * 9.4,
    padding: EdgeInsets.all(15),
    text: title,
    textColor: Colors.white,
    fontSize: tm * 2.4,
    icon: useIcon ? icon : null,
    gradientColors: [firstColor,secondColor],
    onPressed: () => performFunction(),
  );
}

Widget logoWidget() {
  return Container(
    padding: EdgeInsets.all(2.0),
    width: im * 30,
    height: hm * 15,
    decoration: BoxDecoration(
      color: ThemeColors.secondBtnColor,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          spreadRadius: 5,
          blurRadius: 5.0,
          color: ThemeColors.secondBtnColor,
          offset: Offset.zero,
        )
      ],
    ),
    child: Center(
        child: Text(
      "Water",
      style: TextStyle(
          color: Colors.white,
          fontSize: tm * 5.0,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
          fontFamily: "Signatra"),
    )),
  );
}
