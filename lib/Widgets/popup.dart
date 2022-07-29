import 'dart:ui';
import 'package:clinic_app/Utils/colors.dart';
import 'package:clinic_app/Utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Services/auth.dart';

class PopUp extends StatefulWidget {
  final String title, descriptions, text;

  const PopUp(
      {Key? key,
      required this.title,
      required this.descriptions,
      required this.text})
      : super(key: key);

  @override
  _PopUpState createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.height20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: Dimensions.height20,
              top: Dimensions.height15 * 3 + Dimensions.height20,
              right: Dimensions.height20,
              bottom: Dimensions.height20),
          margin: EdgeInsets.only(top: Dimensions.height15 * 3),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.height20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[900]!.withOpacity(.2), offset: const Offset(0, 10), blurRadius: 10, ),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.descriptions,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () async {
                        await _auth.signOut();
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        widget.text,
                        style: const TextStyle(fontSize: 18, color: Colors.redAccent),
                      )),
                  TextButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Nao',
                        style: TextStyle(
                            fontSize: 18, color: AppColors.mainColor2),
                      )),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: Dimensions.height20,
          right: Dimensions.height20,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Dimensions.height15 * 3,
            child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimensions.height15 * 3)),
                child: const Center()),
          ),
        ),
      ],
    );
  }
}
