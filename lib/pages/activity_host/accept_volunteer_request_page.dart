import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jcs/models/volunteer_demo.dart';
import 'package:jcs/pages/volunteer/contact_page.dart';
import 'package:jcs/pages/volunteer/report_issue_page.dart';
import 'package:jcs/pages/volunteer/volunteer_navs/volunteer_profile.dart';
import 'package:jcs/widgets/gradient_buton.dart';


import '../../constants.dart';
import '../../models/orderItem.dart';
class AcceptVolunteerRequestPage extends StatelessWidget {
  final VolunteerDemo item;
  const AcceptVolunteerRequestPage({Key? key,required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            children: [
              Stack(
                children:[
                  Container(
                    height: MediaQuery.of(context).size.height/3,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20,),

                          Text(item.name!,style: textSmallStyle.copyWith(color: PRIMARY_COLOR,fontSize: 18,fontWeight: FontWeight.bold),),
                          const SizedBox(height: 10,),
                          Image.asset(item.imgPath!),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: IconButton(
                        icon: Icon(
                            Icons.arrow_back_ios
                        ), onPressed: () {
                        Navigator.pop(context);
                      },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    right: 20,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, CupertinoPageRoute(builder: (_)=>VolunteerProfile(volunteer: item,)));

                          },
                          child: Container(

                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: roundedRadiusBy15,
                                color: PRIMARY_COLOR

                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Icon(Icons.person,color: Colors.white,),
                                Text('Profile',style: textSmallStyle.copyWith(color: Colors.white),),
                              ],
                            ),
                          ),
                        ),
                        sizedBox20,
                        InkWell(
                          onTap: (){
                            Navigator.push(context, CupertinoPageRoute(builder: (_)=>ReportIssuePage()));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: roundedRadiusBy15,
                                color: PRIMARY_COLOR

                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Icon(Icons.report_problem_outlined,color: Colors.white,),
                                Text('Report',style: textSmallStyle.copyWith(color: Colors.white),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                      bottom: 0,

                      child: Container(
                        color: Colors.white,
                        height: 20,
                        width: MediaQuery.of(context).size.width,

                      ))
                ],

              ),
            ],
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            Column(
              children: [
                Image.asset('assets/checkmark_button.png'),
                Text('Accept',style: textSmallStyle.copyWith(color: PRIMARY_COLOR,fontSize: 20,fontWeight: FontWeight.bold),),

              ],
            ),
            SizedBox(width: 50,),
            Column(
              children: [
                Image.asset('assets/x_button.png'),
                Text('Decline',style: textSmallStyle.copyWith(color: PRIMARY_COLOR,fontSize: 20,fontWeight: FontWeight.bold),),

              ],
            ),

          ],),
          Card(
            margin: paddingBy20,
            shape: RoundedRectangleBorder(
              borderRadius: roundedRadiusBy15
            ),
            elevation: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: roundedRadiusBy15
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Basic information',style: textSmallStyle.copyWith(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),),
                    ],
                  ),
                  SizedBox(height: 10,),

                  Text('age: ${item.age!}',style: textSmallStyle.copyWith(color:textBlackColor,fontSize: 18,fontWeight: FontWeight.bold),),
                  sizedBox10,
                  Text('description:',style: textSmallStyle.copyWith(color: textBlackColor,fontSize: 18,fontWeight: FontWeight.bold),),
                    sizedBox10,
                    Text('skill: ${item.skill!}',style: textSmallStyle.copyWith(color: textBlackColor,fontSize: 18,fontWeight: FontWeight.bold),),
                      sizedBox10,


                  SizedBox(height: 100,)


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


