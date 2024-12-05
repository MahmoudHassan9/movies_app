import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';

abstract class AppTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.scaffoldBg,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.bottomNavBar,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.selectedBottomNavBarItem,
      unselectedItemColor: AppColors.unSelectedBottomNavBarItem,
      elevation: 10,
      showSelectedLabels: true,

    ),
  );
}
