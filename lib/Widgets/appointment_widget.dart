import 'package:clinic_app/Services/database.dart';
import 'package:clinic_app/Utils/user.dart';
import 'package:clinic_app/Widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:clinic_app/Utils/appointment.dart';
import 'package:provider/provider.dart';

import '../Utils/colors.dart';
import '../Utils/dimensions.dart';
import 'BigText.dart';
import 'IconsText.dart';
import 'SmallText.dart';

class AppointmentWidget extends StatelessWidget {
  final Appointment appointment;

  const AppointmentWidget({Key? key, required this.appointment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user!.uid).userByID(appointment.uid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {

        UserData? userData = snapshot.data;
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
                      offset: Offset(0, 5)),
                  BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                  BoxShadow(color: Colors.white, offset: Offset(-5, 0))
                ]),
              child: Container(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BigText(
                      text: userData!.name,
                      size: Dimensions.height20,
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    SmallText(
                      text: userData.phoneNumbers,
                      size: Dimensions.height15,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: IconAndTextWidget(
                                icon: Icons.medical_services_rounded,
                                text: appointment.specialty,
                                iconColor: AppColors.iconColor1)),
                        Expanded(
                            child: IconAndTextWidget(
                                icon: Icons.calendar_today_rounded,
                                text: appointment.day.toDate().day.toString() + '/' + appointment.day.toDate().month.toString(),
                                iconColor: AppColors.mainColor2)),
                        Expanded(
                            child: IconAndTextWidget(
                                icon: Icons.access_time_rounded,
                                text: appointment.time,
                                iconColor: AppColors.iconColor2)),
                      ],
                    )
                  ],
                ),
              ),
            ),
        );
      }
        else{
          return Center();
        }
      }
    );
  }
}
