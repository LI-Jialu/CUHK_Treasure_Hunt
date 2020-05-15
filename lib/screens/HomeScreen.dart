/*
Module to hold multiple pages for users to navigate through pages

Module Name: home screen
Programmer: Steve Tang
This Module takes in the input of user's tab selection to navigate to corresponding pages
*/

import 'package:cuhk_treasure_hunt/screens/PostScreen.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/utilities/SizeConfig.dart';
import 'package:cuhk_treasure_hunt/widgets/HomescreenChatList.dart';
import 'package:cuhk_treasure_hunt/widgets/HomescreenExplore.dart';
import 'package:cuhk_treasure_hunt/widgets/HomescreenProfile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'HomeScreen';

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; //index of the bottom tabs
  //bool variables to determine the icon

  final List<Widget> _children = [
    //the color containers are only for debug use only
    HomescreenExplore(
      key: PageStorageKey('page1'),
    ),
//    Container(
//      color: Colors.green,
//    ),
    PostScreen(
      key: PageStorageKey('page2'),
    ),
    HomeScreenChat(
      key: PageStorageKey('page3'),
    ),
    //Container(color: Colors.green,),
    HomescreenProfile(
      key: PageStorageKey('page4'),
    ),
  ]; //the list of children widgets that will be rendered based on the choice

  final List<Widget> _childrenAppbar = [
  AppBar(
  title: Text("Home"),
  automaticallyImplyLeading: false,
  elevation: 0,
  ),
    null,
    AppBar(
      title: Text("Chat"),
      automaticallyImplyLeading: false,
      elevation: 0,
    ),
    AppBar(
      title: Text("Profile"),
      automaticallyImplyLeading: false,
      elevation: 0,
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  void _onItemTapped(int index) //set the index to the current index
  {

    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    SizeConfig().init(
        context); //initialize the size config object so all sizes can be adjusted
    return Scaffold(
      resizeToAvoidBottomPadding: false, //to avoid the bottom pixel overflow
      //TODO: iOS and Android have different widgets
//      appBar: AppBar(
//        backgroundColor: Colors.white,
//        title: Text("Tolo Dylamic", style: kappbartextstyle),
//      ),
      appBar: _childrenAppbar[_selectedIndex],
      body: SafeArea(
        child: PageStorage(
          child: _children[_selectedIndex],
          bucket: bucket,
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: klogin_button_color,
        type: BottomNavigationBarType.fixed,
        elevation: 100,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
//              color: _selectedIndex == 0
//                  ? klogin_button_color
//                  : knonactive_button_color,
            ),
            title: Text('Explore'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
//              color: _selectedIndex == 1
//                  ? klogin_button_color
//                  : knonactive_button_color,
            ),
            title: Text('Add'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
//              color: _selectedIndex == 2
//                  ? klogin_button_color
//                  : knonactive_button_color,
            ),
            title: Text('Chat'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
//              color: _selectedIndex == 3
//                  ? klogin_button_color
//                  : knonactive_button_color,
            ),
            title: Text('Me'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amberAccent,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}

