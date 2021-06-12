import 'package:cloudbase_auth/cloudbase_auth.dart';
import 'package:cloudbase_core/cloudbase_core.dart';
import 'package:cloudbase_database/cloudbase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';


class RegistPage extends StatefulWidget {
  late final String name;
  RegistPage(this.name);

  @override
  State<StatefulWidget> createState() {
    return _RegistState();
  }
}

class _RegistState extends State<RegistPage> {
  //焦点
  FocusNode _focusNodeUserName = new FocusNode();
  FocusNode _focusNodePassWord = new FocusNode();
  FocusNode _focusNodePassWordSure = new FocusNode();
  FocusNode _focusNodeQuestion= new FocusNode();
  FocusNode _focusNodeAnswer = new FocusNode();
  //用户名输入框控制器，此控制器可以监听用户名输入框操作
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _questionController = new TextEditingController();
  TextEditingController _answerController = new TextEditingController();

  //表单状态
  final _formKey = GlobalKey<FormState>();

  var _password = '';//用户名
  var _passwordsure = '';//用户名
  var _username = '';//密码
  var _question = '';//密保问题
  var _answer = '';//密保答案
  var _isShowPwd = false;//是否显示密码
  var _isShowPwdSure = false;//是否显示密码
  var _isShowClear = false;//是否显示输入框尾部的清除按钮
  var _isShowClear1 = false;//是否显示输入框尾部的清除按钮
  var _isShowClear2 = false;//是否显示输入框尾部的清除按钮

