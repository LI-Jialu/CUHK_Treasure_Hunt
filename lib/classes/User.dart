/*
Module to login, logout and register.

Module Name:
Programmer: Hon Tik TSE
Version: 1.0 (10 May 2020)

Contains static fields and methods for login, logout and user registration.
*/

import 'dart:convert';
import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:http/http.dart' as http;

class User {

  //fields

  // indicate whether user is logged in
  static bool loginStatus = false;

  static String studentID = "";
  static String userID = "";


  // methods
  static Future<bool> login(String studentID, String password) async {

    if (studentID == null || password == null || studentID == "" || password == '') {
      return false;
    }

    String path = "/data/login.php";
    // http basic authentication
    String auth = 'Basic ' + base64Encode((utf8.encode(studentID + ":" + password)));
    // construct url
    String url = Database.hostname + path;
    // make http get request
    http.Response response =
        await http.get(url, headers: {'authorization': auth});

    print("user id" + response.body);

    // if login success
    if (response.body != "-1") {

      loginStatus = true;

      User.userID = response.body;
      Database.userIDPW = response.body + ":" + password;
      Database.basicAuth = 'Basic ' + base64Encode(utf8.encode(Database.userIDPW));
      User.studentID = studentID;

      return true;

    } else { // login fail
      print("fail to log in");
      return false;
    }
  }

  // logout
  static void logout() {
    loginStatus = false;
    Database.userIDPW = "";
    Database.basicAuth = "";
  }

  // user registration
  static Future<bool> register(String studentID, String password,
      String username, String college, String year, String dorm) async {

    year = year[5]; // only retain the number from "Year X"
    String url = Database.hostname + "/data/register.php";
    String auth = 'Basic ' + base64Encode((utf8.encode(studentID + ":" + password)));

    // construct http post body
    Map<String, String> query = {
      "username": username,
      "college": college,
      "year": year,
      "dorm": dorm,
    };

    // make http request
    http.Response response = await http.post(url, headers: {'authorization': auth}, body: query);

    print(response.body);

    return response.body[0] == 's';
  }
}
