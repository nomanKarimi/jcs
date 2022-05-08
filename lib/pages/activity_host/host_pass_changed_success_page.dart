import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jcs/pages/activity_host/login_as_host_page.dart';
import 'package:jcs/pages/volunteer/login_as_volunteer_page.dart';
import 'package:jcs/widgets/background_page.dart';
import 'package:jcs/widgets/custom_button.dart';


import '../../constants.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_text_field.dart';

class HostPassChangedSuccessPage extends StatefulWidget {
  const HostPassChangedSuccessPage({Key? key}) : super(key: key);

  @override
  State<HostPassChangedSuccessPage> createState() => _HostPassChangedSuccessPageState();
}

class _HostPassChangedSuccessPageState extends State<HostPassChangedSuccessPage> {
  late TextEditingController txtEmail;
  late TextEditingController  txtPassword;

  bool isPasswordField= true;
  bool rememberMe= false;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    txtEmail = TextEditingController();
    txtPassword = TextEditingController();

  }
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundPage(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              padding: EdgeInsets.only(top: 50,bottom: 50),
              children: [
                const CustomBackButton(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children:  [
                        SizedBox(height: 150,),
                        Image.asset('assets/tick_green_button.png',width: MediaQuery.of(context).size.width/4,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Your password has been changed',style: textLargeStyle.copyWith(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.green),),
                          ],
                        ),
                        sizedBox50,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Please Login again',style: textLargeStyle.copyWith(fontSize: 28,color: PRIMARY_COLOR),),
                          ],
                        ),

                        SizedBox(height: 20,),




                        sizedBox100,
                        CustomButton(btnText: 'LOGIN', onPress: () {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute<void>(builder: (BuildContext context) =>  LoginAsHostPage()), (route) => false);



                        })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )

    );
  }
}
