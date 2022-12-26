import 'package:flutter/widgets.dart';
import 'package:mp_antd_mobile/mp_antd_mobile.dart';
import 'package:mpcore/mpcore.dart';

class AutoCenterPage extends StatelessWidget {
  const AutoCenterPage({Key? key}) : super(key: key);

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
      name: 'AutoCenter',
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          renderTitle('内容不够整行宽度时自动居中'),
          AutoCenter(text: Text('cillum dolor velit')),
          SizedBox(height: 20),
          renderTitle('内容达到满宽后保持正常的左对齐'),
          AutoCenter(
            text: Text(
              'Voluptate enim labore dolore nisi eiusmod laborum nulla sit. Ipsum occaecat aute et anim nisi cupidatat nostrud. Voluptate exercitation nisi fugiat. Veniam commodo ex magna ullamco et consequat enim sunt ea excepteur sunt proident. Sit excepteur aliquip deserunt aute sint. Velit commodo sunt officia consectetur enim enim culpa sunt. Irure sit sunt quis duis ea ut labore culpa quis ex incididunt ad proident Lorem incididunt. Aliquip in ex occaecat esse ex sit occaecat mollit fugiat dolor. Et officia ea dolor cupidatat. Cillum ea qui tempor cillum mollit labore amet voluptate elit aliquip laborum minim anim et. Lorem eu minim fugiat officia aute laboris sunt anim commodo dolor reprehenderit. Exercitation voluptate anim ad fugiat consectetur sint magna fugiat. Id proident nisi do incididunt proident excepteur Lorem incididunt enim eu velit labore.',
            ),
          ),
        ],
      ),
    );
  }
}
