import 'package:azkar/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemes {
  static lightMode() => ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.lightGreen.shade500,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            )),
        scaffoldBackgroundColor: mainColor,
        canvasColor: Colors.black,
        focusColor: Colors.white,
        cardColor: Colors.brown,
      );

  static darkMode() => ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.blueGrey.shade900,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.black,
              statusBarIconBrightness: Brightness.light,
            )),
        scaffoldBackgroundColor: Colors.black,
        canvasColor: Colors.white,
        focusColor: Colors.black,
        cardColor: Colors.amber,
      );
}
