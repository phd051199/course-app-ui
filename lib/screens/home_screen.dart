import 'package:course_app/components/home_body.dart';
import 'package:course_app/components/menu.dart';
import 'package:course_app/components/search_field.dart';
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

GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: MenuDrawer(),
      appBar: AppBar(
        leading: IconButton(
          icon: Image(
            image: AssetImage('assets/images/menu.png'),
          ),
          onPressed: () => scaffoldKey.currentState.openDrawer(),
        ),
        title: Text(
          'Hi, cháu ông dev 👋',
          style: GoogleFonts.getFont(
            'Montserrat',
            color: primaryColor,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: SearchBar(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: InkWell(
              onTap: () => Get.to(
                () => ProfileScreen(),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                ),
                child: Image(
                  image: AssetImage('assets/images/avatar.png'),
                  height: 50,
                  width: 50,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Body(),
    );
  }
}
