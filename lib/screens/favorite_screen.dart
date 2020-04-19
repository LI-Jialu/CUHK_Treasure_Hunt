import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/widgets/long_item_card.dart';

class FavoriteScreen extends StatefulWidget {
  List<Map<String, String>> favorite_list;
  FavoriteScreen({this.favorite_list});
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favorite_list != null)
      {
        print("Successfully passed the favorite data");
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
