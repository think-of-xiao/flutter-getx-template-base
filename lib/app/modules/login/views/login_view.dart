import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("登录")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              onChanged: (v) => controller.account.value = v,
              decoration: const InputDecoration(labelText: "账号"),
            ),
            const SizedBox(height: 12),
            TextField(
              onChanged: (v) => controller.pwd.value = v,
              obscureText: true,
              decoration: const InputDecoration(labelText: "密码"),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: Obx(
                    () => ElevatedButton(
                  onPressed: controller.loading ? null : controller.login,
                  child: controller.loading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("登录"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}