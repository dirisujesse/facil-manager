import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData shedAppThemeData() {
  final base = ThemeData.light();

  return base.copyWith(
    brightness: Brightness.light,
    accentColor: shedAppBlue400,
    primaryColor: Colors.white,
    buttonTheme: base.buttonTheme.copyWith(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      buttonColor: shedAppBlue400,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    ),
    floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
      backgroundColor: shedAppYellow400,
      foregroundColor: shedAppBodyBlack,
    ),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    cardColor: Colors.white,
    textSelectionColor: shedAppSelectionBlack,
    errorColor: shedAppErrorRed,
    textTheme: base.textTheme.copyWith(
      headline: TextStyle(
        fontFamily: "Octin",
        fontSize: 40.0,
        color: shedAppBlue400,
        fontWeight: FontWeight.w900,
      ),
      title: TextStyle(
        fontFamily: 'WalkwayBold',
        fontSize: 18.0,
        color: shedAppBodyBlack,
      ),
      subtitle: TextStyle(
        fontFamily: 'WalkwayItalic',
        fontSize: 16.0,
        color: shedAppBodyBlack,
      ),
      body1: TextStyle(
        fontFamily: "Walkway",
        fontSize: 14.0,
        color: shedAppBodyBlack,
      ),
      display1: TextStyle(
        fontFamily: "Walkway",
        fontSize: 30.0,
        color: shedAppBlue100,
      ),
      caption: TextStyle(
        fontFamily: "Walkway",
        fontSize: 14.0,
        color: shedAppBodyBlack,
      ),
    ),
    primaryIconTheme: base.iconTheme.copyWith(
      size: 30,
      color: shedAppBlue400,
    ),
    inputDecorationTheme: InputDecorationTheme(
      suffixStyle: TextStyle(color: shedAppBodyBlack),
      labelStyle: TextStyle(
        color: Color(0xCC25333D),
        fontFamily: "WalkwayBold",
        // fontSize: 15.0
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide(
          color: shedAppBlue300,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide(
          color: shedAppErrorRed,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide(
          color: shedAppErrorRed,
          width: 2.0,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide(
          color: shedAppBlue300,
          width: 2.0,
        ),
      ),
    ),
    iconTheme: base.iconTheme.copyWith(
      color: shedAppBlue400,
    ),
  );
}