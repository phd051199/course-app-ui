import 'package:course_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthInput extends StatelessWidget {
  const AuthInput({
    Key key,
    this.label,
  }) : super(key: key);
  final label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.getFont(
            'Montserrat',
            color: primaryTextColor,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffEBEBEB),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff6FD181),
            ),
          ),
        ),
        style: GoogleFonts.getFont(
          'Montserrat',
          color: primaryTextColor,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        cursorColor: primaryTextColor,
      ),
    );
  }
}
