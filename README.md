# flutter_getx_template_base

A new Flutter project template with getx.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 项目介绍

这是一个基于Flutter的项目模板，使用getx框架。

功能包括：
- ✅ 本地存储：SharedPreferences 全局工具类
- ✅ 全局明暗主题：一键切换 + 持久化
- ✅ 国际化多语言：中 / 英一键切换
- ✅ Token 自动拦截 + 刷新：401 自动刷新，过期自动登出
- ✅ 统一错误处理：全局弹窗、网络异常、业务异常统一管理
- ✅ GetX 标准架构：路由、Binding、Controller、View
- ✅ Dio 网络封装：全局日志、Header、重试机制

项目结构如下：
```
  project/
  ├── assets/
  │   └── images/           # 主图片目录（在主图片目录下存放的是1.0x倍图）
  │       ├── 2.0x/         # 2倍图（中等分辨率手机）
  │       │   └── logo.png
  │       ├── 3.0x/         # 3倍图（高清/旗舰手机）
  │       │   └── logo.png
  │       └── logo.png      # 1倍图（默认/基础图）
  └── lib/
      ├── app/
      │   ├── core/
      │   │   ├── constants/
      │   │   │   ├── app_constants.dart    ← 全局常量配置
      │   │   │   └── api_constants.dart    ← API常量配置
      │   │   ├── utils/
      │   │   │   ├── logger_util.dart    ← 日志工具类
      │   │   │   ├── sp_util.dart        ← 本地存储工具类
      │   │   │   └── error_util.dart     ← 统一错误处理工具类
      │   │   ├── network/
      │   │   │   ├── dio_client.dart     ← Dio网络封装、Token拦截+刷新
      │   │   │   └── api_service.dart    ← Dio网络封装服务
      │   │   ├── theme/
      │   │   │   ├── app_theme.dart      ← 全局主题
      │   │   │   └── theme_service.dart  ← 全局主题服务
      │   │   └── lang/
      │   │       ├── lang_service.dart   ← 国际化
      │   │       ├── translations/
      │   │       │   ├── zh_Hans.dart    ← 中文翻译配置
      │   │       │   └── en_US.dart      ← 英文翻译配置
      │   │       └── lang_constant.dart  ← 国际化常量配置
      │   ├── data/
      │   │   └── models/
      │   │       ├── user_model.dart     ← 用户数据模型
      │   │       └── token_model.dart    ← Token数据模型
      │   └── modules/
      │       ├── home/
      │       │   ├── bindings/         ← getx模块级（controller）依赖注入
      │       │   ├── controllers/      ← getx controller 实现层
      │       │   └── views/            ← home模块视图层
      │       ├── login/
      │       │   ├── bindings/         ← getx模块级（controller）依赖注入
      │       │   ├── controllers/      ← getx controller 实现层
      │       │   └── views/            ← login模块视图层
      │       └── splash/
      │           ├── bindings/         ← getx模块级（controller）依赖注入
      │           ├── controllers/      ← getx controller 实现层
      │           └── views/            ← splash模块视图层
      ├── routes/
      │   ├── app_pages.dart      ← 路由页面配置
      │   └── app_routes.dart     ← 路由path配置
      └── main.dart             ← 应用入口
```
