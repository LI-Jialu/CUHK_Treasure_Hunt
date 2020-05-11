/*
Search Screen Module

Module Name: Search Screen
Programmer: Hon Tik TSE, Chenyu HAN, Jialu LI, Zizhou TANG
Version: 1.0 (10 May 2020)

The widget of search screen
*/

import 'package:cuhk_treasure_hunt/classes/Item.dart';
import 'package:cuhk_treasure_hunt/widgets/item_list.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/screens/filter_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../utilities/constants.dart';
import 'package:cuhk_treasure_hunt/database/database.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

// search screen class
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

// class state
class _SearchScreenState extends State<SearchScreen> {
  String sorttype = 'Recommended';
  List<String> tags;
  final List<String> _sorttypename = [
    'Newest',
    'Recommended',
    'Nearest',
    'Highest reputation',
  ];

  Future<List<Item>> _itemlist;

  // function to get search result in form of list
  Future<List<Item>> getSearchResults() async {
    Response searchresults;
    searchresults =
        await Database.get("/data/search.php?search=" + widget.searchinput, "");
    List<Item> itemlist = [];
    var resultlist = json.decode(searchresults.body);
    for (int i = 0; i < resultlist.length; i++) {
      var resultmap = resultlist[i];
      Item newItem = Item.fromJson(resultmap);
      Response tagsinfo = await Database.get("/data/tags.php?item_id=" + newItem.item_id, "");
      var taglist = json.decode(tagsinfo.body);
      taglist.forEach((tag){
        newItem.taglist.add(tag);
      });
      itemlist.add(newItem);
    }
    return itemlist;
  }

  @override
  @mustCallSuper
  void didChangeDependencies() {
    super.didChangeDependencies();
    this._itemlist = getSearchResults();
  }

  // state builder
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    tags = widget.tags;
    // to get search result requires time, thus widget to return is built in the future
    return FutureBuilder<List<Item>>(
      future: _itemlist,
      builder: (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
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
          // sort method and filter
          Container(
            padding: EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 1),
            child: Row(
              children: <Widget>[
                // sort method
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
                // filter button
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
                      setState((){
                        tags = widget.tags;
                      });
                    }),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ),
        ];
        // if item list has gotten, show item list
        if (snapshot.hasData) {
          {
            List<Item> itemlist = [];
            snapshot.data.forEach((item) {
              bool hastag = true;
              item.taglist.forEach((tag){
                if (!tags.contains(tag)) hastag = false;
              });
              if (hastag) itemlist.add(item);
            });
            if (sorttype == "Highest reputation") {
              itemlist.sort((left, right) => double.parse(left.reputation).compareTo(double.parse(right.reputation)));
            }
            else if (sorttype == "Recommended" || sorttype == "Nearest") {
              itemlist.sort((left, right) => int.parse(right.item_id).compareTo(int.parse(left.item_id)));
            }
            else if (sorttype == "Newest") {
              itemlist.sort((left, right) => int.parse(right.item_id).compareTo(int.parse(left.item_id)));
            }
            else if (sorttype == "Highest Price") {
              itemlist.sort((left, right) => double.parse(right.price).compareTo(double.parse(left.price)));
            }
            else if (sorttype == "Lowest Price") {
              itemlist.sort((left, right) => double.parse(left.price).compareTo(double.parse(right.price)));
            }
            childrenofcolumn.add(
              Expanded(
                child: /*ItemListView(itemlist, widget.tags),*/ItemListView(itemlist),
              )
            );
          }
        } 
        // otherwise show error or loading message
        else if (snapshot.hasError) {
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
