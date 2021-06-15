import 'dart:math' as math;

import 'package:cloudbase_core/cloudbase_core.dart';
import 'package:flutter/material.dart';
import 'room_page.dart';

import 'TravelBean.dart';
import 'card_page.dart';
import 'data.dart';
import 'detail_page.dart';

class MsgPage extends StatefulWidget {
  CloudBaseCore core;
  late String name;
  MsgPage(this.name,this.core);

  @override
  _MsgPageState createState() => _MsgPageState();
}

class _MsgPageState extends State<MsgPage> {

  var currentPage = images.length - 1.0;
  late PageController controller;

  var currentPage2 = images.length - 1.0;
  late PageController controller2;

  @override
  void initState() {
    controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });
    controller2 = PageController(initialPage: images.length - 1);
    controller2.addListener(() {
      setState(() {
        currentPage2 = controller2.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Text(
              "世界十大建筑",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 30,
              ),
            ),
          ),
          Container(
            height: 350,
            child: TravelWidget(TravelBean.generateTravelBean(),TravelBean.generateInformation()),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "五大建筑风格",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 150,
            child: MostPopularWidget(TravelBean.generateMostPopularBean(),TravelBean.generateInformation3()),
          ),
          Divider(),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Text(
              "中国古代建筑",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "与民风的碰撞",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                      ),
                    ),
                   GestureDetector(
                     onTap: (){
                       Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                         return RoomPage(show,widget.name,"中国古代建筑的展示区",widget.core);
                       }));
                     },
                    child:Text(
                      "View all",
                      style: TextStyle(
                        color: Color(0xffc1d2f0),
                        fontSize: 20,
                      ),
                    ),
                  )
                  ],
                ),
          ),
          Stack(
            children: <Widget>[
              // 两者堆叠在一起。通过PageView滑动的Controller来控制当前显示的page
              CardScrollWidget(currentPage,"古代"),
              Positioned.fill(
                child: PageView.builder(
                  itemCount: images.length,
                  controller: controller,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return Container();
                  },
                ),
              )
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Text(
            "中国现代建筑",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 25,
            ),
          ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "多样化的趋势",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                      ),
                    ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return RoomPage(show1,widget.name,"中国现代建筑的展示区",widget.core);
                      }));
                    },
                    child: Text(
                      "View all",
                      style: TextStyle(
                        color: Color(0xffc1d2f0),
                        fontSize: 20,
                      ),
                    ),
                  )
                  ],
                ),
          ),
          Stack(
            children: <Widget>[
              // 两者堆叠在一起。通过PageView滑动的Controller来控制当前显示的page
              CardScrollWidget(currentPage2,"现代"),
              Positioned.fill(
                child: PageView.builder(
                  itemCount: images1.length,
                  controller: controller2,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return Container();
                  },
                ),
              )
            ],
          ),
          Divider(),
          Container(
            height: 800,
            child: RightWidget(),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Text(
              "如何保护建筑？",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 25,
              ),
            ),
          ),
          Container(
            height: 350,
            child: TravelWidget(TravelBean.generateTravelBean1(),TravelBean.generateInformation1()),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "你知道这些建筑知识吗？",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 150,
            child: MostPopularWidget(TravelBean.generateMostPopularBean1(),TravelBean.generateInformation4()),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "穿越时空的旅程",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "空间维度的建筑",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                  ),
                ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return CardDemo(TravelBean.generateMostPopularBean2(),true);
                }));
              },
              child:
                Text(
                  "View all",
                  style: TextStyle(
                    color: Color(0xffc1d2f0),
                    fontSize: 20,
                  ),
                ),
            )
              ],
            ),
          ),
          Container(
            height: 250,
            child: TimePlaceWidget(TravelBean.generateMostPopularBean2()),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "时间维度的建筑",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                  ),
                ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return CardDemo(TravelBean.generateMostPopularBean3(),false);
                }));
              },
              child:
                Text(
                  "View all",
                  style: TextStyle(
                    color: Color(0xffc1d2f0),
                    fontSize: 20,
                  ),
                ),
            )
              ],
            ),
          ),
          Container(
            height: 250,
            child: TimePlaceWidget(TravelBean.generateMostPopularBean3()),
          ),
          Divider(),
        ],
      )
      ),
    );
  }
}

