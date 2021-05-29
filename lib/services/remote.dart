import 'package:course_app/models/course.dart';
import 'package:course_app/utils/constants.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static final client = http.Client();

  static Future<List<Course>> fetchCourses() async {
    final response = await client.get(
      Uri.parse('$apiURL/courses'),
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
    );
    if (response.statusCode == 200) {
      final jsonString = response.body;
      return courseFromJson(jsonString);
    } else {
      return [];
    }
  }
}
