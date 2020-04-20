import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/screens/filter_screen.dart';
import 'package:cuhk_treasure_hunt/widgets/homescreen_explore.dart';
import '../utilities/constants.dart';
import 'package:cuhk_treasure_hunt/database/database.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key, @required this.searchinput}) : super(key: key);
  final String searchinput;
  String sorttype = 'Recommended';
  
  @override
  _SearchScreenState createState() => _SearchScreenState();
}


class _SearchScreenState extends State<SearchScreen> {
  final List<String> _sorttypename = [
    'Newest', 'Recommended', 'Nearest', 'Highest reputation',
  ];
  Future<Response> _searchresults;
  Future<Response> getSearchResults() async {
    print("we are in this part!");
    Response searchresults;
    searchresults = await Database.get("/data/search.php?search=" + widget.searchinput, "");
    print("we did this part");
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
              child: Text(widget.searchinput, style: ksearch_keyword_textstyle,),
            ),
            height: SizeConfig.safeBlockVertical*10,
          ),
          Container(
            padding: EdgeInsets.only(bottom: SizeConfig.safeBlockVertical*1),
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5),
                  ),
                  height: SizeConfig.safeBlockVertical*5,
                  width: SizeConfig.safeBlockHorizontal*40,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*1, right: SizeConfig.safeBlockHorizontal*1),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: widget.sorttype,
                      style: ksmall_black_textstyle,
                      items: <DropdownMenuItem>[
                        DropdownMenuItem(value: 'Newest', child: Text('Newest'),),
                        DropdownMenuItem(value: 'Recommended', child: Text('Recommended'),),
                        DropdownMenuItem(value: 'Nearest', child: Text('Nearest'),),
                        DropdownMenuItem(value: 'Highest reputation', child: Text('Highest reputation'),),
                      ],
                      onChanged: (value){
                        setState(() {
                          widget.sorttype = value;
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
                    height: SizeConfig.safeBlockVertical*5,
                    width: SizeConfig.safeBlockHorizontal*40,
                    child: Center(
                      child: Text('Filter', style: ksmall_black_textstyle,),
                    ),
                  ),
                  onTap: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => FilterScreen()),
                    );
                  }
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ),
          //Expanded(child: Container(color: Colors.amber,),)
          //Expanded(child: ItemListView(),)
        ];
        if (snapshot.hasData) {
          childrenofcolumn.add(
            Text(snapshot.data.body)
          );
        }
        else if (snapshot.hasError) {
          childrenofcolumn.add(
            Text('Error: ${snapshot.error}')
          );
        }
        else {
          childrenofcolumn.add(
            Text('Loading...')
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