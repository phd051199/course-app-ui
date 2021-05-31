import 'package:course_app/screens/home.dart';
import 'package:course_app/utils/validation.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxString currentUser = ''.obs;
  RxString jwt = ''.obs;
  RxBool isUserInvalid = true.obs;
  RxBool isPwdInvalid = true.obs;
  RxString usernameInvalidMsg = ''.obs;
  RxString pwdInvalidMsg = ''.obs;
  RxBool btnEnabled = false.obs;
  RxBool isLoading = false.obs;

  void onLoginError(msg) {
    btnDispose();
    if (msg == 'Invalid Username') {
      isUserInvalid(true);
      usernameInvalidMsg('this account does not exists');
      pwdInvalidMsg(null);
    } else if (msg == 'Invalid Password') {
      isPwdInvalid(true);
      pwdInvalidMsg('invalid password');
    }
  }

  void onLoginSuccess(msg) {
    Get.offAll(() => HomeScreen());
  }

  void inputUsernameOnchanged(text) {
    if (Validation.validateUsername(text) || Validation.validateEmail(text)) {
      isUserInvalid(false);
      !isUserInvalid.value && !isPwdInvalid.value
          ? btnEnabled(true)
          : btnEnabled(false);
    } else {
      isUserInvalid(true);
      btnEnabled(false);
    }
  }

  void inputPasswordOnchanged(text) {
    if (Validation.validatePassword(text)) {
      isPwdInvalid(false);
      !isUserInvalid.value && !isPwdInvalid.value
          ? btnEnabled(true)
          : btnEnabled(false);
    } else {
      isPwdInvalid(true);
      btnEnabled(false);
    }
  }

  void btnDispose() {
    btnEnabled(false);
    isLoading(false);
  }
}
