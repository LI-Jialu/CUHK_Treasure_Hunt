import 'package:cuhk_treasure_hunt/classes/Item.dart';
import 'package:cuhk_treasure_hunt/screens/detail_screen.dart';
import 'package:cuhk_treasure_hunt/screens/search_screen.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:cuhk_treasure_hunt/widgets/item_list.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:http/http.dart';

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

  Future<Response> _recommendresults;
  Future<Response> getSearchResults() async {
    Response recommendresults;
    recommendresults = await Database.get("/data/search.php?search=", "");
    print("search results got!");
    return recommendresults;
  }

  @override
  @mustCallSuper
  void didChangeDependencies() {
    super.didChangeDependencies();
    this._recommendresults = getSearchResults();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    SizeConfig().init(context);
    
    return FutureBuilder<Response>(
      future: _recommendresults,
      builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
        List<Widget> firstpage = [
          ItemGridView(Item("Loading...")),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal * 10,
          ),
          ItemGridView(Item("Loading...")),
        ];
        List<Item> secondpage = [Item("Loading..."), Item("Loading...")];
        if (snapshot.hasData) {
          var resultlist = json.decode(snapshot.data.body);
          firstpage[0] = ItemGridView(Item.fromJson(resultlist[0]));
          firstpage[2] = ItemGridView(Item.fromJson(resultlist[1]));
          secondpage = [];
          resultlist.forEach((resultmap) {
            secondpage.add(Item.fromJson(resultmap));
          });
        }
        else return Text("Loading...");
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
              children: firstpage,
            ),
          ],
        ),
        ItemListView(secondpage),
      ],
    )
    );
    }
    );

    
  }
}

