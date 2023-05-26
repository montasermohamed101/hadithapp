import 'package:flutter/material.dart';

import 'app_color.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    canvasColor: AppColors.primaryColor,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
          color: AppColors.accentColor,
          fontWeight: FontWeight.bold,
          fontSize: 30),
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
          color: AppColors.accentColor,
          fontSize: 25,
          fontWeight: FontWeight.w500),//for sura name
      titleSmall: TextStyle(
          color: AppColors.accentColor,
          fontSize: 14,
          fontWeight: FontWeight.bold),//for title in settings tab
      titleMedium: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 14
      ),

    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedIconTheme: IconThemeData(
        size: 30
      ),
      showUnselectedLabels: false,
     selectedIconTheme: IconThemeData(
     size: 36,
   ),
      selectedLabelStyle: TextStyle(
        fontSize: 12,
        color: AppColors.accentColor,
      ),
      selectedItemColor: AppColors.accentColor,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
    ),
    // bottomSheetTheme: const BottomSheetThemeData(
    //   backgroundColor: Colors.white
    // ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryColorDark,
    canvasColor: AppColors.primaryColorDark,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30),
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
          color: AppColors.white,
          fontSize: 25,
          fontWeight: FontWeight.w500),//for sura name
      titleSmall: TextStyle(
          color: AppColors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold),//for title in settings tab
      titleMedium: TextStyle(
          color: AppColors.primaryColorDark,
          fontSize: 14
      ),

    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedIconTheme: IconThemeData(
          size: 30
      ),
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(
        size: 36,
      ),
      selectedLabelStyle: TextStyle(
        fontSize: 12,
        color: AppColors.accentColorDark,
      ),
      selectedItemColor: AppColors.accentColorDark,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
    ),
    // bottomSheetTheme: const BottomSheetThemeData(
    //     backgroundColor: Colors.white
    // ),
  );
}
