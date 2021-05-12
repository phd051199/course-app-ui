import 'package:course_app/components/body.dart';
import 'package:course_app/components/menu.dart';
import 'package:course_app/screens/profile_screen.dart';
import 'package:course_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

var scaffoldKey = new GlobalKey<ScaffoldState>();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: MenuDrawer(),
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: primaryBGColor,
      brightness: Brightness.dark,
      leading: IconButton(
        icon: Image(
          image: AssetImage('assets/images/menu.png'),
        ),
        onPressed: () {
          scaffoldKey.currentState.openDrawer();
        },
      ),
      title: Text(
        'Hi, cháu ông dev 👋',
        style: GoogleFonts.getFont(
          'Montserrat',
          color: primaryColor,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      centerTitle: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: GestureDetector(
            onTap: () => Get.to(() => ProfileScreen()),
            child: Image(
              image: AssetImage('assets/images/avatar.png'),
              height: 50,
              width: 50,
            ),
          ),
        ),
      ],
    );
  }
}
