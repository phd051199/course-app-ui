import 'package:course_app/controllers/course/all.dart';
import 'package:course_app/controllers/course/my.dart';
import 'package:course_app/utils/constants.dart';
import 'package:course_app/widgets/course/all.dart';
import 'package:course_app/widgets/course/my.dart';
import 'package:course_app/widgets/home/title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CourseController courseController = Get.put(CourseController());
    final MyCourseController myCourseController = Get.put(MyCourseController());

    return RefreshIndicator(
      color: secondaryBGColor,
      onRefresh: () async {
        await Future.delayed(Duration(milliseconds: 800));
        courseController.fetchCourses();
        myCourseController.fetchMyCourses();
      },
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
