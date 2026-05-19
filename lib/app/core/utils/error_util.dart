import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorUtil {
  static void handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          showError("连接超时".tr);
          break;
        case DioExceptionType.receiveTimeout:
          showError("响应超时".tr);
          break;
        case DioExceptionType.badResponse:
          final msg = error.response?.data["message"] ?? "请求异常".tr;
          showError(msg);
          break;
        default:
          showError("网络异常".tr);
      }
    } else {
      showError(error.toString());
    }
  }

  static void showError(String msg) {
    Get.snackbar(
      "error".tr,
      msg,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.withOpacity(0.8),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );
  }

  static void showSuccess(String msg) {
    Get.snackbar(
      "success".tr,
      msg,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.8),
      colorText: Colors.white,
    );
  }
}