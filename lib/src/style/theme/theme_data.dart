import 'package:alpha_twelve/src/style/colors/alpha_colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'typography/typography_theme.dart';


abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AlphaColors.primaryBlue,
      onPrimary: AlphaColors.greyShade,
      secondary: AlphaColors.whiteColor,
      onSecondary: Colors.black,
      error: Colors.redAccent,
      onError: Colors.black,
      surface: AlphaColors.greyShade,
      onSurface: AlphaColors.whiteColor,
    ),
    textTheme: AlphaTypography.darkTextTheme,
    useMaterial3: true,
    // Scaffold background
    scaffoldBackgroundColor: AlphaColors.whiteColor,

    // AppBar styling
    appBarTheme: const AppBarTheme(
     
      backgroundColor: AlphaColors.whiteColor,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: AlphaColors.greyShade),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AlphaColors.greyShade,
      ),
    ),

    // Card styling
    cardTheme: CardTheme(
      color: AlphaColors.whiteColor,
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),

    // Drawer theme
    drawerTheme: const DrawerThemeData(
      backgroundColor: AlphaColors.whiteColor,
      surfaceTintColor: Colors.transparent,
    ),

    // Floating Action Button Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AlphaColors.blackColor,
      foregroundColor: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        maximumSize: Size(342.w, 48.h),
        minimumSize: Size(342.w, 48.h),
        splashFactory: NoSplash.splashFactory,
        foregroundColor: AlphaColors.whiteColor,
        backgroundColor: AlphaColors.primaryBlue,
        elevation: 1,
       
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        textStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          fontFamily: AlphaTypography.ibmPlexSans(),
          color: AlphaColors.whiteColor,
        ),
      ),
    ),

    // Outlined Button Theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AlphaColors.whiteColor,
        side: const BorderSide(color: AlphaColors.primaryBlue, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // Input Decoration Theme (TextFields)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AlphaColors.greyShade),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AlphaColors.greyShade, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      hintStyle: TextStyle(
        color: Colors.grey.shade600,
      ),
    ),

    // Bottom Navigation Bar Theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AlphaColors.whiteColor,
      selectedItemColor: AlphaColors.primaryBlue,
      unselectedItemColor: Colors.grey.shade50,
      elevation: 4,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
    ),

    // Canvas color (for dialogs, modals)
    canvasColor: AlphaColors.whiteColor,
  );
}
