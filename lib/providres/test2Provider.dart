import 'package:flutter/material.dart';

class Test2Provider with ChangeNotifier{
  int _data = 0;
  int get data => this._data;
  set data(int newData){
    this._data = newData;
    notifyListeners();
  }
}