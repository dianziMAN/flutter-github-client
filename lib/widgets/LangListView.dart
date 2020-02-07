import 'package:flutter/material.dart';
//抽屉控件中展示的
class LanguageList extends StatefulWidget {
  LanguageList({Key key}) : super(key: key);

  @override
  _LanguageListState createState() => _LanguageListState();
}

class _LanguageListState extends State<LanguageList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          ListTile(
              //leading: const Icon(Icons.add),
              leading: Image.asset("images/python.jpg", width: 36, height: 36),
              title: const Text('python'),
              onTap: () {
                print('listtile python');
              }),
          ListTile(
            //leading: const Icon(Icons.settings),
            leading: Image.asset("images/cpp.jpg", width: 36, height: 36),
            title: const Text('C++'),
          ),
          ListTile(
            //leading: const Icon(Icons.settings),
            leading: Image.asset("images/go.jpg", width: 36, height: 36),
            title: const Text('Go'),
          ),
        ],
      ),
    );
  }
}
