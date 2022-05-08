


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jcs/data.dart';
import 'package:jcs/models/notification_demo.dart';
import 'package:jcs/widgets/gradient_buton.dart';

import '../../constants.dart';
import '../../models/orderItem.dart';

class HostContactSupportPage extends StatelessWidget {
  const HostContactSupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<NotificationData> notificationsData = notifications;
    return  Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [

          Container(
            decoration:  BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  PRIMARY_COLOR.withOpacity(0.5),
                  Colors.orangeAccent.withOpacity(0.5)
                ]
              )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: const Icon(Icons.arrow_back_ios,)),
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Text('Contact Support',style: textLargeStyle.copyWith(color: Colors.black,fontSize: 28),textAlign: TextAlign.center,),
                  ),
                  Container()

                ],
              ),
            ),
          ),
          sizedBox20,
          Container(
            padding: EdgeInsets.only(top: 20 ,right: 20,left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('How can we help?',style: textLargeStyle.copyWith(color: Colors.black),),
                sizedBox10,
                Divider(color: Colors.black),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Common Questions',style: textLargeStyle.copyWith(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w500),),
                    IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_down,size: 40,))
                  ],
                ),
                sizedBox10,
                Divider(color: Colors.black),
                Text('How i post Activity?',style: textLargeStyle.copyWith(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w500),),
                sizedBox10,
                Divider(color: Colors.black),
                Text('How to change?',style: textLargeStyle.copyWith(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w500),),
                sizedBox10,
                Divider(color: Colors.black),

                Text('...',style: textLargeStyle.copyWith(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w500),),
                sizedBox10,
                Divider(color: Colors.black),
                
                sizedBox100,
                GradientButton(paddingHorizontal: 50,paddingVertical: 20,btnText: 'Contact Us', onPress: (){

                })
              ],
            ),
          ),

        ],
      ),
    );
  }
}
