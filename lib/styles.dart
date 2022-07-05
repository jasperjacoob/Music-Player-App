import 'package:flutter/material.dart';
import './constant.dart';

ThemeData get defaultThemeData {
  return ThemeData.light().copyWith(
    canvasColor: background,
    colorScheme: const ColorScheme(
        brightness: brightness,
        primary: primary,
        onPrimary: onPrimary,
        secondary: secondary,
        onSecondary: onSecondary,
        error: error,
        onError: onError,
        background: background,
        onBackground: onBackground,
        surface: surface,
        onSurface: onSurface),
  );
}
