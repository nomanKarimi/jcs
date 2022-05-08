


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jcs/data.dart';
import 'package:jcs/models/notification_demo.dart';

import '../../constants.dart';
import '../../models/orderItem.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<NotificationData> notificationsData = notifications;
    return  Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20),
        children: [
          sizedBox50,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: const Icon(Icons.arrow_back_ios,)),
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Text('Notifications',style: textLargeStyle.copyWith(color: Colors.black,fontSize: 28),textAlign: TextAlign.center,),
                ),
                Container()

              ],
            ),
          ),
          sizedBox20,
          Container(
            height: MediaQuery.of(context).size.height/2,
            padding: EdgeInsets.only(top: 20 ,right: 20,left: 20),
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: notificationsData.length,
                itemBuilder: (context,index){
                  return  Container(

                    child: Card(
                      color: PRIMARY_COLOR.withOpacity(0.5),
                      margin: EdgeInsets.only(bottom: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Center(
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(notificationsData[index].message!,style: textLargeStyle.copyWith(color: Colors.black,fontSize: 22),),
                                    InkWell(
                                        onTap: (){
                                          
                                        },
                                        child: Text('x',textAlign: TextAlign.center,style: textLargeStyle.copyWith(color: Colors.black,fontWeight: FontWeight.w400),)),
                                  ],

                                ),
                                SizedBox(height: 20,),

                                InkWell(
                                  onTap:() {

                                  },
                                  child:  Icon(Icons.arrow_forward_ios)
                                  ,
                                ),
                                SizedBox(height: 30,),
                              ],
                            )
                        ),
                      ),
                    ),
                  );

                }),
          ),

        ],
      ),
    );
  }
}