class TimePlaceWidget extends StatelessWidget {
  List<TravelBean> _list;
  TimePlaceWidget(this._list);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 15),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var bean = _list[index];
        return GestureDetector(
          child: Hero(
            tag: bean.url,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 30, right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      bean.url,
                      width: 170,
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          bean.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          bean.location,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: _list.length,
    );
  }
}

class MostPopularWidget extends StatelessWidget {
  List<TravelBean> _list ;
  List<TravelBean> _list1 ;

  MostPopularWidget(this._list,this._list1);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 15),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var bean = _list[index];
        var bean1 = _list1[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return DetailPage(bean,bean1);
            }));
          },
          child: Hero(
            tag: bean.url,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 30, right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      bean.url,
                      width: 170,
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          bean.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          bean.location,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: _list.length,
    );
  }
}

class TravelWidget extends StatelessWidget {
  List<TravelBean> _list ;
  List<TravelBean> _list1 ;

  TravelWidget(this._list,this._list1);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: PageController(viewportFraction: 0.9),
      itemBuilder: (context, index) {
        var bean = _list[index];
        var bean1 = _list1[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return DetailPage(bean,bean1);
            }));
          },
          child: Hero(
            tag: bean.url,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 30, right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      bean.url,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 60,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          bean.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          bean.location,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 30,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xffc1d2f0),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: _list.length,
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;
  String name = "";
  CardScrollWidget(this.currentPage,this.name);
  List<String> list_img = [];
  List<String> list_title = [];
  @override
  Widget build(BuildContext context) {
    if(name == "古代"){
      list_img = images;
      list_title = title;
    }
    if(name == "现代"){
      list_img = images1;
      list_title = title1;
    }
    return AspectRatio(
      aspectRatio: (12.0 / 16.0) * 1.2,
      child: LayoutBuilder(
        builder: (context, contraints) {
          var width = contraints.maxWidth;
          var height = contraints.maxHeight;
          var safeWidth = width - 2 * padding;
          var safeHeight = height - 2 * padding;
          var heightOfPrimaryCard = safeHeight;
          var widthOfPrimaryCard = heightOfPrimaryCard * 12 / 16;
          var primaryCardLeft = safeWidth - widthOfPrimaryCard;
          var horizontalInset = primaryCardLeft / 2;
          List<Widget> cardList = [];
          for (var i = 0; i < list_img.length; i++) {
            var leftPage = i - currentPage;
            bool isOnRight = leftPage > 0;
            var start = padding +
                math.max(
                    primaryCardLeft -
                        horizontalInset * -leftPage * (isOnRight ? 15 : 1),
                    0);
            var cardItem = Positioned.directional(
                top: padding + verticalInset * math.max(-leftPage, 0.0),
                bottom: padding + verticalInset * math.max(-leftPage, 0.0),
                start: start,
                textDirection: TextDirection.rtl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(3.0, 6.0),
                          blurRadius: 10.0)
                    ]),
                    child: AspectRatio(
                      aspectRatio: 12 / 16,
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Image.network(list_img[i], fit: BoxFit.cover),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // 设置标题
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: Text(
                                    list_title[i],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ));
            cardList.add(cardItem);
          }
          return Stack(
            children: cardList,
          );
        },
      ),
    );
  }
}

class RightWidget extends StatefulWidget {
  @override
  _RightWidgetState createState() => _RightWidgetState();
}

