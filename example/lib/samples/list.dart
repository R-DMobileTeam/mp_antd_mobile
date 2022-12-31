import 'package:flutter/widgets.dart';
import 'package:mp_antd_mobile/mp_antd_mobile.dart';
import 'package:mpcore/mpcore.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

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
      name: 'List',
      backgroundColor: Color(0xfff5f5f5),
      body: ListView(
        children: [
          AntList(
            header: Text('基础用法'),
            items: [
              AntListItem(title: Text('1')),
              AntListItem(title: Text('2')),
              AntListItem(title: Text('3')),
            ],
          ),
          AntList(
            header: Text('可点击列表'),
            items: [
              AntListItem(
                leading: MPIcon(MaterialIcons.list, size: 18),
                title: Text('帐单'),
                arrow: true,
              ),
              AntListItem(
                leading: MPIcon(MaterialIcons.money_round, size: 18),
                title: Text('总资产'),
                arrow: true,
              ),
              AntListItem(
                leading: MPIcon(MaterialIcons.settings, size: 18),
                title: Text('设置'),
                arrow: true,
              ),
            ],
          ),
          AntList(
            header: Text('复杂列表'),
            items: [
              AntListItem(
                title: Text('新消息通知'),
                trailing: MPSwitch(),
              ),
              AntListItem(
                title: Text('大字号模式'),
                trailing: Text('未开启'),
                arrow: true,
              ),
              AntListItem(
                title: Text('授权管理'),
                description: Text('管理已授权的产品和设备'),
                arrow: true,
              ),
            ],
          ),
          AntList(
            header: Text('禁用状态'),
            items: [
              AntListItem(
                leading: MPIcon(MaterialIcons.list, size: 18),
                title: Text('帐单'),
                arrow: true,
                disabled: true,
              ),
              AntListItem(
                leading: MPIcon(MaterialIcons.money_round, size: 18),
                title: Text('总资产'),
                arrow: true,
                disabled: true,
              ),
            ],
          ),
          AntList(
            header: Text('卡片列表'),
            mode: AntListMode.card,
            items: [
              AntListItem(
                title: Text('扣款方式'),
                trailing: Text('按照支付设置的顺序扣款'),
                arrow: true,
              ),
              AntListItem(
                title: Text('月限额'),
                trailing: Text('200元'),
                arrow: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
