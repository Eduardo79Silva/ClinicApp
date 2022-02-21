import 'package:clinic_app/utils/colors.dart';
import 'package:clinic_app/widgets/BigText.dart';
import 'package:clinic_app/widgets/SmallText.dart';
import 'package:flutter/material.dart';

class ServicesBody extends StatefulWidget {
  const ServicesBody({Key? key}) : super(key: key);

  @override
  _ServicesBodyState createState() => _ServicesBodyState();
}

class _ServicesBodyState extends State<ServicesBody> {

  PageController pageController = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: PageView.builder(

        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, position){
          return _builderPageItem(position);
        },
      ),
    );
  }
  Widget _builderPageItem(int index){
    return Stack(

      children: [ Container(
        height: 220,
        margin: EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/image/food0.png"
            )
          )
        ),
      ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 140,
            margin: EdgeInsets.only(left: 40, right: 40, bottom: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              color: Colors.white

            ),
            child: Container(
              padding: EdgeInsets.only(top: 10, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BigText(text: "Fisioterapeuta"),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Wrap(children:
                        List.generate(5, (index) => Icon(Icons.star, color: AppColors.mainColor, size: 15,))
                      ),
                      SizedBox(width: 10,),
                      SmallText(text: "4.5")
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
    ]);
  }
}

