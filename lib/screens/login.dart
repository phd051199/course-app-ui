import 'package:course_app/controllers/checkbox.dart';
import 'package:course_app/screens/forgotpwd.dart';
import 'package:course_app/screens/home.dart';
import 'package:course_app/screens/register.dart';
import 'package:course_app/utils/constants.dart';
import 'package:course_app/widgets/login/button.dart';
import 'package:course_app/widgets/login/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
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
                'Sign In',
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
                    'Don’t have an account? ',
                    style: GoogleFonts.getFont(
                      'Montserrat',
                      color: primaryTextColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => RegisterScreen()),
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
                label: 'Your Email / Username',
              ),
              AuthInput(
                label: 'Password',
              ),
              SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GetX<CheckboxController>(
                    init: CheckboxController(),
                    builder: (_) => GestureDetector(
                      onTap: () {
                        _.isChecked();
                      },
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              right: 10,
                            ),
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
                                _.isChecked();
                              },
                            ),
                          ),
                          Text(
                            'Remember me',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              color: primaryTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => ForgotPasswordScreen()),
                    child: Text(
                      'Forgot password?',
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
                height: 42,
              ),
              AuthButton(
                btnLabel: 'Sign In',
                onPressed: () => Get.offAll(() => HomeScreen()),
                btnColor: Colors.orangeAccent,
                textColor: Colors.black,
              ),
              SizedBox(
                height: 26,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                        child: Divider(
                          color: Colors.white,
                          height: 1,
                        )),
                  ),
                  Text(
                    'or continue with',
                    style: GoogleFonts.getFont(
                      'Montserrat',
                      color: primaryTextColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                        child: Divider(
                          color: Colors.white,
                          height: 1,
                        )),
                  ),
                ],
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
                icon: Container(
                  child: Image(
                    height: 18,
                    width: 24,
                    image: AssetImage('assets/images/gg.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
