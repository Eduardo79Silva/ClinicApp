import 'package:clinic_app/home/main_page_services.dart';
import 'package:clinic_app/widgets/BigText.dart';
import 'package:clinic_app/widgets/SideDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../widgets/IconsText.dart';
import '../widgets/SmallText.dart';
import 'main_page_widget.dart';

class AppointmentPage3 extends StatefulWidget {
  const AppointmentPage3({Key? key}) : super(key: key);

  @override
  _AppointmentPageState3 createState() => _AppointmentPageState3();
}

class _AppointmentPageState3 extends State<AppointmentPage3> {
  TextEditingController symptomns = TextEditingController();

  DateTime? _selectedDay;
  DateTime? _focusedDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              color: Colors.grey[200],
            ),
            child: Container(
              //color: Colors.grey[300],
              margin: const EdgeInsets.only(top: 40, bottom: 20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => {
                            Navigator.popUntil(
                                context, ModalRoute.withName('/'))
                          },
                      icon: Icon(
                        Icons.close_rounded,
                        color: AppColors.mainColor2,
                      )),
                  Column(
                    children: [
                      Container(
                        height: Dimensions.height20 * 2,
                        width: Dimensions.width20 * 20,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/image/logo.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: AppColors.mainColor2,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height20,
          ),
          Container(
            height: Dimensions.height20 * 1.2,
            width: Dimensions.width20 * 25,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/StepProgress3.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height20 * 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: BigText(
                  text: "Escolha o horário",
                  size: 25,
                  weight: FontWeight.bold,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 10.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: SmallText(
                  text: "Escolha o horário que\ndeseja para a sua consulta",
                  size: 15,
                  color: Colors.grey[500],
                )),
          ),
          SizedBox(height: Dimensions.height20 * 2),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay; // update `_focusedDay` here as well
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20*3),
            child: SizedBox(
                height: Dimensions.height10 * 6, //height of button
                width: Dimensions.width20 * 17, //width of button
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 7,
                        primary:
                            AppColors.mainColor2, //background color of button
                        shadowColor: AppColors.mainColor2,
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(50)),
                        padding: const EdgeInsets.all(5) //content padding inside button
                        ),
                    onPressed: () {
                      Navigator.popUntil(
                          context, ModalRoute.withName('/'));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          "Concluir",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        Icon(Icons.check_circle_outline_rounded)
                      ],
                    ))),
          ),
        ]),
      ),
    );
  }
}
