import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthServices {
  Future<dynamic> registerUser({
    required String email,
    required String password,
    required String username,
  }) async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:3000/api/v1/auth/register');
    var body = {
      "username": "$username",
      "email": "$email",
      "password": "$password"
    };
    // print(body);

    var response = await client.post(uri,
        headers: {"Content-Type": "application/json"}, body: jsonEncode(body));
    // print(response.toString());
    if (response.statusCode == 200) {
      var json = response.body;
      // print(json);
      return json;
    }
    return null;
  }

  Future<dynamic> loginUser({
    required String email,
    required String password,
  }) async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:3000/api/v1/auth/login');
    var body = {"email": "$email", "password": "$password"};
    var response = await client.post(uri,
        headers: {"Content-Type": "application/json"}, body: jsonEncode(body));
    if (response.statusCode == 200) {
      var json = response.body;
      return jsonDecode(json);
    }
    return null;
  }
}
