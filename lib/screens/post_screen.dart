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
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                left: SizeConfig.safeBlockHorizontal * 10,
                right: SizeConfig.safeBlockHorizontal * 5),
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
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    left: SizeConfig.safeBlockHorizontal * 10,
                    right: SizeConfig.safeBlockHorizontal * 5),
                height: SizeConfig.safeBlockVertical * 5,
                alignment: Alignment.bottomLeft,
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
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    left: SizeConfig.safeBlockHorizontal * 10,
                    right: SizeConfig.safeBlockHorizontal * 5),
                height: SizeConfig.safeBlockVertical * 5,
                alignment: Alignment.bottomLeft,
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
          Container(
            padding: EdgeInsets.only(
                left: SizeConfig.safeBlockHorizontal * 10,
                right: SizeConfig.safeBlockHorizontal * 5),
            height: SizeConfig.safeBlockVertical * 5,
            alignment: Alignment.bottomLeft,
            child: Text('Description', style: ksmall_black_textstyle),
          ),
          Container(
            padding: EdgeInsets.only(
              left: SizeConfig.safeBlockHorizontal * 5,
              right: SizeConfig.safeBlockHorizontal * 5,
            ),
            child: Container(
              height: SizeConfig.safeBlockVertical * 20,
              width: SizeConfig.safeBlockHorizontal * 80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.5),
              ),
              padding: EdgeInsets.only(
                  left: SizeConfig.safeBlockHorizontal * 5,
                  right: SizeConfig.safeBlockHorizontal * 5),
              child: TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                maxLines: 10,
                decoration: InputDecoration(
                    hintText: 'Detailed information', border: InputBorder.none),
                onChanged: (value) {
                  descriptionInput = value;
                  print(descriptionInput);
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: SizeConfig.safeBlockHorizontal * 10,
                right: SizeConfig.safeBlockHorizontal * 5),
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
          Container(
            padding: EdgeInsets.only(
                left: SizeConfig.safeBlockHorizontal * 10,
                right: SizeConfig.safeBlockHorizontal * 5),
            height: SizeConfig.safeBlockVertical * 5,
            alignment: Alignment.bottomLeft,
            child: Text('Choose tags', style: ksmall_black_textstyle),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.5),
                ),
                height: SizeConfig.safeBlockVertical * 5,
                width: SizeConfig.safeBlockHorizontal * 30,
                child: Center(
                  child: Text("Brand new"),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.5),
                ),
                height: SizeConfig.safeBlockVertical * 5,
                width: SizeConfig.safeBlockHorizontal * 30,
                child: Center(
                  child: Text("Brand new"),
                ),
              ),
            ],
          ),
          Container(
            color: klogin_button_color,
            width: SizeConfig.safeBlockHorizontal * 80,
            height: SizeConfig.safeBlockVertical * 6,
            child: Center(
                child: Text(
              'Post',
              style: klogin_button_text,
            )),
          ),
        ],
      ),
    );
  }
}
