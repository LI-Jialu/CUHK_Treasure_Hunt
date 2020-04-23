// Define User class

import 'dart:convert';
import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:http/http.dart' as http;

class User {
  static bool loginStatus = false;
  static String studentID = "";

  // methods
  static Future<bool> login(String studentID, String password) async {
    if (studentID == null || password == null) {
      return null;
    }

    String path = "/data/login.php";
    String auth =
        'Basic ' + base64Encode((utf8.encode(studentID + ":" + password)));
    String url = Database.hostname + path;
    http.Response response =
        await http.get(url, headers: {'authorization': auth});

    print("user id" + response.body);
    //print(response.body.length);

    if (response.body != "-1") {
      loginStatus = true;
      //print(User.loginStatus);
      Database.userIDPW = response.body + ":" + password;
      Database.basicAuth =
          'Basic ' + base64Encode(utf8.encode(Database.userIDPW));
      User.studentID = studentID;
      //print(basicAuth);

      return true;
    } else {
      return false;
    }
  }

  static void logout() {
    loginStatus = false;
    Database.userIDPW = "";
    Database.basicAuth = "";
  }

  static Future<bool> register(String studentID, String password,
      String username, String college, String year, String dorm) async {
    String url = Database.hostname + "/data/register.php";
    String auth =
        'Basic ' + base64Encode((utf8.encode(studentID + ":" + password)));

    Map<String, String> query = {
      "username": username,
      "college": college,
      "year": year,
      "dorm": dorm,
    };
    http.Response response =
        await http.post(url, headers: {'authorization': auth}, body: query);

    print(response.body);

    return response.body[0] == 's';
  }
}
