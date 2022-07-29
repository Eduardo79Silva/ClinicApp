import 'package:clinic_app/Home/login_page.dart';
import 'package:clinic_app/Home/register_page.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return LoginPage(toggle: toggleView);
    }
    else{
      return RegisterPage(toggle: toggleView);
    }
  }
}
