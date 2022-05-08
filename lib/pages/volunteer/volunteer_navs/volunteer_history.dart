import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jcs/pages/volunteer/help_elder_page.dart';
import 'package:jcs/pages/volunteer/notification_page.dart';
import 'package:jcs/widgets/gradient_buton.dart';
import 'package:jcs/widgets/category_widget.dart';

import '../../../constants.dart';
import '../../../data.dart';
import '../../../models/orderItem.dart';
import '../../../widgets/custom_card.dart';


class VolunteerHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<EventDemo> items = events;
    return  ListView(
      padding: EdgeInsets.symmetric(vertical: 20),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>NotificationPage()));
              }, icon: Icon(Icons.notifications_none,size: 40,)),
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Text('History',style: textLargeStyle.copyWith(color: Colors.black,fontSize: 28),textAlign: TextAlign.center,),
              ),
              Container()

            ],
          ),
        ),
        sizedBox20,
        sizedBox10,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Text('On-going',style: textMediumStyle.copyWith(color: PRIMARY_COLOR),)
            ],
          ),
        ),


        Container(
          height: MediaQuery.of(context).size.height/2,
          padding: EdgeInsets.only(top: 20 ,right: 20,left: 20),
          child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: items.length,
              itemBuilder: (context,index){
                return  Container(

                  child: Card(
                    color: Colors.grey.shade200,
                    margin: EdgeInsets.only(bottom: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    elevation: 5,
                    child: Center(
                        child:Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.width/3,width: MediaQuery.of(context).size.width/3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.horizontal(left: Radius.circular(10),right: Radius.circular(40)),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                    image: AssetImage(
                                        events[index].imgPath!
                                    )
                                ),
                              ),),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0,left: 30),
                                  child: Text(events[index].title!,style: textLargeStyle.copyWith(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.date_range),
                                    Text(events[index].exDate.toString(),style: textSmallStyle.copyWith(color: Colors.grey[600],fontSize: 13),),
                                  ],
                                ),
                                SizedBox(height: 5,),

                                Row(
                                  children: [
                                    Icon(Icons.timer_outlined),

                                    Text(events[index].time.toString(),style: textSmallStyle.copyWith(color: Colors.grey[600],fontSize: 13),),
                                  ],
                                ),

                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Icon(Icons.group_outlined),

                                    Text(events[index].isAccepted!?'Accepted':'Not Accepted',style: textSmallStyle.copyWith(color: Colors.grey[600],fontSize: 13),),
                                  ],
                                ),
                                SizedBox(height: 30,),

                              ],
                            ),
                          ],

                        )
                    ),
                  ),
                );

              }),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Finished',style: textMediumStyle.copyWith(color: PRIMARY_COLOR),),
                ],
              ),
              sizedBox20,
              Container(

                child: Card(
                  color: Colors.grey.shade200,
                  margin: EdgeInsets.only(bottom: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  elevation: 5,
                  child: Center(
                      child:Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width/3,width: MediaQuery.of(context).size.width/3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.horizontal(left: Radius.circular(10),right: Radius.circular(40)),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      orderItem[0].imgPath!
                                  )
                              ),
                            ),),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0,left: 30),
                                child: Text(orderItem[0].title!,style: textLargeStyle.copyWith(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.date_range),
                                  Text(orderItem[0].exDate.toString(),style: textSmallStyle.copyWith(color: Colors.grey[600],fontSize: 13),),
                                ],
                              ),
                              SizedBox(height: 5,),

                              Row(
                                children: [
                                  Icon(Icons.timer_outlined),

                                  Text(orderItem[0].time.toString(),style: textSmallStyle.copyWith(color: Colors.grey[600],fontSize: 13),),
                                ],
                              ),

                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Icon(Icons.group_outlined),

                                  Text(orderItem[0].isAccepted!?'Accepted':'Not Accepted',style: textSmallStyle.copyWith(color: Colors.grey[600],fontSize: 13),),
                                ],
                              ),
                              SizedBox(height: 30,),

                            ],
                          ),
                        ],

                      )
                  ),
                ),
              )
            ],
          ),
        ),

      ],
    );
  }
}
