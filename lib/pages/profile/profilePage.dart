import 'package:flutter/material.dart';
import 'package:flutter2webapp/models/platFormCheckModel.dart';
import 'package:flutter2webapp/providres/platformCheckProvider.dart';
import 'package:flutter2webapp/repos/repoCheck.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PlatformCheckProvider checkProvider = Provider.of<PlatformCheckProvider>(context);
    PlatFormCheckModel check = checkProvider.currentPlatForm;
    if(check == PlatFormCheckModel.WEB) return _web(context, checkProvider);
    if(check == PlatFormCheckModel.APP) return _mobile(context, checkProvider);
    return _error();
  }
  Widget _web(BuildContext context,PlatformCheckProvider checkProvider) => Scaffold(
    appBar: AppBar(title: Text("WEB"),),
    body: GridView.builder(
        itemCount: 20,
        padding: EdgeInsets.all(20.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 800.0 ? 6 : 4,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0
        ),
        itemBuilder: (BuildContext context, int index) => InkWell(
          onTap: () => Func().run(),
          child: Opacity(
            opacity: 0.7,
            child: GridTile(
              child: Container(
                color: Colors.grey[200],
                child: Center(
                  child: Text("Title $index"),
                ),
              ),
            ),
          ),
        )
    ),
  );
  Widget _mobile(BuildContext context,PlatformCheckProvider checkProvider) => Scaffold(
    appBar: AppBar(title: Text("APP"),),
    body: ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) => ListTile(
        title: Text("Title $index"),
        subtitle: Text("- SubTitle $index"),
        leading: Icon(Icons.person),
        trailing: Icon(Icons.navigate_next),
        onTap: () async => await showDialog<void>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text("Flutter 2 APP"),
            actions: [
              TextButton(
                child: Text("Close"),
                onPressed: () => Navigator.of(context).pop<void>(),
              )
            ],
          )
        ),
      )
    ),
  );
  Widget _error() => Scaffold(body: Center(child: Text("지원하지 않는 플랫폼입니다"),),);
}
