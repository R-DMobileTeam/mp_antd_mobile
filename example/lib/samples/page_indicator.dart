import 'package:flutter/widgets.dart';
import 'package:mp_antd_mobile/mp_antd_mobile.dart';
import 'package:mpcore/mpcore.dart';

class PageIndicatorPage extends StatelessWidget {
  const PageIndicatorPage({Key? key}) : super(key: key);

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
      name: 'PageIndicator',
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          renderTitle('基础用法'),
          AntPageIndicator(current: 0, total: 4),
          SizedBox(height: 20),
          renderTitle('白色'),
          Container(
            height: 44,
            color: Colors.black,
            child: Center(
              child: AntPageIndicator(
                current: 0,
                total: 4,
                color: AntPageIndicatorColor.white,
              ),
            ),
          ),
          SizedBox(height: 20),
          renderTitle('竖直方向'),
          AntPageIndicator(
            current: 0,
            total: 4,
            direction: Axis.vertical,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
