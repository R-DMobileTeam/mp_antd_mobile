import 'package:flutter/widgets.dart';
import 'package:mp_antd_mobile/mp_antd_mobile.dart';
import 'package:mpcore/mpcore.dart';

const demoAvatarImages = [
  'https://images.unsplash.com/photo-1548532928-b34e3be62fc6?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
  'https://images.unsplash.com/photo-1493666438817-866a91353ca9?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=b616b2c5b373a80ffc9636ba24f7a4a9',
  'https://images.unsplash.com/photo-1542624937-8d1e9f53c1b9?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
  'https://images.unsplash.com/photo-1546967191-fdfb13ed6b1e?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
];

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

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
      name: 'Avatar',
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          renderTitle('基础用法'),
          Row(
            children: [
              AntAvatar(src: demoAvatarImages[0]),
              SizedBox(width: 8),
              AntAvatar(src: demoAvatarImages[1]),
              SizedBox(width: 8),
              AntAvatar(src: demoAvatarImages[2]),
              SizedBox(width: 8),
              AntAvatar(src: demoAvatarImages[3]),
            ],
          ),
          SizedBox(height: 20),
          renderTitle('占位头像'),
          Row(
            children: [
              AntAvatar(),
            ],
          ),
          SizedBox(height: 20),
          renderTitle('自定义尺寸'),
          Row(
            children: [
              AntAvatar(size: 32, src: demoAvatarImages[0]),
              SizedBox(width: 8),
              AntAvatar(size: 48, src: demoAvatarImages[0]),
              SizedBox(width: 8),
              AntAvatar(size: 64, src: demoAvatarImages[0]),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
