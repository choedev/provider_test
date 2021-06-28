import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:provider_test/apis/model/user.dart';

class ApiUser {
  Future<User> getUser() async {
    // var url = Uri.parse('http://localhost:3000/user');
    // final response = await http.get(url);
    // if (response.statusCode == 200) {
    //   return Future.value(User.fromJson(json.decode(response.body)));
    // } else {
    //   throw Exception('Failed to load ${response.statusCode}');
    // }
    return await Future.delayed(const Duration(milliseconds: 1000), () {
      return User(
          "william",
          Random().nextInt(40) + 1,
          "https://img-cdn.ddanzi.com/ddfile/201605-images/98139432.jpg"
      );
    });
  }
}
