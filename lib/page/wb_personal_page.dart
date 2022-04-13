import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:ja_flutter_module/utils/device_util.dart';
import '../ui/style.dart';
import '../ui/widget.dart';

/// WorkBox个人信息页面
class WBPersonalPage extends StatelessWidget {
  const WBPersonalPage({Key? key}) : super(key: key);

  static const platform = BasicMessageChannel("flutter/navigation", JSONMessageCodec());

  @override
  Widget build(BuildContext context) {
    DeviceUtil.setDarkStatusBar();
    return _buildPersonalPage(context);
  }

  Widget _buildPersonalPage(BuildContext context) {
    /// 标题栏
    var title = wbPageTitle(title: "个人信息", listener: () {
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      } else {
        SystemNavigator.pop();
      }
    });

    /// 用户等级，工资信息
    final userInfoLayout = Container(
      color: const Color(0x66E0E0E0),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  child: Text("W", style: userInfoTextStyle(color: Colors.white, fontSize: 32)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Text("woke_bryant", style: userInfoTextStyle(fontSize: 20.0)),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                _buildUserInfoItem("3", "当前等级", Colors.deepOrange),
                Container(
                  margin: const EdgeInsets.only(left: 90),
                  child: _buildUserInfoItem("15%", "工资加成")
                )
              ],
            ),
          )
        ],
      ),
    );

    /// 提取工资按钮
    final extractPayRollBtn = Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: _buildButton("提取工资记录", () => _jumpToWBExtractSalaryPage())
    );

    /// 工作明细按钮
    final workRecordBtn = Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: _buildButton("工作明细记录", () {
        // BoostNavigator.instance.push("wb_record_page");
        Navigator.of(context).pushNamed("wb_record_page");
      })
    );

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 26.0),
        child: Column(
          children: [
            title,
            userInfoLayout,
            extractPayRollBtn,
            workRecordBtn
          ],
        ),
      ),
    );
  }

  Column _buildUserInfoItem(String title, String subTitle, [Color? titleColor]) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: userInfoTextStyle(color: titleColor, fontSize: 25.0)),
      Text(subTitle, style: userInfoTextStyle(fontSize: 14.0)),
    ],
  );

  OutlinedButton _buildButton(String content, VoidCallback onPressed) => OutlinedButton(
    onPressed: onPressed,
    child: Text(
        content,
        style: buttonTextStyle
    ),
    style: outlineButtonStyle
  );

  /// 跳转WorkBox提取工资页面(Compose页面)
  Future<void> _jumpToWBExtractSalaryPage() async {
    Map<String, String> args = {
      "route": "work_box_salary_record",
      "2021-11-08 10:59": "6.9ACN",
      "2021-07-30 1:55": "54.2736ACN",
    };
    Map<String, Object> map = {
      "method": "navigation",
      "args": args
    };

    final result = await platform.send(map) as List<dynamic>;
    if (result.isNotEmpty && result[0] == "agree") {
      // 接受Native返回值
    }
  }

  /// 跳转WorkBox提取工资页面(Compose页面) Boost
  Future<void> _jumpToWBExtractSalaryPageWithBoost() async {
    BoostNavigator.instance.push("native_wb_record_page");
  }
  
}

class SalaryRecord {
  final String date;
  final String salary;

  const SalaryRecord({
    required this.date,
    required this.salary
  });
}
