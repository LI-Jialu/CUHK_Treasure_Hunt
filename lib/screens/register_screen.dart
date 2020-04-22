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
  var _college = [
    'CC',
    'SH',
    'SC',
    'NA',
    'UC',
    'WS',
    'WYS',
  ];
  var _year = [
    '2018',
    '2019',
  ];
  var _dormCC = ['--', 'WL', 'PMLB'];
  var _dormSH = ['--', 'LQW', 'HT'];
  var _dorm = ['--'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Info"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 10),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: SizeConfig.safeBlockVertical * 20,
                  width: SizeConfig.safeBlockVertical * 20,
                  color: Colors.orange,
                ),
                DropdownButton(
                    value: college,
                    items: _college.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (selectedDorm) {
                      setState(() {
                        dorm = selectedDorm;
                      });
                    }),
                DropdownButton(
                    value: dorm,
                    items: _dorm.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (selectedYear) {
                      setState(() {
                        year = selectedYear;
                      });
                    }),
                DropdownButton(
                    value: year,
                    items: _year.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (selectedYear) {
                      setState(() {
                        year = selectedYear;
                      });
                    }),
                Center(
                  child: Container(
                    color: klogin_button_color,
                    width: SizeConfig.safeBlockHorizontal * 80,
                    height: SizeConfig.safeBlockVertical * 6,
                    child: FlatButton(
                      onPressed: () async {
//                      widget.email = "asdas";
//                      widget.password = "asdasd";

                        // for debug purpose
                        widget.student_id = "1155124275";
                        widget.username = "Steve";
                        widget.password = "abc";
                        try {
                          var register_success = await User.register(
                              widget.student_id,
                              widget.password,
                              widget.username,
                              college,
                              year,
                              dorm);
//                        if (register_success)
//                          {
//                            print("Register succeeded");
//                          }
//                        else
//                          {
//                            print("Register failed");
//                          }
                          print(register_success);
                        } catch (e) {
                          print("fail to register");
                        }
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(
                              password: widget.password,
                              username: widget.student_id,
                            ),
                          ),
                        );
                      },
                      child: Center(
                          child: Text(
                        'Complete!',
                        style: klogin_button_text,
                      )),
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
