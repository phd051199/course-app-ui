import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({this.title, this.menuItemClicked, this.onTap});
  final title, onTap;
  final Function menuItemClicked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
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
      ),
    );
  }
}
