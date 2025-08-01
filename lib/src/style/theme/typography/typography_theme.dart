import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color scheme/alpha_colors.dart';

class AlphaTypography {
  static String ibmPlexSans() => GoogleFonts.ibmPlexSans().fontFamily!;
 
  static String  ibmPlexMono() => GoogleFonts.ibmPlexMono().fontFamily!;

  static const String sfProText = 'SFProDisplay';

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: TextStyle(
        fontSize: 42.sp,
        fontWeight: FontWeight.bold,
        color: AlphaColors.blackColor,
        fontFamily: ibmPlexSans()),
    displayMedium: TextStyle(
        fontSize: 40.sp,
        fontWeight: FontWeight.w600,
        color: AlphaColors.blackColor,
        fontFamily: ibmPlexSans()),
    displaySmall: TextStyle(
        fontSize: 38.sp,
        fontWeight: FontWeight.w500,
        color: AlphaColors.blackColor,
        fontFamily: ibmPlexSans()),
    headlineLarge: TextStyle(
        fontSize: 36.sp,
        fontWeight: FontWeight.w600,
        color: AlphaColors.blackColor,
        fontFamily: ibmPlexSans()),
    headlineMedium: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w500,
        color: AlphaColors.blackColor,
        fontFamily: ibmPlexSans()),
    headlineSmall: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.w400,
        color: AlphaColors.blackColor,
        fontFamily: ibmPlexSans()),
    titleLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: AlphaColors.blackColor,
        fontFamily: ibmPlexSans()),
    titleMedium: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w500,
        color: AlphaColors.blackColor,
        fontFamily: ibmPlexSans()),
    titleSmall: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
        color: AlphaColors.blackColor,
        fontFamily: ibmPlexSans()),
    bodyLarge: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.normal,
        color: AlphaColors.blackColor,
        fontFamily: ibmPlexSans()),
    bodyMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: AlphaColors.blackColor,
        fontFamily: ibmPlexSans()),
    bodySmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: AlphaColors.blackColor,
        fontFamily: ibmPlexSans()),
    labelLarge: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: AlphaColors.blackColor,
        fontFamily:ibmPlexSans()),
    labelMedium: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        color: AlphaColors.blackColor,
        fontFamily: ibmPlexSans()),
    labelSmall: TextStyle(
        fontSize: 8.sp,
        fontWeight: FontWeight.w300,
        color: AlphaColors.blackColor,
        fontFamily: ibmPlexSans()),
  );
}
