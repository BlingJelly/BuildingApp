import 'package:cloudbase_auth/cloudbase_auth.dart';
import 'package:cloudbase_core/cloudbase_core.dart';
import 'package:cloudbase_database/cloudbase_database.dart';
import 'package:cloudbase_storage/cloudbase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';


class VerifyPage extends StatefulWidget {
  CloudBaseCore core;
  late final String username;
  late final String password;
  late final String question;
  late final String index;
  VerifyPage(this.username,this.password,this.question,this.index,this.core);

  @override
  State<StatefulWidget> createState() {
    return _VerifyState();
  }
}

class _VerifyState extends State<VerifyPage> {
  //焦点
  FocusNode _focusNodeAnswer = new FocusNode();
  //用户名输入框控制器，此控制器可以监听用户名输入框操作
  TextEditingController _answerController = new TextEditingController();

  //表单状态
  final _formKey = GlobalKey<FormState>();

  var _answer = '';//密保答案
  var _isShowClear2 = false;//是否显示输入框尾部的清除按钮

  @override
  void initState() {
    // TODO: implement initState
    //设置焦点监听
    _focusNodeAnswer.addListener(_focusNodeListener);
    _answerController.addListener((){
      // print(_answerController.text);
      // 监听文本框输入变化，当有内容的时候，显示尾部清除按钮，否则不显示

      if (_answerController.text.length > 0) {
        _isShowClear2 = true;
      }else{
        _isShowClear2 = false;
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
    _focusNodeAnswer.removeListener(_focusNodeListener);
    _answerController.dispose();
    super.dispose();
  }

  // 监听焦点
  Future _focusNodeListener() async{
    if (_focusNodeAnswer.hasFocus) {
    }
  }

  /**
   * 验证用户名
   */
  String? validateUserName(value){
    if (value.isEmpty) {
      return '不能为空!';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width:750,height:1334)..init(context);
    // print(ScreenUtil().scaleHeight);

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
              controller: _answerController,
              focusNode: _focusNodeAnswer,
              //设置键盘类型
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "密保问题："+widget.question,
                hintText: "请输入密保答案",
                prefixIcon: Icon(Icons.sticky_note_2),
                //尾部添加清除按钮
                suffixIcon:(_isShowClear2)
                    ? IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: (){
                    // 清空输入框内容
                    _answerController.clear();
                  },
                )
                    : null ,
              ),
              //验证用户名
              validator: validateUserName,

              //保存数据
              onSaved: (value){
                _answer = value!;
              },

            )
          ],
        ),
      ),
    );

    // 注册按钮区域
    Widget loginButtonArea = new Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      height: 45.0,
      child: new RaisedButton(
        color: Color(0xffc1d2f0),
        child: Text(
          "密保验证",
          style: Theme.of(context).primaryTextTheme.headline,
        ),
        // 设置按钮圆角
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        onPressed: () async {
          //点击登录按钮，解除焦点，回收键盘
          _focusNodeAnswer.unfocus();

          if (_formKey.currentState!.validate()) {
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
                  collection.where({
                    'username': widget.username,
                    'answer': _answer
                  }).count().then((res) async {
                    var total = res.total; //符合条件的文档的数量
                    if(total == 0){
                      Fluttertoast.showToast(msg: '密保答案输入错误',
                        fontSize: 14,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 2,
                        textColor: Colors.white,
                        backgroundColor: Colors.red,);
                    }else{

                      if(widget.index == "获得新密码") {
                        collection.where({
                          'username': widget.username,
                          'answer': _answer
                        }).update({
                          'password': widget.password
                        }).then((res) {
                          Fluttertoast.showToast(msg: '修改密码成功',
                            fontSize: 14,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 2,
                            textColor: Colors.white,
                            backgroundColor: Colors.green,);
                          //todo 登录操作
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        });
                      }
                      else if(widget.index == "注销账号"){
                        String fileId = 'cloud://hello-cloudbase-2gpxbs42520e0bce.6865-hello-cloudbase-2gpxbs42520e0bce-1305329631/user/'+widget.username+'/background.jpg';
                        CloudBaseStorageRes<List<DeleteMetadata>> res = await storage.deleteFiles([fileId]);
                        // print(res.data[0]); // {'fileId': 'xxx', 'code': 'SUCCESS'}
                        fileId = 'cloud://hello-cloudbase-2gpxbs42520e0bce.6865-hello-cloudbase-2gpxbs42520e0bce-1305329631/user/'+widget.username+'/img.jpg';
                        res = await storage.deleteFiles([fileId]);
                        // print(res.data[0]);
                        int count = 0;
                        collection.where({
                          'username': widget.username
                        }).get().then((res) async {
                          var data = res.data;
                          // print(data);
                          count = data[0]["publish"].length;
                          // print("查找成功");

                          for(int i=0;i<count;i++) {
                            fileId =
                              'cloud://hello-cloudbase-2gpxbs42520e0bce.6865-hello-cloudbase-2gpxbs42520e0bce-1305329631/publish/' +
                                  widget.username + '/' + i.toString() +
                                  '.jpg';
                            await storage.deleteFiles([fileId]);
                          }

                        }).catchError((e) {
                          // print("查找失败");
                        });

                        Collection collection1 = db.collection('publish');
                        collection1.where({
                          'name': widget.username,
                        }).remove().then((res) {
                          Collection collection = db.collection('user');
                          collection.where({
                            'username': widget.username,
                          }).remove().then((res) {
                            Fluttertoast.showToast(msg: '注销账户成功',
                              fontSize: 14,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              textColor: Colors.white,
                              backgroundColor: Colors.green,);
                            //todo 登录操作
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          });
                        });

                      }

                    }
                  }).catchError((e) {
                    // print("失败");
                  });

            }
          }

        ,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("密保验证"),
        backgroundColor: Color(0xff718bba),
        elevation: 0,
      ),
      body:  new GestureDetector(
        onTap: (){
          // 点击空白区域，回收键盘
          // print("点击了空白区域");
          _focusNodeAnswer.unfocus();
        },
        child: new ListView(
          children: [
            new SizedBox(height: ScreenUtil().setHeight(140),),
            inputTextArea,
            new SizedBox(height: ScreenUtil().setHeight(80),),
            loginButtonArea,
          ],
        ),
      ),
    );
  }

}

