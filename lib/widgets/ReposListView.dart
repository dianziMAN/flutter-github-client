import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ReposListView extends StatelessWidget {
  ReposListView(this._language,{Key key}) : super(key: key);
  final String _language;

  final Dio _dio = new Dio();
  
  //String requestUrl = "https://api.github.com/search/repositories?q=language:${this._language}&sort=stars"; //为什么无法用this._language做替换
  //String requestUrl = "https://api.github.com/search/repositories?q=language:python&sort=stars";
  final String domain = "https://api.github.com/search/repositories";

  // Map<String,String> queryParameters = {
  //   "q": this._language,
  //   "sort": "stars",
  // };

  @override
  Widget build(BuildContext context) {
    return Container(
              //height: 500,
            alignment: Alignment.center,
            child: FutureBuilder(
                future:
                    //_dio.get("https://api.github.com/orgs/flutterchina/repos"),
                    //_dio.get(domain, queryParameters: {"q": "language:${this._language}","sort":"stars"}),
                    _dio.get(domain, queryParameters: {"q": "language:${this._language}","sort":"stars"}),
                    //_dio.get(requestUrl),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  //请求完成
                  if (snapshot.connectionState == ConnectionState.done) {
                    Response response = snapshot.data;
                    //发生错误
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    //请求成功，通过项目信息构建用于显示项目名称的ListView
                    return ListView(
                      children: response.data["items"]
                          .map<Widget>(
                              (e) => Card(margin: EdgeInsets.fromLTRB(5.0, 2.5, 5.0, 2.5), child: ListTile(
                                title: Text(e["full_name"],style: TextStyle(fontSize: 18.0)),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 5.0),
                                    Text("stars: ${e["stargazers_count"]}"),
                                    Text("size: ${e["size"]}"),
                                    Text("created at: ${e["created_at"]}"),
                                    Text("updated at: ${e["updated_at"]}"),
                                    Text("description: ${e["description"]}")

                                  ],
                                  ),
                                )
                              )
                            )
                          .toList(),
                    );
                  }
                  //请求未完成时弹出loading
                  return CircularProgressIndicator();
                }),
          //)
        );
  }
}