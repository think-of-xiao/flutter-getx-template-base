import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/sp_util.dart';
import 'lang_constant.dart';
import 'translations/en_us.dart';
import 'translations/zh_hans.dart';

class LangService extends Translations {
  static const _langKey = "language_code";

  static Locale get locale {
    final code = SpUtil.getString(_langKey);
    if (code == LangConstant.zh) return const Locale('zh', 'Hans');
    if (code == LangConstant.en) return const Locale('en', 'US');
    return Get.deviceLocale ?? const Locale('en', 'US');
  }

  static const fallbackLocale = Locale('en', 'US');

  static Future<void> updateLocale(Locale locale) async {
    await SpUtil.setString(_langKey, locale.languageCode);
    Get.updateLocale(locale);
  }

  @override
  Map<String, Map<String, String>> get keys => {
    ...EnTrans().keys,
    ...ZhTrans().keys,
  };
}