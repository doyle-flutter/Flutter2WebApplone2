import 'package:flutter/material.dart';
import 'package:flutter2webapp/pages/main/mainPage.dart';
import 'package:flutter2webapp/providres/test2Provider.dart';
import 'package:flutter2webapp/providres/testProvider.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TestProvider>(create: (context) => TestProvider()),
      ],
      child: MaterialApp(
        title: "Flutter 2 웹과 앱을 한번에",
        onGenerateRoute: (RouteSettings rs){
          if(rs.name == "/sub"){
            return MaterialPageRoute<void>(
              settings: RouteSettings(name: '/sub'),
              maintainState: false,
              builder: (BuildContext context) => ChangeNotifierProvider<Test2Provider>(
                create: (context) => Test2Provider(),
                child: Builder(
                  builder:(BuildContext context){
                    Test2Provider t2 = Provider.of<Test2Provider>(context);
                    return Scaffold(
                      appBar: AppBar(title: Text("/sub"),),
                      body: Center(
                        child: Text(t2.data.toString()),
                      ),
                      floatingActionButton: FloatingActionButton(
                        child: Icon(Icons.add),
                        onPressed: () => t2.data++,
                      ),
                    );
                  }
                )
              )
            );
          }
          return MaterialPageRoute<void>(
            settings: RouteSettings(name: '/'),
            maintainState: false,
            builder: (BuildContext context) => MainPage()
          );
        },
      ),
    );
  }
}



