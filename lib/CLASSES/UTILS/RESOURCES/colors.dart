import 'dart:ui';

import 'package:flutter/material.dart';

// 14 32 94
class DefinedColors {
  Color APP_MAIN_BG_COLOR = const Color.fromRGBO(14, 32, 94, 1);
  Color APP_SUB_BG_COLOR = const Color.fromRGBO(14, 32, 94, 1);
  Color APP_BUTTON_COLOR = const Color.fromARGB(255, 93, 137, 225);
  var hexCode = '#';
  var hexWhiteColor = '#FFFFFF';
  var hexLightPinkColor = '#FF1493';
  var hexBrownColor = '#c49450';
  var hexRedColor = '#FF4500';
  var hexDarkRedColor = '#D32F2F';
  var hexYellowColor = '#FFD700';
  var hexBrightColor = '#FFEB3B';
  var hexBlackColor = '#1C1C1C';
  var test = '#63B8FF';
  var test2 = '#63B8FF';
  var test3 = '#63B8FF';
  var test4 = '#63B8FF';
  var test5 = '#63B8FF';
  var test6 = '#63B8FF';
  var hexBeige = '#F6D58E';
  var hexGreyColor = '#808080';
  var hexDarkGreyColor = '#2E2E2E';
  var hexDarkGreenColor = '#008000';
  // orange shade
  var hexLightestOrange = '#FFECD2';
  var hexLightOrange = '#FFD2A1';
  var hexMidOrange = '#FFB075';
  var hexBrightOrange = '#FF8C42';
  var hexDarkOrange = '#FF5F1F';
  var darkModeDefaultColor = "#91B1F0FF";
}

class AppColors {
  // dark mode
  final appLightModeBackgroundColor = DefinedColors().APP_MAIN_BG_COLOR;
  final appDarkModeBackgroundColor = DefinedColors().APP_SUB_BG_COLOR;
  final appBackgroundColor = DefinedColors().APP_MAIN_BG_COLOR;
  final appNavigationColor = DefinedColors().APP_MAIN_BG_COLOR;
  final backgroundThemeColor = DefinedColors().APP_MAIN_BG_COLOR;
  final backgroundSubThemeColor = DefinedColors().APP_SUB_BG_COLOR;
  final darkButtonColor = DefinedColors().APP_BUTTON_COLOR;
  final whiteColor = DefinedColors().hexWhiteColor;
  final darkGreyColor = DefinedColors().hexDarkGreyColor;

  final test = DefinedColors().test;
  final test2 = DefinedColors().test2;
  final test3 = DefinedColors().test3;
  final test4 = DefinedColors().test4;
  final test5 = DefinedColors().test5;
  final test6 = DefinedColors().test6;
}

class AppHexColor {
  final whiteColor = DefinedColors().hexWhiteColor;
  final lightPinkColor = DefinedColors().hexLightPinkColor;
  final brownColor = DefinedColors().hexBrownColor;
  final redColor = DefinedColors().hexRedColor;
  final darkRedColor = DefinedColors().hexDarkRedColor;
  final yellowColor = DefinedColors().hexYellowColor;
  final brightYellowrightColor = DefinedColors().hexBrightColor;
  final blackColor = DefinedColors().hexBlackColor;
  final test = DefinedColors().test;
  final beigeColor = DefinedColors().hexBeige;
  final greyColor = DefinedColors().hexGreyColor;
  final greenColor = DefinedColors().hexDarkGreenColor;
  // orange shade
  final lightestOrange = DefinedColors().hexLightestOrange;
  final lightOrange = DefinedColors().hexLightOrange;
  final midOrange = DefinedColors().hexMidOrange;
  final brightOrange = DefinedColors().hexBrightOrange;
  final darkOrange = DefinedColors().hexDarkOrange;
  //
  final darkModeDefaultColor = DefinedColors().darkModeDefaultColor;
}
