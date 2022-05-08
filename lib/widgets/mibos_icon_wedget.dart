import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MibosIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
        children:
         [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('M',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w600),),
              SizedBox(width: 10,),
              Text('I',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w600),),
              SizedBox(width: 10,),
              Text('B',style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.w600),),
              SizedBox(width: 10,),
              Text('O',style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.w600),),
              SizedBox(width: 10,),
              Text('S',style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.w600),),

            ],
          ),
           Padding(
             padding: const EdgeInsets.only(left: 120.0),
             child: SizedBox(height: 3,width: 70,child: Container(
               color: Colors.white,
             ),),
           )
        ]
    );
  }
}
