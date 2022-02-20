import 'package:flutter/material.dart';

class ServicesBody extends StatefulWidget {
  const ServicesBody({Key? key}) : super(key: key);

  @override
  _ServicesBodyState createState() => _ServicesBodyState();
}

class _ServicesBodyState extends State<ServicesBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: PageView.builder(
        itemCount: 5,
        itemBuilder: (context, position){
          return _builderPageItem(position);
        },
      ),
    );
  }
  Widget _builderPageItem(int index){
    return Container(
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
    );
  }
}

