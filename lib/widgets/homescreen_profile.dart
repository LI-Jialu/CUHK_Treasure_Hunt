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
                child: Image.asset('assets/images/Icon/superman.svg'),
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
                    padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal*3),
                    child: Container(
                      padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal*3),
                      decoration: new BoxDecoration(
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.black,
                            offset: new Offset(1, 1),
                            blurRadius: 3,
                          )
                        ],
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      height: SizeConfig.safeBlockVertical*6,
                      width: SizeConfig.safeBlockHorizontal*40,
                      child: Center(child: Text("Reputation: ${reputation.substring(0,4)}/5.00",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)), //user reputation
                    ),
                  ),
                ],
              ),
              // user email and reputation
              // Location, Posted items, Favourites, Transaction history, Browsing History
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder:
                            (context) => LoadingScreen2(index:1)),
                      );
                    }, //go to posted items
                    child: Row(
                      children: <Widget>[
                        Container(
                            height: SizeConfig.safeBlockVertical * 10,
                            width: SizeConfig.safeBlockVertical * 15,
                            child: Icon(
                              Icons.shopping_basket,
                              color: Colors.black,
                            )),
                        Container(
                          child: Text(
                            "Posted items",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ],
                    ),
                  ),

                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoadingScreen2(index: 2,)),
                      );
                    }, //go to Favourites
                    child: Row(
                      children: <Widget>[
                        Container(
                            height: SizeConfig.safeBlockVertical * 10,
                            width: SizeConfig.safeBlockVertical * 15,
                            child: Icon(Icons.favorite_border)),
                        Container(
                          child: Text(
                            "Favourites",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ],
                    ),
                  ),

                  FlatButton(
                    onPressed:() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder:
                            (context) => LoadingScreen2(index: 6,)),
                      );
                    }, //go to Transaction history
                    child: Row(
                      children: <Widget>[
                        Container(
                            height: SizeConfig.safeBlockVertical * 10,
                            width: SizeConfig.safeBlockVertical * 15,
                            child: Icon(
                              Icons.shopping_basket,
                              color: Colors.black,
                            )),
                        Container(
                          child: Text(
                            "Buy Requests",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ],
                    ),
                  ),

                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder:
                            (context) => LoadingScreen2(index:5)),
                      );
                    }, //go to posted items
                    child: Row(
                      children: <Widget>[
                        Container(
                            height: SizeConfig.safeBlockVertical * 10,
                            width: SizeConfig.safeBlockVertical * 15,
                            child: Icon(
                              Icons.shopping_basket,
                              color: Colors.black,
                            )),
                        Container(
                          child: Text(
                            "Transactions",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ],
                    ),
                  ),

                  FlatButton(
                    onPressed:() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder:
                            (context) => LoadingScreen2(index: 3,)),
                      );
                    }, //go to Transaction history
                    child: Row(

                      children: <Widget>[
                        Container(
                            height: SizeConfig.safeBlockVertical * 10,
                            width: SizeConfig.safeBlockVertical * 15,
                            child: Icon(
                              Icons.shopping_cart,
                              color: Colors.black,
                            )),
                        Container(
                          child: Text(
                            "Transaction History",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ],
                    ),
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
                        width: SizeConfig.safeBlockHorizontal*80,
                        height: SizeConfig.safeBlockVertical*6,
                        child: Center(
                          child: Text(
                            "Log Out",
                            style: TextStyle(fontSize: 24, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        color: Colors.red,
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
