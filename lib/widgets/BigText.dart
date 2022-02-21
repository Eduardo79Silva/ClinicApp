import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  BigText({Key? key, this.color = const Color(0xFF332d2b), required this.text,
  this.size=20,
  this.overFlow=TextOverflow.fade}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:TextStyle(
        color: color,
        fontSize: size,
        overflow: overFlow,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400
      ),
    );
  }
}
