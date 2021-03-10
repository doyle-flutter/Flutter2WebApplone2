import 'package:flutter/material.dart';

class TestProvider with ChangeNotifier{
  String _data = "";
  TestProvider(){
    data = "Flutter 2";
  }
  String get data => this._data;
  set data(String newData){
    this._data = newData;
    notifyListeners();
    return;
  }
}