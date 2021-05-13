import 'package:course_app/components/course_list.dart';
import 'package:course_app/components/main_title.dart';
import 'package:course_app/components/seachbar.dart';
import 'package:course_app/utils/constants.dart';
import 'package:flutter/material.dart';

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
              SearchBar(),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(22, 107, 25, 0),
                      child: MainTitle(
                        title: 'My course',
                      ),
                    ),
                    CoursesList(),
                    Padding(
                        padding:
                            const EdgeInsets.only(top: 38, left: 25, right: 22),
                        child: MainTitle(
                          title: 'Courses',
                        )),
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
