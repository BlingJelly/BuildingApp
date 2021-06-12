import 'package:cloudbase_database/cloudbase_database.dart';
import 'package:dio/dio.dart';
import 'package:cloudbase_auth/cloudbase_auth.dart';
import 'package:cloudbase_core/cloudbase_core.dart';
import 'package:cloudbase_storage/cloudbase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework/person_page.dart';
import 'package:flutter_homework/regist_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'forget_page.dart';

class MessagePage extends StatefulWidget {
  late final String img;
  late final String background;
  MessagePage(this.img,this.background);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  //焦点
  FocusNode _focusNodeUserName = new FocusNode();
  FocusNode _focusNodePassWord = new FocusNode();
  FocusNode _focusNodeText = new FocusNode();
  //用户名输入框控制器，此控制器可以监听用户名输入框操作
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _textController = new TextEditingController();

  //表单状态
  final _formKey = GlobalKey<FormState>();

  var _password = '';//用户名
  var _username = '';//密码
  var _text = '';//个性签名
  var _isShowPwd = false;//是否显示密码
  var _isShowClear = false;//是否显示输入框尾部的清除按钮
  var _isShowClear1 = false;//是否显示输入框尾部的清除按钮
  var _imgPath;
  var _background;

  @override
  void initState() {
    // TODO: implement initState
    //设置焦点监听
    _focusNodeUserName.addListener(_focusNodeListener);
    _focusNodePassWord.addListener(_focusNodeListener);
    _focusNodeText.addListener(_focusNodeListener);
    //监听用户名框的输入改变
    _userNameController.addListener((){
      print(_userNameController.text);
      // 监听文本框输入变化，当有内容的时候，显示尾部清除按钮，否则不显示

      if (_userNameController.text.length > 0) {
        _isShowClear = true;
      }else{
        _isShowClear = false;
      }
      setState(() {

      });
    });
    _textController.addListener((){
      print(_textController.text);
      // 监听文本框输入变化，当有内容的时候，显示尾部清除按钮，否则不显示

      if (_textController.text.length > 0) {
        _isShowClear1 = true;
      }else{
        _isShowClear1 = false;
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
    _focusNodeUserName.removeListener(_focusNodeListener);
    _focusNodePassWord.removeListener(_focusNodeListener);
    _focusNodeText.removeListener(_focusNodeListener);
    _textController.dispose();
    super.dispose();
  }

  // 监听焦点
  Future _focusNodeListener() async{
    if(_focusNodeUserName.hasFocus){
      print("用户名框获取焦点");
      // 取消密码框的焦点状态
      _focusNodePassWord.unfocus();
      _focusNodeText.unfocus();
    }
    if (_focusNodePassWord.hasFocus) {
      print("密码框获取焦点");
      // 取消用户名框焦点状态
      _focusNodeUserName.unfocus();
      _focusNodeText.unfocus();
    }
    if (_focusNodeText.hasFocus) {
      print("密码框获取焦点");
      // 取消用户名框焦点状态
      _focusNodeUserName.unfocus();
      _focusNodePassWord.unfocus();
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

  /**
   * 验证密码
   */
  String? validatePassWord(value){
    if (value.isEmpty) {
      return '密码不能为空';
    }
    return null;
  }

  /*图片控件*/
  Widget _ImageView(imgPath) {
    if (imgPath == null || imgPath is String) {
      return ClipOval(
        child: Image.network(
          widget.img,
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return ClipOval(
        child: Image.file(
          _imgPath,
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
      );
    }
  }

  BoxDecoration _BackgroundView(imgPath) {
    if (imgPath == null || imgPath is String) {
      return  BoxDecoration(
          image: DecorationImage(
          image: NetworkImage(widget.background),
          fit: BoxFit.fill,
          ),
          );
    } else  {
      return BoxDecoration(
          image: DecorationImage(
            image: FileImage(_background),
            fit: BoxFit.fill,
          ),
        );
    }
  }


  /*相册*/
  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imgPath = image;
    });
  }

  /*相册*/
  _openGallery2() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _background = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width:750,height:1334)..init(context);
    print(ScreenUtil().scaleHeight);

    // logo 图片区域
    Widget logoImageArea = new Container(
      alignment: Alignment.topCenter,
      // 设置图片为圆形
      child: new GestureDetector(
        onTap: (){
          print("点击头像");
          _openGallery();
        },
        child: _ImageView(_imgPath),
      )
    );

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
              controller: _userNameController,
              focusNode: _focusNodeUserName,
              //设置键盘类型
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "请输入昵称",
                prefixIcon: Icon(Icons.account_circle),
                //尾部添加清除按钮
                suffixIcon:(_isShowClear)
                    ? IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: (){
                    // 清空输入框内容
                    _userNameController.clear();
                  },
                )
                    : null ,
              ),
              //验证用户名
              validator: validateUserName,

              //保存数据
              onSaved: (value){
                _username = value!;
              },

            ),
            new TextFormField(
              focusNode: _focusNodePassWord,
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "请输入密码",
                  prefixIcon: Icon(Icons.lock),
                  // 是否显示密码
                  suffixIcon: IconButton(
                    icon: Icon((_isShowPwd) ? Icons.visibility : Icons.visibility_off),
                    // 点击改变显示或隐藏密码
                    onPressed: (){
                      setState(() {
                        _isShowPwd = !_isShowPwd;
                      });
                    },
                  )
              ),
              obscureText: !_isShowPwd,
              //密码验证
              validator:validatePassWord,

              //保存数据
              onSaved: (value){
                _password = value!;
              },

            ),
            new TextFormField(
              controller: _textController,
              focusNode: _focusNodeText,
              //设置键盘类型
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "修改：个性签名",
                hintText: "请输入个性签名",
                prefixIcon: Icon(Icons.border_color),
                //尾部添加清除按钮
                suffixIcon:(_isShowClear1)
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

    // 修改信息按钮区域
    Widget loginButtonArea = new Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      height: 45.0,
      child: new RaisedButton(
        color: Color(0xffc1d2f0),
        child: Text(
          "修改个人信息",
          style: Theme.of(context).primaryTextTheme.headline,
        ),
        // 设置按钮圆角
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        onPressed: () async {
          //点击登录按钮，解除焦点，回收键盘
          _focusNodePassWord.unfocus();
          _focusNodeUserName.unfocus();
          _focusNodeText.unfocus();

          if (_formKey.currentState!.validate()) {
            //只有输入通过验证，才会执行这里
            _formKey.currentState!.save();

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
            CloudBaseStorage storage = CloudBaseStorage(core);
            CloudBaseAuth auth = CloudBaseAuth(core);
            await auth.signInAnonymously().then((success) {
              // 登录成功
              print("连接上腾讯云 success");
            }).catchError((err) {
              // 登录失败
              print(err);
            });
            await auth.getUserInfo().then((userInfo) {
              print(userInfo);
            }).catchError((err) {
              // 获取用户信息失败
            });
            CloudBaseDatabase db = CloudBaseDatabase(core);

            print(_imgPath);
            print(_background);

            if(_imgPath  == null){
              _imgPath = widget.img;
            }else if(_imgPath is String ){

            }else{
              await storage.uploadFile(
                  cloudPath: 'user/' + _username + '/img.jpg',
                  filePath: _imgPath.path,
                  onProcess: (int count, int total) {
                    // 当前进度
                    print(count);
                    // 总进度
                    print(total);
                  }
              );
              List<String> fileIds = [
                'cloud://hello-cloudbase-2gpxbs42520e0bce.6865-hello-cloudbase-2gpxbs42520e0bce-1305329631/user/'+_username+'/img.jpg'
              ];
              CloudBaseStorageRes<List<DownloadMetadata>> res = await storage
                  .getFileDownloadURL(fileIds);
              _imgPath = res.data[0].downloadUrl;
            }
            if(_background  == null){
              _background = widget.background;
            }else if(_background is String ){

            }else {
              await storage.uploadFile(
                  cloudPath: 'user/' + _username + '/background.jpg',
                  filePath: _background.path,
                  onProcess: (int count, int total) {
                    // 当前进度
                    print(count);
                    // 总进度
                    print(total);
                  }
              );
              List<String> fileIds = [
                'cloud://hello-cloudbase-2gpxbs42520e0bce.6865-hello-cloudbase-2gpxbs42520e0bce-1305329631/user/'+_username+'/background.jpg',
              ];
              CloudBaseStorageRes<List<DownloadMetadata>> res = await storage
                  .getFileDownloadURL(fileIds);
              _background = res.data[0].downloadUrl;
            }

            Collection collection = db.collection('user');
            collection.where({
              'username': _username,
              'password': _password
            }).count().then((res) {
              var total = res.total; //符合条件的文档的数量
              if(total == 0){
                Fluttertoast.showToast(msg: '用户名或密码错误',
                  fontSize: 14,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 2,
                  textColor: Colors.white,
                  backgroundColor: Colors.red,);
              }else{
                collection.where({
                  'username': _username,
                  'password': _password
                }).update({
                  'text': _text,
                  'img': _imgPath,
                  'background': _background
                }).then((res) {
                  Fluttertoast.showToast(msg: '修改信息成功',
                    fontSize: 14,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 2,
                    textColor: Colors.white,
                    backgroundColor: Colors.green,);
                  //todo 登录操作
                  Navigator.of(context).pop();
                });
              }
              print("登录成功");
            }).catchError((e) {
              print("登录失败");
            });

            print("$_username + $_password");
          }

        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("修改个人信息"),
        backgroundColor: Color(0xff718bba),
        elevation: 0,
      ),
      // 外层添加一个手势，用于点击空白部分，回收键盘
      body: new GestureDetector(
        onTap: (){
          // 点击空白区域，回收键盘
          print("点击了空白区域");
          _openGallery2();
          _focusNodePassWord.unfocus();
          _focusNodeUserName.unfocus();
          _focusNodeText.unfocus();
        },
        child: Container(
          decoration: _BackgroundView(_background),
          child: new ListView(
                  children: [
                    new SizedBox(height: ScreenUtil().setHeight(80),),
                    logoImageArea,
                    new SizedBox(height: ScreenUtil().setHeight(70),),
                    inputTextArea,
                    new SizedBox(height: ScreenUtil().setHeight(80),),
                    loginButtonArea,
                  ],
        ),
        )
      ),
    );
  }
}