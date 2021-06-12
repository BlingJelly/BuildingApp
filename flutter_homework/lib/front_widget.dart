import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'VocationBean.dart';
import 'img_page.dart';

class FrontWidget extends StatefulWidget {
  Function open;
  final String name;
  final String text;
  final List publish;
  final List favorite;
  final List star;


  FrontWidget(this.open,this.name,this.text,this.publish,this.favorite,this.star);

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
                      child: Text(" —创 意— "),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 80,
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
              ,widget.name,true,true,false,false);
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
            ,widget.name,true,false,true,false);
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
            ,widget.name,true,false,false,true);
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
        child: Text(" "),
      ),
    );
  }

}
