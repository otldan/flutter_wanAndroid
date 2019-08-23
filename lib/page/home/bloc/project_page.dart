import 'package:flutter/material.dart';

class ProjectSubPage extends StatefulWidget{
  PageStorageKey pageStorageKey;
  ProjectSubPage(this.pageStorageKey);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProjectSubPageState();
  }
}

class _ProjectSubPageState extends State<ProjectSubPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Text("page1"),
    );
  }
}