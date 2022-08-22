import 'package:clinic_app/Utils/appointment.dart';
import 'package:clinic_app/Utils/user.dart';
import 'package:clinic_app/Widgets/Doctor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatabaseService{

  final String? uid;
  final String? doctorName;
  final String? day;
  DatabaseService({this.uid, this.doctorName, this.day});

  // collection reference
  final CollectionReference appointmentCollection = FirebaseFirestore.instance.collection("appointments");
  final CollectionReference userCollection = FirebaseFirestore.instance.collection("users");
  final CollectionReference doctorCollection = FirebaseFirestore.instance.collection("doctors");
  final CollectionReference serviceCollection = FirebaseFirestore.instance.collection("services");
  final CollectionReference scheduleCollection = FirebaseFirestore.instance.collection("schedules");
  final CollectionReference occupiedCollection = FirebaseFirestore.instance.collection("occupied");


  Future addAppointment(String especialidade, Timestamp dia, String hora) async {
    return await appointmentCollection.add({
      'especialidade': especialidade,
      'dia': dia,
      'hora': hora,
      'uid': uid
    });

  }

  Future addUser(String name, String email, String phoneNumber, bool admin) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'admin': admin
    });

  }

  Future addOccupied(DateTime day, String hour) async {
    return await userCollection.doc(day.toString()).set({
      'hour': hour
    });

  }

  // Future doctorSchedule(String name) async{
  //   return await doctorCollection.doc(name).get().then((value){
  //     List schedule = List.from(value.get('days'));
  //   }
  //   );
  // }

  Future checkIfOccupied(String day, String hour) async {
   return await occupiedCollection.doc(day.toString()).snapshots().contains(hour);
  }


  Future deleteAppointment() async {
    //.where('hora', isLessThanOrEqualTo: now)
    String now = (DateTime.now().hour + DateTime.now().minute).toString();
    var expired = appointmentCollection.where('dia', isLessThanOrEqualTo: DateTime.now()).snapshots();
    expired.forEach((element) {for (var element1 in element.docs) {print(element1.get('dia'));print(element1.get('hora'));appointmentCollection.doc(element1.id).delete();}});
  }

  
  List<Appointment> _appointmentFromSnap( QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Appointment(specialty: doc.get('especialidade') ?? '', day: doc.get('dia') ?? Timestamp.fromDate(DateTime.now()), time: doc.get('hora') ?? '', uid: doc.get('uid') ?? '');
    }).toList();
  }

  Appointment _nextAppointmentFromSnap( DocumentSnapshot snapshot){
    return Appointment(specialty: snapshot.get('especialidade') ?? '', day: snapshot.get('dia') ?? Timestamp.fromDate(DateTime.now()), time: snapshot.get('hora') ?? '', uid: snapshot.get('uid') ?? '');
  }

  Doctor _doctorFromSnap( DocumentSnapshot snapshot){
    return Doctor(name: doctorName!, days: snapshot.data().toString().contains('hours') ? snapshot.get('hours') : 0);
  }



  List<MyUser> _userFromSnap( QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return MyUser(uid: doc.id);
    }).toList();
  }

  UserData _userDataFromSnapshot(DocumentSnapshot doc){
    return UserData(uid: uid!, name: doc.get('name'), phoneNumbers: doc.get('phoneNumber'), email: doc.get('email'), admin: doc.get('admin'));
  }

  Stream<List<Appointment>> get allUserAppointments {
    return appointmentCollection.snapshots().map(_appointmentFromSnap);
  }



  //get user doc stream

  Stream<UserData> get userData {
    return userCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

  Stream<Doctor> get doctorData {
    return doctorCollection.doc(doctorName).collection('days').doc(day).snapshots().map(_doctorFromSnap);
  }

  Stream<List<Appointment>> get userNextAppointment {
    return appointmentCollection.where('uid', isEqualTo: uid).snapshots().map(_appointmentFromSnap);
  }

  Stream<UserData> userByID(String userid) {
    return userCollection.doc(userid).snapshots().map(_userDataFromSnapshot);
  }

  Future doctorSchedule(String? name) async {
    Map itemsList = {};

    try {
      await doctorCollection.doc(name).get().then((element) {
        itemsList = element.get('days');
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future daySchedule(String? id) async {
    Map itemsList = {};
    //print(scheduleCollection.doc(id).id);

    try {
      await scheduleCollection.doc(id).get().then((element) {
        itemsList = element.get('times');
        itemsList.forEach((key, value) {if(value == false){

        }
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

}