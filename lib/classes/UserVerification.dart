/*
Module for user verification by mail during registration.

Module Name: UserVerification
Programmer: Hon Tik TSE
Version: 1.0 (10 May 2020)

Send verification mail containing the verification code. Also verify the correctness of code entered.
*/

import 'dart:math';
import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:http/http.dart' as http;


class UserVerification{

  // fields
  static int _code; //private variable to store the code

  // methods
  static Future<bool> sendVerificationEmail(String studentID, String username) async {

    // generate a 6-digit code
    var rng = new Random(new DateTime.now().millisecondsSinceEpoch);

    int code = rng.nextInt(900000)+100000;
    _code = code;

    // send mail
    String url = Database.hostname + "/verificationMail.php";

    http.Response response = await http.post(url,body: {'sid':studentID,'username':username,'code':'$code'});

    print(response.body);

    return response.body[0] == 's';   // true for successfully sending the email, false for otherwise

  }

  // verify correctness of code entered
  static bool verifyCode(String code){
    return "$_code" == code;
  }

}