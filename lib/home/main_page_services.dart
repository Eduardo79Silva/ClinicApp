import 'package:clinic_app/utils/colors.dart';
import 'package:clinic_app/utils/dimensions.dart';
import 'package:clinic_app/widgets/BigText.dart';
import 'package:clinic_app/widgets/IconsText.dart';
import 'package:clinic_app/widgets/Service.dart';
import 'package:clinic_app/widgets/SmallText.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class ServicesBody extends StatefulWidget {
  const ServicesBody({Key? key}) : super(key: key);

  @override
  _ServicesBodyState createState() => _ServicesBodyState();
}

class _ServicesBodyState extends State<ServicesBody> {
  PageController pageController = PageController(viewportFraction: 0.8);
  var _currPageValue = 0.0;
  var _height = Dimensions.pageViewContainer;
  double _scaleFactor = 0.8;
  List<Service> services = [new Service(id: 0, name: "Fisioterapia", img: "assets/image/fisioterapia.jpg"),
                            new Service(id: 1, name: "Dentária", img: "assets/image/dentista.jpg"),
                            new Service(id: 2, name: "Psiquiatria", img: "assets/image/psiquiatria.jpg"),
                            new Service(id: 3, name: "Podologia", img: "assets/image/podologia.jpg"),
                            new Service(id: 4, name: "Psicologia", img: "assets/image/psicologia.jpg")];


  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
            itemCount: services.length,
            itemBuilder: (context, position) {
              return _builderPageItem(position, services[position]);
            },
          ),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor2,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        )
      ],
    );
  }

  Widget _builderPageItem(int index, Service service) {
    Matrix4 matrix = new Matrix4.identity();

    if(index == _currPageValue.floor()){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(index == _currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(index == _currPageValue.floor()-1){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else{
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(children: [
        Container(
          height: Dimensions.pageViewContainer,
          margin: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(service.img!))),
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
                  BigText(text: service.name!, size: Dimensions.height20,),
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
                              iconColor: AppColors.iconColor2),),

                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
