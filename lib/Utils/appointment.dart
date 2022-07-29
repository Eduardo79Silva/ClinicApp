import 'package:cloud_firestore/cloud_firestore.dart';

class Appointment {
  final String specialty;
  final Timestamp day;
  final String time;
  final String uid;
  bool scheduled = false;

  Appointment({required this.specialty, required this.day, required this.time, required this.uid });

}