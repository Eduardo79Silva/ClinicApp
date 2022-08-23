import 'dart:ffi';
import 'dart:collection';

import 'package:clinic_app/Services/database.dart';
import 'package:flutter/cupertino.dart';

class Doctor {
  String name;
  String? description;
  List? days;
  Map? hours;


  Doctor({required this.name, this.description, this.days, this.hours});

  List getDays(){
    return days!;
  }

  Map getHours(){
    hours!.removeWhere((key, value) => value == false);
    //print(hours);
    return hours!;
  }


  getDaysFromDatabase() async {
    dynamic result = await DatabaseService().doctorSchedule(name);

    if(result == null){
     // print('No schedule');
    }
    else{
      days = result;
      //print(days);
    }
  }

  getHoursFromDatabase(String? id) async {
    dynamic result = await DatabaseService().daySchedule(id);

    if(result == null){
      print('No schedule');
    }
    else{
      hours = result;
    }

  }
}