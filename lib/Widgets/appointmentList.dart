import 'package:clinic_app/Services/database.dart';
import 'package:clinic_app/Utils/appointment.dart';
import 'package:clinic_app/Widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'appointment_widget.dart';

class AppointmentList extends StatefulWidget {
  const AppointmentList({Key? key}) : super(key: key);

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  @override
  Widget build(BuildContext context) {

    final appointments = Provider.of<List<Appointment>?>(context);
    if(appointments != null) {
      appointments.sort((a, b) {
        int compare = a.day.compareTo(b.day);

        if (compare == 0) {
          return a.time.compareTo(b.time);
        } else {
          return compare;
        }
      });


      return Expanded(
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: appointments.length,
          itemBuilder: (context, index) {
            return AppointmentWidget(appointment: appointments[index]);
          },
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
        ),
      );


    }
    else{
      return Text('');
    }
  }
}