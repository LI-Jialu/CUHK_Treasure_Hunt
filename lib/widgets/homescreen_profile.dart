import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:cuhk_treasure_hunt/screens/browsing_history_screen.dart';
import 'package:cuhk_treasure_hunt/screens/favorite_screen.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/screens/browsing_history_screen.dart';
import 'dart:async';
import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'dart:convert';

import 'package:http/http.dart';

class HomescreenProfile extends StatefulWidget {
  const HomescreenProfile({Key key}) : super(key: key);
  @override
  _HomescreenProfileScreenState createState() =>
      _HomescreenProfileScreenState();
}

class _HomescreenProfileScreenState extends State<HomescreenProfile> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Future<Response> get_favotite()async{
      var favorites;
      favorites =await Database.get("/data/favorites.php", "");
      return favorites;
    }

    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //user icon, user's email and reputation
              Container(
                height: SizeConfig.safeBlockHorizontal * 25,
                width: SizeConfig.safeBlockHorizontal * 25,
                color: Colors.amber, //user icon
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 1,
              ),
              Container(
                child: Text(
                  "Imane",
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
                      "email: 1155108888@link.cuhk.edu.hk",
                    ), //user email
                  ),
                  Container(
                    child: Text("reputation: 100/100"), //user reputation
                  ),
                ],
              ),
              // user email and reputation
              // Location, Posted items, Favourites, Transaction history, Browsing History
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // all 5 rows
                  Row(
                    // location
                    children: <Widget>[
                      Container(
                          height: SizeConfig.safeBlockVertical * 10,
                          width: SizeConfig.safeBlockVertical * 15,
                          child: Icon(
                            Icons.location_on,
                            color: Colors.black,
                          )),
                      GestureDetector(
                        onTap: () {}, //go to location
                        child: Container(
                          child: Text(
                            "Location",
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
                      GestureDetector(
                        onTap: () {}, //go to posted items
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
                      GestureDetector(
                        onTap: () async{
                          Map favorite_list;
                          try{
                            Response favorites = await get_favotite();
                            if (favorites!=null)
                              {
                                print("the body is not null");
                                favorite_list = json.decode(favorites.body);
                              }
                            else
                              print("the body is null");
                          }
                          catch(e){
                            print("fail to acquire the list");
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FavoriteScreen(favorite_list: favorite_list,)),
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
                    // Transaction history
                    children: <Widget>[
                      Container(
                          height: SizeConfig.safeBlockVertical * 10,
                          width: SizeConfig.safeBlockVertical * 15,
                          child: Icon(
                            Icons.shopping_cart,
                            color: Colors.black,
                          )),
                      GestureDetector(
                        onTap: () {}, //go to Transaction history
                        child: Container(
                          child: Text(
                            "Transaction history",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    // Browsing History
                    children: <Widget>[
                      Container(
                          height: SizeConfig.safeBlockVertical * 10,
                          width: SizeConfig.safeBlockVertical * 15,
                          child: Icon(
                            Icons.history,
                            color: Colors.black,
                          )),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder:
                                (context) => BrowsingHistoryScreen(),),
                          );
                        }, //go to Browsing History
                        child: Container(
                          child: Text(
                            "Browsing History",
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
                    child: GestureDetector(
                      onTap: () {}, //Lot out
                      child: Container(
                        child: Text(
                          "Log out",
                          style: TextStyle(fontSize: 24),
                        ),
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
