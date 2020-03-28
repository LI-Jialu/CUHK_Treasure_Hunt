// define the class to acquire data from database

import 'dart:convert';
import 'package:cuhk_treasure_hunt/classes/User.dart';
import 'package:cuhk_treasure_hunt/classes/UserProfile.dart';
import 'package:cuhk_treasure_hunt/classes/UserReputation.dart';
import 'package:http/http.dart' as http;

class Database {

  static String hostname = "http://ec2-3-80-187-207.compute-1.amazonaws.com";

  // methods
  static Future<User> login(String email, String password) async {

    if (email == null || password == null){
      return null;
    }

    String path = "/data/login.php";
    String query = "?email=" + email + "&password=" + password;

    print("send request");

    http.Response response = await get(path,query);

    if (response == null){
      print("Connection failed");
      return null;
    }

    print("response received");

    Map<String, dynamic> result = json.decode(response.body);

    if (result['user_id'] == -1){
      return User(loginStatus: false);
    }
    else {

      UserProfile userProfile = UserProfile.fromJson(result);
      UserReputation userReputation = UserReputation.fromJson(result);

      User user = User(
        loginStatus: true,
        userProfile: userProfile,
        userReputation: userReputation
      );

      return user;
    }
  }

  static Future<http.Response> get(String path, String query) async {

    String url = hostname + path + query;
    http.Response response =  await http.get(url);

    if (response.statusCode == 200){
      return response;
    }
    else {
      return null;
    }

  }


}