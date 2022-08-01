
import 'package:clinic_app/Utils/user.dart';
import 'package:clinic_app/home/main_page_services.dart';
import 'package:clinic_app/widgets/BigText.dart';
import 'package:clinic_app/widgets/SideDrawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:clinic_app/Services/database.dart';
import 'package:provider/provider.dart';

import '../Utils/appointment.dart';
import '../Widgets/appointmentList.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../widgets/IconsText.dart';
import '../widgets/SmallText.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {



  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Appointment>?>.value(
      initialData: null,
      value: DatabaseService().allUserAppointments,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: SideDrawer(),
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                  color: Colors.grey[200],
                ),
                child: Container(
                  //color: Colors.grey[300],
                  margin: const EdgeInsets.only(top: 40, bottom: 20),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: () => _scaffoldKey.currentState?.openDrawer(), icon: Icon(Icons.menu, color: AppColors.mainColor2,)),
                      Column(
                        children: [Container(
                          height: Dimensions.height20*2,
                          width: Dimensions.width20*20,
                          decoration: const BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/image/logo.png"), fit: BoxFit.fill,),
                          ),
                        ),],
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
              SizedBox(height: Dimensions.height20*2,),
              const AppointmentList(),
            ],
          ),
        ),
      ),
    );
  }
}
