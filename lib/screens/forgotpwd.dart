import 'package:course_app/utils/constants.dart';
import 'package:course_app/utils/validation.dart';
import 'package:course_app/widgets/login/button.dart';
import 'package:course_app/widgets/login/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

bool isEmailInvalid = true;

TextEditingController emailInputController = new TextEditingController();

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
                'Forgot Password?',
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
              Text(
                'Enter the email address associated with your account.',
                style: GoogleFonts.getFont(
                  'Montserrat',
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: AuthInput(
                  inputController: emailInputController,
                  label: 'Your Email',
                  isInvalid: isEmailInvalid,
                  onChanged: (text) {
                    setState(() {
                      Validation.validateEmail(text)
                          ? isEmailInvalid = false
                          : isEmailInvalid = true;
                    });
                  },
                ),
              ),
              AuthButton(
                btnLabel: 'Submit',
                onPressed: () => Get.back(),
                btnColor: Colors.orangeAccent,
                textColor: Colors.black,
              ),
              SizedBox(
                height: 24,
              ),
              AuthButton(
                btnLabel: 'Sign in',
                onPressed: () => Get.back(),
                btnColor: Color(0xff444444),
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
