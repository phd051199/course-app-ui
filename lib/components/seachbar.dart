import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 22, right: 27),
      child: Container(
        alignment: Alignment.center,
        height: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Color(0xffFFF1DC)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Icon(
                Icons.search,
                color: Color(0xfff2A3447),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 24,
                  bottom: 4,
                  left: 20,
                ),
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
            ),
          ],
        ),
      ),
    );
  }
}
