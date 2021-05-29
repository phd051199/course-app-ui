import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({this.title, this.menuItemClicked});
  final String title;
  final Function menuItemClicked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: ListTile(
        onTap: menuItemClicked,
        horizontalTitleGap: 0.0,
        title: Text(
          title,
          style: GoogleFonts.getFont(
            'Montserrat',
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
