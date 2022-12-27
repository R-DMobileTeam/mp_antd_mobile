import 'package:flutter/widgets.dart';
import 'package:mp_antd_mobile/mp_antd_mobile.dart';
import 'package:mpcore/mpcore.dart';

class SafeAreaPage extends StatelessWidget {
  const SafeAreaPage({Key? key}) : super(key: key);

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
      name: 'SafeArea',
      body: ListView(
        children: [
          Text(
            'Aute in fugiat id sit. Eu Lorem sint esse esse aliquip id enim quis. Reprehenderit consequat aute qui aliquip dolor. Non cillum id laborum sunt consectetur qui mollit consectetur mollit est culpa amet voluptate amet non. Ad sint incididunt ut sunt excepteur magna sint nostrud id. Magna voluptate dolore amet tempor dolor elit occaecat reprehenderit eiusmod exercitation nostrud sunt culpa sint. Mollit sunt excepteur est laborum ipsum culpa magna ut. Consectetur laborum nulla ut aliqua Lorem occaecat. Excepteur nostrud ipsum elit non do non id. Mollit ipsum tempor dolore anim proident consequat dolore nisi elit veniam magna. Irure adipisicing duis proident mollit id in incididunt laboris fugiat Lorem eiusmod. Dolore dolor tempor Lorem culpa. Velit cillum sit quis occaecat cupidatat dolore ipsum. Et Lorem enim occaecat voluptate cupidatat est in nisi et ipsum. Excepteur pariatur ea aliqua proident id aliqua tempor laborum sunt sint. Enim est ipsum aute voluptate. In consectetur minim voluptate nostrud sunt qui dolore sunt enim velit. Deserunt occaecat nisi eiusmod proident dolore officia culpa ea. Nisi occaecat magna eiusmod proident et pariatur voluptate id dolore non fugiat. Qui velit dolore duis ullamco exercitation. Aliquip Lorem quis aliqua irure consequat id nisi excepteur fugiat duis Lorem. Anim elit deserunt labore amet veniam mollit. Consectetur laborum aliqua commodo commodo quis duis laboris labore. Duis sunt incididunt aliquip ea do veniam quis elit ipsum excepteur ad aute anim enim. Laboris labore irure adipisicing magna sint. Irure sunt labore dolore voluptate consectetur ipsum occaecat consequat aute officia proident aliquip sint laborum. Pariatur quis do do Lorem commodo ut nostrud. Sit eu ullamco pariatur mollit ex ipsum consectetur sit tempor ea ex. Officia velit mollit amet fugiat quis. Sit culpa occaecat qui consectetur duis dolore nisi. Anim excepteur fugiat est mollit duis cupidatat ea nisi duis mollit ullamco. Magna occaecat laborum ad pariatur proident velit consequat ut. Velit ipsum eiusmod consectetur dolor eiusmod eiusmod Lorem. Esse officia aliqua cillum deserunt labore dolore. Ea Lorem Lorem laborum irure et anim reprehenderit mollit tempor. Eu qui velit cillum quis eu. Cillum officia occaecat aliquip amet pariatur aliquip ipsum enim ipsum aliqua Lorem ea. Quis ex voluptate sit elit. Ullamco culpa mollit ad ullamco nulla. Occaecat est consectetur do nulla sint qui incididunt duis pariatur enim. Dolore excepteur quis cupidatat ex voluptate tempor ullamco laborum eiusmod. Lorem eu occaecat ut veniam veniam aliquip id ex. Incididunt magna fugiat ullamco consequat velit deserunt esse labore est veniam amet irure do mollit. Occaecat est exercitation ad nisi. Nisi nostrud esse deserunt non occaecat nulla. Ea cillum cupidatat dolore pariatur mollit reprehenderit cillum non cillum cillum. Nostrud officia amet tempor duis commodo sint veniam. Minim pariatur et in ea. Do anim dolor sunt ad non nulla. Sunt ipsum voluptate reprehenderit dolor ipsum in aute pariatur cupidatat qui tempor exercitation officia incididunt. Reprehenderit esse laboris Lorem quis minim et elit officia dolor sint anim. Consectetur tempor ipsum cillum tempor amet incididunt enim ex magna sit amet. Nisi quis laborum non ea cillum velit reprehenderit ipsum. Incididunt consequat eiusmod duis tempor dolore sit sit velit cillum laboris non fugiat consequat enim. Nisi enim laboris labore proident laboris irure irure ipsum consectetur.',
          ),
          AntSafeArea(bottom: true, color: Colors.blue),
        ],
      ),
    );
  }
}
