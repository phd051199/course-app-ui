import 'package:course_app/controllers/auth/login.dart';
import 'package:course_app/controllers/checkbox.dart';
import 'package:course_app/screens/forgot_pass.dart';
import 'package:course_app/screens/register.dart';
import 'package:course_app/services/auth.dart';
import 'package:course_app/utils/constants.dart';
import 'package:course_app/widgets/login/button.dart';
import 'package:course_app/widgets/login/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController usernameInputController = TextEditingController();
    TextEditingController passwordInputController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: SingleChildScrollView(
          child: GetX<LoginController>(
            init: LoginController(),
            builder: (_) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign In',
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
                      'Don’t have an account ?',
                      style: GoogleFonts.montserrat(
                        color: primaryTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () => Get.to(() => RegisterScreen()),
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
                  label: 'Your Email / Username',
                  inputController: usernameInputController,
                  isInvalid: _.isUserInvalid.value,
                  errorText:
                      _.isUserInvalid.value && _.usernameInvalidMsg.value != ''
                          ? _.usernameInvalidMsg.value
                          : null,
                  onChanged: (text) => _.inputUsernameOnchanged(text),
                ),
                AuthInput(
                  label: 'Password',
                  inputController: passwordInputController,
                  isInvalid: _.isPwdInvalid.value,
                  errorText: _.isPwdInvalid.value && _.pwdInvalidMsg.value != ''
                      ? _.pwdInvalidMsg.value
                      : null,
                  isPwdField: true,
                  onChanged: (text) => _.inputPasswordOnchanged(text),
                ),
                SizedBox(
                  height: 28,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RememberCheckbox(),
                    GestureDetector(
                      onTap: () => Get.to(() => ForgotPasswordScreen()),
                      child: Text(
                        'Forgot password ?',
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
                  height: 42,
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
                  btnLabel: _.isLoading.value ? '' : 'Sign In',
                  onPressed: _.btnEnabled.value
                      ? () {
                          _.btnEnabled(false);
                          _.isLoading(true);
                          if (!_.isUserInvalid.value && !_.isPwdInvalid.value) {
                            AuthServices.login(
                                usernameInputController.text,
                                passwordInputController.text,
                                _.onLoginSuccess,
                                _.onLoginError);
                          }
                        }
                      : null,
                  btnColor: Colors.orangeAccent,
                  textColor: _.btnEnabled.value ? Colors.black : Colors.grey,
                ),
                SizedBox(
                  height: 26,
                ),
                DividerText(
                  text: 'or continue with',
                ),
                SizedBox(
                  height: 32,
                ),
                AuthButton(
                  btnLabel: 'Sign In/Up with Facebook',
                  onPressed: () {},
                  btnColor: Colors.blueAccent,
                  textColor: Colors.white,
                  icon: Icon(Icons.facebook_rounded),
                ),
                SizedBox(
                  height: 11,
                ),
                AuthButton(
                  btnLabel: 'Sign In/Up with Google',
                  onPressed: () {},
                  btnColor: Colors.white,
                  textColor: Colors.black,
                  icon: Image(
                    height: 18,
                    width: 24,
                    image: AssetImage('assets/images/gg.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RememberCheckbox extends StatelessWidget {
  const RememberCheckbox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<CheckboxController>(
      init: CheckboxController(),
      builder: (_) => GestureDetector(
        onTap: () {
          _.isRememberChecked(!_.isRememberChecked.value);
        },
        child: Row(
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Checkbox(
                activeColor: Colors.green,
                checkColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                value: _.isRememberChecked.value,
                onChanged: (val) {
                  _.isRememberChecked(!_.isRememberChecked.value);
                },
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              'Remember me',
              style: GoogleFonts.montserrat(
                color: primaryTextColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DividerText extends StatelessWidget {
  const DividerText({
    Key key,
    this.text,
  }) : super(key: key);
  final text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.white,
            height: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            text,
            style: GoogleFonts.montserrat(
              color: primaryTextColor,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.white,
            height: 1,
          ),
        ),
      ],
    );
  }
}
