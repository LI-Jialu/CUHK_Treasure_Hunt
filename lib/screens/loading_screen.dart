/*
Module to render the processing icon to indicate the users to wait

Module Name: Loading spinner
Programmer: Steve Tang
This Module renders a spinner icon
*/

import 'dart:async';
import 'dart:convert';
import 'package:cuhk_treasure_hunt/classes/User.dart';
import 'package:cuhk_treasure_hunt/classes/UserVerification.dart';
import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:cuhk_treasure_hunt/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  String username;
  String password;
  LoadingScreen({this.username, this.password});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    logIn();
  }

  void logIn () async{

    //await User.login('0000000003', 'admin4');
    bool result = await User.login(widget.username, widget.password);
    if (result) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
    else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: SizeConfig.safeBlockHorizontal*30,
          height: SizeConfig.safeBlockVertical*30,
          child: SpinKitWave(
            color: Colors.teal,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
