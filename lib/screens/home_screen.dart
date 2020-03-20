import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:flutter/material.dart';
int _selectedIndex = 0;


class HomeScreen extends StatefulWidget {
  @override
  static String id = 'HomeScreen';
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override

  void _onItemTapped(int index)
  {
    setState(() {
      _selectedIndex = index;
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: iOS and Android have different widgets
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: kloginbuttoncolor,),
            title: Text('Explore'),),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, color: kloginbuttoncolor),
            title: Text('Add'),
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.chat, color: kloginbuttoncolor),
          title: Text('Chat'),),
          BottomNavigationBarItem(
            icon: Icon(Icons.people, color: kloginbuttoncolor),
            title: Text('Me'),),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kloginbuttoncolor,
        onTap: _onItemTapped,
      ),
    );
  }
}
