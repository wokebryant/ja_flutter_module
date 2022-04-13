import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ja_flutter_module/ui/color.dart';
import 'package:ja_flutter_module/ui/style.dart';
import 'package:ja_flutter_module/ui/widget.dart';
import 'package:ja_flutter_module/utils/device_util.dart';

class WBWorkRecordPage extends StatelessWidget {
  const WBWorkRecordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceUtil.setDarkStatusBar();
    return _buildRecordPage(context);
  }

  Widget _buildRecordPage(BuildContext context) {
    const tooleBarHeight = 230.0;

    final _tabs = [
      TabItemInfo(num: 20, state: "处理中", page: processTabPage()),
      TabItemInfo(num: 81, state: "成功", page: successTabPage()),
      TabItemInfo(num: 94, state: "失败", page: failTabPage()),
    ];

    final title = wbPageTitle(title: "工作明细记录", listener: () {
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      } else {
        SystemNavigator.pop();
      }
    });

    final statistics = Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          statisticsItem("295", "提交任务"),
          statisticsItem("209.35599 ACN", "累计获得工资"),
        ],
      ),
    );

    return DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            titleSpacing: 0,
            leadingWidth: 0,
            title: title,
            shadowColor: Colors.transparent,
          ),

          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget> [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  expandedHeight: tooleBarHeight,
                  // floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    expandedTitleScale: 1.0,
                    collapseMode: CollapseMode.pin,
                    centerTitle: true,
                    background: statistics,
                  ),
                  bottom: PreferredSize(
                    child: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: workBoxHint,
                      indicatorColor: Colors.black,
                      tabs: _tabs.map((e) => tab(e.num.toString(), e.state)).toList(),
                    ),
                    preferredSize: const Size.fromHeight(0),
                  )
                )
              ];
            },
            body: TabBarView(
              children: _tabs.map((e) => e.page).toList(),
            ),
          ),
        )
    );
  }

  Widget statisticsItem (String title, String subTitle) => Container(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: userInfoTextStyle(fontSize: 26.0, color: workBoxGreen),
        ),
        Text(
          subTitle,
          style: userInfoTextStyle(fontSize: 14.0, color: workBoxHint),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    ),
  );
}

Widget processTabPage() {
  final tip = Container(
    color: workBoxBg,
    height: 60,
    child: const Center(
      child: Text(
        "20个处理中,预计24小时内处理完成",
        style: TextStyle(
            color: workBoxHint
        ),
      ),
    )
  );

  final bottom = Container(
      color: workBoxBg,
      height: 60,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "为了确保系统性能,仅显示30天的记录",
              style: TextStyle(
                  color: workBoxHint
              ),
            ),
            Text(
              "查看更多",
              style: TextStyle(
                  color: workBoxGreen
              ),
            ),
          ],
        ),
      )
  );

  const listItem = ListTile(
    dense: true,
    title: Text("图片中包含以下那些选项", style: TextStyle(fontSize: 14)),
    subtitle: Text("提交时间 2021-06-11 17:47", style: TextStyle(fontSize: 13, color: workBoxHint)),
  );

  final listView = ListView(
    children: <Widget>[
      tip,
      for (var i = 0; i < 20; i++) listItem,
      bottom,
      // tem
    ],
  );

  return Container(
    child: listView,
  );
}

Widget successTabPage() {
  return Container(
    color: workBoxBg,
    child: Center(
      child: Column(
        children: [
          Image.asset(
              "images/img_empty.png",
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: const Text("暂时没有审核成功的任务"),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: const Text(
              "为了确保系统性能,仅显示30天的记录",
              style: TextStyle(
                  color: workBoxHint
              ),
            ),
          ),
          const Text(
            "查看更多 >",
            style: TextStyle(
                color: workBoxGreen
            ),
          ),
        ],
      ),
    )
  );
}

Widget failTabPage() {
  return Container(

  );
}

Widget tab(String title, String subTitle) => Tab(
  child: Column(
    children: [
      Text(title),
      Text(subTitle)
    ],
  ),
);

class TabItemInfo {
  final int num;
  final String state;
  final Widget page;

  TabItemInfo({
    required this.num,
    required this.state,
    required this.page
  });
}

