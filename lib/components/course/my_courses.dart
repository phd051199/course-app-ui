import 'package:course_app/components/course/course_card.dart';
import 'package:course_app/controllers/course/my_courses.dart';
import 'package:course_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCoursesList extends StatelessWidget {
  final MyCourseController courseController = Get.put(
    MyCourseController(),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 17),
      child: SingleChildScrollView(
        child: Obx(
          () => SizedBox(
            height: 330,
            child: courseController.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(secondaryColor),
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: courseController.courseList.length,
                    itemBuilder: (context, index) =>
                        CourseCard(courseController.courseList[index]),
                  ),
          ),
        ),
      ),
    );
  }
}
