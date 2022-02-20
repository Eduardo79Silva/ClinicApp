import 'package:clinic_app/home/main_page_services.dart';
import 'package:clinic_app/widgets/BigText.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 45, bottom: 45),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [BigText(text: "Clínica Hora Sã", color: AppColors.mainColor,size: 30,)],
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    child: Icon(Icons.search, color: Colors.white,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: AppColors.mainColor,

                    ),

                  )
                ],
              ),
            ),
          ),
          ServicesBody()
        ],
      ),
    );
  }
}
