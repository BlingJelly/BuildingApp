import 'package:flutter/material.dart';
import 'package:flutter_homework/forget_page.dart';
import 'package:flutter_homework/index_page.dart';
import 'package:flutter_homework/message_page.dart';
import 'package:flutter_homework/regist_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SettingPage extends StatefulWidget {
  late final String name;
  late final String img;
  late final String background;
  SettingPage(this.name,this.img,this.background);

  @override
  State<StatefulWidget> createState() {
    return _SettingState();
  }
}

class _SettingState extends State<SettingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("设置中心"),
        backgroundColor: Color(0xff718bba),
        elevation: 0,
    ),
    body: new Padding(
        padding: EdgeInsets.only(top:20,right: 10,left: 10),
        child: ListView(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.edit),
                    title: new Text('修改信息'),
                  onTap: (){
                    //todo 登录操作
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MessagePage(widget.img,widget.background)),
                    );
                  },
                ),
                Divider(),
                new ListTile(
                    leading: new Icon(Icons.track_changes),
                    title: new Text('更改密保'),
                  onTap: (){
                    //todo 登录操作
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegistPage("更改密保")),
                    );
                  },
                ),
                Divider(),
                new ListTile(
                  leading: new Icon(Icons.logout),
                  title: new Text('退出登录'),
                  onTap: (){
                    if(widget.name == ""){
                      Fluttertoast.showToast(msg: '尚未登录',
                        fontSize: 14,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 2,
                        textColor: Colors.white,
                        backgroundColor: Colors.red,);
                    }else {
                      Fluttertoast.showToast(msg: '退出登录成功',
                        fontSize: 14,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 2,
                        textColor: Colors.white,
                        backgroundColor: Colors.green,);
                      //todo 登录操作
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IndexPage("")),
                      );
                    }
                  },
                ),
                Divider(),
                new ListTile(
                    leading: new Icon(Icons.delete),
                    title: new Text('注销账号'),
                  onTap: (){
                    //todo 登录操作
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgetPage("注销账号")),
                    );
                  },
                ),
                Divider(),
              ],
            )
    )
    );
  }
}

