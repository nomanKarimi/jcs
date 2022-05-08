import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jcs/models/volunteer_demo.dart';
import 'package:jcs/pages/activity_host/accept_volunteer_request_page.dart';
import 'package:jcs/pages/volunteer/help_elder_page.dart';
import 'package:jcs/pages/volunteer/notification_page.dart';
import 'package:jcs/widgets/gradient_buton.dart';
import 'package:jcs/widgets/category_widget.dart';
import 'package:jcs/widgets/list_tile_card.dart';

import '../../../constants.dart';
import '../../../data.dart';
import '../../../models/orderItem.dart';
import '../../../widgets/custom_card.dart';
import '../host_notification_page.dart';


class HostVolunteer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<VolunteerDemo> items = volunteers;
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
                 Navigator.push(context, MaterialPageRoute(builder: (_)=>HostNotificationPage()));
                }, icon: Icon(Icons.notifications_none,size: 40,)),
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Text('Volunteer',style: textLargeStyle.copyWith(color: Colors.black,fontSize: 28),textAlign: TextAlign.center,),
                ),
                Container()

              ],
            ),
          ),


          Container(
            height: MediaQuery.of(context).size.height/1.6,
            padding: EdgeInsets.only(top: 20 ,right: 10,left: 10),
            child: ListView.builder(
              shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: items.length,
                itemBuilder: (context,index){
                  return  Column(
                    children: [
                      ListTileCard(
                        elevation: 10,
                        color: Colors.grey.shade200,
                        textSize: 18,
                        padding: 10,
                          imgSize: 70,
                          content: '',
                          iconData: Icon(Icons.double_arrow_outlined),
                          title: items[index].name!, callback: (){
                          Navigator.push(context, CupertinoPageRoute(builder: (_)=>AcceptVolunteerRequestPage(item: items[index])));
                      }, imgPath: items[index].imgPath),
                      SizedBox(height: 5,)
                    ],
                  );

                }),
          ),
        ],
      );
  }
}
