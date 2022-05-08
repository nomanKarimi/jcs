import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jcs/pages/volunteer/pass_changed_success_page.dart';
import 'package:jcs/widgets/background_page.dart';
import 'package:jcs/widgets/custom_button.dart';
import 'package:jcs/widgets/password_custom_text_field.dart';


import '../../constants.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_text_field.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  late TextEditingController txtNewPass;
  late TextEditingController  txtConfirmPass;

  bool isPasswordField= true;
  bool isConfirmPass= true;
  bool rememberMe= false;
  final formKey = GlobalKey<FormState>();
  bool validatePass(){
    if(txtNewPass.text != txtConfirmPass.text){
      return false;
    }
    return true;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    txtNewPass = TextEditingController();
    txtConfirmPass = TextEditingController();

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
                        Image.asset('assets/group3.png',width: MediaQuery.of(context).size.width/2,),
                        SizedBox(height: 80,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width/2,
                                child: Text('Enter Your New Password',textAlign: TextAlign.center,style: textLargeStyle.copyWith(fontSize: 28,color: PRIMARY_COLOR),)),
                          ],
                        ),


                        SizedBox(height: 20,),
                        PasswordCustomInput(
                          iconData: txtNewPass.text.isNotEmpty ? IconButton(icon: Icon(Icons.remove_red_eye), onPressed: () {
                            setState(() {
                              isPasswordField = !isPasswordField;
                            });
                          },):null,
                          labelText: 'New password',errorText: 'New password can\'t be Empty!',controller: txtNewPass, isPasswordField: isPasswordField, onChange: (value) { setState(() {

                        }); },),
                        SizedBox(height: 20,),
                        PasswordCustomInput(
                          iconData: txtNewPass.text.isNotEmpty ? IconButton(icon: Icon(Icons.remove_red_eye), onPressed: () {
                            setState(() {
                              isConfirmPass = !isConfirmPass;
                            });
                          },):null,
                          labelText: 'Confirm Password',errorText: 'confirm password can\'t be Empty!',controller: txtConfirmPass, isPasswordField: isConfirmPass, onChange: (value) { setState(() {

                        }); },),

                        sizedBox100,
                        CustomButton(btnText: 'SAVE', onPress: () {
                          if(formKey.currentState!.validate()){
                            if(validatePass()){

                            Fluttertoast.showToast(msg: 'Password changed');
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_)=>PassChangedSuccessPage()));

                            }else{
                              Fluttertoast.showToast(msg: 'Password and '
                                  'confirm password must be the same');

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
