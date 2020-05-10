import 'package:cuhk_treasure_hunt/classes/User.dart';
import 'package:cuhk_treasure_hunt/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  final String username;
  final String password;
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
