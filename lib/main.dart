import 'package:clinic_app/Home/wrapper.dart';
import 'package:clinic_app/Services/auth.dart';
import 'package:clinic_app/Utils/user.dart';
import 'package:clinic_app/home/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home/main_page.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  //initilization of Firebase app

  // other Firebase service initialization

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
        value: AuthService().user,
        initialData: null,
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            'MainPage': (context) => const MainPage(),
          },
          home: const Wrapper(),
        )
    );
  }
}
