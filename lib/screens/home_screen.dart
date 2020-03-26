import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/widgets/homescreen_explore.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:cuhk_treasure_hunt/widgets/homescreen_explore.dart';
import 'package:cuhk_treasure_hunt/widgets/homescreen_chat_list.dart';



class HomeScreen extends StatefulWidget {
  @override
  static String id = 'HomeScreen';
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  int _selectedIndex = 0; //index of the bottom tabs
  //bool variables to determine the icon

  final List<Widget> _children = [
    //the color containers are only for debug use only
    HomescreenExplore(),
    Container(color: Colors.green,),
    HomeScreenChat(),
    //Container(color: Colors.green,),
    Container(color: Colors.red,),
  ];  //the list of children widgets that will be rendered based on the choice

  final List<Widget> _childrenAppbar = [

  ];

  void _onItemTapped(int index) //set the index to the current index
  {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {

    SizeConfig().init(context); //initialize the size config object so all sizes can be adjusted

    return Scaffold(
      resizeToAvoidBottomPadding: false,  //to avoid the bottom pixel overflow
      //TODO: iOS and Android have different widgets
//      appBar: AppBar(
//        backgroundColor: Colors.white,
//        title: Text("Tolo Dylamic", style: kappbartextstyle),
//      ),
      body: SafeArea(
          child: _children[_selectedIndex],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [

          new BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _selectedIndex == 0? klogin_button_color:knonactive_button_color,),
            title: Text('Explore'),),

          new BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, color: _selectedIndex == 1? klogin_button_color:knonactive_button_color,),
            title: Text('Add'),
          ),

          new BottomNavigationBarItem(
          icon: Icon(Icons.chat, color: _selectedIndex == 2? klogin_button_color:knonactive_button_color,),
          title: Text('Chat'),),

          new BottomNavigationBarItem(
            icon: Icon(Icons.person, color: _selectedIndex == 3? klogin_button_color:knonactive_button_color,),
            title: Text('Me'),),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: klogin_button_color,
        onTap: _onItemTapped,
      ),
    );
  }
}
