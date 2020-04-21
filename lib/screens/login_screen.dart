import 'dart:async';
import 'dart:convert';
import 'package:cuhk_treasure_hunt/classes/PostItem.dart';
import 'package:cuhk_treasure_hunt/classes/User.dart';
import 'package:cuhk_treasure_hunt/classes/UserVerification.dart';
import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:cuhk_treasure_hunt/screens/home_screen.dart';
import 'package:cuhk_treasure_hunt/screens/register_screen.dart';
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
    String src = Database.hostname+"/data/images/image_picker_120C4BA2-E0F3-49EF-ADF8-4EDBD6A388C7-46791-0005A818D6B5A70F.jpg";

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
                child: Image.network(src,width: SizeConfig.safeBlockVertical*30,height: SizeConfig.safeBlockVertical*30),
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
                  onPressed: ()  async {

                    var user = await Database.get("/data/profile.php","");
                    print(json.decode(user.body));

                    //the login process has been moved to loading screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoadingScreen(
                        username: username,password: password,),),
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
