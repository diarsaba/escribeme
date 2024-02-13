import 'package:escribeme/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const Escribeme());
}

class Escribeme extends StatelessWidget {
  const Escribeme({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Escribeme',
      initialRoute: 'login',
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
      ],
    );
  }
}
