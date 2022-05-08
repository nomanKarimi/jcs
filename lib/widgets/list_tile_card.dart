import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../constants.dart';

class ListTileCard extends StatelessWidget {
  final String title;
  final String ? content;
  final String ? imgPath;
  final VoidCallback callback;
  final Widget ? iconData;
  final double ? imgSize;
  final double ? textSize;
  final double ? elevation;
  final double? padding;
  final Color? color;
  const ListTileCard({Key? key,required this.title,required this.callback, this.content,this.imgPath, this.iconData, this.imgSize, this.textSize, this.elevation, this.padding, this.color}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      color: color?? Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: roundedRadiusBy15
      ),
      elevation: elevation ??0,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(

                  padding: EdgeInsets.symmetric(vertical:padding ?? 0 ,horizontal: padding == null? 5:padding!/3),
                    decoration: containerDecoration.copyWith(
                      color: color ?? Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: imgPath!.isNotEmpty? Image.asset(imgPath!,height: imgSize ?? 50,width:imgSize ?? 50,)
                :Container(
                      padding: paddingBy10,
                        decoration: BoxDecoration(
                          borderRadius: fullRoundedRadius,
                          border: Border.all(width: 2,color: PRIMARY_COLOR)
                        ),
                        child: Icon(Icons.event_note,size: 30,color: PRIMARY_COLOR,))
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,style: textSmallStyle.copyWith(color: Colors.black,fontSize: textSize ??14),),
                    Container(
                        child: Text(content!,style: textSmallStyle.copyWith(color: textBlackColor,fontSize: 12,fontWeight: FontWeight.w400),)),

                  ],
                ),
              ],
            ),

        IconButton(onPressed: callback, icon: iconData ?? const Icon(Icons.arrow_forward_ios))
          ],
        ),
    )
    ;
  }
}
