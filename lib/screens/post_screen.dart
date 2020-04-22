import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter/material.dart';

String titleInput;
String boughtPriceInput;
String sellingPriceInput;
String descriptionInput;
String locationInput;

//TODO: here returns a scaffold which is not a body. It needs to be modified either way(Steve)
class PostScreen extends StatelessWidget {
  const PostScreen({Key key}) : super(key: key);

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
                    titleInput = value;
                    print(titleInput);
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
                    child: Text('Bought price', style: ksmall_black_textstyle),
                  ),
                  Container(
                    height: SizeConfig.safeBlockVertical * 5,
                    width: SizeConfig.safeBlockHorizontal * 50,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      maxLines: 1,
                      decoration:
                          InputDecoration(hintText: 'The price you bought it.'),
                      onChanged: (value) {
                        boughtPriceInput = value;
                        print(boughtPriceInput);
                      },
                    ),
                  ),
                ],
              ),
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
                      decoration: InputDecoration(
                          hintText: 'The price you want to sell at'),
                      onChanged: (value) {
                        sellingPriceInput = value;
                        print(sellingPriceInput);
                      },
                    ),
                  ),
                ],
              ),
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
                      descriptionInput = value;
                      print(descriptionInput);
                    },
                  ),
                ),
              ),
              Divider(),
              Container(
                height: SizeConfig.safeBlockVertical * 5,
                alignment: Alignment.bottomLeft,
                child: Text('Location', style: ksmall_black_textstyle),
              ),
              Container(
                height: SizeConfig.safeBlockVertical * 5,
                width: SizeConfig.safeBlockHorizontal * 80,
                child: TextField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  maxLines: 1,
                  decoration: InputDecoration(hintText: 'Delivering location'),
                  onChanged: (value) {
                    locationInput = value;
                    print(locationInput);
                  },
                ),
              ),
              Divider(),
              Container(
                height: SizeConfig.safeBlockVertical * 5,
                alignment: Alignment.centerLeft,
                child: Text('Choose tags', style: ksmall_black_textstyle),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 5,
                    width: SizeConfig.safeBlockHorizontal * 38,
                    child: OutlineButton(
                        //color: Colors.white,
                        textColor: Colors.black,
                        disabledTextColor: Colors.grey,
                        padding: EdgeInsets.all(8.0),
                        borderSide: BorderSide(color: Colors.grey, width: 0.5),
                        onPressed: () {},
                        child: Text("Brand new")),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 5,
                    width: SizeConfig.safeBlockHorizontal * 38,
                    child: OutlineButton(
                        color: Colors.white,
                        textColor: Colors.black,
                        disabledTextColor: Colors.grey,
                        padding: EdgeInsets.all(8.0),
                        borderSide: BorderSide(color: Colors.grey, width: 0.5),
                        onPressed: () {},
                        child: Text("free")),
                  ),
                ],
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
                  /*...*/
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
