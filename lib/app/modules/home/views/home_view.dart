import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GetX 模板主页")),
      body: Obx(
            () => controller.loading
            ? const Center(child: CircularProgressIndicator())
            : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "count".trParams({"count": controller.count.toString()}),
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: controller.increment,
                child: Text("clickAdd".tr),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: controller.switchTheme,
                child: Text("switchTheme".tr),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: controller.switchLang,
                child: Text("switchLang".tr),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: controller.fetchData,
                child: Text("loadData".tr),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => Get.toNamed(AppRoutes.login),
                child: Text("login".tr),
              ),
            ],
          ),
        ),
      ),
    );
  }
}