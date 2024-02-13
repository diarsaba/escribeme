import 'package:escribeme/pages/pages.dart';
import 'package:escribeme/controllers/controllers.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bookcase extends StatefulWidget {
  const Bookcase({super.key});

  @override
  State<Bookcase> createState() => _HomeState();
}

class _HomeState extends State<Bookcase> {
  final bookcasecontroller = Get.put(BookcaseController());
  final chapterscontroller = Get.put(ChaptersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => ListView.builder(
          itemCount: bookcasecontroller.bookcase.value.bookcase.length,
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(
                bookcasecontroller.bookcase.value.bookcase[index].title,
              ),
              subtitle: Text(
                bookcasecontroller.bookcase.value.bookcase[index].description,
              ),
              onTap: () {
                
                chapterscontroller.selectBookTitle("Ejemplo master");
                Get.to(() => const ChaptersPage());
              },
            );
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              backgroundColor: Colors.transparent,
              builder: (builder) {
                return const ModalInputs();
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
