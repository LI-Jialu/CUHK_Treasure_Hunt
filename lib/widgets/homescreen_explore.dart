import 'package:cuhk_treasure_hunt/screens/detail_screen.dart';
import 'package:cuhk_treasure_hunt/screens/search_screen.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:cuhk_treasure_hunt/database/Database.dart';

class HomescreenExplore extends StatefulWidget {
  const HomescreenExplore({Key key}) : super(key: key);

  @override
  _HomescreenExploreState createState() => _HomescreenExploreState();
}

class _HomescreenExploreState extends State<HomescreenExplore> {
//  Map item_list;
  @override
//  void initState()
//  {
//    super.initState();
//    initialize_item_list();
//  }
//  void initialize_item_list() async{
//    try
//    {
//      var item_list_data = await Database.get("/data/itemPosted.php","");
//      if (item_list_data!=null)
//      {
//        print("the body is not null");
//        item_list = json.decode(item_list_data.body);
//      }
//      else
//        {
//          print("the body is null");
//        }
//    }
//    catch(e){
//        print("fail to acquire the item list");
//    }
//
//  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(
        context); //initialize the size config object so all sizes can be adjusted
    return Column(
      children: <Widget>[
        Container(
          child: Center(
            child: Text(
              "TOLO Dynamic",
              style: khomescreen_title_textstyle,
            ),
          ),
          height: SizeConfig.safeBlockVertical * 10,
        ),
        Container(
          height: SizeConfig.safeBlockVertical * 10,
          width: SizeConfig.safeBlockHorizontal * 80,
          child: TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              maxLines: 1,
              decoration: InputDecoration(hintText: 'Search'),
              onChanged: (value) {
                String searchinput = value;
                print(searchinput);
              },
              onSubmitted: (value) {
                String searchinput = value;
                if (searchinput.length != 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SearchScreen(searchinput: searchinput)),
                  );
                }
              }),
        ),
        ExploreBody(),
      ],
    );
  }
}

// the body of the explore section: a scrollable list
class ExploreBody extends StatefulWidget {
  @override
  _ExploreBodyState createState() => _ExploreBodyState();
}

class _ExploreBodyState extends State<ExploreBody> {
  PageController _controller = PageController(
    initialPage: 0,
    viewportFraction: 1, // to be changed later
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: PageView(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: SizeConfig.safeBlockVertical * 25,
              width: SizeConfig.safeBlockHorizontal * 90,
              color: Colors.amber,
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ItemGridView(),
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal * 10,
                ),
                ItemGridView(),
              ],
            ),
          ],
        ),
        ItemListView(),
      ],
    ));
  }
}

class ItemGridView extends StatefulWidget {
  @override
  _ItemGridViewState createState() => _ItemGridViewState();
}

class _ItemGridViewState extends State<ItemGridView> {
  @override

  //determine if the item is favored or not
  bool isFavorite = false;

  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          height: SizeConfig.safeBlockVertical * 30,
          width: SizeConfig.safeBlockHorizontal * 40,
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: Colors.amber,
                    height: SizeConfig.safeBlockVertical * 20,
                    width: SizeConfig.safeBlockHorizontal * 40,
                  ),
                  Container(
                    child: Text("Title"),
                    height: SizeConfig.safeBlockVertical * 2,
                  ),
                  Container(
                    child: Text("Price"),
                    height: SizeConfig.safeBlockVertical * 2,
                  ),
                  Container(
                    child: Text("New Asia"),
                    height: SizeConfig.safeBlockVertical * 2,
                  ),
                ],
              ),
              Positioned(
                right: SizeConfig.safeBlockHorizontal * 3,
                top: SizeConfig.safeBlockVertical * 22,
                child: GestureDetector(
                    onTap: () {
                      isFavorite = !isFavorite;
                      setState(() {});
                    },
                    child: isFavorite
                        ? Icon(
                            Icons.favorite,
                            color: Colors.pink,
                          )
                        : Icon(
                            Icons.favorite_border,
                            color: Colors.pink,
                          )),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailScreen()),
          );
        });
  }
}

// To return a widget that scrolls down the page to view the items
class ItemListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _itemListView(context);
  }

  Widget _itemListView(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ItemGridView(),
              SizedBox(
                width: SizeConfig.safeBlockHorizontal * 10,
              ),
              ItemGridView(),
            ],
          );
        });
  }
}
