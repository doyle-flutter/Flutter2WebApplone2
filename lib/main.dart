import 'package:flutter/material.dart';
import 'package:flutter2webapp/pages/contentMain/contentMain.dart';
import 'package:flutter2webapp/pages/login/loginPage.dart';
import 'package:flutter2webapp/pages/main/mainPage.dart';
import 'package:flutter2webapp/pages/profile/profilePage.dart';
import 'package:flutter2webapp/providres/platformCheckProvider.dart';
import 'package:flutter2webapp/providres/test2Provider.dart';
import 'package:flutter2webapp/providres/testProvider.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppController());

class AppController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /// 상태관리 Provider 를 전역으로 사용하여 MainPage 에서 context 를 통해 접근하도록 함.
        /// 대부분 많이 사용하는 방법이지만 전역으로 생성되므로 모든(대다수) 페이지(또는 위젯)에서 다룰 상태가 아니라면
        /// '/sub' 경로에서 사용한 Provider 처럼 해당 페이지(또는 위젯)에서만 사용하도록 합니다.
        /// 전역으로 마구 사용하다 보면 페이지(또는 위젯) 개수 만큼 늘어납니다.
        ChangeNotifierProvider<TestProvider>(create: (context) => TestProvider()),

        ChangeNotifierProvider<PlatformCheckProvider>(create: (context) => PlatformCheckProvider(),)
      ],
      child: MaterialApp(
        title: "Flutter 2 웹과 앱을 한번에",
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (RouteSettings rs){
          if(rs.name == "/sub"){
            return MaterialPageRoute<void>(
              settings: RouteSettings(name: '/sub'),
              maintainState: false,
              /// '/sub' 경로는 일부러 분리하지 않았습니다,
              /// * 해당 내용을 통해 확인 할 것들
              /// (1) 기존 Navigator 을 암기해서 사용한 부분을 분해
              /// (2) Provider 상태관리를 전역이 아닌 특정 화면에서만 사용 가능
              /// (3) Builder 위젯
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
          if(rs.name == "/login") return MaterialPageRoute(
            settings: RouteSettings(name: "/login"),
            /// MainPage와 비슷하게 구성하지만 조금 더 쉽게 만들 수 있습니다
            /// IOS(Cupertino) 까지 사용하기 위해서는 좀 더 상위 위젯에서 만들어야합니다
            /// App Widget 에서 사용해서 MaterialApp 과 CupertinoApp으로 분기해주세요
            /// 이번 내용에서는 참고용으로 담아두겠습니다.
            /// * [예시 영상](https://youtu.be/6q0ODwKnPis)
            builder: (context) => LoginPage()
          );
          if(rs.name == "/main") return MaterialPageRoute(
            settings: RouteSettings(name: "/main"),
            builder: (context) => ContentMainPage()
          );
          /// Stateless & Provider
          /// 가장 기초적인 부분이 되는 내용일 것 같습니다
          /// Model 을 class 대신 enum 을 적용하였습니다
          /// * [예시 영상](https://youtu.be/NXnws-0ZG1U)
          if(rs.name == "/profile") return MaterialPageRoute(
              settings: RouteSettings(name: "/profile"),
              builder: (context) => ProfilePage()
          );
          return MaterialPageRoute<void>(
            settings: RouteSettings(name: '/'),
            maintainState: false,
            /// Widget Tree 위젯 트리에서 MainPage 위젯이 어디에 위치하고 있는지를 확인해주세요
            /// 왜 그렇게 위치하게 되었는지 흐름을 따라가보시는 것과 Class 를 어떻게 사용하고 있는지 보시면
            /// 더욱 도움이 되실 겁니다. 아래 링크를 따라 Flutter WEB Clone 영상에서 확인해보실수 있습니다.
            /// * [설명 영상들](https://youtu.be/1rUTQfIUM6c?list=PLIKnSA4GMR4PXI78AXGFp7pbzjgZpd53U)
            builder: (BuildContext context) => MainPage()
          );
        },
      ),
    );
  }
}



