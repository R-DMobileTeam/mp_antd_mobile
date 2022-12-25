import 'package:flutter/widgets.dart';
import 'package:mp_antd_mobile/common/button.dart';
import 'package:mpcore/mpcore.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({Key? key}) : super(key: key);

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
      name: 'Button',
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          renderTitle('填充模式'),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              AntButton(
                color: AntButtonColor.primary,
                fill: AntButtonFill.solid,
                child: Text('Solid'),
              ),
              AntButton(
                color: AntButtonColor.primary,
                fill: AntButtonFill.outline,
                child: Text('Outline'),
              ),
              AntButton(
                color: AntButtonColor.primary,
                fill: AntButtonFill.none,
                child: Text('None'),
              ),
            ],
          ),
          SizedBox(height: 20),
          renderTitle('块级按钮'),
          AntButton(
            size: AntButtonSize.large,
            color: AntButtonColor.primary,
            child: Text('Block Button'),
          ),
          SizedBox(height: 20),
          renderTitle('按钮尺寸'),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              AntButton(
                  size: AntButtonSize.mini,
                  color: AntButtonColor.primary,
                  child: Text('Mini')),
              AntButton(
                  size: AntButtonSize.small,
                  color: AntButtonColor.primary,
                  child: Text('Small')),
              AntButton(
                  size: AntButtonSize.middle,
                  color: AntButtonColor.primary,
                  child: Text('Middle')),
              AntButton(
                  size: AntButtonSize.large,
                  color: AntButtonColor.primary,
                  child: Text('Large')),
            ],
          ),
          SizedBox(height: 20),
          renderTitle('语义按钮'),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              AntButton(
                child: Text('Default'),
                onPressed: () {
                  MPWebDialogs.alert(message: 'Hello');
                },
              ),
              AntButton(color: AntButtonColor.primary, child: Text('Primary')),
              AntButton(color: AntButtonColor.success, child: Text('Success')),
              AntButton(color: AntButtonColor.danger, child: Text('Danger')),
              AntButton(color: AntButtonColor.warning, child: Text('Warning')),
            ],
          ),
          SizedBox(height: 20),
          renderTitle('形状'),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              AntButton(
                color: AntButtonColor.primary,
                child: Text('Default Button'),
              ),
              AntButton(
                color: AntButtonColor.primary,
                shape: AntButtonShape.rounded,
                child: Text('Rounded Button'),
              ),
              AntButton(
                color: AntButtonColor.primary,
                shape: AntButtonShape.rectangular,
                child: Text('Rectangular Button'),
              ),
            ],
          ),
          SizedBox(height: 20),
          renderTitle('加载状态'),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              AntButton(
                color: AntButtonColor.primary,
                loading: true,
                loadingText: '正在加载',
                child: Text('Loading'),
              ),
              AntButton(
                loading: true,
                child: Text('Loading'),
              ),
              AutoLoadingAntButton(
                onPressed: () async {
                  await Future.delayed(Duration(seconds: 5));
                },
                loadingText: '正在加载',
                child: Text('Auto Loading'),
              ),
            ],
          ),
          SizedBox(height: 20),
          renderTitle('禁用状态'),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              AntButton(
                disabled: true,
                child: Text('Disabled'),
              ),
              AntButton(
                color: AntButtonColor.primary,
                disabled: true,
                child: Text('Disabled'),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
