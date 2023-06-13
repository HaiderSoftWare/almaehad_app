import 'package:flutter/material.dart';

Map<int, Color> color1 = {
  50: const Color.fromRGBO(80, 62, 157, .1),
  100: const Color.fromRGBO(80, 62, 157, .2),
  200: const Color.fromRGBO(80, 62, 157, .3),
  300: const Color.fromRGBO(80, 62, 157, .4),
  400: const Color.fromRGBO(80, 62, 157, .5),
  500: const Color.fromRGBO(80, 62, 157, .6),
  600: const Color.fromRGBO(80, 62, 157, .7),
  700: const Color.fromRGBO(80, 62, 157, .8),
  800: const Color.fromRGBO(80, 62, 157, .9),
  900: const Color.fromRGBO(80, 62, 157, 1),
};

Map<int, Color> color2 = {
  50: const Color.fromRGBO(251, 212, 96, .1),
  100: const Color.fromRGBO(251, 212, 96, .2),
  200: const Color.fromRGBO(251, 212, 96, .3),
  300: const Color.fromRGBO(251, 212, 96, .4),
  400: const Color.fromRGBO(251, 212, 96, .5),
  500: const Color.fromRGBO(251, 212, 96, .6),
  600: const Color.fromRGBO(251, 212, 96, .7),
  700: const Color.fromRGBO(251, 212, 96, .8),
  800: const Color.fromRGBO(251, 212, 96, .9),
  900: const Color.fromRGBO(251, 212, 96, 1),
};

class MyColor {
  static const purple = Color(0xff503e9d);
  static const yellow = Color(0xfffbd460);
  static const white0 = Color(0xffffffff);
  static const black = Color(0xff000000);
  static const grayDark = Color(0xff4d4d4d);
  static const red = Colors.red;
  static const white1 = Color(0xffe6e6e6);
  static const white4 = Color(0xffe1e1e1);
  static const white3 = Color(0xffd3cfe6);
  static const green = Colors.green;

  MaterialColor purpleMaterial = MaterialColor(0xff503e9d, color1);
  MaterialColor yellowMaterial = MaterialColor(0xfffbd460, color2);
}
