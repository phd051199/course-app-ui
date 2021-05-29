import 'package:course_app/models/course.dart';
import 'package:course_app/services/remote.dart';
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
      final courses = await RemoteServices.fetchCourses();
      if (courses != null) {
        courseList.value = courses;
      }
    } finally {
      isLoading(false);
    }
  }
}
