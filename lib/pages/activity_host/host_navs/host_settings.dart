import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jcs/models/volunteer_demo.dart';
import 'package:jcs/pages/volunteer/contact_support_page.dart';
import 'package:jcs/pages/volunteer/notification_page.dart';
import 'package:jcs/pages/volunteer/security_page.dart';
import 'package:jcs/pages/welcome_page.dart';
import 'package:jcs/widgets/custom_cupertino_dialog.dart';
import 'package:jcs/widgets/list_tile_card.dart';

import '../../../constants.dart';
import '../../../data.dart';
import '../host_contact_support_page.dart';
import '../host_notification_page.dart';
import '../host_security_page.dart';


class HostSettings extends StatelessWidget {
  const HostSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VolunteerDemo volunteer = volunteers[0];
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
                child: Text('Settings',style: textLargeStyle.copyWith(color: Colors.black,fontSize: 28),textAlign: TextAlign.center,),
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
              Container(
                padding: paddingBy20,
                decoration: containerDecoration.copyWith(
                  gradient: const LinearGradient(
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                      colors: [
                    PRIMARY_COLOR,
                    Colors.orangeAccent
                  ])
                ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: containerDecoration.copyWith(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white,width: 2)
                        ),
                          child: Image.asset(volunteer.imgPath!,height: 70,width: 70,)),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Text(volunteer.name!,style: textMediumStyle.copyWith(color: textWhiteColor,fontSize: 20),),
                            ],
                          ),
                          Text(volunteer.userName!,style: textMediumStyle.copyWith(color: textBlackColor,fontSize: 16,fontWeight: FontWeight.w400),),

                        ],
                      ),

                    ],
                  )),

              sizedBox20,
              Container(
                decoration: containerDecoration,
                padding: EdgeInsets.symmetric(horizontal: 0,vertical: 20),
                child: Column(
                  children: [
                    ListTileCard(title: 'My Account', callback: (){
                      
                    }, imgPath: 'assets/person_icon.png',content: 'Make changes to your account',),
                    sizedBox20,
                    ListTileCard(title: 'Security', callback: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (_)=>HostSecurityPage()));

                    },
                      imgPath: 'assets/lock_icon.png',content: 'Manage your account security settings',),
                    sizedBox20,

                    ListTileCard(title: 'Logout', callback: (){
                      showDialog(context: context, builder:(_)=>
                          CustomCupertinoDialog(
                            contentText: '',
                            alertText: 'Do you want to logout?',
                            yesPressed: (){
                              Navigator.pushReplacement(context, CupertinoPageRoute(builder: (_)=>WelcomePage()));
                            },
                            noPressed: (){
                              Navigator.pop(context);
                            },
                          )
                      );
                    },
                      imgPath: 'assets/logout_icon.png',content: 'Logout of your account',),
                    sizedBox100,
                    Row(
                      children: [
                        Text('Version : 1.0234',style: textSmallStyle.copyWith(color: PRIMARY_COLOR),),
                      ],
                    )
                  ],
                ),
              ),
              sizedBox20,
              Padding(
                padding: const EdgeInsets.only(left: 8.0,bottom: 10),
                child: Row(
                  children: [
                    Text('More',style: textSmallStyle.copyWith(color: PRIMARY_COLOR,fontWeight: FontWeight.w900),),
                  ],
                ),
              ),
              Container(
                decoration: containerDecoration,
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Column(
                  children: [
                    ListTileCard(title: 'Help and support', callback: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (_)=>HostContactSupportPage()));

                    },
                      imgPath: 'assets/fancy_bell.png',content: '',),
                    sizedBox20,

                    ListTileCard(title: 'About App', callback: (){},
                      imgPath: 'assets/fancy_heart.png',content: '',),
                  ],
                ),
              )
            ],

          ),
        )
      ],
    );
  }
}
