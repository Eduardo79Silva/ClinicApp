import 'package:clinic_app/Utils/colors.dart';
import 'package:clinic_app/Utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Center(
        child: SpinKitPumpingHeart(
          color: AppColors.mainColor2,
          size: Dimensions.height10*5,
        ),
      ),
    );
  }
}