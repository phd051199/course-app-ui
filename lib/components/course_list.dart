import 'package:course_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoursesList extends StatelessWidget {
  const CoursesList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 17),
      child: SingleChildScrollView(
        child: SizedBox(
          height: 340,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              card(Color(0xfffFFAC71), Color(0xfffFF8450),
                  'Finding Co-Founder in early days', 'Ankur Warikoo'),
              card(Color(0xfff02AAB0), Color(0xfff00CDAC),
                  'Finding Co-Founder in early days', 'Warikoo Ankur'),
              card(Color(0xfffFFAC71), Color(0xfffFF8450),
                  'Finding Co-Founder in early days', 'Ankur Warikoo'),
              card(Color(0xfff02AAB0), Color(0xfff00CDAC),
                  'Finding Co-Founder in early days', 'Warikoo Ankur'),
            ],
          ),
        ),
      ),
    );
  }

  card(color1, color2, title, author) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Card(
        color: primaryBGColor,
        elevation: 0,
        child: Container(
          width: 261,
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: primaryBGColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: color2.withOpacity(0.5),
                offset: Offset(0, 3),
              )
            ], // Make rounded corner of border
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color1, color2],
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image(
                  image: AssetImage('assets/images/play.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image(
                    image: AssetImage('assets/images/avator.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 170, left: 12, right: 12),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: GoogleFonts.getFont(
                      'Montserrat',
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 12),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage('assets/images/small1.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          author,
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
