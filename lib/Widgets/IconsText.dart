import 'package:clinic_app/Widgets/SmallText.dart';
import 'package:flutter/material.dart';

class IconAndTextWidget extends StatelessWidget {

  final IconData icon;
  final String text;
  final Color iconColor;
  final double textSize;
  final Color textColor;
  final FontWeight textWeight;



  const IconAndTextWidget({Key? key,
    required this.icon,
    required this.text,
    required this.iconColor,
    this.textSize = 15,
    this.textColor = Colors.grey,
    this.textWeight = FontWeight.w100
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor,),
        SizedBox(width: 10,),
        Expanded(child: SmallText(text: text, overFlow: TextOverflow.fade,size: textSize,color: textColor,weight: textWeight,))
      ],
    );
  }
}
