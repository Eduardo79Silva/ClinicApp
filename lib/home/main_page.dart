
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

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideDrawer(),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                color: Colors.grey[200],
              ),
              child: Container(
                //color: Colors.grey[300],
                margin: EdgeInsets.only(top: 40, bottom: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () => _scaffoldKey.currentState?.openDrawer(), icon: Icon(Icons.menu, color: AppColors.mainColor2,)),
                    Column(
                      children: [new Container(
                        height: Dimensions.height20*2,
                        width: Dimensions.width20*20,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(image: new AssetImage("assets/image/logo.png"), fit: BoxFit.fill,),
                        ),
                      ),],
                    ),
                    Container(
                      width: 45,
                      height: 45,
                      child: Icon(Icons.search, color: Colors.white,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: AppColors.mainColor2,

                      ),

                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: Dimensions.height20*2,),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Align(alignment: Alignment.centerLeft,
                  child: BigText(text: "Olá Sr. Diogo, ",size: 25,weight: FontWeight.bold, )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 10.0),
              child: Align(alignment: Alignment.centerLeft,
                  child: SmallText(text: "Marque já a sua consulta \nou veja os documentos de consultas passadas",size: 15, color: Colors.grey[500],)),
            ),
            SizedBox(height: Dimensions.height20*2),
            ServicesBody(),
            SizedBox(height: Dimensions.height20*2),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.pageViewTextContainer,
                margin: EdgeInsets.only(left: 30, right: 30, bottom: 25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5.0,
                          offset: Offset(0,5)
                      ),
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(5,0)
                      ),
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(-5,0)
                      )
                    ]
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BigText(text: "A sua proxima consula", size: Dimensions.height20,),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      Row(
                        children: [
                          Wrap(
                              children: List.generate(
                                  5,
                                      (index) => Icon(
                                    Icons.star,
                                    color: AppColors.mainColor,
                                    size: 15,
                                  ))),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          SmallText(text: "4.5"),
                          SizedBox(
                            width: Dimensions.width20,
                          ),
                          SmallText(text: "1287"),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          SmallText(text: "comentários")
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: IconAndTextWidget(
                                  icon: Icons.circle,
                                  text: "Normal",
                                  iconColor: AppColors.iconColor1)),
                          Expanded(
                              child: IconAndTextWidget(
                                  icon: Icons.location_pin,
                                  text: "1.7km",
                                  iconColor: AppColors.mainColor2)),
                          Expanded(
                              child: IconAndTextWidget(
                                  icon: Icons.access_time_rounded,
                                  text: "11:00 - 19:30",
                                  iconColor: AppColors.iconColor2)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.pageViewTextContainer,
                margin: EdgeInsets.only(left: 30, right: 30, bottom: 25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5.0,
                          offset: Offset(0,5)
                      ),
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(5,0)
                      ),
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(-5,0)
                      )
                    ]
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BigText(text: "Os seus documentos", size: Dimensions.height20,),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: IconAndTextWidget(
                                  icon: Icons.all_inbox_rounded,
                                  text: "Analises ao sangue - Sr. Diogo",
                                  iconColor: AppColors.mainColor)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
