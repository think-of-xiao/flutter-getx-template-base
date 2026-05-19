import 'package:get/get.dart';

import '../../../core/constants/api_constants.dart';
import '../../../core/network/api_service.dart';
import '../../../core/utils/error_util.dart';
import '../../../core/utils/sp_util.dart';

class LoginController extends GetxController {
  final account = "".obs;
  final pwd = "".obs;

  final _loading = false.obs;
  bool get loading => _loading.value;

  Future<void> login() async {
    if (account.isEmpty) {
      ErrorUtil.showError("pleaseInputAccount".tr);
      return;
    }
    if (pwd.isEmpty) {
      ErrorUtil.showError("pleaseInputPassword".tr);
      return;
    }

    _loading.value = true;
    try {
      final data = await ApiService.login(account.value, pwd.value);
      final token = data["token"];
      final refreshToken = data["refresh_token"];

      await SpUtil.setString(ApiConstants.tokenKey, token);
      await SpUtil.setString(ApiConstants.refreshTokenKey, refreshToken);

      ErrorUtil.showSuccess("loginSuccess".tr);
      Get.back();
    } catch (e) {
      ErrorUtil.handleError(e);
    } finally {
      _loading.value = false;
    }
  }
}