  @override
  void initState() {
    // TODO: implement initState
    //设置焦点监听
    _focusNodeUserName.addListener(_focusNodeListener);
    _focusNodePassWord.addListener(_focusNodeListener);
    _focusNodePassWordSure.addListener(_focusNodeListener);
    _focusNodeQuestion.addListener(_focusNodeListener);
    _focusNodeAnswer.addListener(_focusNodeListener);
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
    _questionController.addListener((){
      print(_questionController.text);
      // 监听文本框输入变化，当有内容的时候，显示尾部清除按钮，否则不显示

      if (_questionController.text.length > 0) {
        _isShowClear1 = true;
      }else{
        _isShowClear1 = false;
      }
      setState(() {

      });
    });
    _answerController.addListener((){
      print(_answerController.text);
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
    _focusNodeUserName.removeListener(_focusNodeListener);
    _focusNodePassWord.removeListener(_focusNodeListener);
    _focusNodePassWordSure.removeListener(_focusNodeListener);
    _focusNodeQuestion.removeListener(_focusNodeListener);
    _focusNodeAnswer.removeListener(_focusNodeListener);
    _userNameController.dispose();
    _questionController.dispose();
    _answerController.dispose();
    super.dispose();
  }

  // 监听焦点
  Future _focusNodeListener() async{
    if(_focusNodeUserName.hasFocus){
      _focusNodePassWord.unfocus();
      _focusNodePassWordSure.unfocus();
      _focusNodeQuestion.unfocus();
      _focusNodeAnswer.unfocus();
    }
    if (_focusNodePassWord.hasFocus) {
      _focusNodeUserName.unfocus();
      _focusNodePassWordSure.unfocus();
      _focusNodeQuestion.unfocus();
      _focusNodeAnswer.unfocus();
    }
    if (_focusNodePassWordSure.hasFocus) {
      _focusNodeUserName.unfocus();
      _focusNodePassWord.unfocus();
      _focusNodeQuestion.unfocus();
      _focusNodeAnswer.unfocus();
    }
    if (_focusNodeQuestion.hasFocus) {
      _focusNodeUserName.unfocus();
      _focusNodePassWord.unfocus();
      _focusNodePassWordSure.unfocus();
      _focusNodeAnswer.unfocus();
    }
    if (_focusNodeAnswer.hasFocus) {
      _focusNodeUserName.unfocus();
      _focusNodePassWord.unfocus();
      _focusNodePassWordSure.unfocus();
      _focusNodeQuestion.unfocus();
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

  bool validatePassWordSure(){
    if( _passwordsure != _password){
      print(_password);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width:750,height:1334)..init(context);
    print(ScreenUtil().scaleHeight);

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
                hintText: "昵称是识别用户的唯一凭证，不可修改",
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
              focusNode: _focusNodePassWordSure,
              decoration: InputDecoration(
                  labelText: "确认密码",
                  hintText: "请再一次输入密码",
                  prefixIcon: Icon(Icons.lock),
                  // 是否显示密码
                  suffixIcon: IconButton(
                    icon: Icon((_isShowPwdSure) ? Icons.visibility : Icons.visibility_off),
                    // 点击改变显示或隐藏密码
                    onPressed: (){
                      setState(() {
                        _isShowPwdSure = !_isShowPwdSure;
                      });
                    },
                  )
              ),
              obscureText: !_isShowPwdSure,
              //密码验证
              validator:validatePassWord,

              //保存数据
              onSaved: (value){
                _passwordsure = value!;
              },

            ),
            new TextFormField(
              controller: _questionController,
              focusNode: _focusNodeQuestion,
              //设置键盘类型
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "密保问题",
                hintText: "用于找回密码",
                prefixIcon: Icon(Icons.help),
                //尾部添加清除按钮
                suffixIcon:(_isShowClear1)
                    ? IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: (){
                    // 清空输入框内容
                    _questionController.clear();
                  },
                )
                    : null ,
              ),
              //验证用户名
              validator: validateUserName,

              //保存数据
              onSaved: (value){
                _question = value!;
              },

            ),
            new TextFormField(
              controller: _answerController,
              focusNode: _focusNodeAnswer,
              //设置键盘类型
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "密保答案",
                hintText: "请牢记答案",
                prefixIcon: Icon(Icons.sticky_note_2
                ),
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
          widget.name,
          style: Theme.of(context).primaryTextTheme.headline,
        ),
        // 设置按钮圆角
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        onPressed: () async {
          //点击登录按钮，解除焦点，回收键盘
          _focusNodePassWord.unfocus();
          _focusNodePassWordSure.unfocus();
          _focusNodeUserName.unfocus();
          _focusNodeQuestion.unfocus();
          _focusNodeAnswer.unfocus();

          if (_formKey.currentState!.validate()) {
            //只有输入通过验证，才会执行这里
            _formKey.currentState!.save();
            if(validatePassWordSure()) {

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
              Collection collection = db.collection('user');

              if(widget.name == "快速注册") {
                collection.where({
                  'username': _username
                }).count().then((res) {
                  var total = res.total; //符合条件的文档的数量
                  if (total != 0) {
                    Fluttertoast.showToast(msg: '该用户已存在，请重写用户名',
                      fontSize: 14,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 2,
                      textColor: Colors.white,
                      backgroundColor: Colors.red,);
                  } else {
                    collection.add({
                      'username': _username,
                      'password': _password,
                      'question': _question,
                      'answer': _answer,
                      'background': "https://images.pexels.com/photos/3330118/pexels-photo-3330118.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                      'text': "来写个性签名吧~",
                      'img': "https://www.itying.com/images/flutter/5.png",
                      'favorite': [],
                      'star':[],
                      'publish':[]
                    }).then((res) {
                      Fluttertoast.showToast(msg: '注册成功',
                        fontSize: 14,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 2,
                        textColor: Colors.white,
                        backgroundColor: Colors.green,);
                      //todo 登录操作
                      Navigator.of(context).pop();
                      print("添加用户成功");
                    }).catchError((e) {
                      print("添加用户失败");
                    });
                  }
                  print("登录成功");
                }).catchError((e) {
                  print("登录失败");
                });
              }
              else if(widget.name == "更改密保"){
                collection.where({
                  'username': _username,
                  'password': _password
                }).count().then((res) {
                  var total = res.total; //符合条件的文档的数量
                  if (total == 0) {
                    Fluttertoast.showToast(msg: '用户名或密码错误',
                      fontSize: 14,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 2,
                      textColor: Colors.white,
                      backgroundColor: Colors.red,);
                  } else {
                    collection.where({
                      'username': _username,
                      'password': _password
                    }).update({
                      'question': _question,
                      'answer': _answer
                    }).then((res) {
                      Fluttertoast.showToast(msg: '更改密保成功',
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

              }

            }
            else{
              Fluttertoast.showToast(msg: '两次密码不一致，注册失败',
                fontSize: 14,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 2,
                textColor: Colors.white,
                backgroundColor: Colors.red,);
            }
          }

        },
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Color(0xff718bba),
        elevation: 0,
      ),
      body:  new GestureDetector(
        onTap: (){
          // 点击空白区域，回收键盘
          print("点击了空白区域");
          _focusNodePassWord.unfocus();
          _focusNodePassWordSure.unfocus();
          _focusNodeUserName.unfocus();
          _focusNodeQuestion.unfocus();
          _focusNodeAnswer.unfocus();
        },
        child: new ListView(
          children: [
            new SizedBox(height: ScreenUtil().setHeight(70),),
            inputTextArea,
            new SizedBox(height: ScreenUtil().setHeight(80),),
            loginButtonArea,
          ],
        ),
      ),
    );
  }

}


