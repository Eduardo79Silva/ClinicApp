import 'package:clinic_app/Services/database.dart';
import 'package:clinic_app/Utils/appointment.dart';
import 'package:clinic_app/Widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Utils/colors.dart';
import '../Utils/dimensions.dart';
import '../Utils/user.dart';
import 'BigText.dart';
import 'IconsText.dart';

class NextAppointment extends StatelessWidget {
  const NextAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    return StreamBuilder<List<Appointment>>(
      stream: DatabaseService(uid: user!.uid).userNextAppointment,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
         List<Appointment>? appointments = snapshot.data;
         appointments!.sort((a, b) {
           int compare = a.day.compareTo(b.day);

           if (compare == 0) {
             return a.time.compareTo(b.time);
           } else {
             return compare;
           }
         });

        Appointment? next = snapshot.data!.first;
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin: const EdgeInsets.only(
                left: 30, right: 30, bottom: 25),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)
                  ),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0)
                  ),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0)
                  )
                ]
            ),
            child: Container(
              padding: const EdgeInsets.only(
                  top: 10, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BigText(text: "A sua próxima consula",
                    size: Dimensions.height20,),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  // Row(
                  //   children: [
                  //     Wrap(
                  //         children: List.generate(
                  //             5,
                  //                 (index) =>
                  //                 Icon(
                  //                   Icons.star,
                  //                   color: AppColors.mainColor,
                  //                   size: 15,
                  //                 ))),
                  //     SizedBox(
                  //       width: Dimensions.width10,
                  //     ),
                  //     SmallText(text: "4.5"),
                  //     SizedBox(
                  //       width: Dimensions.width20,
                  //     ),
                  //     SmallText(text: ""),
                  //     SizedBox(
                  //       width: Dimensions.width10,
                  //     ),
                  //     SmallText(text: "")
                  //   ],
                  // ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: IconAndTextWidget(
                              icon: Icons.medical_services_rounded,
                              text: next.specialty,
                              iconColor: AppColors.iconColor1)),
                      Expanded(
                          child: IconAndTextWidget(
                              icon: Icons.calendar_today_rounded,
                              text: next.day.toDate().day.toString()+ '/' + next.day.toDate().month.toString(),
                              iconColor: AppColors.mainColor2)),
                      Expanded(
                          child: IconAndTextWidget(
                              icon: Icons.access_time_rounded,
                              text: next.time,
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
          return Text('no app');
        }
      }
    );
  }
}
