import 'package:clinic_app/Home/login_page.dart';
import 'package:clinic_app/Home/main_page.dart';
import 'package:clinic_app/Utils/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser?>(context);

    print(user);

    if(user == null){
      return const LoginPage();
    }
    else{
      return const MainPage();
    }
  }
}
