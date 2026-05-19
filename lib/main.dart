import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app/core/constants/app_constants.dart';
import 'app/core/lang/lang_service.dart';
import 'app/core/theme/theme_service.dart';
import 'app/core/utils/logger_util.dart';
import 'app/core/utils/sp_util.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil().init();
  Log.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: AppConstants.inAppName,
          initialRoute: AppRoutes.home,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          // 国际化
          locale: LangService.locale,
          fallbackLocale: LangService.fallbackLocale,
          translations: LangService(),
          // 主题
          theme: ThemeService.lightTheme,
          darkTheme: ThemeService.darkTheme,
          themeMode: ThemeService.themeMode,
        );
      },
    );
  }
}