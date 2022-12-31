import 'package:flutter/widgets.dart';
import 'package:mp_antd_mobile/mp_antd_mobile.dart';
import 'package:mpcore/mpcore.dart';

class RegularTabsPage extends StatelessWidget {
  const RegularTabsPage({Key? key}) : super(key: key);

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
      name: 'RegularTabs',
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
    return AntRegularTabs(
      tabs: [
        AntRegularTabItem(
          title: '水果',
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
        AntRegularTabItem(
          title: '蔬菜',
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
        AntRegularTabItem(
          title: '动物',
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
    return AntRegularTabs(
      tabBarScrollable: true,
      tabs: [
        AntRegularTabItem(
          title: 'Expresso',
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
        AntRegularTabItem(
          title: 'Coffee Latte',
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
        AntRegularTabItem(
          title: 'Cappuccino',
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
        AntRegularTabItem(
          title: 'Americano',
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
        AntRegularTabItem(
          title: 'Cafe Mocha',
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
        AntRegularTabItem(
          title: 'Flat White',
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
        AntRegularTabItem(
          title: 'Caramel Macchiato',
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
    return AntRegularTabs(
      tabs: [
        AntRegularTabItem(title: '水果'),
        AntRegularTabItem(title: '蔬菜'),
        AntRegularTabItem(title: '动物'),
      ],
    );
  }

  Widget _renderDisable() {
    return AntRegularTabs(
      tabs: [
        AntRegularTabItem(title: '水果'),
        AntRegularTabItem(title: '蔬菜'),
        AntRegularTabItem(title: '动物', disabled: true),
      ],
    );
  }
}
