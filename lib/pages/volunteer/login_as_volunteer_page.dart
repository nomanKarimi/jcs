import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jcs/pages/volunteer/forgot_password_page.dart';
import 'package:jcs/pages/volunteer/signup_as_volunteer_page.dart';
import 'package:jcs/pages/volunteer/volunteer_home_page.dart';
import 'package:jcs/widgets/background_page.dart';
import 'package:jcs/widgets/custom_button.dart';
import 'package:jcs/widgets/password_custom_text_field.dart';


import '../../constants.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_text_field.dart';

class LoginAsVolunteerPage extends StatefulWidget {
  const LoginAsVolunteerPage({Key? key}) : super(key: key);

  @override
  State<LoginAsVolunteerPage> createState() => _LoginAsVolunteerPageState();
}

class _LoginAsVolunteerPageState extends State<LoginAsVolunteerPage> {
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
                        SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Volunteer',style:TextStyle(color: PRIMARY_COLOR,fontSize: 24,fontWeight: FontWeight.bold),),
                          ],
                        ),

                        SizedBox(height: 20,),
                        CustomInput(
                        iconData: txtEmail.text.isNotEmpty ? Icon(Icons.check):null,
                          labelText: 'Email',errorText: 'Email can\'t be Empty!',controller: txtEmail, isPasswordField: false, onChange: (value) { setState(() {

                          }); },),


                        SizedBox(height: 20,),
                        PasswordCustomInput(labelText: 'Password',
                          iconData: txtPassword.text.isNotEmpty ? IconButton(icon: Icon(Icons.remove_red_eye),
                            onPressed: () {
                              setState(() {
                                isPasswordField = !isPasswordField;
                              });
                            },):null,errorText: 'Password can\'t be Empty!',controller: txtPassword, isPasswordField: isPasswordField, onChange: (value) { setState(() {

                          }); },),
                        SizedBox(height: 10,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                           Checkbox(value: rememberMe, onChanged: (v){
                             setState(() {
                               rememberMe = v!;
                             });
                           },
                             activeColor:PRIMARY_COLOR ,
                           ),
                            Text('Remember me',style: textSmallStyle.copyWith(color: PRIMARY_COLOR),)

                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>ForgotPasswordPage()));
                                },
                                child: Text('Forgot password',style: textSmallStyle.copyWith(color: PRIMARY_COLOR),)),
                          ],
                        ),

                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Text('Don\'t have an account? ',style: textSmallStyle.copyWith(color: PRIMARY_COLOR),),
                                 InkWell(
                                     onTap: (){
                                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>SignUpAsVolunteerPage()));

                                     },
                                     child: Text('Sign up',style: textSmallStyle.copyWith(color: textBlackColor),)),
                          ],
                        ),


                        SizedBox(height: 50,),
                        CustomButton(btnText: 'Sign in', onPress: () {
                          if(formKey.currentState!.validate()){
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_)=>VolunteerHomePage()));
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
