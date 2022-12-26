import 'package:flutter/widgets.dart';

class AutoCenter extends StatelessWidget {
  final Widget text;

  const AutoCenter({
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
