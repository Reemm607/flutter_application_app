import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TColors {
  TColors._();

  // App Basic Colors
  static const Color primary = Color(0xFF4b68ff);
  static const Color secondary = Color(0xFFFfE24B);
  static const Color accent = Color(0xFFFfE24B);

//Grandient Colors

  static const Gradient linerGradient = LinearGradient(
    begin: Alignment(0.0,0.0),
    end: Alignment(0.707, -0.707),
    colors: [
    Color(0xffff9a9e),
    Color(0xfffad0c4),
    Color(0xfffad0c4),


  ]);

  // Text Color
  static const Color textprimary = Color(0xFF333333);
  static const Color textsecondary = Color(0xFF6c7570);
  static const Color textwhite = Colors.white;

  // Background Color
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // Background container Color
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = TColors.white.withOpacity(0.1);

  // Button Colors
  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary = Color(0xFF6C757d);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Border Color
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and Validation Color
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF357C00);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D3);

  // Neutral Color
  static const Color black = Color(0xFF232323);
  static const Color darkerGrery = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFEDEDE0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}
