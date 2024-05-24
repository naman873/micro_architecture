import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_config.dart';
import 'core/utils/localization/translation.dart';
import 'features/auth/domain/use_cases/login_user_case.dart';
import 'features/auth/presentation/controllers/login_controller.dart';
import 'features/auth/presentation/views/home_page.dart';

void main() async {
  AppConfig.create(
    appName: "Dev Flavor Example",
    baseUrl: "https://dev.dwirandyh.com",
    primaryColor: Colors.blue,
    flavor: Flavor.prod,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<LoginUseCase>(() => LoginUseCase());
    Get.lazyPut<LoginController>(
        () => LoginController(Get.find<LoginUseCase>()));
    //or
    // Get.lazyPut<LoginController>(() => LoginController(LoginUseCase()));

    return GetMaterialApp(
      title: 'Flutter Demo Production',
      theme: ThemeData(
        primarySwatch: AppConfig.shared.primaryColor,
      ),
      translations: AppTranslation(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      home: HomePage(),
    );
  }
}
