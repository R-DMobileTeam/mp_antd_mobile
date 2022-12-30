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
    return JumboTabs(
      tabs: [
        JumboTabItem(
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
        JumboTabItem(
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
        JumboTabItem(
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
    return JumboTabs(
      tabBarScrollable: true,
      tabs: [
        JumboTabItem(
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
        JumboTabItem(
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
        JumboTabItem(
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
        JumboTabItem(
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
        JumboTabItem(
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
        JumboTabItem(
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
        JumboTabItem(
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
    return JumboTabs(
      tabs: [
        JumboTabItem(
          title: '水果',
          description: '描述文案',
        ),
        JumboTabItem(
          title: '蔬菜',
          description: '描述文案',
        ),
        JumboTabItem(
          title: '动物',
          description: '描述文案',
        ),
      ],
    );
  }

  Widget _renderDisable() {
    return JumboTabs(
      tabs: [
        JumboTabItem(
          title: '水果',
          description: '描述文案',
        ),
        JumboTabItem(
          title: '蔬菜',
          description: '描述文案',
        ),
        JumboTabItem(title: '动物', description: '描述文案', disabled: true),
      ],
    );
  }
}
