import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:cuhk_treasure_hunt/screens/login_screen.dart';
import 'package:cuhk_treasure_hunt/classes/User.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';

// this screen is for the new user to customise the avatar, college and other infos
class RegisterScreen extends StatefulWidget {
  String student_id;
  String password;
  String username;
  RegisterScreen({this.student_id, this.password, this.username});
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  //initial value for debugging
  String year = "2018";
  String college = "SH";
  String dorm = "--";
  int _selectedIndex = 0;
  final List<String> college_list = const <String>[
    'SH',
    'CC',
    'NA',
    'UC',
    'MC',
    'WS',
    'YS',
    'CW',
    'SC',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Info"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal*10),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: SizeConfig.safeBlockVertical*20,
                  width: SizeConfig.safeBlockVertical*20,
                  color: Colors.orange,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      child: Text("College"),
                    ),
                    GestureDetector(
                      onTap: (){
                        showBottomSheet(context: context,
                            builder: (BuildContext context)
                        {
                          return Scaffold(
                            body: Container(
                              width: SizeConfig.safeBlockHorizontal*50,
                              height: SizeConfig.safeBlockVertical*30,
                              child: CupertinoPicker(
                                itemExtent: 32.0,
                                onSelectedItemChanged: (int index) {
                                  setState(() {
                                    _selectedIndex = index;
                                    print(_selectedIndex);
                                  });
                                },
                                children: <Widget>[
                                  Text("olala"),
                                ],
                              ),
                            ),
                          );
                        });
                      },
                      child: Container(
                        child: Text(college),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Text("Dorm"),
                ),
                Container(
                  child: Text("Year"),
                ),
                Center(
                  child: Container(
                    color: klogin_button_color,
                    width: SizeConfig.safeBlockHorizontal*80,
                    height: SizeConfig.safeBlockVertical*6,
                    child: FlatButton(
                      onPressed: ()async{
//                      widget.email = "asdas";
//                      widget.password = "asdasd";

                      // for debug purpose
                      widget.student_id = "1155124275";
                      widget.username = "Steve";
                      widget.password = "abc";
                      try{
                        var register_success = await User.register(widget.student_id,
                            widget.password, widget.username, college, year, dorm);
//                        if (register_success)
//                          {
//                            print("Register succeeded");
//                          }
//                        else
//                          {
//                            print("Register failed");
//                          }
                      print(register_success);
                      }catch(e){
                        print("fail to register");
                      }
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => LoginScreen(
                          password:widget.password,
                          username: widget.student_id,
                        ),),);
                      },
                      child: Center(
                          child: Text('Complete!', style: klogin_button_text,)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
