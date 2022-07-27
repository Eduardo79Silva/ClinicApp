import 'package:clinic_app/Services/auth.dart';
import 'package:clinic_app/home/main_page.dart';
import 'package:clinic_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  final AuthService _auth = AuthService();

  dynamic result;
  @override
  Widget build(BuildContext context) {
    final logo = Padding(
      padding: const EdgeInsets.all(20),
      child: Hero(
          tag: 'hero',
          child: CircleAvatar(
            radius: 56.0,
            child: Image.asset('assets/image/fisioterapia.jpg'),
          )
      ),
    );
    final inputEmail = Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Email',
            contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0)
            )
        ),
      ),
    );
    final inputPassword = Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Password',
            contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0)
            )
        ),
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
            child: const Text('Login', style: TextStyle(color: Colors.white, fontSize: 18)),
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
    final buttonForgotPassword = const TextButton(
        child: const Text('Forgot Password?', style: const TextStyle(color: Colors.grey, fontSize: 16),),
        onPressed: null
    );
    return SafeArea(
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
                buttonForgotPassword
              ],
            ),
          ),
        )
    );
  }
}