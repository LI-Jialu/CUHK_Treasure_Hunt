// define the class to acquire data from database

import 'dart:convert';
import 'package:http/http.dart' as http;

class Database {

  static String hostname = "http://ec2-3-80-187-207.compute-1.amazonaws.com";
  static String userIDPW;
  static String basicAuth;

  // methods

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

  static Future<bool> post(String path, Map<String,String> query) async {

    String url =  hostname + path;
    print(url);
    http.Response response = await http.post(url,headers: {'authorization':basicAuth},body: query);

    print(response.body);
    print(response.body[0] == 's');

    return response.body[0] == 's';
  }

  static void test()async{
    String url = "http://ec2-3-80-187-207.compute-1.amazonaws.com/data/test.php";
    String uspw = 'god:god';
    String basicAuth = 'Basic '+base64Encode(utf8.encode(uspw));
    http.Response response = await http.get(url,headers: {'authorization':basicAuth});

    print(response.body);

  }


}