class _RightWidgetState extends State<RightWidget>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20, left: 15),
            child: Text(
              "知名建筑师",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10),
            child: SizedBox(
              height: 30,
              child: TabBar(
                isScrollable: true,
                unselectedLabelColor: Colors.black54,
                labelColor: Color(0xff718bba),
                controller: _tabController,
                indicator: BoxDecoration(
                  color: Color(0xffc1d2f0),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                tabs: <Widget>[
                  Tab(
                    text: " 中国 ",
                  ),
                  Tab(
                    text: " 英国 ",
                  ),
                  Tab(
                    text: " 美国 ",
                  ),
                  Tab(
                    text: " 日本 ",
                  ),
                  Tab(
                    text: " 荷兰 ",
                  ),
                  Tab(
                    text: " 西班牙 ",
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                RightBody(),
                RightBody1(),
                RightBody2(),
                RightBody3(),
                RightBody4(),
                RightBody5(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RightBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 15,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              "女性",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top:10)),
                    ClipOval(
                      child: Image.network(
                        "http://5b0988e595225.cdn.sohucs.com/images/20190308/b9b9ebf4f0c84ad7a0ace093738bbf2a.jpeg",
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                      Padding(padding: EdgeInsets.only(top:5)),
                      Text("林徽因",
                      style: TextStyle(
                        color: Colors.black54,
                        wordSpacing: 2,
                        letterSpacing: 2
                      ),),
                      Padding(padding: EdgeInsets.only(top:5)),
                      Text("参与国徽设计\n改造传统景泰蓝\n参加天安门人民英雄纪念碑设计",
                        style: TextStyle(
                            color: Colors.black54,
                        ),
                      textAlign: TextAlign.center,)
                    ]
                  ),
                ),
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                  child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top:10)),
                        ClipOval(
                          child: Image.network(
                            "http://5b0988e595225.cdn.sohucs.com/images/20190308/d807818740044506805c0d4b3a227420.jpeg",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("唐玉恩",
                          style: TextStyle(
                              color: Colors.black54,
                              wordSpacing: 2,
                              letterSpacing: 2
                          ),),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("主持过50余项大、中型公共建筑设计及50余项方案竞赛等设计，多次荣获国家和上海市优秀设计奖",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,)
                      ]
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              "男性",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                  child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top:10)),
                        ClipOval(
                          child: Image.network(
                            "http://5b0988e595225.cdn.sohucs.com/images/20190619/5018e0c2515146f0aaed4621078586ce.jpeg",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("马岩松",
                          style: TextStyle(
                              color: Colors.black54,
                              wordSpacing: 2,
                              letterSpacing: 2
                          ),),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("通过新的建筑形式在社会、城市和环境之间创造新的平衡",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,)
                      ]
                  ),
                ),
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                  child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top:10)),
                        ClipOval(
                          child: Image.network(
                            "https://img2.baidu.com/it/u=173454774,3765150596&fm=26&fmt=auto&gp=0.jpg",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("张永和",
                          style: TextStyle(
                              color: Colors.black54,
                              wordSpacing: 2,
                              letterSpacing: 2
                          ),),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("着眼于现代建筑与当下中国语境的融合，并把建筑视为一个生态系统本身",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,)
                      ]
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),
          )
        ],
      ),
    );
  }
}

class RightBody1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 15,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              "女性",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                  child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top:10)),
                        ClipOval(
                          child: Image.network(
                            "http://5b0988e595225.cdn.sohucs.com/images/20190619/e9d633e7f7a447c4ace6758ee4d3f724.jpeg",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("Zaha Hadid",
                          style: TextStyle(
                              color: Colors.black54,
                              wordSpacing: 2,
                              letterSpacing: 2
                          ),),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("她的实践将自然地形和人造系统结合在一起，导致了尖端技术的实验",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,)
                      ]
                  ),
                ),
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                  child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top:10)),
                        ClipOval(
                          child: Image.network(
                            "http://www.citiais.com/u/cms/www/201703/08161733715u.jpg",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("Amanda Levete",
                          style: TextStyle(
                              color: Colors.black54,
                              wordSpacing: 2,
                              letterSpacing: 2
                          ),),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("她整个的职业生涯都在通过非凡的建筑和家具来探索空间转化的潜力",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,)
                      ]
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              "男性",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                  child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top:10)),
                        ClipOval(
                          child: Image.network(
                            "http://5b0988e595225.cdn.sohucs.com/images/20190619/6d5984ecb9a244fdbff0619dbc38a886.jpeg",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("Thomas Heatherwick",
                          style: TextStyle(
                              color: Colors.black54,
                              wordSpacing: 2,
                              letterSpacing: 2
                          ),),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("自上世纪90年代末以来，已成为英国最具天赋和想象力的设计师之一",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,)
                      ]
                  ),
                ),
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                  child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top:10)),
                        ClipOval(
                          child: Image.network(
                            "http://5b0988e595225.cdn.sohucs.com/images/20190619/42cbde01af55463cac1e7bfc046c9c35.jpeg",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("Terry Farrell",
                          style: TextStyle(
                              color: Colors.black54,
                              wordSpacing: 2,
                              letterSpacing: 2
                          ),),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("他的背景城市设计方案，以及丰富的后现代主义作品，为他赢得了很高的声誉",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,)
                      ]
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),
          )
        ],
      ),
    );
  }
}

