import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Colour tokens. Teal comes from the heading colour of the CV.
class Palette {
  static const bg = Color(0xFFF2F6F8);
  static const surface = Color(0xFFFFFFFF);
  static const ink = Color(0xFF10222E);
  static const inkSoft = Color(0xFF4A5E6B);
  static const teal = Color(0xFF0B7F82);
  static const tealSoft = Color(0xFFD7ECEC);
  static const marigold = Color(0xFFF0B33F);
  static const line = Color(0xFFD3DEE4);
  static const night = Color(0xFF0C1B25);
  static const onNightSoft = Color(0xFFB7C6CF);
  static const onNightLine = Color(0x33FFFFFF);
}

/// Bricolage Grotesque for headings and UI, Source Serif 4 for reading text.
class AppText {
  static TextStyle display(
    double size, {
    Color color = Palette.ink,
    FontWeight w = FontWeight.w700,
    double h = 1.1,
    double ls = 0,
  }) =>
      GoogleFonts.bricolageGrotesque(
        fontSize: size,
        fontWeight: w,
        height: h,
        letterSpacing: ls,
        color: color,
      );

  static TextStyle ui(
    double size, {
    Color color = Palette.ink,
    FontWeight w = FontWeight.w600,
    double h = 1.3,
  }) =>
      GoogleFonts.bricolageGrotesque(
        fontSize: size,
        fontWeight: w,
        height: h,
        color: color,
      );

  static TextStyle body(
    double size, {
    Color color = Palette.inkSoft,
    FontWeight w = FontWeight.w400,
    double h = 1.6,
  }) =>
      GoogleFonts.sourceSerif4(
        fontSize: size,
        fontWeight: w,
        height: h,
        color: color,
      );
}

ThemeData buildTheme() {
  final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(12));
  const padding = EdgeInsets.symmetric(horizontal: 24, vertical: 18);

  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Palette.teal)
        .copyWith(primary: Palette.teal, onPrimary: Colors.white),
    scaffoldBackgroundColor: Palette.bg,
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: Palette.teal,
        foregroundColor: Colors.white,
        padding: padding,
        shape: shape,
        textStyle: AppText.ui(15),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Palette.ink,
        padding: padding,
        shape: shape,
        side: const BorderSide(color: Palette.ink, width: 1.2),
        textStyle: AppText.ui(15),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Palette.ink,
        shape: shape,
        textStyle: AppText.ui(15),
      ),
    ),
  );
}
