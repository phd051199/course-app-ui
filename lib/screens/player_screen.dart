import 'package:course_app/components/home_appbar.dart';
import 'package:course_app/components/menu.dart';
import 'package:course_app/utils/constants.dart';
import 'package:flutter/material.dart';

class PlayerScreen extends StatefulWidget {
  PlayerScreen({Key key}) : super(key: key);

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

var scaffoldKey = new GlobalKey<ScaffoldState>();

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: MenuDrawer(),
      appBar: HomeAppBar(
        onPressed: () => scaffoldKey.currentState.openDrawer(),
      ),
      body: Container(
        color: primaryBGColor,
      ),
    );
  }
}
