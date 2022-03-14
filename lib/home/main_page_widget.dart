import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../widgets/BigText.dart';
import '../widgets/IconsText.dart';
import '../widgets/SmallText.dart';

class WidgetsWindows extends StatefulWidget {
  const WidgetsWindows({Key? key}) : super(key: key);

  @override
  _WidgetsWindowsState createState() => _WidgetsWindowsState();
}

class _WidgetsWindowsState extends State<WidgetsWindows> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 15, right: 15),
      margin: EdgeInsets.symmetric(vertical: Dimensions.height20, horizontal: Dimensions.width20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BigText(text: "Fisioterapeuta", size: Dimensions.height20,),
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
                      iconColor: AppColors.mainColor)),
              Expanded(
                  child: IconAndTextWidget(
                      icon: Icons.access_time_rounded,
                      text: "11:00 - 19:30",
                      iconColor: AppColors.iconColor2)),
            ],
          )
        ],
      ),
    );
  }
}
