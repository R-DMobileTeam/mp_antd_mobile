import 'package:flutter/widgets.dart';
import 'package:mp_antd_mobile/mp_antd_mobile.dart';
import 'package:mpcore/mpcore.dart';

class DividerPage extends StatelessWidget {
  const DividerPage({Key? key}) : super(key: key);

  Widget renderTitle(String title) {
    return Container(
      height: 44,
      child: Text(
        title,
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MPScaffold(
      name: 'Divider',
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          renderTitle('基础分割线'),
          AntDivider(),
          SizedBox(height: 20),
          renderTitle('带内容的分割线'),
          AntDivider(
            child: Text('默认内容在中间'),
          ),
          AntDivider(
            contentPosition: AntDividerPosition.left,
            child: Text('左侧内容'),
          ),
          AntDivider(
            contentPosition: AntDividerPosition.right,
            child: Text('右侧内容'),
          ),
          SizedBox(height: 20),
          renderTitle('竖向分割线'),
          Row(
            children: [
              Text('Text'),
              AntDivider(direction: AntDividerDirection.vertical),
              Text('Text'),
              AntDivider(direction: AntDividerDirection.vertical),
              Text('Text'),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
