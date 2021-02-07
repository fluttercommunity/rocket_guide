import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData light() {
    final textTheme = _getTextTheme(brightness: Brightness.light);

    return ThemeData(
      primaryColor: _primaryColor,
      accentColor: _accentColor,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
    );
  }

  static ThemeData dark() {
    final textTheme = _getTextTheme(brightness: Brightness.dark);

    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: _primaryColor,
      accentColor: _accentColor,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
    );
  }

  static const _primaryColor = Colors.black;
  static const _accentColor = Colors.white;

  static _getTextTheme({@required Brightness brightness}) {
    final themeData = ThemeData(brightness: brightness);

    return GoogleFonts.exo2TextTheme(themeData.textTheme).copyWith(
      headline1: GoogleFonts.orbitron(),
      headline2: GoogleFonts.orbitron(),
      headline3: GoogleFonts.orbitron(),
      headline4: GoogleFonts.orbitron(),
      headline5: GoogleFonts.orbitron(),
      headline6: GoogleFonts.orbitron(),
    );
  }
}
