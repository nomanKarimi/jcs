import 'package:email_auth/email_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jcs/pages/volunteer/change_password_page.dart';
import 'package:jcs/widgets/background_page.dart';
import 'package:jcs/widgets/custom_button.dart';


import '../../constants.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_text_field.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key,required this.email}) : super(key: key);
  final String email;
  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  late TextEditingController txtOtp;
  late EmailAuth emailAuth;
  bool verifying = false;
  final formKey = GlobalKey<FormState>();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailAuth = EmailAuth(sessionName: 'test session');
    txtOtp = TextEditingController();

  }
  void verifyOtp()async{
    bool res = await emailAuth.validateOtp(recipientMail: widget.email, userOtp: txtOtp.text.trim());
    if(res){
      setState(() {
        verifying = false;
      });
      Fluttertoast.showToast(msg:'otp verified successfully');
      Navigator.push(context,
          MaterialPageRoute(builder: (_)=>ChangePasswordPage()));
    }else{
      print('invalid otp heyyyyyyy');

    }

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
                          iconData: txtOtp.text.isNotEmpty ? const Icon(Icons.check):null,
                          labelText: 'Verify',errorText: 'Enter the verification code!',controller: txtOtp, isPasswordField: false, onChange: (value) { setState(() {

                        }); },),
                        sizedBox20,
                        Row(
                          children: [
                            Text('Did not receive Code?',style: textSmallStyle.copyWith(color: PRIMARY_COLOR),),
                            InkWell(
                                onTap: (){
                                  Fluttertoast.showToast(msg: 'sending...');
                                },
                                child: Text(' RESEND',style: textSmallStyle.copyWith(color: Colors.black),)),
                          ],
                        ),

                        sizedBox100,
                       verifying ?const Center(
                         child: CircularProgressIndicator(),
                       ) : CustomButton(btnText: 'VERIFY', onPress: () {
                          if(formKey.currentState!.validate()){
                            setState(() {
                              verifying = true;
                            });
                            verifyOtp();


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
