import 'package:flutter/widgets.dart';
import 'package:mp_antd_mobile/mp_antd_mobile.dart';
import 'package:mpcore/mpcore.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

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
      name: 'Card',
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          renderTitle('基础用法'),
          Container(
            color: Colors.black.withOpacity(0.50),
            padding: EdgeInsets.all(12),
            child: Center(
              child: AntCard(
                title: Text('卡片标题'),
                body: Text('卡片内容'),
              ),
            ),
          ),
          SizedBox(height: 20),
          renderTitle('没有卡片内容'),
          Container(
            color: Colors.black.withOpacity(0.50),
            padding: EdgeInsets.all(12),
            child: Center(
              child: AntCard(
                title: Text('卡片标题'),
              ),
            ),
          ),
          SizedBox(height: 20),
          renderTitle('没有卡片标题'),
          Container(
            color: Colors.black.withOpacity(0.50),
            padding: EdgeInsets.all(12),
            child: Center(
              child: AntCard(
                body: Text('卡片内容'),
              ),
            ),
          ),
          SizedBox(height: 20),
          renderTitle('自定义卡片内容'),
          Container(
            color: Colors.black.withOpacity(0.50),
            padding: EdgeInsets.all(12),
            child: Center(
              child: AntCard(
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    MPIcon(MaterialIcons.ac_unit, size: 14),
                    SizedBox(width: 6),
                    Text('卡片标题'),
                  ],
                ),
                extra: MPIcon(MaterialIcons.keyboard_arrow_right, size: 18),
                body: Text('卡片内容'),
                actions: [
                  AntButton(
                    child: Text('确认'),
                    color: AntButtonColor.primary,
                    size: AntButtonSize.mini,
                  ),
                  AntButton(
                    child: Text('取消'),
                    color: AntButtonColor.normal,
                    size: AntButtonSize.mini,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
