import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:cuhk_treasure_hunt/screens/login_screen.dart';
import 'package:cuhk_treasure_hunt/classes/User.dart';
import 'package:cuhk_treasure_hunt/classes/PostItem.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:universal_html/html.dart';

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
  String year = "year 1";
  String college = "SH";
  String dorm = "--";

  // alert pickup image from web or gallery
  Future<File> showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Choose your icon"),
            content: GestureDetector(
              child: Image.asset('assets / images / batman.svg'),
            ),
          );
        });
  }

  void decideDormRange(college) {
    if (college == 'CC') {
      _dorm = _dormCC;
    } else if (college == 'CW') {
      _dorm = _dormCW;
    } else if (college == 'MC') {
      _dorm = _dormMC;
    } else if (college == 'NA') {
      _dorm = _dormNA;
    } else if (college == 'SC') {
      _dorm = _dormSC;
    } else if (college == 'SH') {
      _dorm = _dormSH;
    } else if (college == 'UC') {
      _dorm = _dormUC;
    } else if (college == 'WS') {
      _dorm = _dormWS;
    } else if (college == 'YS') {
      _dorm = _dormYS;
    }
  }

  static var _college = [
    'CC',
    'CW',
    'MC',
    'NA',
    'SC',
    'SH',
    'UC',
    'WS',
    'YS',
    '--',
  ];
  var _year = [
    'year 1',
    'year 2',
    'year 3',
    'year 4',
    'year 5',
    'year 6',
  ];
  var _dormCC = ['--', 'WL', 'PMLB'];
  var _dormCW = [
    '--',
  ];
  var _dormMC = ['--', 'NB', 'SB'];
  var _dormNA = [
    '--',
  ];
  var _dormSC = [
    '--',
  ];
  var _dormSH = ['--', 'LQW', 'HT'];
  var _dormUC = [
    '--',
  ];
  var _dormWS = [
    '--',
  ];
  var _dormYS = [
    '--',
  ];
  var _dorm = [
    '--',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Info"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 23,
                  width: SizeConfig.safeBlockHorizontal * 40,
                  child: OutlineButton(
                      color: Colors.orange,
                      textColor: Colors.black,
                      disabledTextColor: Colors.grey,
                      padding: EdgeInsets.all(8.0),
                      borderSide: BorderSide(color: Colors.grey, width: 0.5),
                      onPressed: () {
                        showChoiceDialog(context);
                      },
                      child: Text("Select pictures")),
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.school,
                      color: klogin_button_color,
                    ),
                    DropdownButton(
                        // isExpanded: true,
                        value: college,
                        items: _college.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (selectedCollege) {
                          setState(() {
                            college = selectedCollege;
                            decideDormRange(college);
                          });
                        }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.room,
                      color: klogin_button_color,
                    ),
                    DropdownButton(
                        value: dorm,
                        items: _dorm.map((String dropDownStringItem) {
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
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.book, color: klogin_button_color),
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
                  ],
                ),
                Divider(),
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
