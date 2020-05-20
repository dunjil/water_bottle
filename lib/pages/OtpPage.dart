import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:otp_count_down/otp_count_down.dart';
import 'package:water_bottle/pages/BottlesHomePage.dart';
import 'package:water_bottle/utils/theme_colors.dart';
import 'package:water_bottle/widgets/reusableWidgets.dart';

class OtpPage extends StatefulWidget {
  static String id = "/otppage";
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String _countDown;
  OTPCountDown _otpCountDown;
  final int _otpTimeInMS = 1000 * 5 * 60;

  TextEditingController phoneController = TextEditingController();

  void _startCountDown() {
    _otpCountDown = OTPCountDown.startOTPTimer(
      timeInMS: _otpTimeInMS,
      currentCountDown: (String countDown) {
        _countDown = countDown;
        setState(() {});
      },
      onFinish: () {
        print("Count down finished!");
      },
    );
  }

  @override
  void initState() {
    _startCountDown();
    super.initState();
  }

  @override
  void dispose() {
    _otpCountDown.cancelTimer();
    super.dispose();
  }

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
                top: 2 * hm, bottom: 5 * hm, left: im * 5, right: im * 5),
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
                Text(
                  "Verification Code",
                  style: TextStyle(
                    fontSize: tm * 5,
                    color: ThemeColors.secondBtnColor,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: hm * 2,
                ),
                Text(
                  "Please enter the OTP sent to \n+234 7061046672",
                  style: TextStyle(
                      fontSize: tm * 3.2,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: hm * 7,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: OtpTextField(
                    numberOfFields: 4,
                    fieldWidth: 50.0,
                    borderColor: ThemeColors.firstBtnColor,
                    enabledBorderColor: ThemeColors.secondBtnColor,
                    showFieldAsBox: true,
                    onCodeChanged: (String value) {},
                    onSubmit: (String verificationCode) {
                      print(verificationCode);
                    }, // end onSubmit
                  ), // end PinEntryTextField()
                ),
                SizedBox(
                  height: hm * 4.0,
                ),
                timerContainerWidget(_countDown),
                SizedBox(
                  height: hm * 5.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: buildButton(
                      useIcon: false,
                      title: "VERIFY",
                      performFunction: inputOtpCode,
                      firstColor: ThemeColors.secondBtnColor,
                      secondColor: ThemeColors.firstBtnColor,
                      icon: Icons.arrow_forward),
                ),
                SizedBox(
                  height: hm * 3.0,
                ),
                Text(
                  "Didn't receive the verification code?",
                  style: TextStyle(
                      fontSize: tm * 2.5,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, OtpPage.id);
                  },
                  child: Text(
                    "Resend again",
                    style: TextStyle(
                        color: ThemeColors.secondBtnColor, fontSize: tm * 2.5),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  inputOtpCode() {
    Navigator.pushNamed(context, BottlesHomePage.id);
  }
}
