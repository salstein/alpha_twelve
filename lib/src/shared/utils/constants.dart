import 'package:flutter/material.dart';

class AlphaConstants {
  const AlphaConstants._();

  static const int minutesInHour = 60;
  static const int hoursInDay = 24;
  static const int daysInWeek = 7;
  static const int daysInMonth = 30;
  static const int daysInQuarter = 90;
  static const int daysInYear = 365;

  static const termsLink = '';
  static const privacyPolicyLink = '';

  static const agreementsAndPolicies = '';
  static const faqLink = '';
  static const aboutLink = '';
  static const obscureText = '******';

  static const shorterAnimDur = Duration(milliseconds: 300);
  static const shortAnimDur = Duration(milliseconds: 700);
  static const debounceDur = Duration(milliseconds: 900);

  static const smallSpace = 8.0;
  static const smallSpaceM = 10.0;
  static const smallSpaceX = 12.0;
  static const mediumSpace = 16.0;
  static const mediumSpaceM = 20.0;
  static const mediumSpaceX = 24.0;
  static const bigSpace = 32.0;
  static const bigSpaceM = 40.0;
  static const bigSpaceX = 48.0;
  static const iconSize = 24.0;
  static const appBarHeight = 64.0;
  static const safeBottomNavSpace = 68.0;
  static const pageSize = 15;
  static const elevation = 0.5;
  static const ctaIconSize = 100.0;

  static const roundedShape8 = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)));

        static const roundedShape16 = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)));

  static const roundedShape15 = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)));

  static const roundedShape24 = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(24)));

  static const buttonShadow = [
    BoxShadow(
      color: Color(0x26000000),
      blurRadius: 3,
      offset: Offset(0.15, 1.50),
      spreadRadius: 0,
    )
  ];

  static const dottedDashPattern = <double>[10, 4];

  static const primaryBackgroundGradient = LinearGradient(
    begin: Alignment(0.00, -1.00),
    end: Alignment(0, 1),
    colors: [Color(0xFF0067C7), Color(0xFF033C70)],
  );
}
