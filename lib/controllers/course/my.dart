import 'package:course_app/models/course.dart';
import 'package:course_app/services/course.dart';
import 'package:get/get.dart';

class MyCourseController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<Course> courseList = List<Course>.empty().obs;

  @override
  void onInit() {
    fetchMyCourses();
    super.onInit();
  }

  void fetchMyCourses() async {
    try {
      isLoading(true);
      final courses = await CourseServices.fetchMyCourses();
      courseList.value = courses;
    } finally {
      isLoading(false);
    }
  }
}
