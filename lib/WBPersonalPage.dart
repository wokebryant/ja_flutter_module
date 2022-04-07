import 'package:flutter/material.dart';
import 'package:ja_flutter_module/utils/DeviceUtil.dart';

/// WorkBox个人信息页面
class WBPersonalPage extends StatelessWidget {
  const WBPersonalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceUtil.setDarkStatusBar();
    return _buildPersonalPage();
  }

  Widget _buildPersonalPage() {
    /// 标题栏
    var title = ListTile(
      leading: const Icon(Icons.arrow_back_sharp),
      iconColor: Colors.black,
      title: Text(
        "个人信息", style: userInfoTextStyle(fontSize: 18)),
    );

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
      child: _buildButton("提取工资记录", () { })
    );

    /// 工作明细按钮
    final workRecordBtn = Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: _buildButton("工作明细记录", () { })
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
}

/// 按钮样式
final outlineButtonStyle = OutlinedButton.styleFrom(
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0)
  ),
  side: const BorderSide(
      width: 2,
      color: Colors.black,
      style: BorderStyle.solid
  ),
  minimumSize: const Size(double.infinity, 50)
);

/// 按钮文本样式
const buttonTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w600
);

/// 用户信息文本样式
TextStyle userInfoTextStyle({
  Color? color = Colors.black,
  double? fontSize,
}) => TextStyle(
    color: color,
    fontSize: fontSize
);
