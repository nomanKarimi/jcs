import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jcs/pages/activity_host/host_home_page.dart';
import 'package:jcs/pages/activity_host/login_as_host_page.dart';
import 'package:jcs/widgets/back_button.dart';
import 'package:jcs/widgets/background_page.dart';
import 'package:jcs/widgets/custom_button.dart';
import 'package:jcs/widgets/custom_dropdown.dart';
import 'package:jcs/widgets/gradient_buton.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../constants.dart';
import '../../../widgets/custom_text_field.dart';


class AddEvent extends StatefulWidget {
  const AddEvent({Key? key}) : super(key: key);

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  late TextEditingController txtImagePath;
  late TextEditingController txtId;
  late TextEditingController  txtAddress;
  late TextEditingController  txtDescription;
  late TextEditingController  txtName;
  late TextEditingController  txtDuration;
  late TextEditingController txtUploadFile;
  late TextEditingController txtDatePicker;
  late TextEditingController txtTimePicker;
  late String selectedAgeCategory;
  late String selectedCategory;

  List<String> ageCategories = ['14 to 18', '18 to 22','22 to 30','30 to 45','45 to 50', 'over 65'];
  List<String> categories = ['Health', 'Animals','Graduation'];

  bool isPasswordField= true;
  bool isConfirmPasswordField = true;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    txtImagePath = TextEditingController();
    selectedAgeCategory = ageCategories[0];
    selectedCategory = categories[0];

    txtAddress = TextEditingController();
    txtDatePicker = TextEditingController();
    txtTimePicker = TextEditingController();
    txtDuration = TextEditingController();
    txtUploadFile = TextEditingController();
    txtDescription = TextEditingController();
    txtId = TextEditingController();
    txtName = TextEditingController();
  }

  void ageCategoryChanged(String? value) {
    setState(() {
      selectedAgeCategory = value!;
    });
  }
  void categoriesChanged(String? value) {
    setState(() {
      selectedCategory = value!;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            padding: const EdgeInsets.only(top: 50,bottom: 50),
            children: [

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('New Event',style:TextStyle(color: PRIMARY_COLOR,fontSize: 24,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      sizedBox20,


                      const SizedBox(height: 30,),

                      const Text('NAME OF ACTIVITY',style:TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),

                      CustomInput(labelText: 'Name',
                        iconData: txtName.text.isNotEmpty ? const Icon(Icons.check):null,errorText: 'Name can\'t be Empty!',controller: txtName, isPasswordField: false, onChange: (value) { setState(() {

                        }); },),
                      const SizedBox(height: 20,),
                      const Text('TARGET AGE GROUP',style:TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),

                      const SizedBox(height: 5,),
                      CustomDropdown(onChanged: (value){
                        ageCategoryChanged(value);
                      }, selectedItem: selectedAgeCategory, items: ageCategories),
                      const SizedBox(height: 10,),
                      const SizedBox(height: 5,),

                      const Text('SELECT CATEGORY',style:TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),

                      CustomDropdown(onChanged: (value){
                        categoriesChanged(value);
                      }, selectedItem: selectedCategory, items: categories),

                      const SizedBox(height: 10,),
                      InkWell(
                        borderRadius: roundedRadiusBy10,

                        onTap: (){
                          showTimePicker(
                            context: context,  initialTime: TimeOfDay.now(),

                          ).then((value) {
                            if(value !=null){
                              txtTimePicker.text = value.hour.toString()+':'+value.minute.toString()+' '+value.period.name;
                            }
                          });
                        },
                        child: TextFormField(
                          style: const TextStyle(fontSize: 16),
                          enabled: false,
                          decoration: InputDecoration(
                              labelText: 'Time',
                              fillColor: Theme.of(context).primaryColor,
                              suffixIcon:  const Icon(Icons.timer_outlined)
                          ),
                          textInputAction: TextInputAction.next,
                          controller: txtTimePicker,
                        ),
                      ),

                      const SizedBox(height: 10,),
                      InkWell(
                        borderRadius: roundedRadiusBy10,

                        onTap: (){
                          showDatePicker(
                            context: context, initialDate: DateTime.now(), firstDate: DateTime(1999), lastDate: DateTime(2050),

                          ).then((value) {
                            if(value !=null){
                              txtDatePicker.text = value.toString().substring(0,10);
                            }
                          });
                        },
                        child: TextFormField(
                          style: const TextStyle(fontSize: 16),
                          enabled: false,
                          decoration: InputDecoration(
                              labelText: 'Date',
                              fillColor: Theme.of(context).primaryColor,
                              suffixIcon:  const Icon(Icons.date_range)
                          ),
                          textInputAction: TextInputAction.next,
                          controller: txtDatePicker,
                        ),
                      ),

                      const SizedBox(height: 10,),
                      CustomInput(labelText: 'Duration',
                        iconData: txtDuration.text.isNotEmpty ? const Icon(Icons.check):null,errorText: 'Phone can\'t be Empty!',controller: txtDuration, isPasswordField: false, onChange: (value) { setState(() {
                        }

                        ); },
                      keyboardType: TextInputType.datetime,
                      ),

                      const SizedBox(height: 10,),
                      CustomInput(labelText: 'Address',
                        iconData: txtAddress.text.isNotEmpty ?  const Icon(Icons.remove_red_eye):null,
                      errorText: 'address   can\'t be Empty!',controller: txtAddress, onChange: (value) { setState(() {

                        }); }, isPasswordField: false,),
                      const SizedBox(height: 10,),
                      InkWell(
                        borderRadius: roundedRadiusBy10,

                        onTap: (){
                        },
                        child: TextFormField(
                          style: const TextStyle(fontSize: 16),
                          enabled: false,
                          decoration: InputDecoration(
                              labelText: 'upload image file',
                              fillColor: Theme.of(context).primaryColor,
                              suffixIcon:  const Icon(Icons.drive_folder_upload)
                          ),
                          textInputAction: TextInputAction.next,
                          controller: txtImagePath,
                        ),
                      ),
                      const SizedBox(height: 10,),

                      Container(
                        child: Column(
                          children: [
                            Text('Location',style: textMediumStyle.copyWith(color: Colors.black,fontWeight: FontWeight.w400),),
                            IconButton(onPressed: (){}, icon: const Center(child: const Icon(Icons.location_on_outlined,size: 40,)))
                          ],
                        ),
                      ),

                      const SizedBox(height: 20,),
                      Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: roundedRadiusBy10
                        ),
                        elevation: 3,
                        child: TextField(
                          controller: txtDescription,
                          maxLines: 3,
                          decoration: const InputDecoration(
                            labelText: 'Description',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),


                      const SizedBox(height: 10,),

                      const SizedBox(height: 30,),
                      GradientButton(
                        paddingHorizontal: 80,
                          paddingVertical: 20,
                          btnText: 'Submit', onPress: () {
                        if(formKey.currentState!.validate()){
                          Navigator.pushReplacement(context,
                              CupertinoPageRoute(builder: (_)=>HostHomePage()));
                        }


                      })
                    ],
                  ),
                ),
              ),
            ],
          ),
        )

    );
  }
}
