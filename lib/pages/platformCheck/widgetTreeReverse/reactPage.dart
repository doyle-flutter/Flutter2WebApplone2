import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ReactPage extends StatelessWidget{
  final WidgetBuilder web;
  final WidgetBuilder app;
  ReactPage({required this.web, required this.app});

  @override
  Widget build(BuildContext context) => _build(context);

  Widget _build(BuildContext context){
    if(kIsWeb && MediaQuery.of(context).size.width > 800.0) return web(context);
    return app(context);
  }

}