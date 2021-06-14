import 'dart:typed_data';

import 'package:cloudbase_auth/cloudbase_auth.dart';
import 'package:cloudbase_core/cloudbase_core.dart';
import 'package:cloudbase_database/cloudbase_database.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'publish_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

import 'VocationBean.dart';
import 'home_page.dart';

class ImgPage extends StatefulWidget {
  CloudBaseCore core;
  final VacationBean bean;
  final String name;
  final bool judge; //是否个人页面状态
  final bool publish; //是否发布页面状态
  final bool favorite; //是否点赞页面状态
  final bool star; //是否收藏页面状态
  ImgPage(this.bean,this.name,this.judge,this.publish,this.favorite,this.star,this.core);

  @override
  _ImgPageState createState() => _ImgPageState();
}

class _ImgPageState extends State<ImgPage> {

  // Future _openModalBottomSheet() async {
  //   final option = await showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return Container(
  //           height: 800.0,
  //           child: Column(
  //             children: <Widget>[
  //               ListTile(
  //                 title: Text('拍照',textAlign: TextAlign.center),
  //                 onTap: () {
  //                   Navigator.pop(context, '拍照');
  //                 },
  //               ),
  //               ListTile(
  //                 title: Text('从相册选择',textAlign: TextAlign.center),
  //                 onTap: () {
  //                   Navigator.pop(context, '从相册选择');
  //                 },
  //               ),
  //               ListTile(
  //                 title: Text('取消',textAlign: TextAlign.center),
  //                 onTap: () {
  //                   Navigator.pop(context, '取消');
  //                 },
  //               ),
  //             ],
  //           ),
  //         );
  //       }
  //   );
  //   print(option);
  // }

