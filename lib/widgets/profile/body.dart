import 'package:course_app/widgets/course/my.dart';
import 'package:course_app/widgets/home/title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key key, this.fullName, this.email}) : super(key: key);
  final fullName, email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 140),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image(
                image: AssetImage('assets/images/avatar.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                fullName,
                style: GoogleFonts.getFont(
                  'Montserrat',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                email,
                style: GoogleFonts.getFont(
                  'Montserrat',
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Divider(
                color: Colors.white,
                height: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 38, left: 25, right: 22),
              child: MainTitle(
                title: 'Courses Watched',
              ),
            ),
            MyCoursesList(),
          ],
        ),
      ),
    );
  }
}
