import 'package:course_app/controllers/auth/login.dart';
import 'package:course_app/models/course.dart';
import 'package:course_app/utils/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CourseServices {
  static final client = http.Client();
  static final LoginController loginController = Get.put(LoginController());
  static final headers = {
    'Authorization': 'Bearer ${loginController.jwt.value}'
  };

  static Future<List<Course>> fetchCourses() async {
    final response = await client.get(
      Uri.parse('$apiURL/courses'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final jsonString = response.body;
      return courseFromJson(jsonString);
    } else {
      return [];
    }
  }

  static Future<List<Course>> fetchMyCourses() async {
    final response = await client.get(
      Uri.parse('$apiURL/mycourses'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final jsonString = response.body;
      return courseFromJson(jsonString);
    } else {
      return [];
    }
  }
}