  @override
  void initState() {
    super.initState();
    var permission =  PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    // print("permission status is " + permission.toString());
    PermissionHandler().requestPermissions(<PermissionGroup>[
      PermissionGroup.storage, // 在这里添加需要的权限
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:GestureDetector(
          onLongPress: () async {

            if (widget.judge == true)  {

              //添加到腾讯云数据库
              CloudBaseCore core = CloudBaseCore.init({
                'env': 'hello-cloudbase-2gpxbs42520e0bce',
                'appAccess': {
                  // 凭证
                  'key': 'f2706cd262976c6593743417fa3cfa1e',
                  // 版本
                  'version': '1'
                }
              });
              CloudBaseAuth auth = CloudBaseAuth(core);
              await auth.signInAnonymously().then((success) {
                // 登录成功
                // print("连接上腾讯云 success");
              }).catchError((err) {
                // 登录失败
                // print(err);
              });
              await auth.getUserInfo().then((userInfo) {
                // print(userInfo);
              }).catchError((err) {
                // 获取用户信息失败
              });
              CloudBaseDatabase db = CloudBaseDatabase(core);
              Collection collection = db.collection('user');
              var _ = db.command;

              if(widget.publish == true){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PublishPage(widget.name,"更改作品",widget.bean,widget.core)),
                );
              }
              else if(widget.favorite == true) {
                collection.where({
                  'username': widget.name,
                }).get().then((res) {
                  var data = res.data[0]["favorite"];
                  List<VacationBean> list = [];
                  Set<VacationBean> set = new Set<VacationBean>();
                  for (int i = 0; i < data.length; i++) {
                    if (data[i]["url"] != widget.bean.url &&
                        data[i]["text"] != widget.bean.name) {
                      list.add(VacationBean(
                          data[i]["url"], data[i]["name"], data[i]["text"]));
                      set.addAll(list);
                    }
                  }
                  // print(set.toList());
                  collection.where({
                    'username': widget.name,
                  }).update({
                    'favorite': [],
                  }).then((res) {
                    for (int i = 0; i < set
                        .toList()
                        .length; i++) {
                      collection.where({
                        'username': widget.name,
                      }).update({
                        'favorite': _.push([
                          {
                            "name": set.toList()[i].country,
                            "text": set.toList()[i].name,
                            "url": set.toList()[i].url
                          }
                        ]),
                      }).then((res) {

                      });
                    }
                  });
                  Fluttertoast.showToast(msg: '取消点赞成功',
                    fontSize: 14,
                    gravity: ToastGravity.SNACKBAR,
                    timeInSecForIosWeb: 2,
                    textColor: Colors.white,
                    backgroundColor: Colors.green,);
                  // print("显示用户成功");
                }).catchError((e) {
                  // print("显示用户失败");
                });
              }
              else if(widget.star == true) {
                collection.where({
                  'username': widget.name,
                }).get().then((res) {
                  var data = res.data[0]["star"];
                  List<VacationBean> list = [];
                  Set<VacationBean> set = new Set<VacationBean>();
                  for (int i = 0; i < data.length; i++) {
                    if (data[i]["url"] != widget.bean.url &&
                        data[i]["text"] != widget.bean.name) {
                      list.add(VacationBean(
                          data[i]["url"], data[i]["name"], data[i]["text"]));
                      set.addAll(list);
                    }
                  }
                  // print(set.toList());
                  collection.where({
                    'username': widget.name,
                  }).update({
                    'star': [],
                  }).then((res) {
                    for (int i = 0; i < set
                        .toList()
                        .length; i++) {
                      collection.where({
                        'username': widget.name,
                      }).update({
                        'star': _.push([
                          {
                            "name": set.toList()[i].country,
                            "text": set.toList()[i].name,
                            "url": set.toList()[i].url
                          }
                        ]),
                      }).then((res) {
                      });
                    }
                  });
                  Fluttertoast.showToast(msg: '取消收藏成功',
                    fontSize: 14,
                    gravity: ToastGravity.SNACKBAR,
                    timeInSecForIosWeb: 2,
                    textColor: Colors.white,
                    backgroundColor: Colors.green,);
                  // print("显示用户成功");
                }).catchError((e) {
                  // print("显示用户失败");
                });
              }

            }

          },
              child:Stack(
                  children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.bean.url),
                      fit: BoxFit.cover,
                    ),
                  ),
                child: Container(
                  color: Colors.blueGrey.withOpacity(.5),
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                        widget.bean.country,
                        style: TextStyle(
                            // 每一个字符之间的间距
                            letterSpacing: 22,
                            // 每个词之间的间距
                            wordSpacing: 22,
                            color: Colors.white, fontSize: 53
                        ),
                        ),
                        Text(
                          widget.bean.name,
                          style: TextStyle(
                            // 每一个字符之间的间距
                              letterSpacing: 12,
                              // 每个词之间的间距
                              wordSpacing: 12,
                              color: Colors.white, fontSize: 23
                          ),
                        ),
                    ]
                    )
                  )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                ),
                child: SizedBox(
                  height: kToolbarHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                          onPressed: () async {

                            if (widget.name == "") {
                              Fluttertoast.showToast(msg: '尚未登录', fontSize: 14,gravity: ToastGravity.SNACKBAR,timeInSecForIosWeb: 2,textColor: Colors.white,backgroundColor: Colors.red,);
                            } else  {

                              //添加到腾讯云数据库
                              CloudBaseCore core = CloudBaseCore.init({
                                'env': 'hello-cloudbase-2gpxbs42520e0bce',
                                'appAccess': {
                                  // 凭证
                                  'key': 'f2706cd262976c6593743417fa3cfa1e',
                                  // 版本
                                  'version': '1'
                                }
                              });
                              CloudBaseAuth auth = CloudBaseAuth(core);
                              await auth.signInAnonymously().then((success) {
                                // 登录成功
                                // print("连接上腾讯云 success");
                              }).catchError((err) {
                                // 登录失败
                                // print(err);
                              });
                              await auth.getUserInfo().then((userInfo) {
                                // print(userInfo);
                              }).catchError((err) {
                                // 获取用户信息失败
                              });
                              CloudBaseDatabase db = CloudBaseDatabase(core);
                              Collection collection = db.collection('user');
                              var _ = db.command;
                              collection.where({
                                'username': widget.name,
                              }).update({
                                'favorite': _.push([
                                  {
                                    'url': widget.bean.url,
                                    'name': widget.bean.country,
                                    'text': widget.bean.name
                                  }
                                ]),
                              }).then((res) {
                                Fluttertoast.showToast(msg: '点赞成功', fontSize: 14,gravity: ToastGravity.SNACKBAR,timeInSecForIosWeb: 2,textColor: Colors.white,backgroundColor: Colors.green,);
                                // print("显示用户成功");
                              }).catchError((e) {
                                // print("显示用户失败");
                              });

                            }

                          }
                      ),
                      IconButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        icon: Icon(
                          Icons.star_border,
                          color: Colors.white,
                        ),
                          onPressed: () async {

                            if (widget.name == "") {
                              Fluttertoast.showToast(msg: '尚未登录', fontSize: 14,gravity: ToastGravity.SNACKBAR,timeInSecForIosWeb: 2,textColor: Colors.white,backgroundColor: Colors.red,);
                            } else  {

                              //添加到腾讯云数据库
                              CloudBaseCore core = CloudBaseCore.init({
                                'env': 'hello-cloudbase-2gpxbs42520e0bce',
                                'appAccess': {
                                  // 凭证
                                  'key': 'f2706cd262976c6593743417fa3cfa1e',
                                  // 版本
                                  'version': '1'
                                }
                              });
                              CloudBaseAuth auth = CloudBaseAuth(core);
                              await auth.signInAnonymously().then((success) {
                                // 登录成功
                                // print("连接上腾讯云 success");
                              }).catchError((err) {
                                // 登录失败
                                // print(err);
                              });
                              await auth.getUserInfo().then((userInfo) {
                                // print(userInfo);
                              }).catchError((err) {
                                // 获取用户信息失败
                              });
                              CloudBaseDatabase db = CloudBaseDatabase(core);
                              Collection collection = db.collection('user');
                              var _ = db.command;
                              collection.where({
                                'username': widget.name,
                              }).update({
                                'star': _.push([
                                  {
                                    'url': widget.bean.url,
                                    'name': widget.bean.country,
                                    'text': widget.bean.name
                                  }
                                ]),
                              }).then((res) {
                                Fluttertoast.showToast(msg: '收藏成功', fontSize: 14,gravity: ToastGravity.SNACKBAR,timeInSecForIosWeb: 2,textColor: Colors.white,backgroundColor: Colors.green,);
                                // print("显示用户成功");
                              }).catchError((e) {
                                // print("显示用户失败");
                              });

                            }

                          }
                      ),
                      IconButton(
                        padding: EdgeInsets.only(right: 20),
                        icon: Icon(
                          Icons.download,
                          color: Colors.white,
                        ),
                        onPressed: _testSaveImg
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //         child: Positioned(
              //           left: 50,
              //           right: 50,
              //           bottom: 10,
              //           child:
              //           FlatButton(
              //             child: Text('点击查看详情',
              //                         style: TextStyle(
              //                         color: Colors.white, fontSize: 13
              //                         ),
              //             ),
              //             onPressed: _openModalBottomSheet,
              //           ),
              //         ),
              //       ),
          ]
              )
        ),
    );
  }

  void _testSaveImg() async {
    // 这个图片的地址是本地的文件进行测试 要引入,import 'package:flutter/services.dart' show rootBundle;
   //  ByteData bytes = await rootBundle.load(widget.bean.url);
   //  print(bytes);
   //  final result = await ImageGallerySaver.saveImage(bytes.buffer.asUint8List()); //这个是核心的保存图片的插件
   //  //print(result);   //这个返回值 在保存成功后会返回true
   //  if(result["isSuccess"]){
   //    Fluttertoast.showToast(msg: '保存成功', fontSize: 14,gravity: ToastGravity.SNACKBAR,timeInSecForIosWeb: 2,textColor: Colors.white,backgroundColor: Colors.green,);
   //  }else{
   //    Fluttertoast.showToast(msg: '保存失败', fontSize: 14,gravity: ToastGravity.SNACKBAR,timeInSecForIosWeb: 2,textColor: Colors.white,backgroundColor: Colors.green,);
   //  }
   // }
    var response = await Dio().get(widget.bean.url, options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    // print('result:$result');
     if(result["isSuccess"]){
       Fluttertoast.showToast(msg: '保存成功', fontSize: 14,gravity: ToastGravity.SNACKBAR,timeInSecForIosWeb: 2,textColor: Colors.white,backgroundColor: Colors.green,);
     }else{
       Fluttertoast.showToast(msg: '保存失败', fontSize: 14,gravity: ToastGravity.SNACKBAR,timeInSecForIosWeb: 2,textColor: Colors.white,backgroundColor: Colors.green,);
     }
    }

}

