import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jcs/models/volunteer_demo.dart';
import 'package:jcs/pages/volunteer/notification_page.dart';
import 'package:jcs/pages/welcome_page.dart';
import 'package:jcs/widgets/custom_cupertino_dialog.dart';
import 'package:jcs/widgets/list_tile_card.dart';

import '../../../constants.dart';
import '../../../data.dart';
class SecurityPage extends StatelessWidget {
  const SecurityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VolunteerDemo volunteer = volunteers[0];
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
                Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back_ios,)),
                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>NotificationPage()));
                    }, icon: Icon(Icons.notifications_none,size: 40,)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 100),
                  child: Text('Security',style: textLargeStyle.copyWith(color: Colors.black,fontSize: 24),textAlign: TextAlign.center,),
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
                sizedBox20,
                Container(
                  decoration: containerDecoration,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      ListTileCard(title: 'Two-Factor Authentication', callback: (){

                      }, imgPath: 'assets/security_icon.png',content: 'Further secure your account for safety',),
                      sizedBox20,
                      ListTileCard(title: 'Security', callback: (){
                        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (_)=>WelcomePage()));

                      },
                        imgPath: 'assets/person_icon.png',content: 'Manage you device security',),
                      sizedBox20,

                    ],
                  ),
                ),
              ],

            ),
          )
        ],
      ),
    );
  }
}
