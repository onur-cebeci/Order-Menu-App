import 'package:flutter/material.dart';
import 'package:order_web_app/constant.dart';

class BackgraoundProvider extends ChangeNotifier {
  Gradient changeBackGround = darkBackgroundGradient;
  int borderValue = 0;

  changeBackGroundGradient(int value) {
    if (value == 0) {
      changeBackGround = darkBackgroundGradient;
      borderValue = 0;
    } else if (value == 1) {
      changeBackGround = oceanBackgroundGradient;
      borderValue = 1;
    } else {
      changeBackGround = almostBackgroundGradient;
      borderValue = 2;
    }
    notifyListeners();
  }
}
