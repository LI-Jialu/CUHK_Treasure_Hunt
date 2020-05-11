import 'package:flutter/material.dart';

class BrowsingHistoryScreen extends StatefulWidget {
  @override
  _BrowsingHistoryScreenState createState() => _BrowsingHistoryScreenState();
}

class _BrowsingHistoryScreenState extends State<BrowsingHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Browsing History'),),
      body: SafeArea(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
            itemCount: 10,
            itemBuilder: (context, index){
            return Container(
              child: Text("$index"),
              height: 200,
              color: Colors.orange,
            );
            }),
      ),
    );
  }
}
