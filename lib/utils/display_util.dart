import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayUtil {
  static void showMsg(BuildContext context,
      {String text,
      Exception exception,
      bool isErrorMsg,
      Duration duration = const Duration(seconds: 2, milliseconds: 500)}) {
    isErrorMsg ??= (exception != null);
    Scaffold.of(context).showSnackBar(SnackBar(
        content: new Text(
      text,
      style: TextStyle(color: Colors.white),
    ),duration: duration,
        behavior: SnackBarBehavior.floating,
    ));
  }

  static BoxShadow lightElevation({Color baseColor = const Color(0xFFEEEEEE)}){

    return BoxShadow(
      color: baseColor,
      blurRadius: 9,
      spreadRadius: 3,

    );
  }

  static BoxShadow supreLightElevation({Color baseColor = const Color(0xFFEEEEE)}){

    return BoxShadow(
      color: baseColor,
      blurRadius: 6,
    );
  }
}
