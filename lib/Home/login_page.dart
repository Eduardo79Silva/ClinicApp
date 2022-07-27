import 'package:clinic_app/Home/register_page.dart';
import 'package:clinic_app/Services/auth.dart';
import 'package:clinic_app/Utils/dimensions.dart';
import 'package:clinic_app/Home/main_page.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  final AuthService _auth = AuthService();

  String email = '';
  String password = '';

  dynamic result;
  @override
  Widget build(BuildContext context) {
    final logo = Padding(
      padding: const EdgeInsets.all(20),
      child: Hero(
          tag: 'hero',
          child: CircleAvatar(
            radius: 56.0,
            child: Image.asset('assets/image/logo.png'),
            backgroundColor: Colors.transparent,
          )
      ),
    );
    final inputEmail = Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: 'Email',
            floatingLabelAlignment: FloatingLabelAlignment.center,
            labelStyle: TextStyle(color: AppColors.mainColor2),
            contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0)
            )
        ),
        onChanged: (val){
          setState(() {
            email=val;
          });
        },
      ),
    );
    final inputPassword = Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        decoration: InputDecoration(
            labelText: 'Palavra-passe',
            floatingLabelAlignment: FloatingLabelAlignment.center,
            labelStyle: TextStyle(color: AppColors.mainColor2),
            contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0)
            )
        ),
        onChanged: (val) {
          setState(() {
            password=val;
          });
        },
      ),
    );

    final buttonLogin = Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: ButtonTheme(
        height: Dimensions.height20*10,
        child: SizedBox(
          height: Dimensions.height10 * 6, //height of button
          width: Dimensions.width20 * 17, //width of button
          child: ElevatedButton(
            child: const Text('Entrar', style: TextStyle(color: Colors.white, fontSize: 18)),
            style: ElevatedButton.styleFrom(
                elevation: 7,
                primary: AppColors.mainColor2, //background color of button
                shadowColor: AppColors.mainColor2,
                shape: RoundedRectangleBorder(
                  //to set border radius to button
                    borderRadius: BorderRadius.circular(50)),
                padding: EdgeInsets.all(5) //content padding inside button
            ),
            onPressed: () async {
              print(email);
              print(password);
              result = await _auth.signInAnon();
              if(result==null){
                print('error');
              }
              else{
                print(result.uid);
              }
            },
          ),
        ),
      ),
    );

    final buttonForgotPassword =  TextButton(
        child: const Text('Criar Conta', style: TextStyle(color: Colors.grey, fontSize: 20),),
        onPressed:  () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const RegisterPage()),
          );
        }
    );
    return SafeArea(
        child: Form(
          child: Scaffold(
            body: Center(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: <Widget>[
                  logo,
                  SizedBox(height: Dimensions.height20*4,),
                  inputEmail,
                  inputPassword,
                  SizedBox(height: Dimensions.height20*5,),
                  buttonLogin,
                  SizedBox(height: Dimensions.height15,),
                  buttonForgotPassword
                ],
              ),
            ),
          ),
        )
    );
  }
}