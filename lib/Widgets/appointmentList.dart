import 'package:clinic_app/Services/auth.dart';
import 'package:clinic_app/Services/database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../Utils/appointment.dart';

class AppointmentList extends StatefulWidget {
  const AppointmentList({Key? key}) : super(key: key);

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  @override
  Widget build(BuildContext context) {



    final appointments = Provider.of<List<Appointment>>(context);
    // DatabaseService().updateUserData('0', DateTime.now(), '0');
    // print(appointments.docs.first.data());

    for(var doc in appointments){
      print(doc.specialty);
    }

    return Container();
  }
}
