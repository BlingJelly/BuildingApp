import 'package:flutter/material.dart';

class IntroductionPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _IntroductionState();
  }
}

class _IntroductionState extends State<IntroductionPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("关于我们"),
        backgroundColor: Color(0xff718bba),
        elevation: 0,
      ),
      body:  new ListView(
          children: [
            Card(
                child: Column(
                    children: <Widget>[
                    ListTile(
                      title: Text("App简介"),
                    ),
                    Container(
                      padding: EdgeInsets.all(13),
                      child: Text("        一款介绍建筑知识，交流建筑作品的科普类社区型app。在这里，可以看到并下载著名建筑的图片，了解建筑的各项知识，包括建筑的风格、知名建筑及建筑师、如何保护建筑等。在这里，还可以注册自己的账户，并发布自己的建筑作品，查看、点赞、收藏他人发布的建筑作品。",
                        style: TextStyle(color: Colors.black54),),
                    ),
                    ],
                  ),
              ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("使用介绍"),
                  ),
                  Container(
                    padding: EdgeInsets.all(13),
                    child: Text("        受网速影响，该app可能会出现图片加载缓慢、用户注册登录后相关信息加载缓慢等情况，请耐心等待，或尝试换更高速的网络，或刷新页面。此外，用户名是识别用户的唯一凭证，不可修改，请妥善保管。在登录后的个人界面，长按图片可进行修改或删除操作。",
                    style: TextStyle(color: Colors.black54),),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("版权说明"),
                  ),
                  Container(
                    padding: EdgeInsets.all(13),
                    child: Text("        该app不做商业用途，仅用于方便用户查找和交流有关建筑艺术的知识。所有文章图片等材料均在网站上寻找得到，版权归原作者所有，如有侵权请立即与我们联系，我们将及时处理。",
                      style: TextStyle(color: Colors.black54),),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }

}


