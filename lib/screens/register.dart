import 'package:course_app/controllers/auth/register.dart';
import 'package:course_app/services/auth.dart';
import 'package:course_app/utils/constants.dart';
import 'package:course_app/widgets/login/button.dart';
import 'package:course_app/widgets/login/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController usernameInputController = TextEditingController();
    TextEditingController fullnameInputController = TextEditingController();
    TextEditingController passwordInputController = TextEditingController();
    TextEditingController emailInputController = TextEditingController();
    TextEditingController retypePasswordInputController =
        TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: SingleChildScrollView(
          child: GetX<RegisterController>(
            init: RegisterController(),
            builder: (_) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign Up',
                  style: GoogleFonts.montserrat(
                    color: primaryTextColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Text(
                      'I have an account! ',
                      style: GoogleFonts.montserrat(
                        color: primaryTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Text(
                        'Click here',
                        style: GoogleFonts.montserrat(
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 38,
                ),
                AuthInput(
                  inputController: usernameInputController,
                  label: 'Username',
                  errorText:
                      _.isUserInvalid.value && _.usernameInvalidMsg.value != ''
                          ? _.usernameInvalidMsg.value
                          : null,
                  isInvalid: _.isUserInvalid.value,
                  onChanged: (text) => _.inputUsernameOnchanged(text),
                ),
                AuthInput(
                  inputController: fullnameInputController,
                  label: 'Full Name',
                  isInvalid: _.isFullnameInvalid.value,
                  onChanged: (text) => _.inputFullnameOnchanged(text),
                ),
                AuthInput(
                  inputController: emailInputController,
                  label: 'Your Email',
                  errorText:
                      _.isEmailInvalid.value && _.emailInvalidMsg.value != ''
                          ? _.emailInvalidMsg.value
                          : null,
                  isInvalid: _.isEmailInvalid.value,
                  onChanged: (text) => _.inputEmailOnchanged(text),
                ),
                AuthInput(
                  inputController: passwordInputController,
                  label: 'Password',
                  isPwdField: true,
                  isInvalid: _.isPwdInvalid.value,
                  onChanged: (text) => _.inputPasswordOnchanged(text),
                ),
                AuthInput(
                  inputController: retypePasswordInputController,
                  label: 'Retyped Password',
                  isPwdField: true,
                  isInvalid: _.isRPwdInvalid.value,
                  onChanged: (text) {
                    if (retypePasswordInputController.text ==
                        passwordInputController.text) {
                      _.isRPwdInvalid(false);
                      _.checkAll();
                    } else {
                      _.isRPwdInvalid(true);
                      _.btnEnabled(false);
                    }
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                AuthButton(
                  icon: _.isLoading.value
                      ? SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : null,
                  btnLabel: _.isLoading.value ? '' : 'Sign Up',
                  onPressed: _.btnEnabled.value
                      ? () {
                          _.btnEnabled(false);
                          _.isLoading(true);
                          AuthServices.register(
                            usernameInputController.text,
                            fullnameInputController.text,
                            emailInputController.text,
                            passwordInputController.text,
                            _.onRegSuccess,
                            _.onRegError,
                          );
                        }
                      : null,
                  btnColor: Colors.orangeAccent,
                  textColor: _.btnEnabled.value ? Colors.black : Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
