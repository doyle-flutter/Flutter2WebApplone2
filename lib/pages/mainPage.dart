import 'package:flutter/material.dart';
import 'package:flutter2webapp/repos/repo/regulateClass.dart';
import 'package:flutter2webapp/repos/repoCheck.dart' as re;

class MainPage extends StatelessWidget {
  final Regulate repo = new re.Func();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter 2"),
        actions: [
          IconButton(icon: Icon(Icons.navigate_next), onPressed: () => Navigator.of(context).pushNamed("/sub"))
        ],
      ),
      body: Center(
        child: Text(
          repo.run(),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0
          ),
        ),
      ),
    );
  }
}