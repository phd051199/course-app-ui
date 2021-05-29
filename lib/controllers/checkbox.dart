import 'package:get/get.dart';

class CheckboxController extends GetxController {
  RxBool isRememberChecked = false.obs;

  void isChecked() {
    isRememberChecked(!isRememberChecked.value);
  }
}
