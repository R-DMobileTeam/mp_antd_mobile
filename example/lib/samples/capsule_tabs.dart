import 'package:flutter/widgets.dart';
import 'package:mp_antd_mobile/mp_antd_mobile.dart';
import 'package:mpcore/mpcore.dart';

class CapsuleTabsPage extends StatelessWidget {
  const CapsuleTabsPage({Key? key}) : super(key: key);

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
      name: 'CapsuleTabs',
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
    return CapsuleTabs(
      tabs: [
        CapsuleTabItem(
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
        CapsuleTabItem(
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
        CapsuleTabItem(
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
    return CapsuleTabs(
      tabBarScrollable: true,
      tabs: [
        CapsuleTabItem(
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
        CapsuleTabItem(
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
        CapsuleTabItem(
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
        CapsuleTabItem(
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
        CapsuleTabItem(
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
        CapsuleTabItem(
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
        CapsuleTabItem(
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
    return CapsuleTabs(
      tabs: [
        CapsuleTabItem(title: '水果'),
        CapsuleTabItem(title: '蔬菜'),
        CapsuleTabItem(title: '动物'),
      ],
    );
  }

  Widget _renderDisable() {
    return CapsuleTabs(
      tabs: [
        CapsuleTabItem(title: '水果'),
        CapsuleTabItem(title: '蔬菜'),
        CapsuleTabItem(title: '动物', disabled: true),
      ],
    );
  }
}
