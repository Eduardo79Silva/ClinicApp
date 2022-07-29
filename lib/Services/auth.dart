import 'package:clinic_app/Services/database.dart';
import 'package:clinic_app/Utils/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyUser? _userFromFirebaseUser(User? user){
      return user != null ? MyUser(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<MyUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }


  //sign in anon
  Future signInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  String get userId {
    return _auth.currentUser!.uid;
  }

  // sign in with email and pass
  Future signIn(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? u = result.user;
      return _userFromFirebaseUser(u);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  //register
  Future registerEmailPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? u = result.user;
      
      await DatabaseService(uid: u!.uid).addAppointment('Dentista', Timestamp.fromDate(DateTime.now()), '16:30');
      return _userFromFirebaseUser(u);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  //signout
  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }


}