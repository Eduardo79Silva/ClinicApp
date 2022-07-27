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

class AppointmentPage2 extends StatefulWidget {
  const AppointmentPage2({Key? key}) : super(key: key);

  @override
  _AppointmentPageState2 createState() => _AppointmentPageState2();
}

class _AppointmentPageState2 extends State<AppointmentPage2> {
  TextEditingController symptomns = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
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
                      onPressed: () => {Navigator.of(context).popUntil(ModalRoute.withName("/"))},
                      icon: Icon(
                        Icons.close_rounded,
                        color: AppColors.mainColor2,
                      )),
                  Column(
                    children: [
                      Container(
                        height: Dimensions.height20 * 2,
                        width: Dimensions.width20 * 20,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/image/logo.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    child: const Icon(
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
          Container(
            height: Dimensions.height20 * 1.2,
            width: Dimensions.width20 * 25,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/StepProgress2.png"),
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
                  text: "Qual o serviço que precisa? ",
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
                  "Escolha a especialidade que mais\nse indica para as suas necessidades",
                  size: 15,
                  color: Colors.grey[500],
                )),
          ),
          SizedBox(height: Dimensions.height20 * 4),
          ServicesBody(mainPage: false),
        ]),
      ),
    );
  }
}
