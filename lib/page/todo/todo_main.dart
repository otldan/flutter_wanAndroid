import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget{
  static const ROUTER_NAME = "/TODOPAGE";
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TodoPageState();
  }
}

class _TodoPageState extends State<TodoPage>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: new Text("哈哈"),
    );
  }
}