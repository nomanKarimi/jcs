import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jcs/pages/activity_host/host_home_page.dart';
import 'package:jcs/pages/activity_host/login_as_host_page.dart';
import 'package:jcs/pages/volunteer/volunteer_page.dart';
import 'package:jcs/widgets/back_button.dart';
import 'package:jcs/widgets/background_page.dart';
import 'package:jcs/widgets/custom_button.dart';
import 'package:jcs/widgets/password_custom_text_field.dart';


import '../../constants.dart';
import '../../widgets/custom_text_field.dart';

class SignUpAsHostPage extends StatefulWidget {
  const SignUpAsHostPage({Key? key}) : super(key: key);

  @override
  State<SignUpAsHostPage> createState() => _SignUpAsHostPageState();
}

class _SignUpAsHostPageState extends State<SignUpAsHostPage> {
  late TextEditingController txtEmail;
  late TextEditingController txtId;
  late TextEditingController  txtPassword;
  late TextEditingController  txtConfirmPass;
  late TextEditingController  txtName;
  late TextEditingController  txtPhone;
  late TextEditingController txtUploadFile;
  bool isPasswordField= true;
  bool isConfirmPasswordField = true;
  final formKey = GlobalKey<FormState>();
  bool isValidatePassword(){
    if(txtPassword.text != txtConfirmPass.text){
      Fluttertoast.showToast(msg: 'password and confirm password are not the same');
      return false;
    }
    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    txtEmail = TextEditingController();
    txtPassword = TextEditingController();
    txtPhone = TextEditingController();
    txtUploadFile = TextEditingController();
    txtConfirmPass = TextEditingController();
    txtId = TextEditingController();
    txtName = TextEditingController();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundPage(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              padding: EdgeInsets.only(top: 50,bottom: 50),
              children: [
                const CustomBackButton(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children:  [
                        SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Activity Host',style:TextStyle(color: PRIMARY_COLOR,fontSize: 24,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        CustomInput(labelText: 'ID',
                          iconData: txtId.text.isNotEmpty ? const Icon(Icons.check):null,errorText: 'ID can\'t be Emtpy!',controller: txtId, isPasswordField: false, onChange: (value) {setState(() {

                          });  },),
                          SizedBox(height: 10,),
                        CustomInput(labelText: 'Name',
                          iconData: txtName.text.isNotEmpty ? Icon(Icons.check):null,errorText: 'Name can\'t be Empty!',controller: txtName, isPasswordField: false, onChange: (value) { setState(() {

                          }); },),
                        SizedBox(height: 10,),
                        CustomInput(
                        iconData: txtEmail.text.isNotEmpty ? Icon(Icons.check):null,
                          labelText: 'Email',errorText: 'Email can\'t be Empty!',controller: txtEmail, isPasswordField: false, onChange: (value) { setState(() {

                          }); },),
                        SizedBox(height: 10,),
                        CustomInput(labelText: 'Phone',
                          iconData: txtPhone.text.isNotEmpty ? Icon(Icons.check):null,errorText: 'Phone can\'t be Empty!',controller: txtPhone, isPasswordField: false, onChange: (value) { setState(() {

                          }); },),

                        SizedBox(height: 10,),
                        InkWell(
                          borderRadius: roundedRadiusBy10,

                          onTap: (){

                          },
                          child: TextField(
                            style: TextStyle(fontSize: 16),
                            enabled: false,
                            decoration: InputDecoration(
                                labelText: 'Upload image file',
                                fillColor: Theme.of(context).primaryColor,
                                suffixIcon:  InkWell(
                                    onTap: (){

                                    },
                                    child: Icon(Icons.drive_folder_upload))
                            ),
                            textInputAction: TextInputAction.next,
                            controller: txtUploadFile,
                          ),
                        ),

                        SizedBox(height: 10,),
                        PasswordCustomInput(labelText: 'Password',
                          iconData: txtPassword.text.isNotEmpty ? IconButton(icon: Icon(Icons.remove_red_eye),
                            onPressed: () {
                              setState(() {
                                isPasswordField = !isPasswordField;
                              });
                            },):null,errorText: 'Password can\'t be Empty!',controller: txtPassword, isPasswordField: isPasswordField, onChange: (value) { setState(() {

                          }); },),

                        SizedBox(height: 10,),
                        PasswordCustomInput(labelText: 'Confirm Password ',
                          iconData: txtConfirmPass.text.isNotEmpty ? IconButton(icon: Icon(Icons.remove_red_eye),
                            onPressed: () {
                            setState(() {
                              isConfirmPasswordField = !isConfirmPasswordField;
                            });
                            },):null,errorText: 'Confirm Password cant be Empty!',controller: txtConfirmPass, isPasswordField: isConfirmPasswordField, onChange: (value) {setState(() {

                            });  },),



                        const SizedBox(height: 10,),
                        Padding(
                          padding: paddingBy10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account ?',style: textSmallStyle.copyWith(
                                color: PRIMARY_COLOR
                              ),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.pushReplacement(context, CupertinoPageRoute(builder: (_)=> LoginAsHostPage()));
                                },
                                child: Text(
                                  'Login ?',style: textSmallStyle.copyWith(
                                  color: textBlackColor
                                ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 30,),
                        CustomButton(btnText: 'Sign up', onPress: () {
                          if(formKey.currentState!.validate()){
                            if(isValidatePassword()){
                            Navigator.pushReplacement(context,
                                CupertinoPageRoute(builder: (_)=>HostHomePage()));
                            }
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
