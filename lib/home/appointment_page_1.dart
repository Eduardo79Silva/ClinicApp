import 'package:clinic_app/home/main_page_services.dart';
import 'package:clinic_app/widgets/BigText.dart';
import 'package:clinic_app/widgets/SideDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../widgets/IconsText.dart';
import '../widgets/SmallText.dart';
import 'main_page_widget.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      body: Column(children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            color: Colors.grey[200],
          ),
          child: Container(
            //color: Colors.grey[300],
            margin: EdgeInsets.only(top: 40, bottom: 20),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => {Navigator.of(context).pop()},
                    icon: Icon(
                      Icons.close_rounded,
                      color: AppColors.mainColor2,
                    )),
                Column(
                  children: [
                    new Container(
                      height: Dimensions.height20 * 2,
                      width: Dimensions.width20 * 20,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: new AssetImage("assets/image/logo.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 45,
                  height: 45,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: AppColors.mainColor2,
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        new Container(
          height: Dimensions.height20 * 1.2,
          width: Dimensions.width20 * 25,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/image/StepProgress1.png"),
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(
          height: Dimensions.height20 * 2,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: BigText(
                text: "Como se está a sentir? ",
                size: 25,
                weight: FontWeight.bold,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 10.0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: SmallText(
                text:
                    "Partilhe connosco os seus sintomas\npara o podermos ajudar.",
                size: 15,
                color: Colors.grey[500],
              )),
        ),
        SizedBox(height: Dimensions.height20 * 2),
        Container(
          margin: EdgeInsets.only(
              left: Dimensions.width20 * 3, right: Dimensions.width20 * 3),
          height: 7 * 24.0,
          child: TextField(
            textInputAction: TextInputAction.go,
            maxLines: 7 * 24,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Diga-nos como se sente",
            ),
          ),
        ),
        SizedBox(height: Dimensions.height20 * 5),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.mainColor2.withOpacity(0.6),
                spreadRadius: 4,
                blurRadius: 50,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: SizedBox(
              height: Dimensions.height10 * 6, //height of button
              width: Dimensions.width20 * 17, //width of button
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 7,
                      primary: AppColors.mainColor2, //background color of button
                      shadowColor: AppColors.mainColor2,
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(50)),
                      padding: EdgeInsets.all(5) //content padding inside button
                      ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Seguinte",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      Icon(Icons.arrow_forward_rounded)
                    ],
                  ))),
        )
      ]),
    );
  }
}