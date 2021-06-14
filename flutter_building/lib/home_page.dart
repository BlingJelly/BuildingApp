import 'dart:math';

import 'package:cloudbase_core/cloudbase_core.dart';
import 'package:flutter/material.dart';
import 'publish_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'VocationBean.dart';
import 'img_page.dart';

class HomePage extends StatefulWidget {
  CloudBaseCore core;
  final String name;
  HomePage(this.name,this.core);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top:  20,
                    left: 20,
                    right: 20
                  ),
                  child: Text(
                    "       在建筑中，人的自豪感、人对万有引力的胜利和追求权力的意志都呈现出看得见的形状。"
                        "建筑是一种权力的雄辩术。\n",
                    style: TextStyle(
                      letterSpacing: 1.3,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      height: 1.3,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  widthFactor: 4.8,
                  child: Text(
                    "————尼采",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      height:0,
                    ),
                  ),
                ),
                Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 560,
                        child: PageViewWidget(widget.name,widget.core),
                      ),
                    ]
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + kToolbarHeight,
                      left: 52,
                      right: 52,
                      bottom: 20
                  ), // 宽度无限，跟父控件保持一致
                    child: SizedBox(
                        width: double.infinity, // 宽度无限，跟父控件保持一致
                        child:  RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          onPressed: () async {
                            if (widget.name == "") {
                              Fluttertoast.showToast(msg: '尚未登录', fontSize: 14,gravity: ToastGravity.SNACKBAR,timeInSecForIosWeb: 2,textColor: Colors.white,backgroundColor: Colors.red,);
                            } else  {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PublishPage(widget.name,"发布作品",VacationBean("","",""),widget.core)),
                              );
                            }
                          },
                          child: Text(
                              "发 布 作 品",
                          style: TextStyle(
                            color: Colors.white,
                          fontSize: 18)),
                          color: Color(0xffc1d2f0),
                        ),
                    )
                ),
              ],
            )
          )
      ),
    );
  }
}

class PageViewWidget extends StatefulWidget {
  CloudBaseCore core;
  final String name;
  PageViewWidget(this.name,this.core);

  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget>{
  List<VacationBean> _list = VacationBean.generate();

  PageController? pageController;

  double viewportFraction = 0.85;

  double? pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController =
    PageController(initialPage: 0, viewportFraction: viewportFraction)
      ..addListener(() {
        setState(() {
          pageOffset = pageController!.page;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemBuilder: (context, index) {
        double scale = max(viewportFraction,
            (1 - (pageOffset! - index).abs()) + viewportFraction);

        double angle = (pageOffset! - index).abs();

        if (angle > 0.5) {
          angle = 1 - angle;
        }

        var bean = _list[index];

        return GestureDetector(
            onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return ImgPage(bean,widget.name,false,false,false,false,widget.core);
          }));
        },
          child: Container(
          padding: EdgeInsets.only(
            right: 10,
            left: 10,
            top: 100 - scale * 25,
            bottom: 10,
          ),
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(
                3,
                2,
                0.001,
              )
              ..rotateY(angle),
            alignment: Alignment.center,
            child: Stack(
              children: <Widget>[
                Image.network(
                  _list[index].url,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.fill,
                  alignment: Alignment((pageOffset! - index).abs() * 0.5, 0),
                ),
                Positioned(
                  bottom: 60,
                  left: 20,
                  child: AnimatedOpacity(
                    opacity: angle == 0 ? 1 : 0,
                    duration: Duration(
                      milliseconds: 200,
                    ),
                    child: Text(
                      _list[index].country,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 20,
                  child: AnimatedOpacity(
                    opacity: angle == 0 ? 1 : 0,
                    duration: Duration(
                      milliseconds: 200,
                    ),
                    child: Text(
                      _list[index].name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
        );
      },
      itemCount: _list.length,
    );
  }
}
