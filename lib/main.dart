import 'package:course_app/screens/login.dart';
import 'package:course_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(CourseApp());
}

class CourseApp extends StatelessWidget {
  const CourseApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        unselectedWidgetColor: primaryTextColor,
        scaffoldBackgroundColor: primaryBGColor,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: primaryBGColor,
        ),
      ),
      home: LoginScreen(),
    );
  }
}
