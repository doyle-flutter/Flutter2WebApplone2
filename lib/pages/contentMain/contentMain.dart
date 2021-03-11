import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter2webapp/models/contentMainModel.dart';
import 'package:flutter2webapp/repos/repoCheck.dart';
import 'package:http/http.dart' as http;

class ContentMainPage extends StatefulWidget {
  @override
  _ContentMainPageState createState() => _ContentMainPageState();
}

class _ContentMainPageState extends State<ContentMainPage> {

  List<ContentMainModel>? datas;
  String _loadMsg = "기다려주세요";

  @override
  void initState() {
    Future(_init).then((_) => setState((){}));
    super.initState();
  }
  
  Future<void> _init() async{
    const String _host = "localhost:4000";
    const String _path = "/contents";
    try{
      final http.Response _res = await http.get(Uri.http(_host, _path)).timeout(Duration(seconds: 8), onTimeout: () async => http.Response("",408));
      if(_res.statusCode == 404) {
        _loadMsg = "서버 점검 또는 오류";
        return;
      }
      if(_res.statusCode == 408) {
        _loadMsg = "인터넷 연결 상태 확인";
        return;
      }
      final Map<String,dynamic> _resData = json.decode(_res.body);
      final List _result = _resData['data'];
      this.datas = _result.map<ContentMainModel>((dynamic e) => ContentMainModel.fromJson(json: e)).toList();
      return;
    }
    catch(e){
      _loadMsg = "인터넷 연결 상태 확인";
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    if(MediaQuery.of(context).size.width > 800.0 && kIsWeb) return this._web(context);
    /// WEB 빌드에서 주의할 부분입니다.
    /// 빌드 과정에서는 오류가 없을 수 있지만 실행 중 오류가 발생할 수 있습니다.
    /// io 는 WEB 빌드를 생각한다면 try-catch 로 잡아주시면 편합니다.
    try{
      if(Platform.isAndroid) return this._and(context);
      // if(Platform.isIOS) return this._ios(context);
    }
    catch(e){
      print("ERROR - Catch");
    }
    return this._and(context);
  }
  Widget _and(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("APP - Material")),
      body: _commonGrid(isMobile: true),
    );
  }
  Widget _ios(BuildContext context){
    /// 상위 App 위젯에서 MaterialApp || CupertinoApp으로 분기하지 않았으므로
    /// 해당 내용에서는 Cupertino Design 를 제외합니다.
    /// IOS 도 Material Design 으로 적용할 수 있습니다.
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("APP - Cupertino"),
      ),
      child: Container()
    );
  }
  Widget _web(BuildContext context){
    Func f = Func();
    return Scaffold(
      appBar: AppBar(title: Text("WEB - Material"),),
      body: _commonGrid(isMobile: false))
    ;
  }

  Widget _loadWidget() => Center(child: Text(this._loadMsg),);

  SliverGridDelegate _checkDelegate({required bool isMobile})
   => isMobile ? SliverGridDelegateWithFixedCrossAxisCount(
       crossAxisCount: 2,
       mainAxisSpacing: 10.0,
       crossAxisSpacing: 10.0
   ) : SliverGridDelegateWithFixedCrossAxisCount(
       crossAxisCount: 4,
       mainAxisSpacing: 20.0,
       crossAxisSpacing: 20.0
   );

  Widget _contentTile(ContentMainModel data){
    return GridTile(
      header: Container(
        margin: EdgeInsets.all(20.0),
        child: Text(data.id),
      ),
      child: Container(
          color: Colors.grey[200],
          child: Center(child: Text(data.name))
      ),
    );
  }

  Widget _commonGrid({required bool isMobile})
    => this.datas == null ? _loadWidget() : GridView.builder(
      itemCount: this.datas!.length,
      gridDelegate: _checkDelegate(isMobile: isMobile),
      padding: EdgeInsets.all(10.0),
      itemBuilder: (BuildContext context, int index) => _contentTile(this.datas![index])
  );

}
