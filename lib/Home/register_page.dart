import 'package:clinic_app/Home/login_page.dart';
import 'package:clinic_app/Services/auth.dart';
import 'package:clinic_app/Utils/colors.dart';
import 'package:clinic_app/home/main_page.dart';
import 'package:clinic_app/Utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage> {

  final AuthService _auth = AuthService();

  String email = '';
  String password = '';
  String nome = '';


  dynamic result;

  String initialCountry = 'PT';
  PhoneNumber number = PhoneNumber(isoCode: 'PT');
  final TextEditingController controller = TextEditingController();

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
      padding: EdgeInsets.only(bottom: Dimensions.height20),
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
    final inputName = Padding(
      padding: EdgeInsets.only(bottom: Dimensions.height20),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: 'Nome',
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
    final inputPhoneNumber =   Padding(
      padding:  EdgeInsets.only(top: 0),
      child: InternationalPhoneNumberInput(
        onInputChanged: (PhoneNumber number) {
          print(number.phoneNumber);
        },
        onInputValidated: (bool value) {
          print(value);
        },
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        ),
        ignoreBlank: false,
        autoValidateMode: AutovalidateMode.disabled,
        selectorTextStyle: const TextStyle(color: Colors.black),
        initialValue: number,
        textFieldController: controller,
        formatInput: false,
        keyboardType: const TextInputType.numberWithOptions(
            signed: true, decimal: true),
        inputBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 169, 47, 26),
            )),
        inputDecoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          labelText: 'Número de telemóvel',
          floatingLabelAlignment: FloatingLabelAlignment.center,
          labelStyle: TextStyle(color: AppColors.mainColor2),
          iconColor: const Color.fromARGB(255, 169, 47, 26),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 169, 47, 26),
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 169, 47, 26),
              )),
        ),
        onSaved: (PhoneNumber number) {
          print('On Saved: $number');
        },
      ),
    );
    final inputPassword = Padding(
      padding: EdgeInsets.only(bottom: Dimensions.height20),
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
            child: const Text('Registar', style: TextStyle(color: Colors.white, fontSize: 18)),
            style: ElevatedButton.styleFrom(
                elevation: 7,
                primary: AppColors.mainColor2, //background color of button
                shadowColor: AppColors.mainColor2,
                shape: RoundedRectangleBorder(
                  //to set border radius to button
                    borderRadius: BorderRadius.circular(50)),
                padding: const EdgeInsets.all(5) //content padding inside button
            ),
            onPressed: () async {
              print(email);
              print(password);
              /*result = await _auth.signInAnon();
              if(result==null){
                print('error');
              }
              else{
                print(result.uid);
              }*/
            },
          ),
        ),
      ),
    );
    final buttonForgotPassword =  TextButton(
        child: const Text('Já tem uma conta?', style: TextStyle(color: Colors.grey, fontSize: 16),),
        onPressed:  () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const LoginPage()),
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
                  SizedBox(height: Dimensions.height10,),
                  inputEmail,
                  inputPassword,
                  inputName,
                  inputPhoneNumber,
                  SizedBox(height: Dimensions.height20*3.5,),
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