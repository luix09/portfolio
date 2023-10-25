import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeChangeNotifier with ChangeNotifier {
  get lightTheme => _lightTheme;

  var _lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        )),
    primaryColor: Color(0xFF325288),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    textTheme: TextTheme(
      button: GoogleFonts.lato(
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
      ),
      headline2: GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      bodyText2: GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w300, color: Colors.black),
      ),
      bodyText1: TextStyle(
          color: Colors.black, fontSize: 22, fontWeight: FontWeight.w300),
      subtitle1: TextStyle(
          color: Colors.black, fontSize: 28, fontWeight: FontWeight.w700),
      headline4: GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: 20,
            height: 1.5,
            fontWeight: FontWeight.w400,
            color: Colors.white),
      ),
    ),
  );
}
