import 'package:flutter/widgets.dart';
import 'package:mp_antd_mobile/common/theme.dart';

enum AntPageIndicatorColor {
  primary,
  white,
}

class AntPageIndicator extends StatelessWidget {
  final AntPageIndicatorColor color;
  final int current;
  final Axis direction;
  final int total;

  const AntPageIndicator({
    Key? key,
    this.color = AntPageIndicatorColor.primary,
    required this.current,
    this.direction = Axis.horizontal,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AntTheme.of(context) ?? AntTheme(primaryColor: Colors.blue);
    if (direction == Axis.horizontal) {
      return Row(
        children: List.generate(total, (index) {
          if (index == current) {
            return Container(
              width: 13,
              height: 3,
              margin: EdgeInsets.only(right: 3),
              color: color == AntPageIndicatorColor.white
                  ? Colors.white
                  : theme.primaryColor,
            );
          } else {
            return Container(
              width: 3,
              height: 3,
              margin: EdgeInsets.only(right: 3),
              color: color == AntPageIndicatorColor.white
                  ? Colors.white.withOpacity(0.5)
                  : Color(0xffdddddd),
            );
          }
        }),
      );
    } else {
      return Column(
        children: List.generate(total, (index) {
          if (index == current) {
            return Container(
              width: 3,
              height: 13,
              margin: EdgeInsets.only(bottom: 3),
              color: color == AntPageIndicatorColor.white
                  ? Colors.white
                  : theme.primaryColor,
            );
          } else {
            return Container(
              width: 3,
              height: 3,
              margin: EdgeInsets.only(bottom: 3),
              color: color == AntPageIndicatorColor.white
                  ? Colors.white.withOpacity(0.5)
                  : Color(0xffdddddd),
            );
          }
        }),
      );
    }
  }
}
