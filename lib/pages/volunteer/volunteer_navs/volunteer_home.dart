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


class VolunteerHome extends StatelessWidget {
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
                  child: Text('Home',style: textLargeStyle.copyWith(color: Colors.black,fontSize: 28),textAlign: TextAlign.center,),
                ),
                Container()

              ],
            ),
          ),
          sizedBox20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: roundedRadiusBy10
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 Container(
                   width: MediaQuery.of(context).size.width/2,
                   padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                   child: TextFormField(
                     decoration: InputDecoration(
                       border: InputBorder.none,
                       hintText: 'Type something'
                     ),
                   ),
                 ),
                  GradientButton(btnText: 'Search', onPress: (){
                    Fluttertoast.showToast(msg: 'searching...');
                  })

                ],
              ),
            ),
          ),
          sizedBox20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CategoryWidget(text: 'Health', imgPath: 'assets/health.png',),
                CategoryWidget(text: 'Education', imgPath: 'assets/hat.png',),
                CategoryWidget(text: 'Animal', imgPath: 'assets/cat.png',),
                CategoryWidget(text: 'Veiw all', imgPath: 'assets/window.png',),
              ],
            ),
          ),


          Container(
            height: MediaQuery.of(context).size.height/1.6,
            padding: EdgeInsets.only(top: 20 ,right: 20,left: 20),
            child: ListView.builder(
              shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: items.length,
                itemBuilder: (context,index){
                  return  Column(
                    children: [
                      CustomCard(imgPath: items[index].imgPath!, title: items[index].title!,  callBack: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>HelpElderPage(item: items[index])));
                      },),
                      SizedBox(height: 15,)
                    ],
                  );

                }),
          ),
        ],
      );
  }
}
