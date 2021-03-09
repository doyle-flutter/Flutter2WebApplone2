import 'package:flutter/material.dart';
import 'package:flutter2webapp/pages/mainPage.dart';
import 'package:flutter2webapp/pages/subPage.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter 2 웹과 앱을 한번에",
      onGenerateRoute: (RouteSettings rs){
        if(rs.name == "/sub"){
          return MaterialPageRoute<void>(
            settings: RouteSettings(name: '/sub'),
            maintainState: false,
            builder: (BuildContext context) => SubPage()
          );
        }
        return MaterialPageRoute<void>(
          settings: RouteSettings(name: '/'),
          maintainState: false,
          builder: (BuildContext context) => MainPage()
        );
      },
    );
  }
}



