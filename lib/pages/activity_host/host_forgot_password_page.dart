import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jcs/pages/activity_host/host_varification_page.dart';
import 'package:jcs/pages/volunteer/varification_page.dart';
import 'package:jcs/widgets/background_page.dart';
import 'package:jcs/widgets/custom_button.dart';


import '../../constants.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_text_field.dart';

class HostForgotPasswordPage extends StatefulWidget {
  const HostForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<HostForgotPasswordPage> createState() => _HostForgotPasswordPageState();
}

class _HostForgotPasswordPageState extends State<HostForgotPasswordPage> {
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
              CustomButton(btnText: 'GET OTP', onPress: () {
                if(formKey.currentState!.validate()){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_)=>HostVerificationPage()));
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
