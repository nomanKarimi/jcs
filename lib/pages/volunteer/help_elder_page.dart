import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jcs/pages/volunteer/contact_page.dart';
import 'package:jcs/pages/volunteer/report_issue_page.dart';
import 'package:jcs/widgets/gradient_buton.dart';


import '../../constants.dart';
import '../../models/orderItem.dart';
class HelpElderPage extends StatelessWidget {
  final EventDemo item;
  const HelpElderPage({Key? key,required this.item}) : super(key: key);

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
                    height: MediaQuery.of(context).size.width-100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                item.imgPath!
                            )
                        )
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
                            Navigator.push(context, CupertinoPageRoute(builder: (_)=>ContactPage()));

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
                                Icon(Icons.email_outlined,color: Colors.white,),
                                Text('Contact',style: textSmallStyle.copyWith(color: Colors.white),),
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

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(50))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 30,),
                Text('Help Elders',style: textSmallStyle.copyWith(color: PRIMARY_COLOR,fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),

                Row(
                  children: [
                    Icon(Icons.date_range),
                    Text('on going',style: textSmallStyle.copyWith(color: PRIMARY_COLOR,fontSize: 18,fontWeight: FontWeight.bold),),

                  ],
                ),
                sizedBox10,

                Row(
                  children: [
                    Icon(Icons.location_on_outlined),

                    Text('al-bahar',style: textSmallStyle.copyWith(color: PRIMARY_COLOR,fontSize: 18,fontWeight: FontWeight.bold),),

                  ],
                ),
                sizedBox10,

                Text('Description',style: textSmallStyle.copyWith(color: PRIMARY_COLOR,fontSize: 18,fontWeight: FontWeight.bold),),
                sizedBox10,

                Container(
                    width: MediaQuery.of(context).size.width/1.2,

                    child: Text('Help elder that they need care them and make them happy',style: textSmallStyle.copyWith(color: textBlackColor,fontSize: 18,fontWeight: FontWeight.w500),)),
                sizedBox10,

                Text('Requirement',style: textSmallStyle.copyWith(color: PRIMARY_COLOR,fontSize: 18,fontWeight: FontWeight.bold),),
                sizedBox10,

                Text('Everyone can volunteer',style: textSmallStyle.copyWith(color: textBlackColor,fontSize: 18,fontWeight: FontWeight.w400),),
                sizedBox10,

                Image.asset('assets/group_profiles.png'),
                sizedBox50,

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){

                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width/2,
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [PRIMARY_COLOR, Colors.orangeAccent])
                      ),

                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                          child: Text('Apply now',style: TextStyle(color: Colors.white,fontSize: 18,),),
                        ),
                      )),
                ),
                SizedBox(width: 20,),
                const Icon(Icons.bookmark,color: PRIMARY_COLOR,)
              ],
            ),
                SizedBox(height: 100,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}


