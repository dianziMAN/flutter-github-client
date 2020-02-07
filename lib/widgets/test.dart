import 'package:flutter/material.dart';

// class Test extends StatefulWidget {
//   Test({Key key}) : super(key: key);
//   final String _language = 'python';
  
//   @override
//   _TestState createState() => _TestState(this._language);
// }

// class _TestState extends State<Test> {
//   _TestState(this._language);
//   String _language;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//        child: Text('Input : ${this._language}'),
//     );
//   }
// }

class Test extends StatelessWidget {
  const Test(this._lan,{Key key}) : super(key: key);
  final String _lan;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("${this._lan}"),
    );
  }
}