import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:cuhk_treasure_hunt/screens/login_screen.dart';

// this screen is for the new user to customise the avatar, college and other infos
class RegisterScreen extends StatefulWidget {
  String email;
  String password;
  String username;
  RegisterScreen({this.email, this.password, this.username});
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Info"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal*10),
          child: Column(
            children: <Widget>[
              Container(
                height: SizeConfig.safeBlockVertical*20,
                width: SizeConfig.safeBlockVertical*20,
                color: Colors.orange,
              ),
              Container(
                child: Text("College"),
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
                    onPressed: (){
//                      widget.email = "asdas";
//                      widget.password = "asdasd";
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginScreen(
                        password:widget.password,
                        username: widget.email,
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
    );
  }
}
