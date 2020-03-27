// define the class to acquire data from database

import 'package:http/http.dart' as http;

class Database {

  static String hostname = "http://ec2-3-80-187-207.compute-1.amazonaws.com";

  // methods
  static Future<bool> login(String email, String password) async {

    String path = "/data/login.php";

    String query = "?email=" + email + "&password=" + password;

    String url = hostname + path + query;

    var response = await http.get(url);

    print(response.body);

    if (response.body == 'fail'){
      return false;
    }
    else {
      return true;
    }
  }


}