import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCupertinoDialog extends StatelessWidget {
  const CustomCupertinoDialog({Key? key,this.alertText, this.yesPressed, this.noPressed, this.contentText, this.yesText, this.noText}) : super(key: key);
  final String ? alertText;
  final String ? contentText;
  final String ? yesText;
  final String ? noText;
  final VoidCallback ?yesPressed;
  final VoidCallback ?noPressed;
  @override
  Widget build(BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(alertText!),
          content: Text(contentText!),
          actions: [
            CupertinoDialogAction(
                child: Text(yesText ??'Yes'),
                onPressed:yesPressed
            ),
            CupertinoDialogAction(
              child: Text(noText ??'Cancel',style: const TextStyle(color: Colors.red),),
              onPressed: noPressed
              ,
            )
          ],
        );
  }
}
