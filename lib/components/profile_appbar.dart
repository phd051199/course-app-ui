import 'package:course_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      brightness: Brightness.dark,
      flexibleSpace: Container(
        child: MediaQuery.of(context).orientation == Orientation.portrait
            ? Image(
                image: AssetImage('assets/images/bgprofile.png'),
                fit: BoxFit.fill,
                colorBlendMode: BlendMode.darken,
                color: Color(0xfff2A3447).withOpacity(0.5),
              )
            : null,
      ),
      backgroundColor: primaryBGColor,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () => Get.back(),
        ),
      ),
      title: Text(
        'Profile',
        style: GoogleFonts.getFont(
          'Montserrat',
          color: primaryColor,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      centerTitle: false,
    );
  }
}
