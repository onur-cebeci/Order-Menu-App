import 'package:flutter/material.dart';
import 'package:order_web_app/constant.dart';

class BackgraoundProvider extends ChangeNotifier {
  Gradient changeBackGround = darkBackgroundGradient;
  Color primaryColor = darkPrimaryColor;
  int borderValue = 0;

  changeBackGroundGradient(int value) {
    if (value == 0) {
      changeBackGround = darkBackgroundGradient;
      primaryColor = darkPrimaryColor;
      borderValue = 0;
    } else if (value == 1) {
      changeBackGround = oceanBackgroundGradient;
      primaryColor = oceanPrimaryColor;
      borderValue = 1;
    } else {
      changeBackGround = almostBackgroundGradient;
      primaryColor = almostPrimaryColor;
      borderValue = 2;
    }
    notifyListeners();
  }
}
