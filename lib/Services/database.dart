import 'package:clinic_app/Services/auth.dart';
import 'package:clinic_app/Utils/appointment.dart';
import 'package:clinic_app/Utils/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService{

  final String? uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference appointmentCollection = FirebaseFirestore.instance.collection("appointments");
  final CollectionReference userCollection = FirebaseFirestore.instance.collection("users");


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

  
  List<Appointment> _appointmentFromSnap( QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Appointment(specialty: doc.get('especialidade') ?? '', day: doc.get('dia') ?? Timestamp.fromDate(DateTime.now()), time: doc.get('hora') ?? '', uid: doc.get('uid') ?? '');
    }).toList();
  }

  Appointment _nextAppointmentFromSnap( DocumentSnapshot snapshot){
    return Appointment(specialty: snapshot.get('especialidade') ?? '', day: snapshot.get('dia') ?? Timestamp.fromDate(DateTime.now()), time: snapshot.get('hora') ?? '', uid: snapshot.get('uid') ?? '');
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

  Stream<List<Appointment>> get userNextAppointment {
    return appointmentCollection.where('uid', isEqualTo: uid).snapshots().map(_appointmentFromSnap);
  }



}