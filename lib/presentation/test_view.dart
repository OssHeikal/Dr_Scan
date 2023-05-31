import 'package:dr_scan_graduation_project/presentation/auth/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  static String id = 'TestView';
  TestView({super.key});
  final AuthViewModel controller = Get.put(AuthViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  controller.userName.value,
                  style: const TextStyle(fontSize: 30),
                )),
            ElevatedButton(
              onPressed: () {
                controller.login();
              },
              child: const Text('login'),
            ),
          ],
        ),
      ),
    );
  }
}
