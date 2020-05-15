/*
Module to render the favorite screen to store the list of favorite items

Module Name: favorite screen
Programmer: Steve Tang
This Module takes in the favorite items from the database and render them on the screen
*/

import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/widgets/LongItemCard.dart';

class FavoriteScreen extends StatefulWidget {

  final favorite_list;
  FavoriteScreen({this.favorite_list});
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favorite_list.length != 0)
      {

//        print(widget.favorite_list.length);
//        print(widget.favorite_list[1]['item_id']);
        return Scaffold(
          appBar: AppBar(title: Text('Favorites'),),
          body: SafeArea(
            child: ListView.builder(
                itemCount: widget.favorite_list.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index){
                  //Long item card will be passed three parameters
                      return LongItemCard(
                        price: widget.favorite_list[index]['price'],
                        name: widget.favorite_list[index]['name'],
                        favourite_id: widget.favorite_list[index]['favourite_id'],
                        item_id: widget.favorite_list[index]['item_id'],
                        image: widget.favorite_list[index]['image'],
                        isFavorite: true,
                      );
                }),
          ),
        );
      }
    else
      {
        print("the favorite list is empty");
        return Scaffold(
          appBar: AppBar(title: Text('Favorites'),),
          body: SafeArea(
            child:Center(
              child: Container(
                child: Text("No favorite item yet...", ),
              ),
            ),
          ),
        );
      }
  }
}
