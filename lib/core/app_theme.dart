/*
AppTheme
Defines both light and dark themes for PetPass
*/

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.lightBlue[200]!,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.lightBlue[200]),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.lightBlue[200]),
      titleTextStyle: GoogleFonts.nunito(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.lightBlue[200],
      ),
    ),
    textTheme: GoogleFonts.nunitoTextTheme(ThemeData.dark().textTheme),
  );

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.lightBlue[200]!,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.lightBlue[200]),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.lightBlue[200]),
      titleTextStyle: GoogleFonts.nunito(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.lightBlue[200],
      ),
    ),
    textTheme: GoogleFonts.nunitoTextTheme(ThemeData.light().textTheme),
  );
}
