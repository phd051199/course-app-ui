import 'package:course_app/models/course.dart';
import 'package:course_app/services/course.dart';
import 'package:get/get.dart';

class CourseController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<Course> courseList = List<Course>.empty().obs;

  @override
  void onInit() {
    fetchCourses();
    super.onInit();
  }

  void fetchCourses() async {
    try {
      isLoading(true);
      final courses = await CourseServices.fetchCourses();
      courseList.value = courses;
    } finally {
      isLoading(false);
    }
  }
}
