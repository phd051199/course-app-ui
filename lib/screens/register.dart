import 'package:course_app/screens/success.dart';
import 'package:course_app/services/auth.dart';
import 'package:course_app/utils/constants.dart';
import 'package:course_app/utils/validation.dart';
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
bool btnEnabled = false;
bool isLoading = false;
TextEditingController usernameInputController = TextEditingController();
TextEditingController fullnameInputController = TextEditingController();
TextEditingController passwordInputController = TextEditingController();
TextEditingController emailInputController = TextEditingController();
TextEditingController retypePasswordInputController = TextEditingController();
String usernameInvalidMsg;
String emailInvalidMsg;

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
                errorText: isUserInvalid ? usernameInvalidMsg : null,
                isInvalid: isUserInvalid,
                onChanged: (text) {
                  setState(
                    () {
                      if (Validation.validateUsername(text)) {
                        isUserInvalid = false;
                        checkAll();
                      } else {
                        isUserInvalid = true;
                        btnEnabled = false;
                      }
                    },
                  );
                },
              ),
              AuthInput(
                inputController: fullnameInputController,
                label: 'Full Name',
                isInvalid: isFullnameInvalid,
                onChanged: (text) {
                  setState(
                    () {
                      if (text.length > 5) {
                        isFullnameInvalid = false;
                        checkAll();
                      } else {
                        isFullnameInvalid = true;
                        btnEnabled = false;
                      }
                    },
                  );
                },
              ),
              AuthInput(
                inputController: emailInputController,
                label: 'Your Email',
                errorText: isEmailInvalid ? emailInvalidMsg : null,
                isInvalid: isEmailInvalid,
                onChanged: (text) {
                  setState(
                    () {
                      if (Validation.validateEmail(text)) {
                        isEmailInvalid = false;
                        checkAll();
                      } else {
                        isEmailInvalid = true;
                        btnEnabled = false;
                      }
                    },
                  );
                },
              ),
              AuthInput(
                inputController: passwordInputController,
                label: 'Password',
                isPwdField: true,
                isInvalid: isPwdInvalid,
                onChanged: (text) {
                  setState(
                    () {
                      if (Validation.validatePassword(text)) {
                        isPwdInvalid = false;
                        checkAll();
                      } else {
                        isPwdInvalid = true;
                        btnEnabled = false;
                      }
                      if (retypePasswordInputController.text ==
                          passwordInputController.text) {
                        isRPwdInvalid = false;
                        checkAll();
                      } else {
                        isRPwdInvalid = true;
                        btnEnabled = false;
                      }
                    },
                  );
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
                      if (retypePasswordInputController.text ==
                          passwordInputController.text) {
                        isRPwdInvalid = false;
                        checkAll();
                      } else {
                        isRPwdInvalid = true;
                        btnEnabled = false;
                      }
                    },
                  );
                },
              ),
              SizedBox(
                height: 40,
              ),
              AuthButton(
                icon: isLoading
                    ? SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : null,
                btnLabel: isLoading ? '' : 'Sign Up',
                onPressed: btnEnabled ? clickRegister : null,
                btnColor: Colors.orangeAccent,
                textColor: btnEnabled ? Colors.black : Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSuccess() {
    isLoading = false;
    Get.offAll(() => SuccessScreen());
  }

  void onError(msg) {
    setState(
      () {
        isLoading = false;
        if (msg == 'User Already Exists') {
          isUserInvalid = true;
          usernameInvalidMsg = 'user already exists';
          btnEnabled = false;
          isLoading = false;
        } else {
          isEmailInvalid = true;
          btnEnabled = false;
          emailInvalidMsg = 'this field must be an email';
          isLoading = false;
        }
      },
    );
  }

  void checkAll() {
    setState(
      () {
        !isUserInvalid &&
                !isFullnameInvalid &&
                !isEmailInvalid &&
                !isPwdInvalid &&
                !isRPwdInvalid
            ? btnEnabled = true
            : btnEnabled = false;
      },
    );
  }

  void clickRegister() {
    setState(
      () {
        btnEnabled = false;
        isLoading = true;
        AuthServices.register(
          usernameInputController.text,
          fullnameInputController.text,
          emailInputController.text,
          passwordInputController.text,
          onSuccess,
          onError,
        );
      },
    );
  }
}
