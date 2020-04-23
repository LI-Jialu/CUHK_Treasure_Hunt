import 'package:cuhk_treasure_hunt/classes/Item.dart';
import 'package:cuhk_treasure_hunt/widgets/item_list.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/screens/filter_screen.dart';
import 'package:cuhk_treasure_hunt/widgets/homescreen_explore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../utilities/constants.dart';
import 'package:cuhk_treasure_hunt/database/database.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

class SearchScreen extends StatefulWidget {
  List<String> tags = [];
  SearchScreen({Key key, @required this.searchinput}) : super(key: key) {
    Item.tags.forEach((tag){
      this.tags.add(tag);
    });
  }
  
  final String searchinput;

  @override
  _SearchScreenState createState() => _SearchScreenState();
}


class _SearchScreenState extends State<SearchScreen> {
  String sorttype = 'Recommended';
  final List<String> _sorttypename = [
    'Newest',
    'Recommended',
    'Nearest',
    'Highest reputation',
  ];
  Future<Response> _searchresults;
  Future<Response> getSearchResults() async {
    print("try getting search results!");
    Response searchresults;
    searchresults =
        await Database.get("/data/search.php?search=" + widget.searchinput, "");
    print("search results got!");
    print(searchresults.body);
    return searchresults;
  }

  @override
  @mustCallSuper
  void didChangeDependencies() {
    super.didChangeDependencies();
    this._searchresults = getSearchResults();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return FutureBuilder<Response>(
      future: _searchresults,
      builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
        List<Widget> childrenofcolumn = <Widget>[
          Container(
            child: Align(
              alignment: Alignment(-0.9, 0.0),
              child: Text(
                widget.searchinput,
                style: ksearch_keyword_textstyle,
              ),
            ),
            height: SizeConfig.safeBlockVertical * 10,
          ),
          Container(
            padding: EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 1),
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5),
                  ),
                  height: SizeConfig.safeBlockVertical * 5,
                  width: SizeConfig.safeBlockHorizontal * 40,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 1,
                      right: SizeConfig.safeBlockHorizontal * 1),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: sorttype,
                      style: ksmall_black_textstyle,
                      items: <DropdownMenuItem>[
                        DropdownMenuItem(value: 'Newest', child: Text('Newest'),),
                        DropdownMenuItem(value: 'Recommended', child: Text('Recommended'),),
                        DropdownMenuItem(value: 'Highest reputation', child: Text('Highest reputation'),),
                        DropdownMenuItem(value: 'Highest Price', child: Text('Highest Price'),),
                        DropdownMenuItem(value: 'Lowest Price', child: Text('Lowest Price'),),
                      ],
                      onChanged: (value) {
                        setState(() {
                          sorttype = value;
                        });
                      },
                    ),
                  ),
                ),
                GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.5),
                      ),
                      height: SizeConfig.safeBlockVertical * 5,
                      width: SizeConfig.safeBlockHorizontal * 40,
                      child: Center(
                        child: Text(
                          'Filter',
                          style: ksmall_black_textstyle,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FilterScreen(searchscreen: widget)),
                      );
                    }),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ),
          // Expanded(child: Container(color: Colors.amber,),)
          // Expanded(child: ItemListView(),)
        ];
        if (snapshot.hasData) {
          var resultlist = json.decode(snapshot.data.body);
          print(resultlist.runtimeType);
          print(resultlist is List<dynamic>);
          if (resultlist.isEmpty) {
            childrenofcolumn.add(
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Sorry! No results found!'),
                ),
                height: SizeConfig.safeBlockVertical * 10,
              ),
            );
          } else {
            print(resultlist[0].runtimeType);
            List<Item> itemlist = [];
            resultlist.forEach((resultmap) {
              itemlist.add(Item.fromJson(resultmap));
            });
            if (sorttype == "Highest reputation") {
              print("sort again! highest reputation!");
              //itemlist[1].reputation = "1";
              itemlist.sort((left, right) => double.parse(left.reputation).compareTo(double.parse(right.reputation)));
              print(itemlist[0].name);
            }
            else if (sorttype == "Recommended" || sorttype == "Nearest") {
              print("sort again! recommended");
              itemlist.sort((left, right) => int.parse(right.item_id).compareTo(int.parse(left.item_id)));
            }
            else if (sorttype == "Newest") {
              print("sort again! newest");
              itemlist.sort((left, right) => int.parse(left.item_id).compareTo(int.parse(right.item_id)));
            }
            else if (sorttype == "Highest Price") {
              print("sort again!");
              itemlist.sort((left, right) => double.parse(right.price).compareTo(double.parse(left.price)));
            }
            else if (sorttype == "Lowest Price") {
              print("sort again!");
              itemlist.sort((left, right) => double.parse(left.price).compareTo(double.parse(right.price)));
            }
            childrenofcolumn.add(
              Expanded(
                child: /*ItemListView(itemlist, widget.tags),*/ItemListView(itemlist),
              )
            );
          }
        } else if (snapshot.hasError) {
          childrenofcolumn.add(
            Container(
              child: Align(
                alignment: Alignment.center,
                child: Text('Error: ${snapshot.error}'),
              ),
              height: SizeConfig.safeBlockVertical * 10,
            ),
          );
        } else {
          childrenofcolumn.add(
            Container(
              child: Align(
                alignment: Alignment.center,
                child: Center(
              child: Container(
                width: SizeConfig.safeBlockHorizontal*30,
                height: SizeConfig.safeBlockVertical*30,
                child: SpinKitWave(
                  color: Colors.teal,
                  size: 100.0,
                ),
              ),
            ),
              ),
              height: SizeConfig.safeBlockVertical*40,
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text("Searching results"),
          ),
          body: Column(
            children: childrenofcolumn,
          ),
        );
      },
    );
  }
}
