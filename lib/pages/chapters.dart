import 'package:escribeme/controllers/controllers.dart';
import 'package:escribeme/pages/modal_chapters.dart';
import 'package:escribeme/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChaptersPage extends StatefulWidget {
  const ChaptersPage({super.key});

  @override
  State<ChaptersPage> createState() => _ChaptersPageState();
}

class _ChaptersPageState extends State<ChaptersPage> {
  

  @override
  Widget build(BuildContext context) {
    final chapterscontroller = Get.find<ChaptersController>();
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text(chapterscontroller.booktitle.value),
          ),
          body: ListView.builder(
              itemCount: chapterscontroller.chapters.value.chapters.length,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(
                    chapterscontroller.chapters.value.chapters[index].title,
                  ),
                  subtitle: Text(
                    chapterscontroller
                        .chapters.value.chapters[index].description,
                  ),
                  onTap: () {
                    Get.to(() => const ChaptersPage());
                  },
                );
              }),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (builder) {
                    return const ModalChaptersInputs();
                  });
            },
            child: Icon(Icons.add),
          ),
        ));
  }
}
