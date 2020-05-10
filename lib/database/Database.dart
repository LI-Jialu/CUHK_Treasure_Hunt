/*
Module to communicate with server

Module Name: Database
Programmer: Hon Tik TSE
Version: 1.0 (10 May 2020)

Contains static fields and methods for sending requests to the server.
*/

import 'package:http/http.dart' as http;

class Database {

  // fields
  static String hostname = "http://ec2-3-80-187-207.compute-1.amazonaws.com";
  static String userIDPW;
  static String basicAuth;

  // methods
  // http get request
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

  // http post request
  static Future<bool> post(String path, Map<String,String> query) async {

    String url =  hostname + path;
    print(url);
    http.Response response = await http.post(url,headers: {'authorization':basicAuth},body: query);

    return response.body[0] == 's';
  }


}