import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key,required this.btnText, this.padding, required this.onPress}) : super(key: key);
  final String btnText;
  final double? padding;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:padding ??0 ),
            child: MaterialButton(
                color: PRIMARY_COLOR,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                ),
                onPressed:onPress,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 15),
                  child: Text(btnText,style: TextStyle(color: Colors.white,fontSize: 16,),),
                )),
          ),
        ),
      ],
    );

  }
}
