import 'package:clinic_app/Utils/colors.dart';
import 'package:clinic_app/Utils/dimensions.dart';
import 'package:clinic_app/Widgets/BigText.dart';
import 'package:clinic_app/Widgets/Service.dart';
import 'package:clinic_app/Widgets/SmallText.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'appointment_page_1.dart';
import 'appointment_page_3.dart';

class ServicesBody extends StatefulWidget {
  final bool mainPage;
  final String? symptomns;
  const ServicesBody({Key? key, required this.mainPage, this.symptomns}) : super(key: key);

  @override
  _ServicesBodyState createState() => _ServicesBodyState();
}

class _ServicesBodyState extends State<ServicesBody> {
  PageController pageController = PageController(viewportFraction: 0.8);
  var _currPageValue = 0.0;
  final _height = Dimensions.pageViewContainer;
  final double _scaleFactor = 0.8;
  List<Service> services = [Service(id: 0, name: "Fisioterapia", img: "assets/image/fisioterapia.jpg", stars: 5, doctor: "Fisioterapeuta Carina"),
                            Service(id: 1, name: "Dentista", img: "assets/image/dentista.jpg", stars: 4, doctor: "3 Doutores disponíveis"),
                            Service(id: 2, name: "Psiquiatria", img: "assets/image/psiquiatria.jpg", stars: 5, doctor: "Dr. Pedro"),
                            Service(id: 3, name: "Podologia", img: "assets/image/podologia.jpg", stars: 5, doctor: "Dra. Isabela"),
                            Service(id: 4, name: "Psicologia", img: "assets/image/psicologia.jpg", stars: 4, doctor: "Dra. Bruna")];


  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  // @override
  // void dispose() {
  //   pageController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
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
    Matrix4 matrix = Matrix4.identity();

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
      child: InkWell(
        onTap: () {widget.mainPage ? Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AppointmentPage(hasService: true, service: service.name,))) : Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AppointmentPage3(service: service.name!, symptomns: widget.symptomns!,)));},
        child: Stack(children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven ? const Color(0xFF69c5df) : const Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(service.img!))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 25),
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
                padding: EdgeInsets.only(top: Dimensions.height10, left: Dimensions.height20, right: Dimensions.height15),
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
                                service.stars!,
                                (index) => Icon(
                                      Icons.star,
                                      color: AppColors.mainColor,
                                      size: Dimensions.height20,
                                    ))),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        SmallText(text: service.stars.toString(), size: Dimensions.height20),


                      ],

                    ),
                    SizedBox(height: Dimensions.height15,),
                    Row(
                      children: [
                        SmallText(text: service.doctor!, size: Dimensions.height20,),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
