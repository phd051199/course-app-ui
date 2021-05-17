import 'package:course_app/widgets/course/course_card.dart';
import 'package:course_app/controllers/course/my_courses.dart';
import 'package:course_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCoursesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 17),
      child: SingleChildScrollView(
        child: GetX<MyCourseController>(
          init: MyCourseController(),
          builder: (_) => SizedBox(
            height: 330,
            child: _.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(secondaryColor),
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _.courseList.length,
                    itemBuilder: (context, index) =>
                        CourseCard(_.courseList[index]),
                  ),
          ),
        ),
      ),
    );
  }
}
