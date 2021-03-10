import 'package:flutter/material.dart';
import 'package:flutter2webapp/pages/reactPage.dart';

abstract class PageClass extends StatelessWidget{
  Widget appScaffold(BuildContext context);
  Widget webScaffold(BuildContext context);

  @override
  Widget build(BuildContext context) => _render(context);

  Widget _render(BuildContext context) => ReactPage(web: this.webScaffold, app: this.appScaffold,);

}