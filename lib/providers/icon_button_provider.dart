import 'package:flutter/material.dart';

class IconButtonProvider extends ChangeNotifier {
  bool changeIcon = false;

  changeList(AnimationController _animationController) {
    if (changeIcon == false) {
      _animationController.forward();
      changeIcon = true;
    } else {
      _animationController.reverse();
      changeIcon = false;
    }
    notifyListeners();
  }
}
