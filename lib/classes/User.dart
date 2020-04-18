// Define User class

import 'dart:convert';
import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:http/http.dart' as http;

class User{

  static bool loginStatus =false;

  // methods
  static Future<bool> login(String studentID, String password) async {

    if (studentID == null || password == null){
      return null;
    }

    String path = "/data/login.php";
    String auth = 'Basic ' + base64Encode((utf8.encode(studentID+":"+password)));

    String url = Database.hostname + path;
    http.Response response = await http.get(url,headers: {'authorization':auth});

    print("user id"+response.body);
    //print(response.body.length);

    if (response.body != "-1"){
      loginStatus = true;
      //print(User.loginStatus);
      Database.userIDPW = response.body+":"+password;
      Database.basicAuth = 'Basic '+base64Encode(utf8.encode(Database.userIDPW));
      //print(basicAuth);

      return true;
    }
    else {
      return false;
    }

  }

  static void logout(){

    loginStatus = false;
    Database.userIDPW = "";
    Database.basicAuth = "";

  }

}