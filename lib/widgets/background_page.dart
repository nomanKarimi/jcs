import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackgroundPage extends StatelessWidget {
  const BackgroundPage({Key? key,required this.child}) : super(key: key);
  final  Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/status_bar_icon.png',height: MediaQuery.of(context).size.width/2,width: MediaQuery.of(context).size.width/2,)
              ],
            ),
          ),
          child
        ],
      );

  }
}
