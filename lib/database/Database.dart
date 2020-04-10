// define the class to acquire data from database

import 'dart:convert';
import 'package:cuhk_treasure_hunt/classes/User.dart';
import 'package:cuhk_treasure_hunt/classes/UserProfile.dart';
import 'package:cuhk_treasure_hunt/classes/UserReputation.dart';
import 'package:http/http.dart' as http;

class Database {

  static String hostname = "http://ec2-3-80-187-207.compute-1.amazonaws.com";
  static String userIDPW;
  static String basicAuth;

  // methods
  static Future<bool> login(String studentID, String password) async {

    if (studentID == null || password == null){
      return null;
    }

    String path = "/data/login.php";
    String auth = 'Basic ' + base64Encode((utf8.encode(studentID+":"+password)));

    String url = hostname + path;
    http.Response response = await http.get(url,headers: {'authorization':auth});

    print(response.body);
    print(response.body.length);

    if (response.body != "-1"){
      User.loginStatus = true;
      //print(User.loginStatus);
      userIDPW = response.body+":"+password;
      basicAuth = 'Basic '+base64Encode(utf8.encode(userIDPW));
      //print(basicAuth);

      return true;
    }
    else {
      return false;
    }

  }

  static Future<http.Response> get(String path, String query) async {

    String url = hostname + path + query;
    http.Response response =  await http.get(url, headers: {'authorization':basicAuth});

    if (response.statusCode == 200){
      return response;
    }
    else {
      return null;
    }

  }

  static Future<http.Response> post(String path, Map<String,String> query) async {

    String url =  hostname + path;
    print(url);
    http.Response response = await http.post(url,headers: {'authorization':basicAuth},body: query);

    print(response.body);
  }

  static void test()async{
    String url = "http://ec2-3-80-187-207.compute-1.amazonaws.com/data/test.php";
    String uspw = 'god:god';
    String basicAuth = 'Basic '+base64Encode(utf8.encode(uspw));
    http.Response response = await http.get(url,headers: {'authorization':basicAuth});

    print(response.body);

  }


}