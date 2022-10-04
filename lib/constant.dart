import 'package:flutter/material.dart';

const darkPrimaryColor = Color(0xFF313347);
const darkSecondColor = Color(0xFF5F627D);

const oceanPrimaryColor = Color(0xFFA0BEF8);
const oceanSecondColor = Color(0xFFB5F0F0);

const almostPrimaryColor = Color(0xFFF9E7FE);
const almostSecondColor = Color(0xFFDAFCFC);

double smallPading = 10;
double mediumPading = 20;
double bigPading = 40;

const darkBackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      darkPrimaryColor,
      darkSecondColor,
    ]);

const oceanBackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      oceanPrimaryColor,
      oceanSecondColor,
    ]);
const almostBackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      almostPrimaryColor,
      almostSecondColor,
    ]);
