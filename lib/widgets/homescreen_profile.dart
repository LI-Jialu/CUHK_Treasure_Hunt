import 'package:cuhk_treasure_hunt/classes/User.dart';
import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:cuhk_treasure_hunt/screens/browsing_history_screen.dart';
import 'package:cuhk_treasure_hunt/screens/loading_screen_2.dart';
import 'package:cuhk_treasure_hunt/screens/login_screen.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

class HomescreenProfile extends StatefulWidget {
  const HomescreenProfile({Key key}) : super(key: key);
  @override
  _HomescreenProfileScreenState createState() =>
      _HomescreenProfileScreenState();
}

class _HomescreenProfileScreenState extends State<HomescreenProfile> {
  String username;
  String studentID;
  String reputation = "0.0000";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Future<Response> get_user()async{
      var user;
      user = await Database.get("/data/profile.php", "");
      return user;
    }

    void set_user() async{
      Response user = await get_user();
      setState(() {
        username = json.decode(user.body)[0]['username'];
        studentID = json.decode(user.body)[0]['student_id'];
        reputation = json.decode(user.body)[0]['reputation'];
      }
      );
    }
    set_user();



    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //user icon, user's email and reputation
              Container(
                height: SizeConfig.safeBlockHorizontal * 25,
                width: SizeConfig.safeBlockHorizontal * 25,
                decoration: new BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ), //user icon
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 1,
              ),
              Container(
                child: Text(
                  "$username",
                  style: TextStyle(fontSize: 24),
                ), //user name
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 1,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      "email: $studentID@link.cuhk.edu.hk",
                    ), //user email
                  ),
                  Container(
                    child: Text("reputation: ${reputation.substring(0,4)}/5.00"), //user reputation
                  ),
                ],
              ),
              // user email and reputation
              // Location, Posted items, Favourites, Transaction history, Browsing History
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    // Posted items
                    children: <Widget>[
                      Container(
                          height: SizeConfig.safeBlockVertical * 10,
                          width: SizeConfig.safeBlockVertical * 15,
                          child: Icon(
                            Icons.shopping_basket,
                            color: Colors.black,
                          )),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder:
                                (context) => LoadingScreen2(index:1)),
                          );
                        }, //go to posted items
                        child: Container(
                          child: Text(
                            "Posted items",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    // Favourites
                    children: <Widget>[
                      Container(
                          height: SizeConfig.safeBlockVertical * 10,
                          width: SizeConfig.safeBlockVertical * 15,
                          child: Icon(Icons.favorite_border)),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoadingScreen2(index: 2,)),
                          );
                        }, //go to Favourites
                        child: Container(
                          child: Text(
                            "Favourites",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    // Posted items
                    children: <Widget>[
                      Container(
                          height: SizeConfig.safeBlockVertical * 10,
                          width: SizeConfig.safeBlockVertical * 15,
                          child: Icon(
                            Icons.shopping_basket,
                            color: Colors.black,
                          )),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder:
                                (context) => LoadingScreen2(index:5)),
                          );
                        }, //go to posted items
                        child: Container(
                          child: Text(
                            "Transactions",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    // Transaction history
                    children: <Widget>[
                      Container(
                          height: SizeConfig.safeBlockVertical * 10,
                          width: SizeConfig.safeBlockVertical * 15,
                          child: Icon(
                            Icons.shopping_cart,
                            color: Colors.black,
                          )),
                      FlatButton(
                        onPressed:() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder:
                                (context) => LoadingScreen2(index: 3,)),
                          );
                        }, //go to Transaction history
                        child: Container(
                          child: Text(
                            "Transaction History",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 1,
                  ),
                  Container(
                    // Log out
                    child: FlatButton(
                      onPressed:() {
                        User.logout();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      }, //Lot out
                      child: Container(
                        height: SizeConfig.safeBlockVertical * 5,
                        width: SizeConfig.safeBlockVertical * 25,
                        child: Center(
                          child: Text(
                            "Log Out",
                            style: TextStyle(fontSize: 24),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        color: Colors.red[200],
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical*10,),
                ],
              ),
            ],
          ),
          );
        },
      ),
    );
  }
}
