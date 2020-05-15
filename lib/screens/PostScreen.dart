/*
Post Item Screen Module

Module Name: Post Screen
Programmer: Hon Tik TSE, Chenyu HAN, Jialu LI, Zizhou TANG
Version: 1.0 (10 May 2020)

The widget of post item screen
*/

import 'dart:async';

import 'package:cuhk_treasure_hunt/classes/Item.dart';
import 'package:cuhk_treasure_hunt/classes/PostItem.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/utilities/SizeConfig.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/screens/HomeScreen.dart';

String name;
String price;
String quantity;
String description;
var basename = PostItem.picture.path.split('/').last;

//TODO: here returns a scaffold which is not a body. It needs to be modified either way(Steve)
class PostScreen extends StatefulWidget {
  const PostScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PostScreenState();
  }
}

class PostScreenState extends State<PostScreen> {
  List<int> tags = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build post screen
    SizeConfig().init(context);
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        // screen title
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Post an item"),
        ),
        body: SafeArea(
          child: ListView(
            //separatorBuilder: (BuildContext context, int index) => const Divider(),
            //padding: const EdgeInsets.all(8),
            padding: EdgeInsets.only(
                left: SizeConfig.safeBlockHorizontal * 5,
                right: SizeConfig.safeBlockHorizontal * 5),
            scrollDirection: Axis.vertical,
            children: <Widget>[
              // TextField to enter item title
              Container(
                height: SizeConfig.safeBlockVertical * 5,
                width: SizeConfig.safeBlockHorizontal * 90,
                child: TextField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: 'Title', border: InputBorder.none),
                  onChanged: (value) {
                    name = value;
                    print(name);
                  },
                ),
              ),
              Divider(),
              // TextField to enter item detail information
              Container(
                child: Container(
                  height: SizeConfig.safeBlockVertical * 20,
                  width: SizeConfig.safeBlockHorizontal * 80,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    maxLines: 10,
                    decoration: InputDecoration(
                        hintText: 'Detailed information',
                        border: InputBorder.none),
                    onChanged: (value) {
                      description = value;
                      print(description);
                    },
                  ),
                ),
              ),
              // add image bottom
              Row(children: <Widget>[
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 35,
                  width: SizeConfig.safeBlockHorizontal * 35,
                  child: OutlineButton(
                    color: Colors.amber,
                    textColor: Colors.black,
                    disabledTextColor: Colors.grey,
                    padding: EdgeInsets.all(8.0),
                    borderSide: BorderSide(color: Colors.transparent, width: 0),
                    onPressed: () async {
                      await PostItem.showChoiceDialog(context);
                      Timer(Duration(seconds: 5), () {
                        setState(() {});
                      });
                    },
                    // if an image is chosen, this bottom shows the image, otherwise it appears to be a plus sign
                    child: PostItem.decideImageView(),
                  ),
                ),
              ]),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  PostItem.decideImageView(),
//                  PostItem.decideImageView(),
//                  PostItem.decideImageView(),
//                ],
//              ),

              SizedBox(height: SizeConfig.safeBlockVertical * 2),

              Divider(),
              // other information of item to post
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: SizeConfig.safeBlockVertical * 5,
                    alignment: Alignment.centerLeft,
                    child: Text('Selling price', style: ksmall_black_textstyle),
                  ),
                  Container(
                    height: SizeConfig.safeBlockVertical * 5,
                    width: SizeConfig.safeBlockHorizontal * 50,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      maxLines: 1,
                      decoration: InputDecoration(hintText: 'Price for 1 item'),
                      onChanged: (value) {
                        price = value;
                        print(price);
                      },
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: SizeConfig.safeBlockVertical * 5,
                    alignment: Alignment.centerLeft,
                    child: Text('Quantity', style: ksmall_black_textstyle),
                  ),
                  Container(
                    height: SizeConfig.safeBlockVertical * 5,
                    width: SizeConfig.safeBlockHorizontal * 50,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      maxLines: 1,
                      decoration:
                          InputDecoration(hintText: 'Number of items to sell'),
                      onChanged: (value) {
                        quantity = value;
                        print(quantity);
                      },
                    ),
                  ),
                ],
              ),
              Divider(),
              // "Choose tags"
              Container(
                height: SizeConfig.safeBlockVertical * 5,
                alignment: Alignment.centerLeft,
                child: Text('Choose tags', style: ksmall_black_textstyle),
              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  SizedBox(
//                    height: SizeConfig.safeBlockVertical * 5,
//                    width: SizeConfig.safeBlockHorizontal * 38,
//                    child: OutlineButton(
//                        //color: Colors.white,
//                        textColor: Colors.black,
//                        disabledTextColor: Colors.grey,
//                        padding: EdgeInsets.all(8.0),
//                        borderSide: BorderSide(color: Colors.grey, width: 0.5),
//                        onPressed: () {},
//                        child: Text("Brand new")),
//                  ),
//                  SizedBox(
//                    height: SizeConfig.safeBlockVertical * 5,
//                    width: SizeConfig.safeBlockHorizontal * 38,
//                    child: OutlineButton(
//                        color: Colors.white,
//                        textColor: Colors.black,
//                        disabledTextColor: Colors.grey,
//                        padding: EdgeInsets.all(8.0),
//                        borderSide: BorderSide(color: Colors.grey, width: 0.5),
//                        onPressed: () {},
//                        child: Text("free")),
//                  ),
//                ],
//              ),

              // tag selector
              Container(
                height: SizeConfig.safeBlockVertical * 5,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: Item.tags.length,
                  itemBuilder: (BuildContext context, int index) {
                    bool selected = tags.indexOf(index) != -1;
                    return FilterChip(
                        label: Text(Item.tags[index]),
                        selected: selected,
                        onSelected: (bool value) {
                          if (value) {
                            setState(() {
                              tags.add(index);
                            });
                            print(tags);
                          } else {
                            setState(() {
                              tags.remove(index);
                            });
                            print(tags);
                          }
                        });
                    /*return Container(
                      height: SizeConfig.safeBlockVertical * 5,
                      width: SizeConfig.safeBlockHorizontal * 38,
                      color: !selected ? Colors.white : Colors.grey[300],
                      child: OutlineButton(
                          textColor: Colors.black,
                          padding: EdgeInsets.all(8.0),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.5),
                          onPressed: () {
                            if (!selected) {
                              setState(() {
                                tags.add(index);
                              });
                              print(tags);
                            } else {
                              setState(() {
                                tags.remove(index);
                              });
                              print(tags);
                            }
                          },
                          child: Text("${Item.tags[index]}")),
                    );*/
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return VerticalDivider();
                  },
                ),
              ),
              Divider(),
              // post bottom
              FlatButton(
                color: Colors.amber,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () async {
                  if (kIsWeb) {
                    // flutter web
                    String id = await PostItem.postItem("insert", name, price,
                        quantity, description, PostItem.webImageName);
                    PostItem.postTags(id, tags);
                    //Todo:Remove PostItem.webImageName?
                  } else {
                    // mobile
                    String imageName =
                        await PostItem.uploadImage(PostItem.picture);
                    String id = await PostItem.postItem("insert", name, price,
                        quantity, description, imageName);
                    PostItem.postTags(id, tags);
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Text(
                  "Post",
                  style: TextStyle(fontSize: 20.0),
                ),
              )
            ],
          ),
        ));
  }
}
