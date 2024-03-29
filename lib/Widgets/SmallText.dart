import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;
  TextOverflow overFlow;
  FontWeight weight;
  SmallText({Key? key, this.color = const Color(0xFFccc7c5), required this.text,
    this.size=12,
    this.height = 1.2,
    this.overFlow=TextOverflow.ellipsis,
  this.weight = FontWeight.w100}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      softWrap: false,
      style:TextStyle(
          color: color,
          fontSize: size,
          fontFamily: 'Roboto',
          fontWeight: weight
      ),
    );
  }
}
