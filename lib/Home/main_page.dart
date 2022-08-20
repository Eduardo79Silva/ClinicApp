
import 'package:clinic_app/Services/database.dart';
import 'package:clinic_app/Utils/user.dart';
import 'package:clinic_app/Widgets/Doctor.dart';
import 'package:clinic_app/Widgets/loading.dart';
import 'package:clinic_app/Widgets/next_appointment.dart';
import 'package:clinic_app/Home/main_page_services.dart';
import 'package:clinic_app/Widgets/BigText.dart';
import 'package:clinic_app/Widgets/SideDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Utils/colors.dart';
import '../Utils/dimensions.dart';
import '../Widgets/IconsText.dart';
import '../Widgets/SmallText.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future getOccupied() async{
    await DatabaseService().checkIfOccupied(DateTime.now(), '11:00');
  }




  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser?>(context);
    DatabaseService(uid: user!.uid).deleteAppointment();
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {

          UserData? userData = snapshot.data;
          DatabaseService().checkIfOccupied(DateTime.now(), '11:00');

          return FutureBuilder(
            future: getOccupied(),
            builder: (context, snapshot) {
              print(snapshot.data.toString());
              return Scaffold(
              key: _scaffoldKey,
              drawer: SideDrawer(),
              backgroundColor: Colors.grey[100],
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                        color: Colors.grey[200],
                      ),
                      child: Container(
                        //color: Colors.grey[300],
                        margin: const EdgeInsets.only(top: 40, bottom: 20),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(onPressed: () =>
                                _scaffoldKey.currentState?.openDrawer(),
                                icon: Icon(
                                  Icons.menu, color: AppColors.mainColor2,)),
                            Column(
                              children: [Container(
                                height: Dimensions.height20 * 2,
                                width: Dimensions.width20 * 20,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/image/logo.png"),
                                    fit: BoxFit.fill,),
                                ),
                              ),
                              ],
                            ),
                            const SizedBox(
                              width: 45,
                              height: 45,
                              child: Center(),
                              // Icon(Icons.search, color: Colors.white,),
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(15.0),
                              //   color: AppColors.mainColor2,
                              //
                              // ),

                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.height20 * 2,),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Align(alignment: Alignment.centerLeft,
                          child: BigText(
                            text: "Olá " + userData!.name, size: 25, weight: FontWeight.bold,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, top: 10.0),
                      child: Align(alignment: Alignment.centerLeft,
                          child: SmallText(text: "Marque já a sua consulta",
                            size: 15,
                            color: Colors.grey[500],)),
                    ),
                    SizedBox(height: Dimensions.height20 * 2),
                    const ServicesBody(mainPage: true,),
                    SizedBox(height: Dimensions.height20 * 2),
                    const NextAppointment()

                    //---------------- FUTURE FEATURE
                    // Align(
                    //   alignment: Alignment.bottomCenter,
                    //   child: Container(
                    //     height: Dimensions.pageViewTextContainer,
                    //     margin: EdgeInsets.only(left: 30, right: 30, bottom: 25),
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(20),
                    //         color: Colors.white,
                    //         boxShadow: const [
                    //           BoxShadow(
                    //               color: Color(0xFFe8e8e8),
                    //               blurRadius: 5.0,
                    //               offset: Offset(0,5)
                    //           ),
                    //           BoxShadow(
                    //               color: Colors.white,
                    //               offset: Offset(5,0)
                    //           ),
                    //           BoxShadow(
                    //               color: Colors.white,
                    //               offset: Offset(-5,0)
                    //           )
                    //         ]
                    //     ),
                    //     child: Container(
                    //       padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         children: [
                    //           BigText(text: "Os seus documentos", size: Dimensions.height20,),
                    //           SizedBox(
                    //             height: Dimensions.height20,
                    //           ),
                    //           Row(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               Expanded(
                    //                   child: IconAndTextWidget(
                    //                       icon: Icons.all_inbox_rounded,
                    //                       text: "Analises ao sangue - Sr. Diogo",
                    //                       iconColor: AppColors.mainColor)),
                    //             ],
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            );}
          );
        }
        else {
          return Loading();
        }
      }

    );
  }
}
