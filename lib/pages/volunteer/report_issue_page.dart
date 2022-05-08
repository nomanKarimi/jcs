


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jcs/data.dart';
import 'package:jcs/models/notification_demo.dart';
import 'package:jcs/widgets/gradient_buton.dart';

import '../../constants.dart';
import '../../models/orderItem.dart';

class ReportIssuePage extends StatelessWidget {
  const ReportIssuePage({Key? key}) : super(key: key);

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
                    child: Text('Report an Issue',style: textLargeStyle.copyWith(color: Colors.black,fontSize: 28),textAlign: TextAlign.center,),
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
                Text('Help us understand what’s the problem',style: textLargeStyle.copyWith(color: Colors.black,fontSize: 26),),
                sizedBox10,
                Divider(color: Colors.black),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Fake volunteers',style: textLargeStyle.copyWith(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w500),),
                  ],
                ),
                sizedBox10,
                Divider(color: Colors.black),
                Text('Volunteers not attending?',style: textLargeStyle.copyWith(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w500),),
                sizedBox10,
                Divider(color: Colors.black),
                Text('Volunteers irresponsibility',style: textLargeStyle.copyWith(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w500),),
                sizedBox10,
                Divider(color: Colors.black),

                Text('...',style: textLargeStyle.copyWith(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w500),),
                sizedBox10,
                Divider(color: Colors.black),
                
                sizedBox100,
                GradientButton(paddingHorizontal: 50,paddingVertical: 20,btnText: 'Report', onPress: (){

                })
              ],
            ),
          ),

        ],
      ),
    );
  }
}
