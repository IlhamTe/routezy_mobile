import 'package:flutter/material.dart';

/// App Text Styles based on Design System
class AppTextStyles {
  const AppTextStyles._();

  /// Font Family
  static const String fontFamily = 'Poppins';
  static TextStyle poppins = const TextStyle(fontFamily: fontFamily);

  /// Letter Spacing
  static const double letterSpacing01 = 0.1;
  static const double letterSpacing02 = 0.2;

  ///////////////////////////// HEADING STYLES /////////////////////////////

  /// Heading 1: Bold 32px, Line Height 30px, Letter Spacing 0.2px
  static TextStyle heading1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    height: 30 / 24,
    letterSpacing: letterSpacing02,
  );

  /// Heading 2: Bold 28px, Line Height 26px, Letter Spacing 0.1px
  static TextStyle heading2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    height: 26 / 20,
    letterSpacing: letterSpacing01,
  );

  /// Heading 3: Bold 24px, Line Height 26px, Letter Spacing 0.1px
  static TextStyle heading3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    height: 26 / 20,
    letterSpacing: letterSpacing01,
  );

  /// Heading 4: Bold 20px, Line Height 26px, Letter Spacing 0.1px
  static TextStyle heading4 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    height: 26 / 20,
    letterSpacing: letterSpacing01,
  );

  /// Heading 5: Bold 18px, Line Height 26px, Letter Spacing 0.1px
  static TextStyle heading5 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    height: 26 / 20,
    letterSpacing: letterSpacing01,
  );

  /// Heading 6: Bold 16px, Line Height 26px, Letter Spacing 0.1px
  static TextStyle heading6 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    height: 26 / 16,
    letterSpacing: letterSpacing01,
  );

  ///////////////////////////// BODY STYLES /////////////////////////////

  /// Body-reg 1: Regular 18px, Line Height 27px, Letter Spacing 0.2px
  static TextStyle bodyRegular1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 27 / 16,
    letterSpacing: letterSpacing02,
  );

  /// Body-reg 2: Regular 16px, Line Height 27px, Letter Spacing 0.2px
  static TextStyle bodyRegular2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 27 / 16,
    letterSpacing: letterSpacing02,
  );

  /// Body-reg 3: Regular 14px, Line Height 24px, Letter Spacing 0.2px
  static TextStyle bodyRegular3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 24 / 14,
    letterSpacing: letterSpacing02,
  );

  /// Body-reg 4: Regular 12px, Line Height 20px, Letter Spacing 0.2px
  static TextStyle bodyRegular4 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 20 / 12,
    letterSpacing: letterSpacing02,
  );

  static TextStyle bodyRegular5 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    height: 20 / 12,
    letterSpacing: letterSpacing02,
  );

  /// Body-bold 1: Bold 16px, Line Height 27px, Letter Spacing 0.2px
  static TextStyle bodyBold1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    height: 27 / 16,
    letterSpacing: letterSpacing02,
  );

  /// Body-bold 2: Bold 14px, Line Height 24px, Letter Spacing 0.2px
  static TextStyle bodyBold2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.bold,
    height: 24 / 14,
    letterSpacing: letterSpacing02,
  );

  /// Body-bold 3: Bold 12px, Line Height 20px, Letter Spacing 0.2px
  static TextStyle bodyBold3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.bold,
    height: 20 / 12,
    letterSpacing: letterSpacing02,
  );

  /// Body-bold 4: Bold 10px, Line Height 20px, Letter Spacing 0.2px
  static TextStyle bodyBold4 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.bold,
    height: 20 / 12,
    letterSpacing: letterSpacing02,
  );

  ///////////////////////////// OVERLINE STYLES /////////////////////////////

  /// Overline 1: Regular 10px, Line Height 14px, Letter Spacing 0.2px
  static TextStyle overline1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    height: 14 / 10,
    letterSpacing: letterSpacing02,
  );

  /// Overline 2: Bold 10px, Line Height 14px, Letter Spacing 0.2px
  static TextStyle overline2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.bold,
    height: 14 / 10,
    letterSpacing: letterSpacing02,
  );

  ///////////////////////////// DISPLAY STYLES /////////////////////////////

  /// Display-reg 1: Regular 18px, Line Height 20px, Letter Spacing 0.2px
  static TextStyle displayReg1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 20 / 18,
    letterSpacing: letterSpacing02,
  );

  /// Display-reg 2: Regular 16px, Line Height 18px, Letter Spacing 0.2px
  static TextStyle displayReg2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 18 / 16,
    letterSpacing: letterSpacing02,
  );

  /// Display-reg 3: Regular 14px, Line Height 16px, Letter Spacing 0.2px
  static TextStyle displayReg3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 16 / 14,
    letterSpacing: letterSpacing02,
  );

  /// Display-reg 4: Medium 12px, Line Height 20px, Letter Spacing 0.2px
  static TextStyle displayReg4 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 20 / 12,
    letterSpacing: letterSpacing02,
  );

  /// Display-med 1: Medium 18px, Line Height 20px, Letter Spacing 0.2px
  static TextStyle displayMed1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 20 / 18,
    letterSpacing: letterSpacing02,
  );

  /// Display-med 2: Medium 16px, Line Height 20px, Letter Spacing 0.2px
  static TextStyle displayMed2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 20 / 16,
    letterSpacing: letterSpacing02,
  );

  /// Display-med 3: Medium 14px, Line Height 20px, Letter Spacing 0.2px
  static TextStyle displayMed3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 20 / 14,
    letterSpacing: letterSpacing02,
  );

  /// Display-med 4: Medium 12px, Line Height 20px, Letter Spacing 0.2px
  static TextStyle displayMed4 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 20 / 12,
    letterSpacing: letterSpacing02,
  );

  ///////////////////////////// ALIASES /////////////////////////////

  /// Alias for heading styles
  static TextStyle h1 = heading1;
  static TextStyle h2 = heading2;
  static TextStyle h3 = heading3;
  static TextStyle h4 = heading4;
  static TextStyle h5 = heading5;
  static TextStyle h6 = heading6;

  /// Alias for body styles
  static TextStyle bodyReg1 = bodyRegular1;
  static TextStyle bodyReg2 = bodyRegular2;
  static TextStyle bodyReg3 = bodyRegular3;
  static TextStyle bodyReg4 = bodyRegular4;

  /// Default style for TextLabel widget
  static TextStyle defaultLabel = bodyReg2;
}
