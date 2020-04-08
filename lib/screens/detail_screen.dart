import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import '../utilities/constants.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}


class _DetailScreenState extends State<DetailScreen> {
  PageController _controller = PageController(
    initialPage: 0,
    viewportFraction: 1,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Container(
                  height: SizeConfig.safeBlockVertical*50,
                  width: SizeConfig.safeBlockHorizontal*100,
                  child: PageView(
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(color: Colors.amber),
                      Container(color: Colors.pink),
                      Container(color: Colors.purple),
                    ],
                  ),
                ),
                Container(
                  height: SizeConfig.safeBlockVertical*5,
                  padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*5, right: SizeConfig.safeBlockHorizontal*5),
                  alignment: Alignment.bottomLeft,
                  child: Text("Jimmy-Choo high heels", style: kmiddle_black_textstyle),
                ),
                Container(
                  height: SizeConfig.safeBlockVertical*5,
                  padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*5, right: SizeConfig.safeBlockHorizontal*5),
                  alignment: Alignment.topLeft,
                  child: Text("\$800", style: kmiddle_red_textstyle),
                ),
                Container(
                  height: SizeConfig.safeBlockVertical*10,
                  padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*5, right: SizeConfig.safeBlockHorizontal*5),
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      ClipOval(
                        child: Container(
                          height: SizeConfig.safeBlockVertical*8,
                          width: SizeConfig.safeBlockVertical*8,
                          color: Colors.amber,
                        ),
                      ),
                      Container(
                        padding:EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*3, right: SizeConfig.safeBlockHorizontal*5),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: SizeConfig.safeBlockVertical*5,
                              alignment: Alignment.bottomLeft,
                              child: Text("CHAN Tai Man", style: kmiddle_black_textstyle),
                            ),
                            Container(
                              height: SizeConfig.safeBlockVertical*5,
                              alignment: Alignment.topLeft,
                              child: Text("Woo Sing College", style: ksmall_black_textstyle),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: SizeConfig.safeBlockVertical*10,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SizedBox(width:SizeConfig.safeBlockHorizontal*3),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.5),
                          ),
                          height: SizeConfig.safeBlockVertical*5,
                          padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*1, right: SizeConfig.safeBlockHorizontal*1),
                          child: Center(child: Text("Brand new", style: ksmall_black_textstyle),),
                        ),
                      ),
                      SizedBox(width:SizeConfig.safeBlockHorizontal*3),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.5),
                          ),
                          height: SizeConfig.safeBlockVertical*5,
                          padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*1, right: SizeConfig.safeBlockHorizontal*1),
                          child: Center(child: Text("Brand new", style: ksmall_black_textstyle),),
                        ),
                      ),
                      SizedBox(width:SizeConfig.safeBlockHorizontal*3),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.5),
                          ),
                          height: SizeConfig.safeBlockVertical*5,
                          padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*1, right: SizeConfig.safeBlockHorizontal*1),
                          child: Center(child: Text("Brand new", style: ksmall_black_textstyle),),
                        ),
                      ),
                      SizedBox(width:SizeConfig.safeBlockHorizontal*3),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.5),
                          ),
                          height: SizeConfig.safeBlockVertical*5,
                          padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*1, right: SizeConfig.safeBlockHorizontal*1),
                          child: Center(child: Text("Brand new", style: ksmall_black_textstyle),),
                        ),
                      ),
                      SizedBox(width:SizeConfig.safeBlockHorizontal*3),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.5),
                          ),
                          height: SizeConfig.safeBlockVertical*5,
                          padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*1, right: SizeConfig.safeBlockHorizontal*1),
                          child: Center(child: Text("Brand new", style: ksmall_black_textstyle),),
                        ),
                      ),
                      SizedBox(width:SizeConfig.safeBlockHorizontal*3),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.5),
                          ),
                          height: SizeConfig.safeBlockVertical*5,
                          padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*1, right: SizeConfig.safeBlockHorizontal*1),
                          child: Center(child: Text("Brand new", style: ksmall_black_textstyle),),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*5, right: SizeConfig.safeBlockHorizontal*5),
                  height: SizeConfig.safeBlockVertical*5,
                  alignment: Alignment.centerLeft,
                  child: Text('More descriptions', style: ksmall_black_textstyle),
                ),
                Container(
                  padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*5, right: SizeConfig.safeBlockHorizontal*5, bottom: SizeConfig.safeBlockHorizontal*5),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5),
                    ),
                    padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal*5),
                    child: Text('Ankle-high buffed leather boots in black. Round toe. Ankle-high buffed leather boots in black. Ankle-high buffed leather boots in black. Round toe. \nPlease contact me if you like it!', style: ksmall_black_textstyle),
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical*1, bottom: SizeConfig.safeBlockVertical*1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5),
                  ),
                  height: SizeConfig.safeBlockVertical*5,
                  width: SizeConfig.safeBlockHorizontal*40,
                  child: Center(
                    child: Text('Like', style: ksmall_black_textstyle,),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5),
                  ),
                  height: SizeConfig.safeBlockVertical*5,
                  width: SizeConfig.safeBlockHorizontal*40,
                  child: Center(
                    child: Text('Contact', style: ksmall_black_textstyle,),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}