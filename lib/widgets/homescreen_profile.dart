import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';

class HomescreenProfile extends StatefulWidget {
  @override
  _HomescreenProfileScreenState createState() => _HomescreenProfileScreenState();
}

class _HomescreenProfileScreenState extends State<HomescreenProfile> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //user icon, user's email and reputation
          Container(
            height: SizeConfig.safeBlockVertical*25,
            width: SizeConfig.safeBlockHorizontal*25,
            color: Colors.amber, //user icon
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical*1,
          ),
          Container(
            child: Text("Imane",style: TextStyle(fontSize: 24),), //user name
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical*1,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text("email: 1155108888@link.cuhk.edu.hk",), //user email
              ),
              Container(
                child: Text("reputation: 100/100"), //user reputation
              ),
            ],
          ),   // user email and reputation
          // Location, Posted items, Favourites, Transaction history, Browsing History
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                // all 5 rows
                  Row(
                    // location
                    children: <Widget>[
                      Container(
                          height: SizeConfig.safeBlockVertical*15,
                          width: SizeConfig.safeBlockVertical*15,
                          child: Icon(Icons.location_on , color: Colors.white,)
                      ),
                      GestureDetector(
                        onTap: (){}, //go to location
                        child: Container(
                          child: Text("Location",style: TextStyle(fontSize: 24),),
                        ),
                      ),
                    ],
                  ),
                Row(
                  // Posted items
                  children: <Widget>[
                    Container(
                        height: SizeConfig.safeBlockVertical*15,
                        width: SizeConfig.safeBlockVertical*15,
                        child: Icon(Icons.shopping_basket , color: Colors.white,)
                    ),
                    GestureDetector(
                      onTap: (){}, //go to posted items
                      child: Container(
                        child: Text("Posted items",style: TextStyle(fontSize: 24),),
                      ),
                    ),
                  ],
                ),
                Row(
                  // Favourites
                  children: <Widget>[
                    Container(
                        height: SizeConfig.safeBlockVertical*15,
                        width: SizeConfig.safeBlockVertical*15,
                        child: Icon(Icons.favorite_border)
                    ),
                    GestureDetector(
                      onTap: (){}, //go to Favourites
                      child: Container(
                        child: Text("Favourites",style: TextStyle(fontSize: 24),),
                      ),
                    ),
                  ],
                ),
                Row(
                  // Transaction history
                  children: <Widget>[
                    Container(
                        height: SizeConfig.safeBlockVertical*15,
                        width: SizeConfig.safeBlockVertical*15,
                        child: Icon(Icons.shopping_cart  , color: Colors.white,)
                    ),
                    GestureDetector(
                      onTap: (){}, //go to Transaction history
                      child: Container(
                        child: Text("Transaction history",style: TextStyle(fontSize: 24),),
                      ),
                    ),
                  ],
                ),
                Row(
                  // Browsing History
                  children: <Widget>[
                    Container(
                        height: SizeConfig.safeBlockVertical*15,
                        width: SizeConfig.safeBlockVertical*15,
                        child: Icon(Icons.history  , color: Colors.white,)
                    ),
                    GestureDetector(
                      onTap: (){}, //go to Browsing History
                      child: Container(
                        child: Text("Browsing History",style: TextStyle(fontSize: 24),),
                      ),
                    ),
                  ],
                ),
                Container(
                  // Log out
                  child: GestureDetector(
                    onTap: (){}, //Lot out
                    child: Container(
                      child: Text("Log out",style: TextStyle(fontSize: 24),),
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
          ),
        ],
      ),
    );
  }
}