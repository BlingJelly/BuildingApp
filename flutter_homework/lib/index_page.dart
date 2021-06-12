import 'package:cloudbase_auth/cloudbase_auth.dart';
import 'package:cloudbase_core/cloudbase_core.dart';
import 'package:cloudbase_database/cloudbase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework/room_page.dart';
import 'package:flutter_homework/setting_page.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'msg_page.dart';
import 'person_page.dart';
import 'VocationBean.dart';

class IndexPage extends StatefulWidget {
  late final String name;
  IndexPage(this.name);

  @override
  State<StatefulWidget> createState() {
    return _IndexState();
  }
}

class _IndexState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: Icon(
        Icons.navigation,
        color: Colors.grey,
      ),
      title: Text("导航",
          style:  TextStyle(
            color: Colors.grey,)),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: Icon(
        Icons.home,
        color: Colors.grey,
      ),
      title: Text("首页",
          style:  TextStyle(
            color: Colors.grey,)),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: Icon(
        Icons.person,
        color: Colors.grey,
      ),
      title: Text("个人",
          style:  TextStyle(
        color: Colors.grey,)),
    ),
  ];

  late int currentIndex;
  late int currentIndex1;
  String img = "https://www.itying.com/images/flutter/5.png";
  String background = "https://images.pexels.com/photos/3330118/pexels-photo-3330118.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  String username= "  用户King";
  String text ="My State：未登录";
  List favorite = [];
  List publish = [];
  List star = [];
  List<VacationBean> _list = [];


  @override
  void initState() {
    super.initState();
    currentIndex = 1;
    currentIndex1 = 1;
  }

  void _DrawerView() async {

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
    Collection collection = db.collection('publish');
    collection.get().then((res) {
      var data = res.data;
      List<VacationBean> list= [];
      Set<VacationBean> set=new Set<VacationBean>();
      for(int i =0 ;i<data.length;i++){
          list.add(VacationBean(data[i]["url"], data[i]["name"], data[i]["text"]));
          set.addAll(list);
      }
      _list=set.toList();
      print(data);
      print(_list);
      print("显示用户成功");
    }).catchError((e) {
      print("显示用户失败");
    });

    if (widget.name == "") {
      img = "https://www.itying.com/images/flutter/5.png";
      background = "https://images.pexels.com/photos/3330118/pexels-photo-3330118.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
    } else  {

      Collection collection = db.collection('user');
      collection.where({
        'username': widget.name,
      }).get().then((res) {
        var data = res.data;
        print(data);
        img = data[0]["img"];
        background = data[0]["background"];
        username = "  "+data[0]["username"];
        text = data[0]["text"];
        favorite = data[0]["favorite"];
        star = data[0]["star"];
        publish = data[0]["publish"];
        print("显示用户成功");
      }).catchError((e) {
        print("显示用户失败");
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = [MsgPage(widget.name), HomePage(widget.name),LoginPage(),PersonPage(widget.name,text,publish,favorite,star)];
    _DrawerView();
    return Scaffold(
      appBar: AppBar(
        title: Text("建筑赏析"),
        backgroundColor: Color(0xff718bba),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 20),
            icon: Icon(
              Icons.search,
            ),
            onPressed: (){
              showSearch(context: context,delegate: SearchBarDelegate());
            },
          ),
        ],
      ),
      //左侧边栏
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            //头部
            Row(
              children: <Widget>[
                Expanded(
                  child: UserAccountsDrawerHeader(
                    accountName: Text(username),
                    accountEmail: Text(text),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                          img),
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              background),
                          fit: BoxFit.fill),
                    ),
                  )
                )
              ],
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.collections_bookmark_rounded),
                backgroundColor: Color(0xffc1d2f0),
              ),
              title: Text("更多展示"),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomPage(_list,widget.name,"注册用户的交流展示区")),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.settings),
                backgroundColor: Color(0xffc1d2f0),
              ),
              title: Text("设置中心"),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingPage(widget.name,img,background)),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                  child: Icon(Icons.people),
                backgroundColor: Color(0xffc1d2f0),
              ),
              title: Text("关于我们"),
              onTap: () {
                Navigator.of(context).pop(); //隐藏侧边栏
                Navigator.pushNamed(context, '/user');
              },
            ),
            Divider(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white10,
        items: bottomNavItems,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          _changePage(index);
        },
      ),
      body: pages[currentIndex1],
    );
  }

  /*切换页面*/
  void _changePage(int index) {
    /*如果点击的导航项不是当前项  切换 */
    if (index != currentIndex) {
      setState(() {
        if(index == 2 && widget.name != ""){
          currentIndex1 = index+1;
        }else {
          currentIndex1 = index;
        }
        currentIndex = index;
      });
    }
  }

}

class SearchBarDelegate extends SearchDelegate<String>{

  var show;

  Future<String> search_publish() async {
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
    Collection collection = db.collection('publish');
    collection.where({
      'name': query,
      'text': query
    }).count().then((res) {
      var total = res.total; //符合条件的文档的数量
      if(total == 0){
        return "没有该作品";
      }else{

        collection.where({
          'name': query,
          'text': query
        }).get().then((res) {
          var data = res.data; //符合条件的文档的数量
          return data;
        }).catchError((e) {
        });

      }
    }).catchError((e) {

    });
    return "查找中";
  }

  //清空按钮
  @override
  List<Widget>buildActions(BuildContext context){
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = "", //搜索值为空
      )
    ];
  }
  //返回上级按钮
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation
        ),
        onPressed: () => close(context, "null")  //点击时关闭整个搜索页面
    );
  }
  //搜到到内容后的展现
  @override
  Widget buildResults(BuildContext context){
    search_publish();
    return Container(
      width: 100.0,
      height:100.0,
      child: Card(
        color:Colors.redAccent,
        child: Center(
          child: Text(show),
        ),
      ),
    );
  }
  //设置推荐
  @override
  Widget buildSuggestions(BuildContext context){

    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 20,bottom: 20)),
        Center(
        child:Text("根据作品 作者名 或者 简介",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 15,
          wordSpacing: 2,
          letterSpacing: 2
        ),),
        ),
        Padding(padding: EdgeInsets.only(top: 10,bottom: 10)),
        Center(
        child:Text("搜索 注册用户的交流展示区的 作品",
          style: TextStyle(
              color: Colors.grey,
            fontSize: 15,
            wordSpacing: 2,
            letterSpacing: 2
          ),)
        )
      ],
    );
  }

}


