import 'package:clinic_app/Utils/appointment.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyUser{

  final String uid;

  MyUser({required this.uid});


}

class UserData {

  final String uid;
  final String name;
  final String phoneNumbers;
  final String email;
  final List<Appointment>? appointments;
  final bool admin;

  UserData({required this.uid,required this.name, this.appointments, required this.phoneNumbers, required this.email, required this.admin});
}