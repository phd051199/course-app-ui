import 'package:course_app/screens/success.dart';
import 'package:course_app/utils/validation.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RxBool isUserInvalid = true.obs;
  RxBool isFullnameInvalid = true.obs;
  RxBool isEmailInvalid = true.obs;
  RxBool isPwdInvalid = true.obs;
  RxBool isRPwdInvalid = true.obs;
  RxBool btnEnabled = false.obs;
  RxBool isLoading = false.obs;
  RxString usernameInvalidMsg = ''.obs;
  RxString emailInvalidMsg = ''.obs;

  void onRegSuccess() {
    Get.offAll(() => SuccessScreen());
  }

  void onRegError(msg) {
    btnDispose();
    if (msg == 'User Already Exists') {
      isUserInvalid(true);
      usernameInvalidMsg('user already exists');
    } else {
      isEmailInvalid(true);
      emailInvalidMsg('this field must be an email');
    }
  }

  void checkAll() {
    !isUserInvalid.value &&
            !isFullnameInvalid.value &&
            !isEmailInvalid.value &&
            !isPwdInvalid.value &&
            !isRPwdInvalid.value
        ? btnEnabled(true)
        : btnEnabled(false);
  }

  void inputUsernameOnchanged(text) {
    if (Validation.validateUsername(text)) {
      isUserInvalid(false);
      checkAll();
    } else {
      isUserInvalid(true);
      btnEnabled(false);
    }
  }

  void inputFullnameOnchanged(text) {
    if (text.length > 5) {
      isFullnameInvalid(false);
      checkAll();
    } else {
      isFullnameInvalid(true);
      btnEnabled(false);
    }
  }

  void inputEmailOnchanged(text) {
    if (Validation.validateEmail(text)) {
      isEmailInvalid(false);
      checkAll();
    } else {
      isEmailInvalid(true);
      btnEnabled(false);
    }
  }

  void inputPasswordOnchanged(text) {
    if (Validation.validatePassword(text)) {
      isPwdInvalid(false);
      checkAll();
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
