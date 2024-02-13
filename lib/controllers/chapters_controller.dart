import 'package:escribeme/models/models.dart';
import 'package:get/get.dart';

class ChaptersController extends GetxController {
  Rx<Chapters> chapters = Chapters(chapters: [], book: "").obs;

  RxString booktitle = "".obs;

  void addBook(Chapter chapter) {
    chapters.update((val) {
      val?.chapters.add(chapter);
    });
  }

  void selectBookTitle(String title) {
    booktitle.value = title;
  }

  void removeBook() {}
}
