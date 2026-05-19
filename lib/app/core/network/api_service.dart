import 'package:get/get.dart';
import 'dio_client.dart';

class ApiService {
  static Future<Map> login(String account, String pwd) async {
    final res = await DioClient.instance.post("/login", data: {
      "username": account,
      "password": pwd,
    });
    return res.data;
  }

  static Future<Map> getUserInfo() async {
    final res = await DioClient.instance.get("/user/info");
    return res.data;
  }
}