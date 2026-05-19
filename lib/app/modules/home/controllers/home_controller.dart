import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/lang/lang_service.dart';
import '../../../core/theme/theme_service.dart';
import '../../../core/utils/logger_util.dart';

class HomeController extends GetxController {
  final _count = 0.obs;
  int get count => _count.value;

  final _loading = false.obs;
  bool get loading => _loading.value;

  void increment() {
    _count.value++;
  }

  Future<void> fetchData() async {
    _loading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    _loading.value = false;
    Get.snackbar("提示", "数据加载完成");
  }

  /// 切换主题
  void switchTheme() => ThemeService.switchTheme();

  /// 切换中英文
  void switchLang() {
    final isZh = Get.locale?.languageCode == "zh";
    LangService.updateLocale(isZh
        ? const Locale('en', 'US')
        : const Locale('zh', 'Hans'));
  }

  @override
  void onInit() {
    super.onInit();
    Log.d("HomeController onInit");
  }

  @override
  void onReady() {
    super.onReady();
    Log.d("HomeController onReady");
  }

  @override
  void onClose() {
    Log.d("HomeController onClose");
    super.onClose();
  }
}