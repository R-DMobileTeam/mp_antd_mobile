import 'package:flutter/widgets.dart';
import 'package:mp_antd_mobile/mp_antd_mobile.dart';
import 'package:mpcore/mpcore.dart';

class TagPage extends StatelessWidget {
  const TagPage({Key? key}) : super(key: key);

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
      name: 'Tag',
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          renderTitle('基础用法'),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              AntTag(color: AntTagColor.normal, child: Text('123')),
            ],
          ),
          SizedBox(height: 20),
          renderTitle('线框标签'),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              AntTag(
                color: AntTagColor.primary,
                fill: AntTagFill.outline,
                child: Text('Primary'),
              ),
              AntTag(
                color: Color(0xff87d068),
                fill: AntTagFill.outline,
                child: Text('#87d068'),
              ),
              AntTag(
                color: Color(0xffff6430),
                fill: AntTagFill.outline,
                child: Text('#ff6430'),
              ),
            ],
          ),
          SizedBox(height: 20),
          renderTitle('语义标签'),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              AntTag(
                color: AntTagColor.normal,
                child: Text('Normal'),
              ),
              AntTag(
                color: AntTagColor.primary,
                child: Text('Primary 测试'),
              ),
              AntTag(
                color: AntTagColor.success,
                child: Text('Success'),
              ),
              AntTag(
                color: AntTagColor.warning,
                child: Text('Warning'),
              ),
              AntTag(
                color: AntTagColor.danger,
                child: Text('Danger'),
              ),
            ],
          ),
          SizedBox(height: 20),
          renderTitle('圆角标签'),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              AntTag(
                color: Color(0xff2db7f5),
                round: true,
                child: Text('kongxin'),
              ),
            ],
          ),
          SizedBox(height: 20),
          renderTitle('自定义颜色'),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              AntTag(
                color: Color(0xff2db7f5),
                child: Text('#2db7f5'),
              ),
              AntTag(
                color: Color(0xff87d068),
                child: Text('#87d068'),
              ),
              AntTag(
                color: Color(0xff108ee9),
                child: Text('#108ee9'),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
