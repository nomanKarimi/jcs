import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jcs/models/volunteer_demo.dart';
import 'package:jcs/pages/volunteer/help_elder_page.dart';
import 'package:jcs/pages/volunteer/notification_page.dart';
import 'package:jcs/widgets/gradient_buton.dart';
import 'package:jcs/widgets/category_widget.dart';

import '../../../constants.dart';
import '../../../data.dart';


class VolunteerProfile extends StatelessWidget {
  const VolunteerProfile({Key? key, this.volunteer}) : super(key: key);
  final VolunteerDemo ? volunteer;
  @override
  Widget build(BuildContext context) {
    VolunteerDemo volun = volunteers[0];
    return  Scaffold(
      body: ListView(
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
                  child: Text('Profile',style: textLargeStyle.copyWith(color: Colors.black,fontSize: 28),textAlign: TextAlign.center,),
                ),
                Container()

              ],
            ),
          ),
          sizedBox50,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(volunteer?.imgPath ?? volun.imgPath!,height: 100,width: 100,),
                sizedBox30,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(volunteer?.name ?? volun.name!,style: textMediumStyle.copyWith(color: PRIMARY_COLOR,fontSize: 22),),
                    SizedBox(width: 10,),
                  ],
                ),
                sizedBox30,
                Text('volunteered in',style: textMediumStyle.copyWith(color: PRIMARY_COLOR,fontWeight: FontWeight.w400),),
                sizedBox50,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Material(
                      shape: RoundedRectangleBorder(
                        borderRadius: roundedRadiusBy10
                      ),
                      elevation: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width/5,
                        height: MediaQuery.of(context).size.width/5,

                        padding: paddingBy10,
                        decoration: containerDecoration,
                        child: Center(
                          child: Text('Teaching kids',textAlign: TextAlign.center,style: textSmallStyle.copyWith(color: PRIMARY_COLOR),),
                        ),
                      ),
                    ),
                    Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: roundedRadiusBy10
                      ),
                      elevation: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width/5,
                        height: MediaQuery.of(context).size.width/5,

                        padding: paddingBy10,
                        decoration: containerDecoration,
                        child: Center(
                          child: Text('Cleaning beach',textAlign: TextAlign.center,style: textSmallStyle.copyWith(color: PRIMARY_COLOR),),
                        ),
                      ),
                    ),
                    Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: roundedRadiusBy10
                      ),
                      elevation: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width/5,
                        height: MediaQuery.of(context).size.width/5,

                        padding: paddingBy10,
                        decoration: containerDecoration,
                        child: Center(
                          child: Text('gathering trash',textAlign: TextAlign.center,style: textSmallStyle.copyWith(color: PRIMARY_COLOR),),
                        ),
                      ),
                    ),
                    Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: roundedRadiusBy10
                      ),
                      elevation: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width/5,
                        height: MediaQuery.of(context).size.width/5,

                        padding: paddingBy10,
                        decoration: containerDecoration,
                        child: Center(
                          child: Text('taking care of elderly',textAlign: TextAlign.center,style: textSmallStyle.copyWith(color: PRIMARY_COLOR),),
                        ),
                      ),
                    ),
                  ],
                ),
                sizedBox20,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/star_trophy.png',width: 50,height: 50,),
                            Image.asset('assets/trophy.png',width: 50,height: 50,),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset('assets/medal_trophy.png',width: 50,height: 50,),
                            Container(
                              padding: paddingBy10,
                              color: Colors.grey[200],
                              child: Center(
                                child: Text('3+',style: textMediumStyle.copyWith(color: Colors.grey),),
                              ),
                            )
                          ],
                        ),

                        Text('Bio \nWrite 300 words... ',style: textSmallStyle.copyWith(color: PRIMARY_COLOR),)
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('37',style: textLargeStyle.copyWith(color: PRIMARY_COLOR,fontWeight: FontWeight.w400,fontSize: 50),),
                        Text('volunteers complete',style: textSmallStyle.copyWith(color: PRIMARY_COLOR,fontWeight: FontWeight.w400,),),
                      ],
                    )
                  ],
                )
              ],

            ),
          )
        ],
      ),
    );
  }
}
