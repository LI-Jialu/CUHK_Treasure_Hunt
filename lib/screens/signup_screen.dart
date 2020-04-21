import 'package:cuhk_treasure_hunt/screens/loading_screen.dart';
import 'package:cuhk_treasure_hunt/screens/login_screen.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/screens/home_screen.dart';
import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:cuhk_treasure_hunt/screens/register_screen.dart';
import 'package:cuhk_treasure_hunt/classes/UserVerification.dart';
import 'dart:async';



class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String student_id;
  String password;
  String veri_code; //6-digit numbers from the email
  String username;
  String button_hint = "Send Code";
  bool status = false;  // code sent status
  bool send_button_status = true;
  bool verification_status;
  bool password_visible = false;
  bool username_repitition = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,  //to avoid the bottom pixel overflow
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal*10),
            child: ListView.builder(
              itemCount: 1,
                itemBuilder: (context, index){
              return Column(
//              mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
//                Container(
//                  height: 300,
//                  width: 300,
//                  color: Colors.orange,
//                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical*10,
                ),
                  Container(child:
                  Text("Username")
                    ,),
                  Stack(
                    children: <Widget>[
                      Container(
                        height: SizeConfig.safeBlockVertical*10,
                        width: SizeConfig.safeBlockHorizontal*80,
                        child: TextField(
                          autofocus: true,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          maxLines: 1,
                          decoration: InputDecoration(
                              hintText: 'Rocky Tuan'
                          ),
                          onChanged: (value) async{
                            username = value;
                            var username_exist =
                            await Database.get('/data/usernameExists.php', '?username=$username');
                            print(username_exist.body.length);
                            if (username_exist.body.length == 6)
                            {
                              username_repitition = true;
                            }
                            else
                            {
                              username_repitition = false;
                            }
                            setState(() {
                            });
                            print(username);
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 25,
                        right: 0,
                        child: username_repitition?
                            Icon(Icons.clear,
                            color: Colors.redAccent,)
                            :Icon(
                          Icons.check_circle,
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Text("CUHK Email"),
                  ),

                  Row(
//                    textBaseline: TextBaseline.ideographic,
                    children: <Widget>[
                      Container(
                        height: SizeConfig.safeBlockVertical*10,
                        width: SizeConfig.safeBlockHorizontal*40,
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
                        child: Text("@link.cuhk.edu.hk", style: TextStyle(
                          fontSize: 18,
                        ),),
                      ),
                    ],
                  ),
                  Container(child:
                  Text("Password")
                    ,),
                  Stack(
                    children: <Widget>[

                      Container(
                        height: SizeConfig.safeBlockVertical*10,
                        width: SizeConfig.safeBlockHorizontal*80,
                        child: TextField(
                          obscureText: password_visible?true:false,
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
                      Positioned(
                        right: 0,
                        child: IconButton(
                          icon: Icon(password_visible?Icons.visibility:Icons.visibility_off),
                          onPressed: (){
                            password_visible = !password_visible;
                            setState(() {

                            });
                          },
                        ),
                      ),
                    ],
                  ),


                  Container(
                    child: Text("Verification Code"),
                  ),
                  Row(
                    children: <Widget>[
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
                            veri_code = value;
                            print(veri_code);
                          },
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal*10,
                      ),
                      Container(
                        color: send_button_status?Colors.orange:Colors.grey,
                        width: SizeConfig.safeBlockHorizontal*30,
                        height: SizeConfig.safeBlockVertical*6,
                        child: FlatButton(
                          onPressed: ()async{
                            try{
                              if (student_id.length==10 && password!=null)
                              {
                                status = await UserVerification.sendVerificationEmail(student_id, username);
                                print("debug");
                                if (status == true)
                                {
                                  send_button_status = false;
                                  print("message sent");
                                }
                                else
                                {
                                  print("fail to send the message");
                                }
                              }
                            }catch(e){
                              print("Fail to send");
                            }
                            setState(() {

                            });
                          },
                          child: Center(
                              child: Text(send_button_status?'Send':'Sent', style: klogin_button_text,)),
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
//                    onPressed: (){
//                      print(student_id.length);
//                    },
                      onPressed: ()  {
                        //TODO: verify the sign up information
                        if (send_button_status==false)
                        {
                          try{
                            verification_status = UserVerification.verifyCode(veri_code) ;
                          }
                          catch(e){
                            verification_status = false;
                            print("fail to verify code");
                          }
                        }
                        else
                        {
                          print("No code is sent yet");
                        }
                        print(verification_status);
                        if (verification_status)
                        {
//                          String email_address = "$student_id+@link.cuhk.edu.hk";
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterScreen(
                              student_id: student_id,
                              password:password,
                              username: username,
                            ),),
                          );
                        }//message sent but wrong code
                        else{
                          print("wrong code");
                        }
                        setState(() {
                        });

                      },
                      child: Center(
                          child: Text('Next', style: klogin_button_text,)),
                    ),
                  ),
                  FlatButton(
                    color: Colors.orange,
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterScreen()),
                      );
                    },
                    child: Center(
                        child: Text('test', style: klogin_button_text,)),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical*30,
                  ),
                ],
              );
            })

          ),
        ),
    );
  }
}
