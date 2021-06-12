import 'package:flutter/material.dart';

import 'VocationBean.dart';
import 'img_page.dart';

class RoomPage extends StatefulWidget {
  late final List<VacationBean> list;
  late String name;
  late String page;
  RoomPage(this.list,this.name,this.page);

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(widget.page),
    backgroundColor: Color(0xff718bba),
    elevation: 0,
    ),
    body:
      Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 80,
              child: _buildContainer1(),
            )
          ],
        ),
      ),
    )
    );
  }


  Widget _buildContainer1() {
    return Container(
      child:  Padding(
          padding: const EdgeInsets.all(10.0),
          child: SafeArea(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1),
              itemBuilder: (context, index) {
                return _itemGrid1(index);
              },
              itemCount: widget.list.length,
            ),
          ),
        ),
      );
  }

  Widget _itemGrid1(index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ImgPage(VacationBean(widget.list[index].url, widget.list[index].name,widget.list[index].country)
              ,widget.name,false,false,false,false);
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
                      widget.list[index].url,
                      fit: BoxFit.fill,
                    ),
                  )
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 25,
                      left: 15,
                      child:  Text(
                        widget.list[index].name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 15,
                      child:  Text(
                        widget.list[index].country,
                        overflow: TextOverflow.ellipsis,
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

}
