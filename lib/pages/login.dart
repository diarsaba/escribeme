import 'package:escribeme/pages/pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            child: const Text('Login'),
            onPressed: () {
              Get.to(() => const Bookcase());
            }),
      ),
    );
  }
}
