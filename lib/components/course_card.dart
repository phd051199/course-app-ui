import 'package:course_app/screens/player_screen.dart';
import 'package:course_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    Key key,
    this.title,
    this.author,
    this.firstColor,
    this.secondColor,
  }) : super(key: key);

  final String title, author;
  final Color firstColor, secondColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () => Get.to(() => PlayerScreen()),
          child: Card(
            color: primaryBGColor,
            elevation: 0,
            child: Container(
              width: 261,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: primaryBGColor,
                borderRadius: BorderRadius.circular(12),
                // boxShadow: [
                //   BoxShadow(
                //     blurRadius: 5,
                //     color: secondColor.withOpacity(0.1),
                //     offset: Offset(0, 3),
                //   )
                // ], // Make rounded corner of border
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    firstColor,
                    secondColor,
                  ],
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
                    padding:
                        const EdgeInsets.only(top: 170, left: 12, right: 12),
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
        ),
      ),
    );
  }
}