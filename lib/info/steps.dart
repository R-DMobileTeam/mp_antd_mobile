import 'package:flutter/widgets.dart';
import 'package:mp_antd_mobile/common/theme.dart';

class AntSteps extends StatelessWidget {
  final double containerWidthOrHeight;
  final int current;
  final Axis direction;
  final List<AntStep> steps;

  const AntSteps({
    Key? key,
    required this.containerWidthOrHeight,
    int? current,
    this.direction = Axis.horizontal,
    required this.steps,
  })  : this.current = current ?? -1,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AntTheme.of(context) ?? AntTheme(primaryColor: Colors.blue);
    var current = this.current;
    if (current < 0) {
      current = steps
          .indexWhere((element) => element.status == AntStepStatus.process);
      if (current < 0) {
        current = steps.lastIndexWhere((element) =>
            element.status == AntStepStatus.error ||
            element.status == AntStepStatus.finish);
      }
    }
    if (direction == Axis.horizontal) {
      return Container(
        width: containerWidthOrHeight,
        child: Row(
          children: this.steps.map((e) {
            final currentStepIndex = this.steps.indexOf(e);
            final isLastIndex = currentStepIndex == this.steps.length - 1;
            final currentStepPassed = current >= currentStepIndex;
            final nextStepPassed = current >= currentStepIndex + 1;
            var dotColor =
                currentStepPassed ? theme.primaryColor : Color(0xffe5e5e5);
            var lineColor =
                nextStepPassed ? theme.primaryColor : Color(0xffe5e5e5);
            if (e.status == AntStepStatus.error) {
              dotColor = Color(0xffff3141);
            }
            return Container(
              height: 100,
              width: containerWidthOrHeight / steps.length,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: e.icon != null ? null : dotColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 4,
                          left: 8,
                          width: isLastIndex
                              ? 0
                              : containerWidthOrHeight / steps.length - 8,
                          child: Container(
                            height: 1,
                            color: lineColor,
                          ),
                        ),
                        Positioned(
                            left: (e.iconSize ?? 0.0) / -4.0,
                            top: (e.iconSize ?? 0.0) / -4.0,
                            child: e.icon ?? SizedBox())
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  DefaultTextStyle.merge(
                    style: TextStyle(
                      fontSize: theme.textTheme.fontSize.main,
                      color: (() {
                        if (currentStepPassed && currentStepIndex != current) {
                          return theme.textTheme.mainTextColor;
                        } else if (currentStepIndex == current) {
                          return dotColor;
                        } else {
                          return theme.textTheme.weakTextColor;
                        }
                      })(),
                    ),
                    child: e.title,
                  ),
                  DefaultTextStyle.merge(
                    style: TextStyle(
                      fontSize: theme.textTheme.fontSize.size4,
                      color: theme.textTheme.weakTextColor,
                    ),
                    child: e.description ?? SizedBox(),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      );
    } else {
      return Container(
        height: containerWidthOrHeight,
        child: Column(
          children: this.steps.map((e) {
            final currentStepIndex = this.steps.indexOf(e);
            final isLastIndex = currentStepIndex == this.steps.length - 1;
            final currentStepPassed = current >= currentStepIndex;
            final nextStepPassed = current >= currentStepIndex + 1;
            var dotColor =
                currentStepPassed ? theme.primaryColor : Color(0xffe5e5e5);
            var lineColor =
                nextStepPassed ? theme.primaryColor : Color(0xffe5e5e5);
            if (e.status == AntStepStatus.error) {
              dotColor = Color(0xffff3141);
            }
            return Container(
              height: containerWidthOrHeight / steps.length,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: e.icon != null ? null : dotColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 8,
                          left: 4,
                          height: isLastIndex
                              ? 0
                              : containerWidthOrHeight / steps.length - 8,
                          child: Container(
                            width: 1,
                            color: lineColor,
                          ),
                        ),
                        Positioned(
                            left: (e.iconSize ?? 0.0) / -4.0,
                            top: (e.iconSize ?? 0.0) / -4.0,
                            child: e.icon ?? SizedBox())
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Transform.translate(
                    offset: Offset(0.0, -6.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultTextStyle.merge(
                          style: TextStyle(
                            fontSize: theme.textTheme.fontSize.main,
                            color: (() {
                              if (currentStepPassed &&
                                  currentStepIndex != current) {
                                return theme.textTheme.mainTextColor;
                              } else if (currentStepIndex == current) {
                                return dotColor;
                              } else {
                                return theme.textTheme.weakTextColor;
                              }
                            })(),
                          ),
                          child: e.title,
                        ),
                        DefaultTextStyle.merge(
                          style: TextStyle(
                            fontSize: theme.textTheme.fontSize.size4,
                            color: theme.textTheme.weakTextColor,
                          ),
                          child: e.description ?? SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      );
    }
  }
}

enum AntStepStatus {
  wait,
  process,
  finish,
  error,
}

class AntStep {
  final Widget title;
  final Widget? description;
  final Widget? icon;
  final double? iconSize;
  final AntStepStatus status;

  AntStep({
    required this.title,
    this.description,
    this.icon,
    this.iconSize,
    this.status = AntStepStatus.wait,
  });
}
