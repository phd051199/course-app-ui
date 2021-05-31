import 'package:course_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
      child: Container(
        alignment: Alignment.center,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: primaryTextColor,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Icon(
                Icons.search,
                color: Color(0xff2A3447),
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search course',
                  hintStyle: GoogleFonts.getFont(
                    'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
