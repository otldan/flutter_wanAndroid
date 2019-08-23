import 'package:flutter/material.dart';
import 'package:flutter_app/utils/screen_utils.dart';

class SearchBar extends StatefulWidget{
  double height;
  double width;
  Widget child;
  Color color;
  Color iconColor;
  Widget icon;
  SearchBar({this.height,this.width,this.child,this.color,this.iconColor,this.icon});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}
class _SearchState extends State<SearchBar>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: widget.height != null ? BorderRadius.circular(widget.height/2) : null,
        color: widget.color
      ),
      alignment: Alignment.centerLeft,
      child: Row(children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: pt(5)),
          child: widget.icon ?? Icon(Icons.search,color: widget.iconColor,),
        ),Expanded(child: widget.child ?? Container(),)
      ],),
    );
  }

}