class RightBody2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 15,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              "女性",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                  child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top:10)),
                        ClipOval(
                          child: Image.network(
                            "http://5b0988e595225.cdn.sohucs.com/images/20190619/b736871af4e945edb664773a4e7c9cad.jpeg",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("Jeanne Gang",
                          style: TextStyle(
                              color: Colors.black54,
                              wordSpacing: 2,
                              letterSpacing: 2
                          ),),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("国际上公认她的创新使用材料和环境敏感的方法，珍妮探索设计在振兴城市的作用",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,)
                      ]
                  ),
                ),
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                  child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top:10)),
                        ClipOval(
                          child: Image.network(
                            "http://p2.itc.cn/images01/20201230/ab44d2a92b14472ebd246fe325fc4877.jpeg",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("Julie Eizenberg",
                          style: TextStyle(
                              color: Colors.black54,
                              wordSpacing: 2,
                              letterSpacing: 2
                          ),),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("向人们展现了社区项目和以人为本设计的价值及潜力",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,)
                      ]
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              "男性",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                  child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top:10)),
                        ClipOval(
                          child: Image.network(
                            "http://5b0988e595225.cdn.sohucs.com/images/20190619/d2a8249100264c61ba202f147ab98ab3.jpeg",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("Thom Mayne",
                          style: TextStyle(
                              color: Colors.black54,
                              wordSpacing: 2,
                              letterSpacing: 2
                          ),),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("一位享誉世界的建筑师，也是近几十年来唯一获得“建筑界奥斯卡”普利兹克奖的美国人",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,)
                      ]
                  ),
                ),
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                  child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top:10)),
                        ClipOval(
                          child: Image.network(
                            "http://5b0988e595225.cdn.sohucs.com/images/20190619/0da74dcf14144994ba0210e1a29e5ad3.jpeg",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("Steven Holl",
                          style: TextStyle(
                              color: Colors.black54,
                              wordSpacing: 2,
                              letterSpacing: 2
                          ),),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("擅长将新项目与具有特殊文化和历史意义的背景无缝地结合起来",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,)
                      ]
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),
          )
        ],
      ),
    );
  }
}

class RightBody3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 15,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              "女性",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                  child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top:10)),
                        ClipOval(
                          child: Image.network(
                            "https://img1.baidu.com/it/u=3491522914,1821263563&fm=26&fmt=auto&gp=0.jpgg",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("妹岛和世",
                          style: TextStyle(
                              color: Colors.black54,
                              wordSpacing: 2,
                              letterSpacing: 2
                          ),),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("她与SANAA建筑设计事务所的作品，多带有重要的“穿透性”风格",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,)
                      ]
                  ),
                ),
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                  child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top:10)),
                        ClipOval(
                          child: Image.network(
                            "https://img0.baidu.com/it/u=1249689075,2073927234&fm=26&fmt=auto&gp=0.jpg",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("长谷川逸子",
                          style: TextStyle(
                              color: Colors.black54,
                              wordSpacing: 2,
                              letterSpacing: 2
                          ),),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("作品并没有鲜明的代表元素，或者可以有迹可循的建筑表现手法",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,)
                      ]
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              "男性",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                  child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top:10)),
                        ClipOval(
                          child: Image.network(
                            "http://5b0988e595225.cdn.sohucs.com/images/20190619/30c339d172a64b43a0ae4988b215bada.jpeg",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("矶崎新",
                          style: TextStyle(
                              color: Colors.black54,
                              wordSpacing: 2,
                              letterSpacing: 2
                          ),),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("融合理性的现代主义结构、典雅的古典主义布局和装饰、又兼有东方的细腻构件和装饰特色",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,)
                      ]
                  ),
                ),
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                  child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top:10)),
                        ClipOval(
                          child: Image.network(
                            "http://5b0988e595225.cdn.sohucs.com/images/20190619/176f6d3bed504e3f8ebd303e9c427663.jpeg",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("伊东丰雄",
                          style: TextStyle(
                              color: Colors.black54,
                              wordSpacing: 2,
                              letterSpacing: 2
                          ),),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("当代“模拟”城市概念的建筑领军人物，是世界上最具创新性和影响力的建筑师之一",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,)
                      ]
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),
          )
        ],
      ),
    );
  }
}

