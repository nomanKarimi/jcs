import 'package:flutter/material.dart';

class JcsLogo extends StatelessWidget {
  const JcsLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Image.asset('assets/logo.png',height:  MediaQuery.of(context).size.width/2,
    width: MediaQuery.of(context).size.width/2,
    );

  }
}
