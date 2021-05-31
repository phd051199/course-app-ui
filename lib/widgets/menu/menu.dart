import 'package:course_app/screens/login.dart';
import 'package:course_app/widgets/menu/item.dart';
import 'package:course_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: primaryBGColor,
        child: ListView(
          children: [
            ListTile(
              horizontalTitleGap: 0.0,
              title: Text(
                'Menu',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: primaryTextColor,
                ),
              ),
            ),
            SizedBox(height: 24),
            DrawerListTile(
              title: 'Home',
              onTap: () {},
            ),
            DrawerListTile(
              title: 'My Courses',
              onTap: () {},
            ),
            DrawerListTile(
              title: 'Setting',
              onTap: () {},
            ),
            DrawerListTile(
              title: 'Sign out',
              onTap: () => Get.offAll(() => LoginScreen()),
            ),
          ],
        ),
      ),
    );
  }
}
