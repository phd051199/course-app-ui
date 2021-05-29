import 'package:course_app/screens/home.dart';
import 'package:course_app/utils/constants.dart';
import 'package:course_app/widgets/login/button.dart';
import 'package:course_app/widgets/login/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

String btnSignUpLabel = 'Sign Up';
bool isUserInvalid = true;
bool isEmailInvalid = true;
bool isPwdInvalid = true;
bool isRPwdInvalid = true;
TextEditingController usernameInputController = new TextEditingController();
TextEditingController passwordInputController = new TextEditingController();
TextEditingController emailInputController = new TextEditingController();
TextEditingController retypePasswordInputController =
    new TextEditingController();

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign Up',
                style: GoogleFonts.getFont(
                  'Montserrat',
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
                    style: GoogleFonts.getFont(
                      'Montserrat',
                      color: primaryTextColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Text(
                      'Click here',
                      style: GoogleFonts.getFont(
                        'Montserrat',
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
                isInvalid: isUserInvalid,
                onChanged: (text) {
                  setState(() {
                    btnSignUpLabel = 'Sign Up';
                    text.length < 1
                        ? isUserInvalid = true
                        : isUserInvalid = false;
                  });
                },
              ),
              AuthInput(
                inputController: emailInputController,
                label: 'Your Email',
                isInvalid: isEmailInvalid,
                onChanged: (text) {
                  setState(() {
                    btnSignUpLabel = 'Sign Up';
                    text.length > 1 &&
                            RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(text)
                        ? isEmailInvalid = false
                        : isEmailInvalid = true;
                  });
                },
              ),
              AuthInput(
                inputController: passwordInputController,
                label: 'Password',
                isPwdField: true,
                isInvalid: isPwdInvalid,
                onChanged: (text) {
                  setState(() {
                    btnSignUpLabel = 'Sign Up';
                    text.length < 6
                        ? isPwdInvalid = true
                        : isPwdInvalid = false;
                  });
                },
              ),
              AuthInput(
                inputController: retypePasswordInputController,
                label: 'Retyped Password',
                isPwdField: true,
                isInvalid: isRPwdInvalid,
                onChanged: (text) {
                  setState(() {
                    btnSignUpLabel = 'Sign Up';
                    retypePasswordInputController.text !=
                            passwordInputController.text
                        ? isRPwdInvalid = true
                        : isRPwdInvalid = false;
                  });
                },
              ),
              SizedBox(
                height: 40,
              ),
              AuthButton(
                btnLabel: btnSignUpLabel,
                onPressed: () {
                  setState(() {
                    !isUserInvalid &&
                            !isPwdInvalid &&
                            !isEmailInvalid &&
                            !isRPwdInvalid
                        ? Get.offAll(() => HomeScreen())
                        : btnSignUpLabel = 'Nhập sai bét kìa ?';
                  });
                },
                btnColor: Colors.orangeAccent,
                textColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
