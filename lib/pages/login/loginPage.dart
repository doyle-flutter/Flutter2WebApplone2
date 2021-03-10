import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter2webapp/pages/platformCheck/simpleCheck/platformCheckWidget.dart';
import 'package:flutter2webapp/providres/testProvider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class LoginPage extends PlatformCheckWidget{

  @override
  Widget and(context) => _and(context);
  @override
  Widget ios(context) => _ios(context);
  @override
  Widget web(context) => _web(context);

  Widget _and(BuildContext context){
    TestProvider t1 = Provider.of<TestProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("AND : ${t1.data}"),
      ),
    );
  }
  Widget _ios(BuildContext context){
    TestProvider t1 = Provider.of<TestProvider>(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("IOS : ${t1.data}"),
      ),
      child: Container()
    );
  }
  Widget _web(BuildContext context){
    TestProvider t1 = Provider.of<TestProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Web : ${t1.data}"),
      ),
    );
  }
}