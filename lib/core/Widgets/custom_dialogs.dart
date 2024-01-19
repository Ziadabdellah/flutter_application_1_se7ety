//Error

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

showErrorDialog(context, ErrorText) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.all(10),
      content: Text(ErrorText)));
}

showLoadingDialog(BuildContext context) {
  //------------ Using Custom Loading for IOS & Android

  showDialog(
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(.7),
    context: context,
    builder: (BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/on1.png', width: 150, height: 150),
        ],
      );
    },
  );
}
