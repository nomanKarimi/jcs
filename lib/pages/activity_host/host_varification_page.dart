import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jcs/pages/activity_host/host_change_password_page.dart';
import 'package:jcs/pages/volunteer/change_password_page.dart';
import 'package:jcs/widgets/background_page.dart';
import 'package:jcs/widgets/custom_button.dart';


import '../../constants.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_text_field.dart';

class HostVerificationPage extends StatefulWidget {
  const HostVerificationPage({Key? key}) : super(key: key);

  @override
  State<HostVerificationPage> createState() => _HostVerificationPageState();
}

class _HostVerificationPageState extends State<HostVerificationPage> {
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
                        Image.asset('assets/group2.png',width: MediaQuery.of(context).size.width/2,),
                        SizedBox(height: 80,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Verification',style: textLargeStyle.copyWith(fontSize: 28,color: PRIMARY_COLOR),),
                          ],
                        ),

                        SizedBox(height: 20,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,

                          child:Text('Enter the OTP code that we send you via SMS',style: textMediumStyle.copyWith(color: PRIMARY_COLOR,),textAlign: TextAlign.center,),
                        ),

                        SizedBox(height: 20,),
                        CustomInput(
                          iconData: txtEmail.text.isNotEmpty ? const Icon(Icons.check):null,
                          labelText: 'Verify',errorText: 'Enter the verification code!',controller: txtEmail, isPasswordField: false, onChange: (value) { setState(() {

                        }); },),
                        sizedBox20,
                        Row(
                          children: [
                            Text('Did not receive Code?',style: textSmallStyle.copyWith(color: PRIMARY_COLOR),),
                            InkWell(
                                onTap: (){
                                  Fluttertoast.showToast(msg: 'sending...');
                                },
                                child: Text('RESEND',style: textSmallStyle.copyWith(color: Colors.black),)),
                          ],
                        ),

                        sizedBox100,
                        CustomButton(btnText: 'VERIFY', onPress: () {
                          if(formKey.currentState!.validate()){
                            Fluttertoast.showToast(msg: 'OTP sent');

                            Navigator.push(context,
                                MaterialPageRoute(builder: (_)=>HostChangePasswordPage()));

                          }


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
