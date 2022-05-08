import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jcs/constants.dart';
import 'package:jcs/pages/volunteer/signup_as_volunteer_page.dart';
import 'package:jcs/widgets/background_page.dart';
import 'package:jcs/widgets/custom_button.dart';

import 'login_as_volunteer_page.dart';

class VolunteerPage extends StatelessWidget {
  const VolunteerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundPage(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.vertical(top: Radius.circular(50))
          ),
          child: ListView(
            padding: EdgeInsets.only(top: 100),
            children:  [
              Image.asset('assets/logo.png',height:  MediaQuery.of(context).size.width/2,),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Text('Welcome',style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: PRIMARY_COLOR),textAlign: TextAlign.center,)),
                ],
              ),
              SizedBox(height: 30,),

              SizedBox(height: 10,),
              CustomButton(btnText: 'Sign up',padding: 20, onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_)=>SignUpAsVolunteerPage()));
              },),
              SizedBox(height: 20,),

              Row(mainAxisAlignment: MainAxisAlignment.center
                ,children: [
                  Expanded(
                    child: SizedBox(height: 3,child: Container(
                      color: Colors.grey[600],
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('OR',style: TextStyle(color: Colors.grey[800],fontSize: 20,fontWeight: FontWeight.w600,),),
                  ),
                  Expanded(
                    child: SizedBox(height: 3,child: Container(
                      color: Colors.grey[600],
                    ),),
                  ),

                ],),
              SizedBox(height: 20,),
              CustomButton(btnText: 'Log in',padding: 20, onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_)=>LoginAsVolunteerPage()));
              },)

            ],
          ),
        ),
      ),
    );

  }
}
