import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jcs/pages/volunteer/login_as_volunteer_page.dart';
import 'package:jcs/pages/volunteer/volunteer_home_page.dart';
import 'package:jcs/pages/volunteer/volunteer_page.dart';
import 'package:jcs/widgets/back_button.dart';
import 'package:jcs/widgets/background_page.dart';
import 'package:jcs/widgets/custom_button.dart';
import 'package:jcs/widgets/password_custom_text_field.dart';


import '../../constants.dart';
import '../../widgets/custom_text_field.dart';

class SignUpAsVolunteerPage extends StatefulWidget {
  const SignUpAsVolunteerPage({Key? key}) : super(key: key);

  @override
  State<SignUpAsVolunteerPage> createState() => _SignUpAsVolunteerPageState();
}

class _SignUpAsVolunteerPageState extends State<SignUpAsVolunteerPage> {
  late TextEditingController txtEmail;
  late TextEditingController txtId;
  late TextEditingController  txtPassword;
  late TextEditingController  txtConfirmPass;
  late TextEditingController  txtName;
  late TextEditingController  txtPhone;
  late TextEditingController txtUploadFile;
  late TextEditingController txtAge;
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
    txtAge = TextEditingController();
    txtConfirmPass = TextEditingController();
    txtId = TextEditingController();
    txtName = TextEditingController();
    txtUploadFile = TextEditingController();
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
                          children: [
                            Text('Volunteer',style:TextStyle(color: PRIMARY_COLOR,fontSize: 24,fontWeight: FontWeight.bold),),
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
                          iconData: txtPhone.text.isNotEmpty ? Icon(Icons.check):null,
                          keyboardType: TextInputType.phone,errorText: 'Phone can\'t be Empty!',controller: txtPhone, isPasswordField: false, onChange: (value) { setState(() {

                          }); },),
                        SizedBox(height: 10,),
                        CustomInput(labelText: 'Age',
                          keyboardType: TextInputType.number,
                          iconData: txtAge.text.isNotEmpty ? Icon(Icons.check):null,errorText: 'Age can\'t be Empty!',controller: txtAge, isPasswordField: false, onChange: (value) { setState(() {

                          }); },),
                        const SizedBox(height: 10,),

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
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> LoginAsVolunteerPage()));
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
                                MaterialPageRoute(builder: (_)=>VolunteerHomePage()));
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
