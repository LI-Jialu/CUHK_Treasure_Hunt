import 'package:cuhk_treasure_hunt/classes/Item.dart';
import 'package:cuhk_treasure_hunt/classes/PostItem.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/screens/home_screen.dart';

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
        appBar: AppBar(),
        body: SafeArea(
          child: ListView(
            //separatorBuilder: (BuildContext context, int index) => const Divider(),
            //padding: const EdgeInsets.all(8),
            padding: EdgeInsets.only(
                left: SizeConfig.safeBlockHorizontal * 10,
                right: SizeConfig.safeBlockHorizontal * 10),
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Container(
                height: SizeConfig.safeBlockVertical * 5,
                alignment: Alignment.bottomLeft,
                child: Text('Title', style: ksmall_black_textstyle),
              ),
              Container(
                height: SizeConfig.safeBlockVertical * 5,
                width: SizeConfig.safeBlockHorizontal * 80,
                child: TextField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  maxLines: 1,
                  decoration: InputDecoration(hintText: 'Title of your item'),
                  onChanged: (value) {
                    name = value;
                    print(name);
                  },
                ),
              ),
              Divider(),
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
              Container(
                height: SizeConfig.safeBlockVertical * 5,
                alignment: Alignment.centerLeft,
                child: Text('Pictures', style: ksmall_black_textstyle),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 5,
                width: SizeConfig.safeBlockHorizontal * 38,
                child: OutlineButton(
                    color: Colors.amber,
                    textColor: Colors.black,
                    disabledTextColor: Colors.grey,
                    padding: EdgeInsets.all(8.0),
                    borderSide: BorderSide(color: Colors.grey, width: 0.5),
                    onPressed: () {
                      PostItem.showChoiceDialog(context);
                    },
                    child: Text("Select pictures")),
              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  PostItem.decideImageView(),
//                  PostItem.decideImageView(),
//                  PostItem.decideImageView(),
//                ],
//              ),
              PostItem.decideImageView(),

              Divider(),
              Container(
                height: SizeConfig.safeBlockVertical * 5,
                alignment: Alignment.centerLeft,
                child: Text('Description', style: ksmall_black_textstyle),
              ),
              Container(
                child: Container(
                  height: SizeConfig.safeBlockVertical * 20,
                  width: SizeConfig.safeBlockHorizontal * 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5),
                  ),
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
              Container(
                height: SizeConfig.safeBlockVertical * 5,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: Item.tags.length,
                  itemBuilder: (BuildContext context, int index) {
                    bool selected = tags.indexOf(index) != -1;
                    return Container(
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
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return VerticalDivider();
                  },
                ),
              ),
              Divider(),
              FlatButton(
                color: Colors.amber,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  PostItem.uploadImage(PostItem.picture);
                  PostItem.postItem(
                      "insert", name, price, quantity, description, basename);
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
