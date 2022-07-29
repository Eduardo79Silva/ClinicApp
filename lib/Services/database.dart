import 'package:clinic_app/Services/auth.dart';
import 'package:clinic_app/Utils/appointment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String? uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference appointmentCollection = FirebaseFirestore.instance.collection('appointments');

  Future updateUserData(String especialidade, DateTime dia, String hora) async {
    return await appointmentCollection.doc(uid).set({
      'especialidade': especialidade,
      'dia': dia,
      'hora': hora
    });
  }

  Future addAppointment(String especialidade, DateTime dia, String hora) async {
    final CollectionReference userAppointments = appointmentCollection.doc(uid).collection('userAppointments');
    return await userAppointments.doc(dia.toString()).set({
      'especialidade': especialidade,
      'dia': dia,
      'hora': hora,
      'marcado': false
    });
  }
  
  List<Appointment> _appointmentFromSnap( QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Appointment(specialty: doc.get('especialidade') ?? '', day: doc.get('dia') ?? DateTime.now(), time: doc.get('hora') ?? '');
    }).toList();
  }

  Stream<List<Appointment>> get userAppointments {
    return appointmentCollection.doc(AuthService().userId).collection('userAppointments').snapshots().map(_appointmentFromSnap);
  }

  Stream<QuerySnapshot> get appointments {
    return appointmentCollection.snapshots();
  }

}