import 'package:cloudbase_auth/cloudbase_auth.dart';
import 'package:cloudbase_core/cloudbase_core.dart';
import 'package:cloudbase_storage/cloudbase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VacationBean {
  String url;
  String name;
  String country;

  VacationBean(this.url, this.country, this.name);

  // static List<String> down = List.filled(15, "");
  //
  // static void get() async {
  //   //添加到腾讯云数据库
  //   CloudBaseCore core = CloudBaseCore.init({
  //     'env': 'hello-cloudbase-2gpxbs42520e0bce',
  //     'appAccess': {
  //       // 凭证
  //       'key': 'f2706cd262976c6593743417fa3cfa1e',
  //       // 版本
  //       'version': '1'
  //     }
  //   });
  //   CloudBaseStorage storage = CloudBaseStorage(core);
  //   CloudBaseAuth auth = CloudBaseAuth(core);
  //   await auth.signInAnonymously().then((success) {
  //     // 登录成功
  //     print("连接上腾讯云 success");
  //   }).catchError((err) {
  //     // 登录失败
  //     print(err);
  //   });
  //   await auth.getUserInfo().then((userInfo) {
  //     print(userInfo);
  //   }).catchError((err) {
  //     // 获取用户信息失败
  //   });
  //   List<String> fileIds = [
  //     'cloud://hello-cloudbase-2gpxbs42520e0bce.6865-hello-cloudbase-2gpxbs42520e0bce-1305329631/assets/images/1.jpg',
  //     'cloud://hello-cloudbase-2gpxbs42520e0bce.6865-hello-cloudbase-2gpxbs42520e0bce-1305329631/assets/images/2.jpg',
  //     'cloud://hello-cloudbase-2gpxbs42520e0bce.6865-hello-cloudbase-2gpxbs42520e0bce-1305329631/assets/images/3.jpg',
  //     'cloud://hello-cloudbase-2gpxbs42520e0bce.6865-hello-cloudbase-2gpxbs42520e0bce-1305329631/assets/images/4.jpg',
  //     'cloud://hello-cloudbase-2gpxbs42520e0bce.6865-hello-cloudbase-2gpxbs42520e0bce-1305329631/assets/images/5.jpg',
  //     'cloud://hello-cloudbase-2gpxbs42520e0bce.6865-hello-cloudbase-2gpxbs42520e0bce-1305329631/assets/images/6.jpg',
  //     'cloud://hello-cloudbase-2gpxbs42520e0bce.6865-hello-cloudbase-2gpxbs42520e0bce-1305329631/assets/images/7.jpg',
  //     'cloud://hello-cloudbase-2gpxbs42520e0bce.6865-hello-cloudbase-2gpxbs42520e0bce-1305329631/assets/images/8.jpg',
  //     'cloud://hello-cloudbase-2gpxbs42520e0bce.6865-hello-cloudbase-2gpxbs42520e0bce-1305329631/assets/images/9.jpg',
  //     'cloud://hello-cloudbase-2gpxbs42520e0bce.6865-hello-cloudbase-2gpxbs42520e0bce-1305329631/assets/images/10.jpg',
  //     'cloud://hello-cloudbase-2gpxbs42520e0bce.6865-hello-cloudbase-2gpxbs42520e0bce-1305329631/assets/images/11.jpg',
  //     'cloud://hello-cloudbase-2gpxbs42520e0bce.6865-hello-cloudbase-2gpxbs42520e0bce-1305329631/assets/images/12.jpg',
  //     'cloud://hello-cloudbase-2gpxbs42520e0bce.6865-hello-cloudbase-2gpxbs42520e0bce-1305329631/assets/images/13.jpg',
  //     'cloud://hello-cloudbase-2gpxbs42520e0bce.6865-hello-cloudbase-2gpxbs42520e0bce-1305329631/assets/images/14.jpg',
  //     'cloud://hello-cloudbase-2gpxbs42520e0bce.6865-hello-cloudbase-2gpxbs42520e0bce-1305329631/assets/images/15.jpg',
  //   ];
  //   CloudBaseStorageRes<List<DownloadMetadata>> res = await storage
  //       .getFileDownloadURL(fileIds);
  //   print(res.data[0]); // {'fileId': 'xxx', 'downloadUrl': 'https://xxx'}
  //   for(var i = 0;i<15;i++){
  //     down[i] = res.data[i].downloadUrl;
  //   }
  // }

  static List<VacationBean> generate(){
    return [
      VacationBean("https://images.pexels.com/photos/2304791/pexels-photo-2304791.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "中国","万里长城"),
      VacationBean("https://images.pexels.com/photos/887848/pexels-photo-887848.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "美国","自由女神像"),
      VacationBean("https://images.pexels.com/photos/4173679/pexels-photo-4173679.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "法国","埃菲尔铁塔"),
      VacationBean("https://images.pexels.com/photos/1837591/pexels-photo-1837591.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "英国","大本钟"),
      VacationBean("https://images.pexels.com/photos/2193268/pexels-photo-2193268.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "澳大利亚","悉尼歌剧院"),
      VacationBean("https://images.pexels.com/photos/4161911/pexels-photo-4161911.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "意大利","比萨斜塔"),
      VacationBean("https://images.pexels.com/photos/2387871/pexels-photo-2387871.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "印度","泰姬陵"),
      VacationBean("https://images.pexels.com/photos/4212360/pexels-photo-4212360.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "德国","勃兰登堡门"),
      VacationBean("https://images.pexels.com/photos/91409/pexels-photo-91409.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "埃及","金字塔"),
      VacationBean("https://images.pexels.com/photos/1561863/pexels-photo-1561863.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "新加坡","鱼尾狮"),
      VacationBean("https://images.pexels.com/photos/2940925/pexels-photo-2940925.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "马来西亚","吉隆坡双子塔"),
      VacationBean("https://images.pexels.com/photos/5745048/pexels-photo-5745048.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "日本","东京塔"),
      VacationBean("https://images.pexels.com/photos/2041556/pexels-photo-2041556.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "阿联酋","阿拉伯塔酒店"),
      VacationBean("https://images.pexels.com/photos/1531677/pexels-photo-1531677.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "柬埔寨","吴哥窟"),
      VacationBean("https://images.pexels.com/photos/6152262/pexels-photo-6152262.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "土耳其","圣索菲亚大教堂"),
    ];
  }
}