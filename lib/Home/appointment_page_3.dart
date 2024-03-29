import 'package:clinic_app/Services/database.dart';
import 'package:clinic_app/Widgets/loading.dart';
import 'package:clinic_app/Widgets/BigText.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../Utils/user.dart';
import '../Widgets/Doctor.dart';
import '../Utils/colors.dart';
import '../Utils/dimensions.dart';
import '../Widgets/IconsText.dart';
import '../Widgets/SmallText.dart';
import '../Widgets/appointment_widget.dart';

class AppointmentPage3 extends StatefulWidget {
  final String service;
  final String symptomns;

  const AppointmentPage3(
      {Key? key, required this.service, required this.symptomns})
      : super(key: key);

  @override
  _AppointmentPageState3 createState() => _AppointmentPageState3();
}

class _AppointmentPageState3 extends State<AppointmentPage3> {
  TextEditingController symptomns = TextEditingController();
  Doctor doctor = Doctor(name: 'Dr. Ricardo');

  DateTime? _selectedDay;
  var _res;
  List serviceDays = [];
  Map<String, bool> occupied = {};
  List hoursOccupied = [];
  
  bool checkOccupation(String currentTime){
    if(hoursOccupied.contains(currentTime)){
      return true;
    }
    return false;
  }

  Future getSchedule() async {
    await doctor.getDaysFromDatabase();
    List? days = doctor.getDays();
    //serviceDays = await DatabaseService().serviceSchedule(widget.service);
  }

