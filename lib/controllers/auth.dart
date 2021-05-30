import 'package:get/get.dart';

class AuthController extends GetxController {
  RxString user = ''.obs;
  RxString jwt = ''.obs;

  void setUser(name) {
    user.value = name;
  }

  void setToken(token) {
    jwt.value = token;
  }
}
