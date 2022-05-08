import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {

   CustomInput({Key? key,this.function,this.labelText, this.errorText, this.keyboardType, this.controller, this.iconData, required this.isPasswordField, required this.onChange}) : super(key: key);
  final  Function? function;
  final String? labelText;
  final String? errorText;
   bool  isPasswordField;
  final Widget? iconData;
  final TextInputType ? keyboardType;
  final TextEditingController? controller;
  final Function onChange;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
         labelText: widget.labelText,
          fillColor: Theme.of(context).primaryColor,
          suffixIcon:  widget.iconData
        ),
        obscureText: widget.isPasswordField,
        textInputAction: TextInputAction.next,
        validator: (value){
          if(value == '' || value == null){
            return widget.errorText;
          }
        },
      onChanged: (value){
          widget.onChange(value);
      },
        keyboardType: widget.keyboardType,
        controller: widget.controller,
    );
  }
}
