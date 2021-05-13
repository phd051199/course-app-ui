import 'package:course_app/components/profile_appbar.dart';
import 'package:course_app/components/profile_body.dart';
import 'package:course_app/utils/constants.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryBGColor,
        child: Stack(
          children: [
            ProfileAppBar(),
            ProfileBody(),
          ],
        ),
      ),
    );
  }
}
