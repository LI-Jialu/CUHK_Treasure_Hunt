import 'dart:async';
import 'dart:convert';

import 'package:cuhk_treasure_hunt/classes/User.dart';
import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:cuhk_treasure_hunt/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:cuhk_treasure_hunt/classes/UserProfile.dart';

import 'package:http/http.dart' as http;

String username;
String password;

class LoginScreen extends StatelessWidget {

  @override
  static String id = '/LoginScreen';


  Widget build(BuildContext context) {

    SizeConfig().init(context);


    return Scaffold(
      resizeToAvoidBottomPadding: false,  //to avoid the bottom pixel overflow
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              //place the avatar of the user
              SizedBox(
                height: SizeConfig.safeBlockVertical*10,

              ),
              Container(
                height: SizeConfig.safeBlockVertical*30,
                width: SizeConfig.safeBlockVertical*30,
                color: Colors.amber,
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical*5,
              ),
              //Input the username into the box
              Container(
                height: SizeConfig.safeBlockVertical*10,
                width: SizeConfig.safeBlockHorizontal*80,
                child: TextField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Username/Email'
                  ),
                  onChanged: (value){
                    username = value;
                    print(username);
                    },
                ),
              ),
              //input the password into the box
              SizedBox(
                height: SizeConfig.safeBlockVertical*2,
              ),
              Container(
                height: SizeConfig.safeBlockVertical*10,
                width: SizeConfig.safeBlockHorizontal*80,
                child: TextField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: 'Password'
                  ),
                  onChanged: (value){
                    password = value;
                    print(password);
                  },
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical*20,
              ),
              Container(
                color: klogin_button_color,
                width: SizeConfig.safeBlockHorizontal*80,
                height: SizeConfig.safeBlockVertical*6,
                child: FlatButton(
                  onPressed: () async {
                    //Database.test();
                    User.login('0000000001', 'admin2');

                    Timer(Duration(seconds: 2), () async{
                      http.Response res = await Database.get('/data/profile.php', '');
                      print(json.decode(res.body)[0]['college']);
                    });
                    /*Timer(Duration(seconds: 2), () async{
                      Database.post(
                          "/data/manageTransactions.php",
                          {'action':'update','type':'b','transaction_id':'3','rating':'4'}
                          );
                    });*/

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Center(
                      child: Text('Log In', style: klogin_button_text,)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
