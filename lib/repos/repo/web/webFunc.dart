// (WEB) 실제로 구현하고 싶은 내용을 만들어서 사용합니다
import 'package:flutter2webapp/repos/repo/regulateClass.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class Func implements Regulate{
  String webValue = "WEB Value";
  @override
  String run(){
    html.window.alert("Hi, Flutter 2 WEB ?!");
    return this.webValue;
  }
}