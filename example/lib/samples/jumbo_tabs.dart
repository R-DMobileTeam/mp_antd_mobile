import 'package:flutter/widgets.dart';
import 'package:mp_antd_mobile/mp_antd_mobile.dart';
import 'package:mpcore/mpcore.dart';

class JumboTabsPage extends StatelessWidget {
  const JumboTabsPage({Key? key}) : super(key: key);

  Widget renderTitle(String title) {
    return Container(
      height: 22,
      padding: EdgeInsets.only(left: 12),
      child: Text(
        title,
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MPScaffold(
      name: 'JumboTabs',
      body: ListView(children: [
        renderTitle('基础用法'),
        _renderBasic(),
        renderTitle('超长滑动'),
        _renderTabBarScrollable(),
        renderTitle('没有内容区'),
        _renderNoContent(),
        renderTitle('禁用状态'),
        _renderDisable(),
      ]),
    );
  }

  Widget _renderBasic() {
    return AntJumboTabs(
      tabs: [
        AntJumboTabItem(
          title: '水果',
          description: '描述文案',
          contentBuilder: ((context) {
            return Container(
              padding: EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('菠萝'),
              ),
            );
          }),
        ),
        AntJumboTabItem(
          title: '蔬菜',
          description: '描述文案',
          contentBuilder: ((context) {
            return Container(
              padding: EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('西红柿'),
              ),
            );
          }),
        ),
        AntJumboTabItem(
          title: '动物',
          description: '描述文案',
          contentBuilder: ((context) {
            return Container(
              padding: EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('蚂蚁'),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _renderTabBarScrollable() {
    return AntJumboTabs(
      tabBarScrollable: true,
      tabs: [
        AntJumboTabItem(
          title: 'Expresso',
          description: '描述文案',
          contentBuilder: ((context) {
            return Container(
              padding: EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('1'),
              ),
            );
          }),
        ),
        AntJumboTabItem(
          title: 'Coffee Latte',
          description: '描述文案',
          contentBuilder: ((context) {
            return Container(
              padding: EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('2'),
              ),
            );
          }),
        ),
        AntJumboTabItem(
          title: 'Cappuccino',
          description: '描述文案',
          contentBuilder: ((context) {
            return Container(
              padding: EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('3'),
              ),
            );
          }),
        ),
        AntJumboTabItem(
          title: 'Americano',
          description: '描述文案',
          contentBuilder: ((context) {
            return Container(
              padding: EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('4'),
              ),
            );
          }),
        ),
        AntJumboTabItem(
          title: 'Cafe Mocha',
          description: '描述文案',
          contentBuilder: ((context) {
            return Container(
              padding: EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('5'),
              ),
            );
          }),
        ),
        AntJumboTabItem(
          title: 'Flat White',
          description: '描述文案',
          contentBuilder: ((context) {
            return Container(
              padding: EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('6'),
              ),
            );
          }),
        ),
        AntJumboTabItem(
          title: 'Caramel Macchiato',
          description: '描述文案',
          contentBuilder: ((context) {
            return Container(
              padding: EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('7'),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _renderNoContent() {
    return AntJumboTabs(
      tabs: [
        AntJumboTabItem(
          title: '水果',
          description: '描述文案',
        ),
        AntJumboTabItem(
          title: '蔬菜',
          description: '描述文案',
        ),
        AntJumboTabItem(
          title: '动物',
          description: '描述文案',
        ),
      ],
    );
  }

  Widget _renderDisable() {
    return AntJumboTabs(
      tabs: [
        AntJumboTabItem(
          title: '水果',
          description: '描述文案',
        ),
        AntJumboTabItem(
          title: '蔬菜',
          description: '描述文案',
        ),
        AntJumboTabItem(title: '动物', description: '描述文案', disabled: true),
      ],
    );
  }
}
