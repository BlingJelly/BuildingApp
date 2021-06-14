import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TravelBean.dart';
import 'data.dart';

class CardDemo extends StatefulWidget {
  List<TravelBean> list;
  bool first;
  CardDemo(this.list,this.first);

  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    List<String> str;
    if(widget.first == true){
      str = card;
    }else{
      str = card1;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('详细介绍'),
          backgroundColor: Color(0xff718bba),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10),
              itemBuilder: (context, index) {
                var bean = widget.list[index];
                return Card(
                child: Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 16/9,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                        child: Image.network(
                          bean.url,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(bean.name),
                      subtitle: Text(bean.location),
                    ),
                    // Container(
                    //   padding: EdgeInsets.all(10),
                    //   child: Text(str[index], overflow: TextOverflow.ellipsis,),
                    // ),
                    Container(
                      padding: EdgeInsets.all(13),
                      child: Text(str[index]),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 10))
                  ],
                ),
              );
             },
            itemCount: widget.list.length,
  )
          ),
        );
  }
}