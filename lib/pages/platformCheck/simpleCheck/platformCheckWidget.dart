import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';

// ignore: must_be_immutable
abstract class PlatformCheckWidget extends StatelessWidget{
  Widget? ios(BuildContext context){}
  Widget? and(BuildContext context){}
  Widget? web(BuildContext context){}

  Widget _check(BuildContext context){
    if(MediaQuery.of(context).size.width > 800.0 && kIsWeb) return this.web(context)!;
    try{
      /// io 의 경우 try-catch 로 잡을 수 있습니다.
      /// 하지만 html 패키지의 경우 Mobile 빌드 자체가 불가능합니다.
      if(Platform.isAndroid) return this.and(context)!;
      if(Platform.isIOS) return this.ios(context)!;
    }
    catch(e){

    }
    return this.and(context)!;
  }
  @override
  Widget build(BuildContext context) => this._check(context);
}