import 'package:course_app/services/auth.dart';
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

bool isUserInvalid = true;
bool isFullnameInvalid = true;
bool isEmailInvalid = true;
bool isPwdInvalid = true;
bool isRPwdInvalid = true;
TextEditingController usernameInputController = new TextEditingController();
TextEditingController fullnameInputController = new TextEditingController();
TextEditingController passwordInputController = new TextEditingController();
TextEditingController emailInputController = new TextEditingController();
TextEditingController retypePasswordInputController =
    new TextEditingController();
String usernameInvalidMsg;
String pwdInvalidMsg;

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
                    text.length > 5 && validCharacters.hasMatch(text)
                        ? isUserInvalid = false
                        : isUserInvalid = true;
                  });
                },
              ),
              AuthInput(
                inputController: fullnameInputController,
                label: 'Full Name',
                isInvalid: isFullnameInvalid,
                onChanged: (text) {
                  setState(() {
                    text.length > 5
                        ? isFullnameInvalid = false
                        : isFullnameInvalid = true;
                  });
                },
              ),
              AuthInput(
                inputController: emailInputController,
                label: 'Your Email',
                isInvalid: isEmailInvalid,
                onChanged: (text) {
                  setState(() {
                    text.length > 1 &&
                            
                                validEmail.hasMatch(text)
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
                    text.length > 5 && validCharacters.hasMatch(text)
                        ? isPwdInvalid = false
                        : isPwdInvalid = true;
                  });
                },
              ),
              AuthInput(
                inputController: retypePasswordInputController,
                label: 'Retyped Password',
                isPwdField: true,
                isInvalid: isRPwdInvalid,
                onChanged: (text) {
                  setState(
                    () {
                      retypePasswordInputController.text ==
                              passwordInputController.text
                          ? isRPwdInvalid = false
                          : isRPwdInvalid = true;
                    },
                  );
                },
              ),
              SizedBox(
                height: 40,
              ),
              AuthButton(
                btnLabel: 'Sign Up',
                onPressed: clickRegister,
                btnColor: Colors.orangeAccent,
                textColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void clickRegister() {
    setState(
      () {
        AuthServices.register();
      },
    );
  }
}
