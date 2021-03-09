// (APP) 실제로 구현하고 싶은 내용을 만들어서 사용합니다
import 'package:flutter2webapp/repos/repo/regulateClass.dart';

class Func implements Regulate{
  String appValue = "APP Value";
  @override
  String run() => this.appValue;
}