import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({Key? key,required this.btnText, this.paddingHorizontal, required this.onPress, this.paddingVertical}) : super(key: key);
  final String btnText;
  final double? paddingHorizontal;
  final double? paddingVertical;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onPress,
          child: Container(
              decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [PRIMARY_COLOR, Colors.orangeAccent])
              ),

              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal:paddingHorizontal ?? 20.0,vertical: paddingVertical ?? 10),
                child: Text(btnText,style: const TextStyle(color: Colors.white,fontSize: 16,),),
              )),
        ),
      ],
    );

  }
}
