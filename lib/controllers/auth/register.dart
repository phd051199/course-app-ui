import 'package:course_app/screens/success.dart';
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
    if (GetUtils.isUsername(text)) {
      isUserInvalid(false);
      checkAll();
    } else {
      usernameInvalidMsg('');
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
    if (GetUtils.isEmail(text)) {
      isEmailInvalid(false);
      checkAll();
    } else {
      emailInvalidMsg('');
      isEmailInvalid(true);
      btnEnabled(false);
    }
  }

  void inputEmailFGOnchanged(text) {
    if (GetUtils.isEmail(text)) {
      isEmailInvalid(false);
      btnEnabled(true);
    } else {
      emailInvalidMsg('');
      isEmailInvalid(true);
      btnEnabled(false);
    }
  }

  void inputPasswordOnchanged(text) {
    if (GetUtils.isPassport(text)) {
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
