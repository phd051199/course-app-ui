import 'package:course_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.getFont(
            'Montserrat',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: primaryColor,
          ),
        ),
        Text(
          'View all',
          style: GoogleFonts.getFont(
            'Montserrat',
            fontSize: 16,
            color: Color(0xffFFB347),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
