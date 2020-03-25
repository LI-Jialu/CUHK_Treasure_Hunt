import 'package:cuhk_treasure_hunt/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';

String titleInput;
String boughtPriceInput;
String sellingPriceInput;
String descriptionInput;
String locationInput;

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build post screen
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Post"),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text("Title"),
            Container(
              height: SizeConfig.safeBlockVertical * 10,
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
                Text("Bought price"),
                Container(
                  height: SizeConfig.safeBlockVertical * 10,
                  width: SizeConfig.safeBlockHorizontal * 40,
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
                Text("Selling price"),
                Container(
                  height: SizeConfig.safeBlockVertical * 10,
                  width: SizeConfig.safeBlockHorizontal * 40,
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
            Text("Description"),
            Container(
              height: SizeConfig.safeBlockVertical * 50,
              width: SizeConfig.safeBlockHorizontal * 80,
              child: TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                maxLines: 10,
                decoration:
                    InputDecoration(hintText: 'Descriptions of your item'),
                onChanged: (value) {
                  descriptionInput = value;
                  print(descriptionInput);
                },
              ),
            ),
            Text("Location"),
            Container(
              height: SizeConfig.safeBlockVertical * 10,
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
            Text("Choose tags"),
            Row(
              children: <Widget>[
                Container(
                  color: klogin_button_color,
                  width: SizeConfig.safeBlockHorizontal * 40,
                  height: SizeConfig.safeBlockVertical * 6,
                  child: Center(
                      child: Text(
                    'Deliverable',
                    style: klogin_button_text,
                  )),
                ),
                Container(
                  color: klogin_button_color,
                  width: SizeConfig.safeBlockHorizontal * 40,
                  height: SizeConfig.safeBlockVertical * 6,
                  child: Center(
                      child: Text(
                    'Give-away-free',
                    style: klogin_button_text,
                  )),
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
      ),
    );
  }
}
