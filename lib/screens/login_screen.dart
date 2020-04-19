import 'dart:async';
import 'dart:convert';

import 'package:cuhk_treasure_hunt/classes/User.dart';
import 'package:cuhk_treasure_hunt/classes/UserVerification.dart';
import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:cuhk_treasure_hunt/screens/home_screen.dart';
import 'package:cuhk_treasure_hunt/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:cuhk_treasure_hunt/classes/UserProfile.dart';
import 'package:cuhk_treasure_hunt/screens/loading_screen.dart';
import 'package:cuhk_treasure_hunt/screens/signup_screen.dart';

import 'package:http/http.dart' as http;



class LoginScreen extends StatelessWidget {
  String username;
  String password;
  @override
  LoginScreen({this.username, this.password});

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
                child: TextFormField(
                  initialValue: username,
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
                child: TextFormField(
                  initialValue: password,
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
                height: SizeConfig.safeBlockVertical*10,
              ),
              Container(
                color: Colors.orange,
                width: SizeConfig.safeBlockHorizontal*80,
                height: SizeConfig.safeBlockVertical*6,
                child: FlatButton(
                  onPressed: ()  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  child: Center(
                      child: Text('Sign Up', style: klogin_button_text,)),
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical*4,
              ),
              Container(
                color: klogin_button_color,
                width: SizeConfig.safeBlockHorizontal*80,
                height: SizeConfig.safeBlockVertical*6,
                child: FlatButton(
                  onPressed: ()  {
                    //Database.test();
//                    User.login('0000000001', 'admin2');
//                    try
//                    {
//                      var item_list_data = await Database.get("/data/favourites.php","");
//                      // TODO: will be implemented as the recommended items later
//                      if (item_list_data!=null)
//                      {
//                        print("the item_list body is not null");
//                        var item_list = json.decode(item_list_data.body);
//                      }
//                      else
//                      {
//                        print("the item_body is null");
//                      }
//                    }
//                    catch(e){
//                      print("fail to acquire the item_list list");
//                    }

                    /*Timer(Duration(seconds: 2),(){
                      User.logout();
                    });*/

                    //print(await UserVerification.sendVerificationEmail("", ""));
                    //print(UserVerification.verifyCode("619605"));
                    
                    /*Timer(Duration(seconds: 2), () async{
                      http.Response res = await Database.get('/data/profile.php', '');
                      print(await json.decode(res.body));
                      //print(json.decode(res.body)[0]['college']);
                    });*/
                    /*Timer(Duration(seconds: 2), () async{
                      Database.post(
                          "/data/manageTransactions.php",
                          {'action':'update','type':'b','transaction_id':'3','rating':'4'}
                          );
                    });*/

                    //User.register("0000000005", "admin6", "admin6", 'CC', "5", "--");

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoadingScreen(
                        username: username,password: password,)),
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
