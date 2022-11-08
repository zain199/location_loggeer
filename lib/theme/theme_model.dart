import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Dohatana/theme/color.dart';

import 'config.dart';

class ThemeModel {
  final lightMode = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Config().appColor,
    primaryColorDark: Config().appaccentColor,
    iconTheme: const IconThemeData(color: Colors.orange),
    fontFamily: 'Manrope',
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    primaryColorLight: Colors.white,
    secondaryHeaderColor: Colors.grey,
    shadowColor: Colors.grey[200],
    backgroundColor: Config().appColor,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.grey[900],

      ),
      actionsIconTheme: const IconThemeData(color: Colors.white),
    ),
    textTheme:  TextTheme(
      bodyText1: TextStyle(
           fontSize: 12, color: Colors.black,fontFamily: GoogleFonts.abel().fontFamily),
      bodyText2: TextStyle(
           fontSize: 14, color: Colors.black,fontFamily: GoogleFonts.abel().fontFamily),


      subtitle1: TextStyle(
           fontSize: 16, color: Colors.black,fontFamily: GoogleFonts.abel().fontFamily),
      subtitle2: TextStyle(
           fontSize: 18, color: Colors.black,fontFamily: GoogleFonts.abel().fontFamily),

      headline1: TextStyle(
           fontSize: 20, color: Colors.black,fontFamily: GoogleFonts.abel().fontFamily),
      headline2: TextStyle(
           fontSize: 22, color: Colors.black,fontFamily: GoogleFonts.abel().fontFamily),
      headline3: TextStyle(
           fontSize: 24, color: Colors.black,fontFamily: GoogleFonts.abel().fontFamily),
      headline4: TextStyle(
           fontSize: 26, color: Colors.black,fontFamily: GoogleFonts.abel().fontFamily),
      headline5: TextStyle(
           fontSize: 28, color: Colors.black,fontFamily: GoogleFonts.abel().fontFamily),
      headline6: TextStyle(
           fontSize: 30, color: Colors.black,fontFamily: GoogleFonts.abel().fontFamily),

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Config().appaccentColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
    ),
  );

  final darkMode = ThemeData(
      primarySwatch: Colors.pink,
      primaryColor: Config().appColor,
      iconTheme: const IconThemeData(color: Colors.white),
      fontFamily: 'Manrope',
      scaffoldBackgroundColor: const Color(0xff303030),
      brightness: Brightness.dark,
      primaryColorDark: Colors.grey[300],
      primaryColorLight: Colors.grey[800],
      secondaryHeaderColor: Colors.grey[400],
      shadowColor: const Color(0xff282828),
      backgroundColor: Colors.grey[900],
      appBarTheme: AppBarTheme(
        color: Colors.grey[900],
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actionsIconTheme: const IconThemeData(color: Colors.white),
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
             fontSize: 12, color: Colors.black),
        bodyText2: TextStyle(
             fontSize: 14, color: Colors.black),


        subtitle1: TextStyle(
             fontSize: 16, color: Colors.black),
        subtitle2: TextStyle(
             fontSize: 18, color: Colors.black),

        headline1: TextStyle(
             fontSize: 20, color: Colors.black),
        headline2: TextStyle(
             fontSize: 22, color: Colors.black),
        headline3: TextStyle(
             fontSize: 24, color: Colors.black),
        headline4: TextStyle(
             fontSize: 26, color: Colors.black),
        headline5: TextStyle(
             fontSize: 28, color: Colors.black),
        headline6: TextStyle(
             fontSize: 30, color: Colors.black),

      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[500],
      ));
}
