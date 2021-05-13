import 'package:course_app/screens/profile_screen.dart';
import 'package:course_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key key,
    this.onPressed,
  }) : super(key: key);
  final Function onPressed;
  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: primaryBGColor,
      brightness: Brightness.dark,
      leading: IconButton(
        icon: Image(
          image: AssetImage('assets/images/menu.png'),
        ),
        onPressed: onPressed,
      ),
      title: Text(
        'Hi, cháu ông dev 👋',
        style: GoogleFonts.getFont(
          'Montserrat',
          color: primaryColor,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      centerTitle: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: GestureDetector(
            onTap: () => Get.to(() => ProfileScreen()),
            child: Image(
              image: AssetImage('assets/images/avatar.png'),
              height: 50,
              width: 50,
            ),
          ),
        ),
      ],
    );
  }
}
