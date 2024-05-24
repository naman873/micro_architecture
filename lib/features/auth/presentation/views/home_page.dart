import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:micro_architecture/features/auth/presentation/controllers/login_controller.dart';
import 'package:micro_architecture/features/auth/presentation/views/change_language.dart';

import '../../../../app_config.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final LoginController controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConfig.shared.appName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text("App Name:".tr),
                Text(" ${AppConfig.shared.appName}"),
              ],
            ),
            Row(
              children: [
                Text("Base URL:".tr),
                Text(" ${AppConfig.shared.baseUrl}"),
              ],
            ),
            Row(
              children: [
                Text("Flavor:".tr),
                Text(" ${AppConfig.shared.flavor}"),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return const CircularProgressIndicator();
              } else {
                return ElevatedButton(
                  onPressed: () async {
                    await controller.login("asd", "asd");
                  },
                  child: Text(
                    "Get Data".tr,
                  ),
                );
              }
            }),
            const SizedBox(
              height: 10,
            ),
            Obx(() {
              if (controller.user.value != null) {
                return Row(
                  children: [
                    Text("Name is:".tr),
                    Text(" ${controller.user.value?.name}"),
                  ],
                );
              } else {
                return Container();
              }
            }),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const ChangeLanguage();
                      },
                    ),
                  );
                },
                child: Text("Change Language".tr))
          ],
        ),
      ),
    );
  }
}
