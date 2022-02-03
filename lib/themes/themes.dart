import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Theme {
  static ThemeData dark() {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colors.deepPurple[200],
        primaryVariant: const Color(0x003700B3),
        secondary: Colors.teal[200],
        background: Colors.black,
        surface: const Color(0x00121212),
        error: const Color(0x00CF6679),
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onBackground: Colors.white,
        onSurface: Colors.white,
        onError: Colors.black,
        brightness: Brightness.dark,
      ),
      splashColor: Colors.deepPurple[200],
      textTheme: TextTheme(
        button: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        headline1: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        headline2: const TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ),
        subtitle1: const TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
        subtitle2: TextStyle(
          color: Colors.deepPurple[200],
        ),
      ),
      scaffoldBackgroundColor: const Color(0x00121212),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.white,
          size: 40,
        ),
        color: Colors.black,
      ),
    );
  }

  static ThemeData light() {
    return ThemeData(
      primarySwatch: Colors.deepPurple,
    );
  }
}
