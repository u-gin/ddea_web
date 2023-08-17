import 'package:get/get.dart';

class MyController extends GetxController {
  RxInt myVariable = RxInt(1);

  void increment() {
    myVariable.value++;
    update();
  }

  void decrement() {
    myVariable.value--;
    update();
  }
}
