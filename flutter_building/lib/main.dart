// @dart=2.9

import 'package:cloudbase_auth/cloudbase_auth.dart';
import 'package:cloudbase_core/cloudbase_core.dart';
import 'package:flutter/material.dart';

import 'index_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  CloudBaseCore core;

  Future<void> get() async {
    // 初始化 CloudBase
    core = CloudBaseCore.init({
      // 填写您的云开发 env
      'env': 'hello-cloudbase-2gpxbs42520e0bce',
      // 填写您的移动应用安全来源凭证
      // 生成凭证的应用标识必须是 Android 包名或者 iOS BundleID
      'appAccess': {
        // 凭证
        'key': 'a75f45fbd12d1c4446c5b882fa664a99',
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
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    get();
    return MaterialApp(
      title: '建筑赏析',
      home: IndexPage("",core),
    );
  }
}

