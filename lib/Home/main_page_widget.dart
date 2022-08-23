import 'package:flutter/material.dart';

import '../Utils/colors.dart';
import '../Utils/dimensions.dart';
import '../Widgets/BigText.dart';
import '../Widgets/IconsText.dart';
import '../Widgets/SmallText.dart';

class WidgetsWindows extends StatefulWidget {
  final String name;
  const WidgetsWindows(this.name);

  @override
  _WidgetsWindowsState createState() => _WidgetsWindowsState();
}

class _WidgetsWindowsState extends State<WidgetsWindows> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: Dimensions.pageViewTextContainer,
        margin: const EdgeInsets.only(left: 30, right: 30, bottom: 25),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Color(0xFFe8e8e8),
                  blurRadius: 5.0,
                  offset: Offset(0,5)
              ),
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(5,0)
              ),
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(-5,0)
              )
            ]
        ),
        child: Container(
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BigText(text: widget.name, size: Dimensions.height20,),
              SizedBox(
                height: Dimensions.height10,
              ),
              Row(
                children: [
                  Wrap(
                      children: List.generate(
                          5,
                              (index) => Icon(
                            Icons.star,
                            color: AppColors.mainColor,
                            size: 15,
                          ))),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  SmallText(text: "4.5"),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  SmallText(text: "1287"),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  SmallText(text: "comentários")
                ],
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: IconAndTextWidget(
                          icon: Icons.circle,
                          text: "Normal",
                          iconColor: AppColors.iconColor1)),
                  Expanded(
                      child: IconAndTextWidget(
                          icon: Icons.location_pin,
                          text: "1.7km",
                          iconColor: AppColors.mainColor2)),
                  Expanded(
                      child: IconAndTextWidget(
                          icon: Icons.access_time_rounded,
                          text: "11:00 - 19:30",
                          iconColor: AppColors.iconColor2)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
