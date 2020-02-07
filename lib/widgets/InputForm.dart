import 'package:flutter/material.dart';
import "./ReposListView.dart";
import './test.dart';

class InputForm extends StatefulWidget {
  InputForm({Key key}) : super(key: key);

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  FocusNode focusNode = new FocusNode();
  TextEditingController _unamecontroller = TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  String _language = 'python';
  //String _language;

  @override
  void initState() {
    super.initState();
    _unamecontroller.addListener(() {
      print(_unamecontroller.text);
      print(this._language);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          //color: Colors.red,
          child: Form(
            key: _formKey, //设置globalKey，用于后面获取FormState
            autovalidate: true, //开启自动校验
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: TextFormField(
                        autofocus: true,
                        focusNode: focusNode,
                        controller: _unamecontroller,
                        decoration: InputDecoration(
                          //labelText: "用户名",
                          hintText: "language",
                          prefixIcon: Icon(Icons.search),
                        ),
                        validator: (v) {
                          return v.trim().length > 0 ? null : "输入不能为空";
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: RaisedButton(
                        //padding: EdgeInsets.all(15.0),
                        focusNode: focusNode,
                        color: Colors.blue,
                        child: Image.asset("images/fluidicon.png",
                            width: 36, height: 36, fit: BoxFit.cover),
                        onPressed: () {
                          if ((_formKey.currentState as FormState).validate()) {
                            //验证通过提交数据
                            setState(() {
                              this._language = _unamecontroller.text;
                            });
                          }
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded( 
          child: ReposListView(this._language)
        )
        //Expanded(child: Test("Input:${this._language}"),)
        //ReposListView(this._language),

        // Container( 
        //   color: Colors.blue,
        //   height: 400,
        //   child: ListView(  
        //     children: <Widget>[
        //       ListTile(
        //         title: Text("hahahah"),
        //         subtitle: Text("hahahhahaa"),
        //       ),
        //     ],
        //   )
        // )
      ],
    );
  }
}
