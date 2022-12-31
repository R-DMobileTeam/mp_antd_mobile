import 'package:flutter/widgets.dart';
import 'package:mp_antd_mobile/mp_antd_mobile.dart';
import 'package:mpcore/mpcore.dart';

class StepsPage extends StatelessWidget {
  const StepsPage({Key? key}) : super(key: key);

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
      name: 'Steps',
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          renderTitle('横向步骤条'),
          Center(
            child: AntSteps(
              containerWidthOrHeight: 240,
              current: 1,
              steps: [
                AntStep(
                  icon: MPIcon(
                    MaterialIcons.check_circle,
                    size: 18,
                    color: AntTheme.of(context)?.primaryColor ?? Colors.black,
                  ),
                  iconSize: 18,
                  title: Text('标题1'),
                  description: Text('描述'),
                ),
                AntStep(title: Text('标题2'), description: Text('描述')),
                AntStep(title: Text('标题3'), description: Text('描述')),
              ],
            ),
          ),
          renderTitle('横向步骤条失败'),
          Center(
            child: AntSteps(
              containerWidthOrHeight: 240,
              current: 2,
              steps: [
                AntStep(title: Text('第一步')),
                AntStep(title: Text('第二步')),
                AntStep(title: Text('第三步'), status: AntStepStatus.error),
                AntStep(title: Text('第四步')),
              ],
            ),
          ),
          renderTitle('横向纯状态'),
          Center(
            child: AntSteps(
              containerWidthOrHeight: 240,
              steps: [
                AntStep(title: Text('第一步'), status: AntStepStatus.finish),
                AntStep(title: Text('第二步'), status: AntStepStatus.process),
                AntStep(title: Text('第三步'), status: AntStepStatus.wait),
                AntStep(title: Text('第四步'), status: AntStepStatus.wait),
              ],
            ),
          ),
          renderTitle('纵向步骤条失败'),
          Center(
            child: AntSteps(
              containerWidthOrHeight: 60 * 4,
              direction: Axis.vertical,
              steps: [
                AntStep(
                    title: Text('填写机构信息'),
                    description: Text('完成时间：2020-12-01'),
                    status: AntStepStatus.finish),
                AntStep(
                    title: Text('签约机构'),
                    description: Text('完成时间：2020-12-01'),
                    status: AntStepStatus.finish),
                AntStep(title: Text('关联服务区'), status: AntStepStatus.error),
                AntStep(title: Text('审批失败'), status: AntStepStatus.wait),
              ],
            ),
          ),
          renderTitle('自定义图标及大小'),
          Center(
            child: AntSteps(
              containerWidthOrHeight: 70 * 4,
              direction: Axis.vertical,
              steps: [
                AntStep(
                  icon: MPIcon(
                    MaterialIcons.check_circle,
                    size: 18,
                    color: AntTheme.of(context)?.primaryColor ?? Colors.black,
                  ),
                  iconSize: 18,
                  title: Text('填写机构信息'),
                  description: Text('完成时间：2020-12-01'),
                  status: AntStepStatus.finish,
                ),
                AntStep(
                  icon: MPIcon(
                    MaterialIcons.alarm_round,
                    size: 18,
                    color: AntTheme.of(context)?.primaryColor ?? Colors.black,
                  ),
                  iconSize: 18,
                  title: Text('签约机构'),
                  description: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('完成时间：2020-12-01'),
                      AntButton(
                        color: AntButtonColor.primary,
                        size: AntButtonSize.mini,
                        child: Text('去签约'),
                      ),
                    ],
                  ),
                  status: AntStepStatus.process,
                ),
                AntStep(
                  icon: MPIcon(
                    MaterialIcons.money_round,
                    size: 18,
                    color: AntTheme.of(context)?.textTheme.weakTextColor ??
                        Colors.black,
                  ),
                  iconSize: 18,
                  title: Text('关联服务区'),
                  status: AntStepStatus.wait,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
