import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jcs/widgets/gradient_buton.dart';
import 'package:jcs/widgets/custom_button.dart';

import '../constants.dart';

class CustomCard extends StatelessWidget {
  String imgPath;

  String title;
  VoidCallback callBack;
  CustomCard({Key? key,required this.callBack,required this.imgPath,required this.title, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Container(
        padding: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          color: Colors.grey[100],
        ),
        child: Center(
            child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    height: 170,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            imgPath
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title,style: textSmallStyle.copyWith(color: Colors.black87,fontSize: 16),),

                          ],
                        ),
                       GradientButton(btnText: 'Select', onPress: callBack)
                      ],
                    ),
                  )
                ]
            )
        ),
      ),
    );

  }
}
