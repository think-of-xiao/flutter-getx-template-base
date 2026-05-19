import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../constants/api_constants.dart';
import '../utils/error_util.dart';
import '../utils/logger_util.dart';
import '../utils/sp_util.dart';

class DioClient {
  static final Dio _dio = Dio();

  static Dio get instance {
    _dio.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(milliseconds: ApiConstants.timeout),
      receiveTimeout: const Duration(milliseconds: ApiConstants.timeout),
    );

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = SpUtil.getString(ApiConstants.tokenKey);
        if (token.isNotEmpty) {
          options.headers["Authorization"] = "Bearer $token";
        }
        Log.d("REQUEST: ${options.method} ${options.uri}");
        return handler.next(options);
      },
      onResponse: (res, handler) {
        return handler.next(res);
      },
      onError: (e, handler) async {
        Log.e("ERROR: ${e.message}");
        if (e.response?.statusCode == 401) {
          await _refreshToken(e, handler);
          return;
        }
        ErrorUtil.handleError(e);
        return handler.next(e);
      },
    ));

    return _dio;
  }

  static Future<void> _refreshToken(
      DioException e, ErrorInterceptorHandler handler) async {
    try {
      // 刷新Token接口
      final refreshToken = SpUtil.getString(ApiConstants.refreshTokenKey);
      final res = await _dio.post("/refresh-token", data: {
        "refresh_token": refreshToken,
      });

      final newToken = res.data["token"];
      final newRefresh = res.data["refresh_token"];

      await SpUtil.setString(ApiConstants.tokenKey, newToken);
      await SpUtil.setString(ApiConstants.refreshTokenKey, newRefresh);

      // 重试请求
      final opts = Options(
        method: e.requestOptions.method,
        headers: e.requestOptions.headers,
      );
      handler.resolve(await _dio.request(
        e.requestOptions.path,
        options: opts,
        data: e.requestOptions.data,
        queryParameters: e.requestOptions.queryParameters,
      ));
    } catch (e) {
      ErrorUtil.showError("登录已过期，请重新登录".tr);
      // 跳转登录页并清空前面的所有路由
      Get.offAllNamed(AppRoutes.login);
    }
  }
}