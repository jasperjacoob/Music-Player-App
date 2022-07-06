import 'package:flutter/material.dart';
import 'package:musicplayer/constant.dart';

ThemeData get defaultThemeData {
  return ThemeData.light().copyWith(
      canvasColor: background,
      scaffoldBackgroundColor: onBackground,
      appBarTheme: const AppBarTheme(backgroundColor: background),
      colorScheme: const ColorScheme(
          brightness: brightness,
          primary: onPrimary,
          onPrimary: onPrimary,
          secondary: secondary,
          onSecondary: onSecondary,
          error: error,
          onError: onError,
          background: background,
          onBackground: onBackground,
          surface: surface,
          onSurface: onSurface),
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22.0,
            color: onSecondary,
            fontFamily: 'Inter'),
        headline2: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: onSecondary,
            fontFamily: 'Inter'),
        headline3: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: onTertiary,
            decoration: TextDecoration.underline,
            fontFamily: 'Inter'),
        headline4: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.0,
            decoration: TextDecoration.underline,
            color: onTertiary,
            fontFamily: 'Inter'),
        bodyText1:
            TextStyle(color: onTertiary, fontSize: 14.0, fontFamily: 'Inter'),
        bodyText2:
            TextStyle(color: onTertiary, fontSize: 12.0, fontFamily: 'Inter'),
        button: TextStyle(
            color: background,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter'),
      ),
      buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          minWidth: 200.0),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        shadowColor: Colors.transparent,
        minimumSize: const Size.fromHeight(17),
      )),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey.shade300,
      ));
}
