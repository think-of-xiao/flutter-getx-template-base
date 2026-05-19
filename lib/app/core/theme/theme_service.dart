import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/sp_util.dart';
import 'app_theme.dart';

class ThemeService {
  static const _themeKey = "theme_mode";

  static ThemeMode get themeMode {
    final isDark = SpUtil.getBool(_themeKey);
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  static Future<void> switchTheme() async {
    final isDark = Get.isDarkMode;
    await SpUtil.setBool(_themeKey, !isDark);
    Get.changeThemeMode(!isDark ? ThemeMode.dark : ThemeMode.light);
  }

  static ThemeData get lightTheme => AppTheme.lightTheme;
  static ThemeData get darkTheme => AppTheme.darkTheme;
}