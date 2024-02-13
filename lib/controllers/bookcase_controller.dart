import 'package:escribeme/models/models.dart';
import 'package:get/get.dart';

class BookcaseController extends GetxController{

  Rx<Bookcase> bookcase = Bookcase(bookcase: []).obs;


  void addBook(Book book){
    bookcase.update((val) {
      val?.bookcase.add(book);
    });
  }

  void removeBook(){

  }
}