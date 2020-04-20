// define UserVerification class

import 'dart:math';

import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:http/http.dart' as http;


class UserVerification{

  // fields
  static int _code;

  // methods
  static Future<bool> sendVerificationEmail(String studentID, String username) async {

    var rng = new Random(new DateTime.now().millisecondsSinceEpoch);

    int code = rng.nextInt(900000)+100000;
    _code = code;
    print(code);

    String url = Database.hostname + "/verificationMail.php";

    http.Response response = await http.post(url,body: {'sid':studentID,'username':username,'code':'$code'});

    print(response.body);

    return response.body[0] == 's';   // true for successfully sending the email, false for otherwise

  }

  static bool verifyCode(String code){
    if ('$_code' == code)
      return true;
    else
      return false;

  }

}