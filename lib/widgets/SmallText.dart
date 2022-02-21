import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;
  TextOverflow overFlow;
  SmallText({Key? key, this.color = const Color(0xFFccc7c5), required this.text,
    this.size=12,
    this.height = 1.2,
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
          fontWeight: FontWeight.w100
      ),
    );
  }
}
