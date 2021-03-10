import 'package:flutter/material.dart';
import 'package:flutter2webapp/pages/pageClass.dart';

class MainPage extends PageClass {

  @override
  Widget appScaffold(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("APP"),),
  );

  @override
  Widget webScaffold(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("WEB"),
    ),
  );

  @override
  Widget build(BuildContext context) {
    // Providers
    return super.build(context);
  }
}