  Future getOccupied() async {
    hoursOccupied = [];
    hoursOccupied = await DatabaseService().checkOccupied(_selectedDay!);
    serviceDays.forEach((element) {occupied[element] = false;});
    for(var hour in hoursOccupied){
      occupied.forEach((key, value) {
        if(key == hour){
          value = true;
        }
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    var hours = doctor.days != null
        ? List.generate(
            doctor.days!.length,
            (index) => RadioListTile(
                activeColor: AppColors.mainColor2,
                visualDensity: const VisualDensity(vertical: 0.1),
                title: Text(doctor.days![index].toString()),
                value: doctor.days![index].toString(),
                groupValue: _res,
                onChanged: (value) {
                  setState(() {
                    _res = value;
                  });
                }))
        : Center();
    return StreamBuilder<Doctor>(
        stream: DatabaseService(
                service: widget.service,
                day: _selectedDay == null
                    ? "0"
                    : _selectedDay!.weekday.toString())
            .doctorData,
        builder: (context, snapshot) {
          if (_selectedDay != null) {
          }
          if (snapshot.hasData) {
            Doctor? doctor = snapshot.data;
            return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.grey[100],
              body: FutureBuilder(
                  future: getSchedule(),
                  builder: (context, snapshot) {
                    return SingleChildScrollView(
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
                                          image: AssetImage(
                                              "assets/image/logo.png"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 45,
                                  height: 45,
                                  child: Center(),
                                  // Icon(Icons.search, color: Colors.white,),
                                  // decoration: BoxDecoration(
                                  //   borderRadius: BorderRadius.circular(15.0),
                                  //   color: AppColors.mainColor2,
                                  //
                                  // ),
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
                              image:
                                  AssetImage("assets/image/StepProgress3.png"),
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
                                text:
                                    "Escolha o horário que\ndeseja para a sua consulta",
                                size: 15,
                                color: Colors.grey[500],
                              )),
                        ),
                        SizedBox(height: Dimensions.height20 * 2),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 30.0,
                            bottom: 10,
                          ),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: IconAndTextWidget(
                                icon: Icons.calendar_today_rounded,
                                iconColor: AppColors.mainColor2,
                                text: "Dia da Marcação",
                                textSize: 17,
                                textColor: Colors.black87,
                                textWeight: FontWeight.bold,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                          child: TableCalendar(
                            locale: 'pt_PT',
                            firstDay: DateTime.utc(2010, 10, 16),
                            lastDay: DateTime.utc(2030, 3, 14),
                            focusedDay: DateTime.now(),
                            calendarFormat: CalendarFormat.month,
                            calendarStyle: CalendarStyle(
                              canMarkersOverflow: true,
                              defaultTextStyle: const TextStyle(fontSize: 17),
                              rangeHighlightColor: AppColors.mainColor,
                              todayTextStyle: const TextStyle(
                                  color: Colors.white, fontSize: 17),
                              todayDecoration: BoxDecoration(
                                color: AppColors.mainColor2.withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              selectedDecoration: BoxDecoration(
                                  color: AppColors.mainColor2,
                                  shape: BoxShape.circle),
                            ),
                            headerStyle: const HeaderStyle(
                              titleCentered: true,
                              formatButtonVisible: false,
                            ),
                            selectedDayPredicate: (day) {
                              return isSameDay(_selectedDay, day);
                            },
                            onDaySelected: (selectedDay, focusedDay) {
                              setState(() {
                                _selectedDay = selectedDay;
// update `_focusedDay` here as well
                              });
                              //print(selectedDay);
                            },
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30.0, bottom: 20),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: IconAndTextWidget(
                                    icon: Icons.more_time_rounded,
                                    iconColor: AppColors.mainColor2,
                                    text: "Hora da Marcação",
                                    textSize: 17,
                                    textColor: Colors.black87,
                                    textWeight: FontWeight.bold,
                                  )),
                            ),
                            BigText(
                              text: doctor!.name,
                              weight: FontWeight.bold,
                              size: Dimensions.height20,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: doctor.days!.length,
                              itemBuilder: (context, index){
                                return FutureBuilder(
                                  future: getOccupied(),
                                  builder: (context, snapshot) {
                                    return AbsorbPointer(
                                      absorbing: checkOccupation( doctor.days![index].toString()),
                                      child: RadioListTile(activeColor: AppColors.mainColor2,
                                          //visualDensity: const VisualDensity(vertical: 0.1),
                                          title: checkOccupation(doctor.days![index].toString()) ? Text(doctor.days![index].toString() + '   (Ocupado)', style: TextStyle(color: Colors.redAccent),) : Text(doctor.days![index].toString()),
                                          value: doctor.days![index].toString(),
                                          groupValue: _res,
                                          onChanged: (value) {
                                            setState(() {
                                              _res = value;
                                            });
                                          }),
                                    );
                                  });
                              },
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 30, bottom: 20 * 3),
                          child: SizedBox(
                              height: Dimensions.height10 * 6,
                              //height of button
                              width: Dimensions.width20 * 17,
                              //width of button
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 7,
                                      primary: AppColors.mainColor2,
                                      //background color of button
                                      shadowColor: AppColors.mainColor2,
                                      shape: RoundedRectangleBorder(
                                          //to set border radius to button
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      padding: const EdgeInsets.all(
                                          5) //content padding inside button
                                      ),
                                  onPressed: () async {
                                    DatabaseService db =DatabaseService(uid: user!.uid);
                                    db.addAppointment(
                                            widget.service,
                                            Timestamp.fromDate(_selectedDay!),
                                            _res);
                                    // db.addOccupied(
                                    //     _selectedDay!, _res);
                                    Navigator.of(context)
                                        .popUntil(ModalRoute.withName("/"));
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                    );
                  }),
            );
          } else {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.grey[100],
              body: FutureBuilder(
                  future: getSchedule(),
                  builder: (context, snapshot) {
                    return SingleChildScrollView(
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
                                          image: AssetImage(
                                              "assets/image/logo.png"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 45,
                                  height: 45,
                                  child: Center(),
                                  // Icon(Icons.search, color: Colors.white,),
                                  // decoration: BoxDecoration(
                                  //   borderRadius: BorderRadius.circular(15.0),
                                  //   color: AppColors.mainColor2,
                                  //
                                  // ),
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
                              image:
                                  AssetImage("assets/image/StepProgress3.png"),
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
                                text:
                                    "Escolha o horário que\ndeseja para a sua consulta",
                                size: 15,
                                color: Colors.grey[500],
                              )),
                        ),
                        SizedBox(height: Dimensions.height20 * 2),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 30.0,
                            bottom: 10,
                          ),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: IconAndTextWidget(
                                icon: Icons.calendar_today_rounded,
                                iconColor: AppColors.mainColor2,
                                text: "Dia da Marcação",
                                textSize: 17,
                                textColor: Colors.black87,
                                textWeight: FontWeight.bold,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                          child: TableCalendar(
                            locale: 'pt_PT',
                            firstDay: DateTime.utc(2010, 10, 16),
                            lastDay: DateTime.utc(2030, 3, 14),
                            focusedDay: DateTime.now(),
                            calendarFormat: CalendarFormat.month,
                            calendarStyle: CalendarStyle(
                              canMarkersOverflow: true,
                              defaultTextStyle: const TextStyle(fontSize: 17),
                              rangeHighlightColor: AppColors.mainColor,
                              todayTextStyle: const TextStyle(
                                  color: Colors.white, fontSize: 17),
                              todayDecoration: BoxDecoration(
                                color: AppColors.mainColor2.withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              selectedDecoration: BoxDecoration(
                                  color: AppColors.mainColor2,
                                  shape: BoxShape.circle),
                            ),
                            headerStyle: const HeaderStyle(
                              titleCentered: true,
                              formatButtonVisible: false,
                            ),
                            selectedDayPredicate: (day) {
                              return isSameDay(_selectedDay, day);
                            },
                            onDaySelected: (selectedDay, focusedDay) {
                              setState(() {
                                _selectedDay = selectedDay;
// update `_focusedDay` here as well
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                      ]),
                    );
                  }),
            );
          }
        });
  }
}
