import 'package:flutter/material.dart';
import 'package:flutter2webapp/pages/platformCheck/widgetTreeReverse/CustomPageWidgetBuilder.dart';
import 'package:flutter2webapp/providres/testProvider.dart';
import 'package:flutter2webapp/repos/repoCheck.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MainPage extends CustomPageWidgetBuilder {

  TestProvider? t1;
  final Func func = new Func();

  @override
  Widget appScaffold(BuildContext context){
    // [ Provider Only Read ]
    this.t1 = Provider.of<TestProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("APP : ${t1!.data}"),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () => Navigator.of(context).pushNamed("/login"),
          )
        ],
      ),
      body: Center(
        child: IconButton(
          icon: Icon(Icons.call),
          onPressed: () => t1!.data = "JAMES APP",
        ),
      ),
    );
  }

  @override
  Widget webScaffold(BuildContext context){
    // [ Provider Only Read ]
    this.t1 = Provider.of<TestProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("WEB : ${t1!.data}"),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_active),
            // [ Repo : WEB - Alert ]
            onPressed: () => func.run()
          )
        ],
      ),
      body: Center(
        child: IconButton(
          icon: Icon(Icons.call_end_outlined),
          onPressed: () => t1!.data = "JAMES WEB?!",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => super.build(context);
}