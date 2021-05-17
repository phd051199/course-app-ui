import 'package:course_app/widgets/home_body.dart';
import 'package:course_app/widgets/menu/menu.dart';
import 'package:course_app/widgets/search_field.dart';
import 'package:course_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
            color: Colors.white,
            fontWeight: FontWeight.w600,
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
