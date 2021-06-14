import 'package:cloudbase_core/cloudbase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'VocationBean.dart';
import 'img_page.dart';

class FrontWidget extends StatefulWidget {
  CloudBaseCore core;
  Function open;
  final String name;
  final String text;
  final List publish;
  final List favorite;
  final List star;


  FrontWidget(this.open,this.name,this.text,this.publish,this.favorite,this.star,this.core);

  @override
  _FrontWidgetState createState() => _FrontWidgetState();
}

class _FrontWidgetState extends State<FrontWidget>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
              ),
              child: Container(
                  height: 60,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Center(
                                child: Text(
                                  widget.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                        ),
                        )
                      ]
                  )
              )
            ),
            Container(
              color: Color(0xffeaf2f8),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 0,
                ),
                child: Text(
                  widget.text,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xff266ed5),
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
              ),
              child: Container(
                height: 40,
                child: TabBar(
                  isScrollable: true,
                  labelColor: Colors.black54,
                  controller: _tabController,
                  tabs: <Widget>[
                    Tab(
                      child: Text(" —发 布— "),
                    ),
                    Tab(
                      child: Text(" —点 赞— "),
                    ),
                    Tab(
                      child: Text(" —收 藏— "),
                    ),
                    Tab(
                      child: Text(" —诗 句— "),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 180,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  _buildContainer(),
                  _buildContainer1(),
                  _buildContainer2(),
                  _buildContainer3(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContainer() {
    return Container(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SafeArea(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1),
              itemBuilder: (context, index) {
                return _itemGrid(index);
              },
              itemCount: widget.publish.length,
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemGrid(index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ImgPage(VacationBean(widget.publish[index]["url"], "",widget.publish[index]["text"])
              ,widget.name,true,true,false,false,widget.core);
        }));
      },
      child:
      InkWell(
        child: Container(
          color: Colors.white,
          height: 120,
          padding: EdgeInsets.all(0),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      widget.publish[index]["url"],
                      fit: BoxFit.fill,
                    ),
                  )
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 15,
                      left: 15,
                      child:  Text(
                        widget.publish[index]["text"],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContainer1() {
    return Container(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SafeArea(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1),
              itemBuilder: (context, index) {
                return _itemGrid1(index);
              },
              itemCount: widget.favorite.length,
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemGrid1(index) {
    return GestureDetector(
        onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return ImgPage(VacationBean(widget.favorite[index]["url"], widget.favorite[index]["name"],widget.favorite[index]["text"])
            ,widget.name,true,false,true,false,widget.core);
      }));
    },
    child:
      InkWell(
      child: Container(
        color: Colors.white,
        height: 120,
        padding: EdgeInsets.all(0),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
              child: Image.network(
                widget.favorite[index]["url"],
                fit: BoxFit.fill,
              ),
              )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 30,
                    left: 15,
                    child:  Text(
                      widget.favorite[index]["name"],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                  ),
                  Positioned(
                    bottom: 15,
                    left: 15,
                    child:  Text(
                      widget.favorite[index]["text"],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }

  Widget _buildContainer2() {
    return Container(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SafeArea(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1),
              itemBuilder: (context, index) {
                return _itemGrid2(index);
              },
              itemCount: widget.star.length,
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemGrid2(index) {
    return GestureDetector(
        onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return ImgPage(VacationBean(widget.star[index]["url"], widget.star[index]["name"],widget.star[index]["text"])
            ,widget.name,true,false,false,true,widget.core);
      }));
    },
    child:
      InkWell(
      child: Container(
        color: Colors.white,
        height: 120,
        padding: EdgeInsets.all(0),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.star[index]["url"],
                    fit: BoxFit.fill,
                  ),
                )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 30,
                    left: 15,
                    child:  Text(
                      widget.star[index]["name"],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    left: 15,
                    child:  Text(
                      widget.star[index]["text"],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    )
    );
  }

  Widget _buildContainer3() {
    return Container(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
        padding: EdgeInsets.only(left: 20,top: 20,bottom: 20,right: 20),
        child: ListView(
           children: <Widget>[
             Padding(padding: EdgeInsets.only(top:8)),
             Text("玩新庭树因咏所怀",textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: Colors.black54,letterSpacing: 3,wordSpacing: 3),),
             Text("【唐】白居易",textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: Colors.black54,letterSpacing: 3,wordSpacing: 3)),
             Text("霭霭四月初，新树叶成阴。\n动摇风景丽，盖覆庭院深。\n下有无事人，竟日此幽寻。\n岂惟玩时物，亦可开烦襟。\n时与道人语，或听诗客吟。\n度春足芳色，入夜多鸣禽。\n偶得幽闲境，遂忘尘俗心。\n始知真隐者，不必在山林。",
             textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: Colors.black54,letterSpacing: 3,wordSpacing: 3)),
             Padding(padding: EdgeInsets.only(top:8)),
             Divider(),
             Padding(padding: EdgeInsets.only(top:8)),
             Text("滕王阁诗",textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: Colors.black54,letterSpacing: 3,wordSpacing: 3)),
             Text("【唐】王勃",textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: Colors.black54,letterSpacing: 3,wordSpacing: 3)),
             Text("滕王高阁临江渚，佩玉鸣鸾罢歌舞。\n画栋朝飞南浦云，珠帘暮卷西山雨。\n闲云潭影日悠悠，物换星移几度秋。\n阁中帝子今何在？槛外长江空自流。",
               textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: Colors.black54,letterSpacing: 3,wordSpacing: 3)),
             Padding(padding: EdgeInsets.only(top:8)),
             Divider(),
             Padding(padding: EdgeInsets.only(top:8)),
             Text("虞美人 ",textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: Colors.black54,letterSpacing: 3,wordSpacing: 3)),
             Text("【宋】苏轼",textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: Colors.black54,letterSpacing: 3,wordSpacing: 3)),
             Text("深深庭院清明过，桃李初红破。\n柳丝搭在玉阑干，\n帘外潇潇微雨、做轻寒。\n晚晴台榭增明媚，已拼花前醉。\n更阑人静月侵廊，\n独自行来行去、好思量。",
                 textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: Colors.black54,letterSpacing: 3,wordSpacing: 3)),
             Padding(padding: EdgeInsets.only(top:8)),
           ]
        ),
      ),
      )
    );
  }

}
