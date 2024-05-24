import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Language".tr),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text("Change Language".tr),
              Center(
                child: IconButton(
                  onPressed: () {
                    var locale = Get.locale == const Locale('en', 'US')
                        ? const Locale('fr', 'FR')
                        : const Locale('en', 'US');
                    Get.updateLocale(locale);
                  },
                  icon: const Icon(Icons.language),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text("Current Language:".tr),
              Text(" ${Get.locale?.countryCode}"),
            ],
          )
        ],
      ),
    );
  }
}
