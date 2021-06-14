import 'dart:io';

import 'package:cloudbase_auth/cloudbase_auth.dart';
import 'package:cloudbase_core/cloudbase_core.dart';
import 'package:cloudbase_database/cloudbase_database.dart';
import 'package:cloudbase_storage/cloudbase_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'VocationBean.dart';

class PublishPage extends StatefulWidget {
  final String name;
  final String page_name;
  final VacationBean bean;
  CloudBaseCore core;
  PublishPage(this.name,this.page_name,this.bean,this.core);

  @override
  _PublishPageState createState() => _PublishPageState();
}

class _PublishPageState extends State<PublishPage> {
  var _imgPath;
  //表单状态
  final _formKey = GlobalKey<FormState>();
  FocusNode _focusNodeText = new FocusNode();
  TextEditingController _textController = new TextEditingController();
  var _text = '';
  var _isShowClear = false;//是否显示输入框尾部的清除按钮

  @override
  void initState() {
    // TODO: implement initState
    //设置焦点监听
    _focusNodeText.addListener(_focusNodeListener);
    //监听用户名框的输入改变
    _textController.addListener((){
      // print(_textController.text);
      // 监听文本框输入变化，当有内容的时候，显示尾部清除按钮，否则不显示

      if (_textController.text.length > 0) {
        _isShowClear = true;
      }else{
        _isShowClear = false;
      }
      setState(() {

      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // 移除焦点监听
    _focusNodeText.removeListener(_focusNodeListener);
    _textController.dispose();
    super.dispose();
  }

  // 监听焦点
  Future _focusNodeListener() async{
    if (_focusNodeText.hasFocus) {
    }
  }

  String? validateUserName(value){
    if (value.isEmpty) {
      return '不能为空!';
    }
    return null;
  }

  /*相册*/
  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imgPath = image;
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget _ImageView(imgPath) {
      if (imgPath == null) {
        return Center(
            child:
            Text('没有图片被选中',
              style: TextStyle(
                color: Color(0xff718bba),
              ),)
        );
      } else {
        return Padding(
          padding: EdgeInsets.only(left: 25,right: 25),
          child: Image.file(
          _imgPath,
          fit: BoxFit.contain,
        )
      );
      }
    }

    //输入文本框区域
    Widget inputTextArea = new Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white
      ),
      child: new Form(
        key: _formKey,
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            new TextFormField(
              controller: _textController,
              focusNode: _focusNodeText,
              //设置键盘类型
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "输入图片简介",
                hintText: "请输入图片简介",
                prefixIcon: Icon(Icons.border_color),
                //尾部添加清除按钮
                suffixIcon:(_isShowClear)
                    ? IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: (){
                    // 清空输入框内容
                    _textController.clear();
                  },
                )
                    : null ,
              ),
              //验证用户名
              validator: validateUserName,

              //保存数据
              onSaved: (value){
                _text = value!;
              },

            ),
          ],
        ),
      ),
    );

    Widget loginButtonArea = new Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      height: 45.0,
      child: new RaisedButton(
        color: Color(0xffc1d2f0),
        child: Text(
          widget.page_name,
          style: Theme.of(context).primaryTextTheme.headline,
        ),
        // 设置按钮圆角
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        onPressed: () async {
          //点击登录按钮，解除焦点，回收键盘、
          _focusNodeText.unfocus();

          if (widget.page_name == "发布作品") {
            if (_formKey.currentState!.validate()) {
              if (_imgPath == null) {
                Fluttertoast.showToast(msg: '未选中图片',
                  fontSize: 14,
                  gravity: ToastGravity.SNACKBAR,
                  timeInSecForIosWeb: 2,
                  textColor: Colors.white,
                  backgroundColor: Colors.red,);
              }
              else {
                //只有输入通过验证，才会执行这里
                _formKey.currentState!.save();

                // //添加到腾讯云数据库
                // CloudBaseCore core = CloudBaseCore.init({
                //   'env': 'hello-cloudbase-2gpxbs42520e0bce',
                //   'appAccess': {
                //     // 凭证
                //     'key': 'f2706cd262976c6593743417fa3cfa1e',
                //     // 版本
                //     'version': '1'
                //   }
                // });
                CloudBaseStorage storage = CloudBaseStorage(widget.core);
                // CloudBaseAuth auth = CloudBaseAuth(core);
                // await auth.signInAnonymously().then((success) {
                //   // 登录成功
                //   // print("连接上腾讯云 success");
                // }).catchError((err) {
                //   // 登录失败
                //   // print(err);
                // });
                // await auth.getUserInfo().then((userInfo) {
                //   // print(userInfo);
                // }).catchError((err) {
                //   // 获取用户信息失败
                // });
                CloudBaseDatabase db = CloudBaseDatabase(widget.core);
                Collection collection = db.collection('user');
                int count = 0;
                collection.where({
                  'username': widget.name
                }).get().then((res) async {
                  var data = res.data;
                  // print(data);
                  count = data[0]["publish"].length;
                  // print("查找成功");

                  await storage.uploadFile(
                    cloudPath: 'publish/' + widget.name + '/' +
                        count.toString() + '.jpg',
                    filePath: _imgPath.path,
                  );
                  List<String> fileIds = [
                    'cloud://hello-cloudbase-2gpxbs42520e0bce.6865-hello-cloudbase-2gpxbs42520e0bce-1305329631/publish/' +
                        widget.name + '/' + count.toString() + '.jpg'
                  ];
                  CloudBaseStorageRes<List<DownloadMetadata>> r = await storage
                      .getFileDownloadURL(fileIds);
                  _imgPath = r.data[0].downloadUrl;

                  var _ = db.command;
                  collection.where({
                    'username': widget.name
                  }).update({
                    'publish': _.push([{"url": _imgPath, "text": _text}]),
                  }).then((res) {
                    // print("添加成功");
                  }).catchError((e) {
                    // print("添加失败");
                  });

                  Collection collection1 = db.collection('publish');
                  collection1.add({
                    'name': widget.name,
                    'text': _text,
                    'url': _imgPath
                  }).then((res) {
                    // print("添加成功");
                  }).catchError((e) {
                    // print("添加失败");
                  });
                }).catchError((e) {
                  // print("查找失败");
                });

                Fluttertoast.showToast(msg: '发布成功',
                  fontSize: 14,
                  gravity: ToastGravity.SNACKBAR,
                  timeInSecForIosWeb: 2,
                  textColor: Colors.white,
                  backgroundColor: Colors.green,);
                Navigator.pop(context);
              }
            }
          }
          else if (widget.page_name == "更改作品") {
            _formKey.currentState!.save();

            // //添加到腾讯云数据库
            // CloudBaseCore core = CloudBaseCore.init({
            //   'env': 'hello-cloudbase-2gpxbs42520e0bce',
            //   'appAccess': {
            //     // 凭证
            //     'key': 'f2706cd262976c6593743417fa3cfa1e',
            //     // 版本
            //     'version': '1'
            //   }
            // });
            CloudBaseStorage storage = CloudBaseStorage(widget.core);
            // CloudBaseAuth auth = CloudBaseAuth(core);
            // await auth.signInAnonymously().then((success) {
            //   // 登录成功
            //   // print("连接上腾讯云 success");
            // }).catchError((err) {
            //   // 登录失败
            //   // print(err);
            // });
            // await auth.getUserInfo().then((userInfo) {
            //   // print(userInfo);
            // }).catchError((err) {
            //   // 获取用户信息失败
            // });
            CloudBaseDatabase db = CloudBaseDatabase(widget.core);

            if (_text != '') {
              Collection collection1 = db.collection('publish');
              collection1.where({
                'name': widget.name,
                'url': widget.bean.url
              }).update(
                  {'text': _text}
              ).then((res) {
                // print(res);

                Collection collection = db.collection('user');
                var _ = db.command;
                collection.where({
                  'username': widget.name,
                }).get().then((res) {
                  var data = res.data[0]["publish"];
                  List<VacationBean> list = [];
                  Set<VacationBean> set = new Set<VacationBean>();
                  for (int i = 0; i < data.length; i++) {
                    if (data[i]["url"] != widget.bean.url &&
                        data[i]["text"] != widget.bean.name) {
                      list.add(VacationBean(
                          data[i]["url"], "", data[i]["text"]));
                      set.addAll(list);
                    } else {
                      list.add(VacationBean(
                          data[i]["url"], "", _text));
                      set.addAll(list);
                    }
                  }
                  // print(set.toList());
                  collection.where({
                    'username': widget.name,
                  }).update({
                    'publish': [],
                  }).then((res) {
                    for (int i = 0; i < set
                        .toList()
                        .length; i++) {
                      collection.where({
                        'username': widget.name,
                      }).update({
                        'publish': _.push([
                          {
                            "text": set.toList()[i].name,
                            "url": set.toList()[i].url
                          }
                        ]),
                      }).then((res) {

                      });
                    }
                  });
                  // print("显示用户成功");
                }).catchError((e) {
                  // print("显示用户失败");
                });
              });
            }
            if (_imgPath != null) {
              String fileId = widget.bean.url;
              String f = fileId.replaceFirst(
                  "https://6865-hello-cloudbase-2gpxbs42520e0bce-1305329631.tcb.qcloud.la/publish/",
                  "");
              await storage.uploadFile(
                cloudPath: 'publish/' + f,
                filePath: _imgPath.path,
              );
              List<String> fileIds = [
                'cloud://hello-cloudbase-2gpxbs42520e0bce.6865-hello-cloudbase-2gpxbs42520e0bce-1305329631/publish/' +
                    f
              ];
              CloudBaseStorageRes<List<DownloadMetadata>> r = await storage
                  .getFileDownloadURL(fileIds);
              _imgPath = r.data[0].downloadUrl;
              Collection collection1 = db.collection('publish');
              collection1.where({
                'name': widget.name,
                'url': widget.bean.url
              }).update(
                  {'url': _imgPath}
              ).then((res) {
                // print(res);

                Collection collection = db.collection('user');
                var _ = db.command;
                collection.where({
                  'username': widget.name,
                }).get().then((res) {
                  var data = res.data[0]["publish"];
                  List<VacationBean> list = [];
                  Set<VacationBean> set = new Set<VacationBean>();
                  for (int i = 0; i < data.length; i++) {
                    if (data[i]["url"] != widget.bean.url &&
                        data[i]["text"] != widget.bean.name) {
                      list.add(VacationBean(
                          data[i]["url"], "", data[i]["text"]));
                      set.addAll(list);
                    } else {
                      list.add(VacationBean(
                          _imgPath, "", data[i]["text"]));
                      set.addAll(list);
                    }
                  }
                  // print(set.toList());
                  collection.where({
                    'username': widget.name,
                  }).update({
                    'publish': [],
                  }).then((res) {
                    for (int i = 0; i < set
                        .toList()
                        .length; i++) {
                      collection.where({
                        'username': widget.name,
                      }).update({
                        'publish': _.push([
                          {
                            "text": set.toList()[i].name,
                            "url": set.toList()[i].url
                          }
                        ]),
                      }).then((res) {

                      });
                    }
                  });
                });
              });
            }

            Fluttertoast.showToast(msg: '修改成功',
              fontSize: 14,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 2,
              textColor: Colors.white,
              backgroundColor: Colors.green,);
            Navigator.pop(context);
          }
        },
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.page_name),
          backgroundColor: Color(0xff718bba),
          elevation: 0,
        ),
      body: Center(
        child: Container(
          child: new ListView(
            children: [
              new SizedBox(height: ScreenUtil().setHeight(50),),
              Container(
                  alignment: Alignment.topCenter,
                  // 设置图片为圆形
                  child: new Container(
                    child: Text(
                      "请前往“更多展示”区域，查看发布的内容",
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        wordSpacing: 2,
                        letterSpacing: 2,
                        fontSize: 15
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
              ),
              new SizedBox(height: ScreenUtil().setHeight(70),),
              _ImageView(_imgPath),
              new SizedBox(height: ScreenUtil().setHeight(70),),
              inputTextArea,
              new SizedBox(height: ScreenUtil().setHeight(70),),
              loginButtonArea,
              new SizedBox(height: ScreenUtil().setHeight(70),),
            ],
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          _openGallery();
        },
        tooltip: '选择图片',
        child: Icon(Icons.add_a_photo),
        heroTag: null,
      ),
    );
  }
}

