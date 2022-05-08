import 'package:flutter/cupertino.dart';
import 'package:jcs/constants.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key,required this.text,required this.imgPath}) : super(key: key);
  final String text;
  final String imgPath;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(imgPath,width: MediaQuery.of(context).size.width/6
          ,),
        Text(text,style: textSmallStyle.copyWith(color: textBlackColor),),
        SizedBox(height: 5,)
      ],
    );
  }
}
