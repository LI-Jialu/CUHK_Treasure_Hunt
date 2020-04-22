import 'package:cuhk_treasure_hunt/classes/Item.dart';
import 'package:cuhk_treasure_hunt/screens/home_screen.dart';
import 'package:cuhk_treasure_hunt/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';

import '../utilities/constants.dart';

class FilterScreen extends StatefulWidget {
  double minprice = 0.0;
  double minnew = 0.0;
  bool giveawayfree = false;
  SearchScreen searchscreen;
  FilterScreen({this.searchscreen});
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    List<Widget> tagChips = [];
    Item.tags.forEach((tagstring) {
      tagChips.add(
        FilterChip(
          label: Text(tagstring),
          selected: widget.searchscreen.tags.contains(tagstring),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                widget.searchscreen.tags.add(tagstring);
              }
              else {
                widget.searchscreen.tags.removeWhere((String tag) {
                  return tag == tagstring;
                });
              }
            });
          }
        )
      );
    });
    print("all tags " + Item.tags.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter"),
      ),
      body: Column(
        children: <Widget>[
          /*Container(
            padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*5),
            height: SizeConfig.safeBlockVertical*5,
            alignment: Alignment.bottomLeft,
            child: Text("Price range", style: ksmall_black_textstyle),
          ),
          Container(
            height: SizeConfig.safeBlockVertical*5,
            child: Slider(
              value: widget.minprice,
              onChanged: (value){
                setState((){
                  widget.minprice = value;
                });
              }
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 0.5,),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*5),height: SizeConfig.safeBlockVertical*5,
            alignment: Alignment.bottomLeft,
            child: Text("New", style: ksmall_black_textstyle),
          ),
          Container(
            height: SizeConfig.safeBlockVertical*5,
            child: Slider(
              value: widget.minnew,
              onChanged: (value){
                setState((){
                  widget.minnew = value;
                });
              }
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 0.5,),
              ),
            ),
          ),
          Container(
            height: SizeConfig.safeBlockVertical*10,
            padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*5, right: SizeConfig.safeBlockHorizontal*5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Give away free", style: ksmall_black_textstyle),
                Switch(
                  value: widget.giveawayfree,
                  onChanged: (value){
                    setState((){
                      widget.giveawayfree = value;
                    });
                  },
                )
              ],
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 0.5,),
              ),
            ),
          ),
          Container(
            height: SizeConfig.safeBlockVertical*10,
            padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*5),
            child: Text("Tags", style: ksmall_black_textstyle),
            alignment: Alignment.centerLeft,
          ),
          */
          Container(
            child: Wrap(
              spacing: SizeConfig.safeBlockHorizontal * 3,
              children: tagChips,
              /*<Widget>[
                FilterChip(
                  label: Text("free"),
                  selected: widget.searchscreen.tags.contains("free"),
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        widget.searchscreen.tags.add("free");
                      }
                      else {
                        widget.searchscreen.tags.removeWhere((String tag) {
                          return tag == "free";
                        });
                      }
                    });
                  }
                ),
                FilterChip(
                  label: Text("other"),
                  selected: widget.searchscreen.tags.contains("other"),
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        widget.searchscreen.tags.add("other");
                      }
                      else {
                        widget.searchscreen.tags.removeWhere((String tag) {
                          return tag == "other";
                        });
                      }
                    });
                  }
                ),
              ],*/
            )
          )
        ],
      ),
    );
  }
}
