import 'dart:convert';

import 'package:course_app/controllers/auth/login.dart';
import 'package:course_app/models/login.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  static final client = http.Client();
  static LoginController loginController = Get.put(LoginController());

  static register(uname, fname, email, password, onSuccess, onError) async {
    final response = await client.post(
      Uri.parse('https://api.phamduy.host/register'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        {
          "username": "$uname",
          "password": "$password",
          "email": "$email",
          "fullName": "$fname"
        },
      ),
    );
    final jsonString = loginFromJson(response.body);
    final res = jsonString;
    if (response.statusCode == 201) {
      onSuccess();
    } else {
      onError(res.message);
    }
  }

  static login(username, password, onSuccess, onError) async {
    final response = await client.post(
        Uri.parse('https://api.phamduy.host/login'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"username": "$username", "password": "$password"}));
    final jsonString = loginFromJson(response.body);
    final res = jsonString;
    if (response.statusCode == 201) {
      loginController.currentUser(
        jsonDecode(
          ascii.decode(
            base64.decode(
              base64.normalize(res.token.split(".")[1]),
            ),
          ),
        )['fname'],
      );
      loginController.jwt(res.token);
      await onSuccess(res.message);
    } else {
      onError(res.message);
    }
  }
}
