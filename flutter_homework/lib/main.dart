// @dart=2.9

import 'package:flutter/material.dart';
import 'index_page.dart';
import 'package:cloudbase_core/cloudbase_core.dart';
import 'package:cloudbase_auth/cloudbase_auth.dart';

void main() async{
  // // 初始化 CloudBase
  // CloudBaseCore core = CloudBaseCore.init({
  //   // 填写您的云开发 env
  //   'env': 'hello-cloudbase-2gpxbs42520e0bce',
  //   // 填写您的移动应用安全来源凭证
  //   // 生成凭证的应用标识必须是 Android 包名或者 iOS BundleID
  //   'appAccess': {
  //     // 凭证
  //     'key': 'f2706cd262976c6593743417fa3cfa1e',
  //     // 版本
  //     'version': '1'
  //   }
  // });
  // // 获取登录状态
  // CloudBaseAuth auth = CloudBaseAuth(core);
  // CloudBaseAuthState authState = await auth.getAuthState();
  // // 唤起匿名登录
  // if (authState == null) {
  //   await auth.signInAnonymously().then((success) {
  //     // 登录成功
  //     print("连接上腾讯云 success");
  //   }).catchError((err) {
  //     // 登录失败
  //     print(err);
  //   });
  // }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '建筑赏析',
      home: IndexPage(""),
    );
  }
}

