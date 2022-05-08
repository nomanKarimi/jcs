import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({Key? key, required this.onChanged,required this.selectedItem, required this.items}) : super(key: key);

  final Function onChanged;
  final String selectedItem;
  final List items;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Container(

          height: 55,
          padding: EdgeInsets.only(left: 15,right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: DropdownButtonFormField(

              onChanged: (value) {
                onChanged(value.toString());
              },
              value: selectedItem,
              icon: Icon(Icons.keyboard_arrow_down,size: 35,),

              items: items.map((e)=>DropdownMenuItem<String>(
                  value: e,
                  child:Text(e))).toList(),

            ),
          ),
        ),
      ],
    );

  }
}
