import 'package:cuhk_treasure_hunt/screens/loading_screen.dart';
import 'package:cuhk_treasure_hunt/screens/login_screen.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/screens/home_screen.dart';
import 'package:cuhk_treasure_hunt/database/Database.dart';



class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String student_id;
  String password;
  String veri_code; //6-digit numbers from the email
  bool sign_up_success = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,  //to avoid the bottom pixel overflow
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal*10),
            child: Column(
//              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
//                Container(
//                  height: 300,
//                  width: 300,
//                  color: Colors.orange,
//                ),
                Container(
                  child: Text("CUHK Email"),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      height: SizeConfig.safeBlockVertical*10,
                      width: SizeConfig.safeBlockHorizontal*50,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        maxLines: 1,
                        maxLength: 10,
                        decoration: InputDecoration(
                            hintText: '1155******'
                        ),
                        onChanged: (value){
                          student_id = value;
                          print(student_id);
                        },
                      ),
                    ),
                    Container(
                      child: Text("@link.cuhk.edu.hk"),
                    ),
                  ],
                ),
                Container(child:
                Text("Password")
                  ,),
                Container(
                  height: SizeConfig.safeBlockVertical*10,
                  width: SizeConfig.safeBlockHorizontal*80,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    maxLines: 1,
                    decoration: InputDecoration(
                        hintText: 'Irwin King'
                    ),
                    onChanged: (value){
                      password = value;
                      print(password);
                    },
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      child: Text("Verification Code"),
                    ),
                    SizedBox(
                      width: SizeConfig.safeBlockHorizontal*10,
                    ),
                    Container(
                      height: SizeConfig.safeBlockVertical*10,
                      width: SizeConfig.safeBlockHorizontal*40,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        maxLines: 1,
                        maxLength: 6,
                        decoration: InputDecoration(
                            hintText: '123456'
                        ),
                        onChanged: (value){
                          student_id = value;
                          print(student_id);
                        },
                      ),
                    ),
                  ],
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
                      //TODO: verify the sign up information
                      if (sign_up_success){
                        String email_address = "$student_id+@link.cuhk.edu.hk";
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen(
                              username: email_address,
                              password:password),),
                        );
                      }
                      else
                        {

                        }

                    },
                    child: Center(
                        child: Text('Complete', style: klogin_button_text,)),
                  ),
                ),
              ],
            ),

          ),
        ),
    );
  }
}
