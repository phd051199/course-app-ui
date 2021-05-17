import 'package:course_app/widgets/course/all_courses.dart';
import 'package:course_app/widgets/course/my_courses.dart';
import 'package:course_app/widgets/main_title.dart';
import 'package:course_app/utils/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryBGColor,
      child: ListView(
        children: [
          Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(22, 33, 25, 0),
                      child: MainTitle(
                        title: 'My courses',
                      ),
                    ),
                    MyCoursesList(),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 38, left: 25, right: 22),
                      child: MainTitle(
                        title: 'Courses',
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
