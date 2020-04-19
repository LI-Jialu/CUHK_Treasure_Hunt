import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/widgets/long_item_card.dart';

class FavoriteScreen extends StatefulWidget {
  var favorite_list;
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
        print(widget.favorite_list);
//        print(widget.favorite_list.length);
//        print(widget.favorite_list[0]['name']);
        return Scaffold(
          appBar: AppBar(title: Text('Favorites'),),
          body: SafeArea(
            child: ListView.builder(
                itemCount: widget.favorite_list.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index){

                      return LongItemCard(
                        price: widget.favorite_list[index]['price'],
                        name: widget.favorite_list[index]['name'],
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
