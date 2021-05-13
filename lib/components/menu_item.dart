import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key key,
    this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: ListTile(
        onTap: () {},
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
