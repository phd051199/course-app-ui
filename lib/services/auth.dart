import 'dart:convert';

import 'package:course_app/controllers/auth.dart';
import 'package:course_app/models/login.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  static final client = http.Client();
  static AuthController authController = Get.put(AuthController());

  static register() async {
    await client.post(
      Uri.parse('https://api.phamduy.host/register'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        {
          "username": "duy",
          "password": "111111",
          "email": "duy@gmail.com",
          "fullName": "Pham Duy"
        },
      ),
    );
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
      authController.setUser(
        jsonDecode(
          ascii.decode(
            base64.decode(
              base64.normalize(res.token.split(".")[1]),
            ),
          ),
        )['fname'],
      );
      authController.setToken(res.token);
      await onSuccess(res.message);
    } else {
      onError(res.message);
    }
  }
}
