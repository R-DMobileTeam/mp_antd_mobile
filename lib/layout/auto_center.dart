import 'package:flutter/widgets.dart';

class AntAutoCenter extends StatelessWidget {
  final Widget text;

  const AntAutoCenter({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: text,
    );
  }
}
