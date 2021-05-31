import 'package:course_app/widgets/profile/appbar.dart';
import 'package:course_app/widgets/profile/body.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
    required this.fullName,
  }) : super(key: key);
  final String fullName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ProfileAppBar(),
          ProfileBody(
            fullName: fullName,
            email: '@chauOngDev',
          ),
        ],
      ),
    );
  }
}
