import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/widgets/long_item_card.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorites'),),
      body: SafeArea(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index){
              return LongItemCard();
            }),
      ),
    );
  }
}
