import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter2webapp/models/platFormCheckModel.dart';
import 'dart:io';

class PlatformCheckProvider with ChangeNotifier{
  PlatFormCheckModel _currentPlatForm = PlatFormCheckModel.None;

  PlatFormCheckModel get currentPlatForm => _currentPlatForm;
  set currentPlatForm(PlatFormCheckModel check){
    _currentPlatForm = check;
    notifyListeners();
    return;
  }

  PlatformCheckProvider(){
    _init();
  }

  void _init(){
    /// io 만 사용하는 경우 import 를 분기하지 않고 try-catch 로
    /// 사용 할 수 있습니다, html을 사용하여 분기가 필요한 경우 repos/
    /// 내용처럼 만들어서 사용해주세요
    if(kIsWeb){
      this.currentPlatForm = PlatFormCheckModel.WEB;
      return;
    }
    try{
      if(Platform.isAndroid || Platform.isIOS) {
        this.currentPlatForm = PlatFormCheckModel.APP;
      }
    }
    catch(e){
      this.currentPlatForm = PlatFormCheckModel.WEB;
    }
    return;
  }
}