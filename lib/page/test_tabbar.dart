import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    Tab(
      text: '选项卡一',
    ),
    Tab(
      text: '选项卡二',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "底部标签栏",
      home: DefaultTabController(
        //选项卡长度
        length: myTabs.length,
        child: Scaffold(
            appBar: PreferredSize(
              child: AppBar(
                title: Text('AppBar标题'),
                //添加选项卡按钮，注意此bottom表示在AppBar的底部，在整个页面上看还是处于顶部区域
                bottom: TabBar(
                  tabs: myTabs,
                ),
              ),
              preferredSize: Size.fromHeight(200),
            ),
            body: TabBarView(
              children: myTabs.map((Tab tab) {
                return Center(child: Text("hahha"));
              }).toList(),
            )),
      ),
    );
  }
}



