import 'package:course_app/components/course_list.dart';
import 'package:course_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildAppBar(),
    );
  }

  buildAppBar() {
    return Container(
      color: primaryBGColor,
      child: Stack(
        children: [
          AppBar(
            elevation: 0,
            brightness: Brightness.dark,
            flexibleSpace: Container(
              child: MediaQuery.of(context).orientation == Orientation.portrait
                  ? Image(
                      image: AssetImage('assets/images/bgprofile.png'),
                      fit: BoxFit.fill,
                      colorBlendMode: BlendMode.darken,
                      color: Color(0xfff2A3447).withOpacity(0.5),
                    )
                  : null,
            ),
            backgroundColor: primaryBGColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_rounded),
              onPressed: () => Get.back(),
            ),
            title: Text(
              'Profile',
              style: GoogleFonts.getFont(
                'Montserrat',
                color: primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            centerTitle: false,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 140),
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
                    'Cháu ông dev',
                    style: GoogleFonts.getFont(
                      'Montserrat',
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    '@chauOngDev',
                    style: GoogleFonts.getFont(
                      'Montserrat',
                      color: primaryColor,
                      fontWeight: FontWeight.w300,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Courses Watched',
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
          ),
        ],
      ),
    );
  }
}
