import 'package:clinic_app/Services/auth.dart';
import 'package:clinic_app/Utils/appointment.dart';
import 'package:clinic_app/Utils/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService{

  final String? uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference appointmentCollection = FirebaseFirestore.instance.collection("appointments")
  ;


  Future addAppointment(String especialidade, Timestamp dia, String hora) async {
    return await appointmentCollection.add({
      'especialidade': especialidade,
      'dia': dia,
      'hora': hora,
      'uid': uid
    });

  }

  
  List<Appointment> _appointmentFromSnap( QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Appointment(specialty: doc.get('especialidade') ?? '', day: doc.get('dia') ?? Timestamp.fromDate(DateTime.now()), time: doc.get('hora') ?? '', uid: doc.get('uid') ?? '');
    }).toList();
  }

  List<MyUser> _userFromSnap( QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return MyUser(uid: doc.id);
    }).toList();
  }

  Stream<List<Appointment>> get userAppointments {
    return appointmentCollection.snapshots().map(_appointmentFromSnap);
  }



}