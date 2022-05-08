import 'package:email_auth/email_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jcs/pages/volunteer/varification_page.dart';
import 'package:jcs/widgets/background_page.dart';
import 'package:jcs/widgets/custom_button.dart';

import 'package:email_auth/email_auth.dart';
import '../../constants.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_text_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late EmailAuth emailAuth;



  late TextEditingController txtEmail;

  bool isPasswordField= true;
  bool rememberMe= false;
  final formKey = GlobalKey<FormState>();

  late bool sending;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sending = false;
    txtEmail = TextEditingController();
    emailAuth = EmailAuth(sessionName: 'test session');

  }


  void sendOtp() async {
    bool result = await emailAuth.sendOtp(
        recipientMail: txtEmail.value.text.trim(), otpLength: 5);
    if (result) {
      setState(() {
        sending = false;
      });
      Navigator.push(context,
          MaterialPageRoute(builder: (_)=>VerificationPage(email: txtEmail.text.trim(),)));
      print('otp sent sussss;lkjasdf;lkajsfd');
      Fluttertoast.showToast(msg: 'Otp sent to your email ');
    }else{
      print('otp invalid please try again');

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
                        Image.asset('assets/group1.png',width: MediaQuery.of(context).size.width/2,),
                        SizedBox(height: 80,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Forgot password',style: textLargeStyle.copyWith(fontSize: 28,color: PRIMARY_COLOR),),
                          ],
                        ),

                        SizedBox(height: 20,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,

                            child:Text('We will send you an OTP on your phone number',style: textMediumStyle.copyWith(color: PRIMARY_COLOR,),textAlign: TextAlign.center,),
                        ),

                    SizedBox(height: 20,),
                    CustomInput(
                      iconData: txtEmail.text.isNotEmpty ? Icon(Icons.check):null,
                      labelText: 'Email Address',errorText: 'Email can\'t be Empty!',controller: txtEmail, isPasswordField: false, onChange: (value) { setState(() {

                    }); },),

              sizedBox100,
              sending ? Center(
                child: CircularProgressIndicator(),
              ): CustomButton(btnText: 'GET OTP', onPress: () {
                if(formKey.currentState!.validate()){
                  setState(() {
                  sending = true;
                  });
                  sendOtp();
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