class RightBody4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 15,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              "女性",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                  child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top:10)),
                        ClipOval(
                          child: Image.network(
                            "https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2Fm%3D3MBp3xaCQhzujCKmy9zdJawxRmfrCNtXQPethtTz5Pd1560915925239.jpg&thumbnail=650x2147483647&quality=80&type=jpg",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("Francine Houben",
                          style: TextStyle(
                              color: Colors.black54,
                              wordSpacing: 2,
                              letterSpacing: 2
                          ),),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("提到建筑设计的设计理念她认为，建筑必须打动所有感官",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,)
                      ]
                  ),
                ),
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                  child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top:10)),
                        ClipOval(
                          child: Image.network(
                            "http://www.333cn.com/cms/CMSware/resource/img/h001/h15/img201105051530237.jpg",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("Marlies Rohmer",
                          style: TextStyle(
                              color: Colors.black54,
                              wordSpacing: 2,
                              letterSpacing: 2
                          ),),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("对她来说，最重要的是她设计的建筑总能与周围的环境融为一体",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,)
                      ]
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              "男性",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                  child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top:10)),
                        ClipOval(
                          child: Image.network(
                            "http://5b0988e595225.cdn.sohucs.com/images/20190619/5e051cc047a0456796dc84bfc2d38687.jpeg",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("Winy Maas",
                          style: TextStyle(
                              color: Colors.black54,
                              wordSpacing: 2,
                              letterSpacing: 2
                          ),),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("其设计往往利用最前沿的技术探讨未来城市的发展,其建筑作品则体现了乌托邦式的理念与现实的融合",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,)
                      ]
                  ),
                ),
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                  child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top:10)),
                        ClipOval(
                          child: Image.network(
                            "http://5b0988e595225.cdn.sohucs.com/images/20190619/75dd6f7d8d85466b9421a45778fd72ec.jpeg",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("Rem Koolhass",
                          style: TextStyle(
                              color: Colors.black54,
                              wordSpacing: 2,
                              letterSpacing: 2
                          ),),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("库哈斯的事务所现在几乎只以大型建筑而闻名，比如中央电视台总部和西雅图图书馆",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,)
                      ]
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),
          )
        ],
      ),
    );
  }
}

class RightBody5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 15,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              "女性",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                  child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top:10)),
                        ClipOval(
                          child: Image.network(
                            "http://5b0988e595225.cdn.sohucs.com/images/20200307/0ae9eb83b1554e7c966dead4701b6989.jpeg",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("Carme Pigem",
                          style: TextStyle(
                              color: Colors.black54,
                              wordSpacing: 2,
                              letterSpacing: 2
                          ),),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("化“现代”于“本土”自然之中，化有形于无形空间之中",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,)
                      ]
                  ),
                ),
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                  child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top:10)),
                        ClipOval(
                          child: Image.network(
                            "https://i0.hdslb.com/bfs/article/90c311e3857e46feea4cc6061e5507915775804e.jpg@785w_1193h_progressive.webp",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("Benedetta Tagliabue",
                          style: TextStyle(
                              color: Colors.black54,
                              wordSpacing: 2,
                              letterSpacing: 2
                          ),),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("热衷于采用常人无法想象的奇异材质，将建筑复杂多变的线条尽可能地与周围环境联系起来",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,)
                      ]
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              "男性",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                  child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top:10)),
                        ClipOval(
                          child: Image.network(
                            "http://5b0988e595225.cdn.sohucs.com/images/20190619/d799a49b80a24d7baece3f2bb6f11f8a.jpeg",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("Rafael Moneo",
                          style: TextStyle(
                              color: Colors.black54,
                              wordSpacing: 2,
                              letterSpacing: 2
                          ),),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("他的作品以环境与建筑高度的融合在一起而著称，并且极力表现出现代主义风格",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,)
                      ]
                  ),
                ),
                Container(
                  width: 220,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                        color: Color(0x33757575),
                      ),
                    ],
                  ),
                  child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top:10)),
                        ClipOval(
                          child: Image.network(
                            "http://5b0988e595225.cdn.sohucs.com/images/20190619/c6b69e3f7f944374a7f39ae3d4eda652.jpeg",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("Santiago Calatrava",
                          style: TextStyle(
                              color: Colors.black54,
                              wordSpacing: 2,
                              letterSpacing: 2
                          ),),
                        Padding(padding: EdgeInsets.only(top:5)),
                        Text("将自己的风格定义为架起结构工程和建筑之间的桥梁",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,)
                      ]
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),
          )
        ],
      ),
    );
  }
}
