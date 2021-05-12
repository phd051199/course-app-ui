import 'package:course_app/components/course_list.dart';
import 'package:course_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryBGColor,
      child: ListView(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 22, right: 27),
                child: Container(
                  alignment: Alignment.center,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffFFF1DC)),
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
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 107, left: 25, right: 22),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'My Courses',
                              style: GoogleFonts.getFont(
                                'Montserrat',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: primaryColor,
                              ),
                            ),
                            Text(
                              'View all',
                              style: GoogleFonts.getFont(
                                'Montserrat',
                                fontSize: 16,
                                color: Color(0xffFFB347),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ]),
                    ),
                    CoursesList(),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 38, left: 25, right: 22),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Courses',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: primaryColor,
                            ),
                          ),
                          Text(
                            'View all',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              fontSize: 16,
                              color: Color(0xffFFB347),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CoursesList(),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
