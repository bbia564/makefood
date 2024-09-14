import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class AppStyle {
  static final lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: AppColors.themeColor,
    primaryColorDark: AppColors.themeText,
    primaryColorLight: Colors.white,
    focusColor: Colors.transparent,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    brightness: Brightness.light,
    //画布主题
    scaffoldBackgroundColor: const Color(0xFFF8F8F8),
    canvasColor: AppColors.themeColor,
    dividerColor: Colors.black.withOpacity(0.05),
    appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 16.sp, fontWeight: FontWeight.w700, color: const Color(0xFF0F0F0F))),
    cardTheme: const CardTheme(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
    dividerTheme: DividerThemeData(
      thickness: 1,
      color: Colors.grey[200],
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Color(0xFFF5902C)),
  );
  static const TextStyle lightText = TextStyle(
    color: Colors.white,
    // fontFamily: AppFonts.fontLight,
  );

  static BoxDecoration get defDecoration =>
      BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.r)), color: Colors.white);
}
