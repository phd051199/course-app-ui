import 'package:course_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: primaryBGColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 79, left: 24),
              child: Text(
                'Menu',
                style: GoogleFonts.getFont(
                  'Montserrat',
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffFDF1DE),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22, left: 24),
              child: Text(
                'Home',
                style: GoogleFonts.getFont(
                  'Montserrat',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
